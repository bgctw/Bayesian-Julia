# This file was generated, do not modify it.

using Downloads, DataFrames, CSV, GZip, Chain, Dates

url = "https://data.brasil.io/dataset/covid19/caso_full.csv.gz"
file = Downloads.download(url)
df = CSV.File(GZip.open(file, "r")) |> DataFrame

br = @chain df begin
    filter([:date, :city] => (date, city) -> date < Dates.Date("2021-01-01") && date > Dates.Date("2020-04-01") && ismissing(city), _)
    groupby(:date)
    combine(
        [:estimated_population_2019,
         :last_available_confirmed_per_100k_inhabitants,
         :last_available_deaths,
         :new_confirmed,
         :new_deaths] .=> sum .=>
         [:estimated_population_2019,
         :last_available_confirmed_per_100k_inhabitants,
         :last_available_deaths,
         :new_confirmed,
         :new_deaths]
    )
end;

first(br, 5)

last(br, 5)

using Plots, StatsPlots, LaTeXStrings
@df br plot(:date, :new_confirmed, xlab=L"t", ylab="infected", label=false, title="Brasil COVID 2020")
savefig(joinpath(@OUTPUT, "infected.svg")); # hide

using DifferentialEquations

function sir_ode!(du, u, p, t)
    (S, I, R) = u
    (β, γ) = p
    N = S + I + R
    infection = β * I * S / N
    recovery = γ * I
    @inbounds begin
        du[1] = -infection # Susceptible
        du[2] = infection - recovery # Infected
        du[3] = recovery # Recovered
    end
    nothing
end;

i₀ = first(br[:, :new_confirmed])
N = maximum(br[:, :estimated_population_2019])

u = [N - i₀, i₀, 0.0]
p = [0.5, 0.05]
prob = ODEProblem(sir_ode!, u, (1.0, 100.0), p)
sol_ode = solve(prob)
plot(sol_ode, label=[L"S" L"I" L"R" ],
     lw=3,
     xlabel=L"t",
     ylabel=L"N",
     yformatter=y -> string(round(Int64, y ÷ 1_000_000)) * "mi",
     title="SIR Model for 100 days, β = $(p[1]), γ = $(p[2])")
savefig(joinpath(@OUTPUT, "ode_solve.svg")); # hide

using Turing
using Random:seed!
seed!(123)
setprogress!(false) # hide

@model bayes_sir(infected, i₀, r₀, N) = begin
  #calculate number of timepoints
  l = length(infected)

  #priors
  β ~ TruncatedNormal(2, 1, 1e-4, 10)     # using 10 instead of Inf because numerical issues arose
  γ ~ TruncatedNormal(0.4, 0.5, 1e-4, 10) # using 10 instead of Inf because numerical issues arose
  ϕ⁻ ~ truncated(Exponential(5), 1, 20)
  ϕ = 1.0 / ϕ⁻

  #ODE Stuff
  I = i₀
  u0 = [N - I, I, r₀] # S,I,R
  p = [β, γ]
  tspan = (1.0, float(l))
  prob = ODEProblem(sir_ode!,
          u0,
          tspan,
          p)
  sol = solve(prob,
              Tsit5(), # similar to RK45 in Stan but 10% faster
              saveat=1.0)
  solᵢ = Array(sol)[2, :] # New Infected

  #likelihood
  for i in 1:l
    solᵢ[i] = max(1e-4, solᵢ[i]) # numerical issues arose
    infected[i] ~ NegativeBinomial(solᵢ[i], ϕ)
  end
end;

infected = br[:, :new_confirmed]
r₀ = first(br[:, :new_deaths])
chain_sir = sample(bayes_sir(infected, i₀, r₀, N), NUTS(), 2_000)
summarystats(chain_sir[[:β, :γ]])

