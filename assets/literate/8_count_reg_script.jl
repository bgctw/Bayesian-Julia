# This file was generated, do not modify it.

using Plots, LaTeXStrings

plot(exp, -6, 6, label=false,
     xlabel=L"x", ylabel=L"e^x")
savefig(joinpath(@OUTPUT, "exponential.svg")); # hide

using StatsPlots, Distributions
plot(Gamma(0.01, 0.01),
        lw=2, label=false,
        xlabel=L"\phi",
        ylabel="Density",
        xlims=(0, 0.01))
savefig(joinpath(@OUTPUT, "gamma.svg")); # hide

using Turing
using LazyArrays
using Random:seed!
seed!(123)
setprogress!(false) # hide

@model negbinreg(X,  y; predictors=size(X, 2)) = begin
	#priors
	α ~ Normal(0, 2.5)
	β ~ filldist(TDist(3), predictors)

	#likelihood
	y ~ arraydist(LazyArray(@~ LogPoisson.(α .+ X * β)))
end;

using DataFrames, CSV, HTTP

url = "https://raw.githubusercontent.com/storopoli/Bayesian-Julia/master/datasets/roaches.csv"
roaches = CSV.read(HTTP.get(url).body, DataFrame)
describe(roaches)

X = Matrix(select(roaches, Not(:y)))
y = roaches[:, :y]
model = negbinreg(X, y);

chain = sample(model, NUTS(), MCMCThreads(), 2_000, 4)
summarystats(chain)

using Chain

@chain quantile(chain) begin
	DataFrame
    select(_,
        :parameters,
        names(_, r"%") .=> ByRow(exp),
        renamecols=false)
end

