# This file was generated, do not modify it. # hide
infected = br[:, :new_confirmed]
r₀ = first(br[:, :new_deaths])
chain_sir = sample(bayes_sir(infected, i₀, r₀, N), NUTS(), 2_000)
summarystats(chain_sir[[:β, :γ]])