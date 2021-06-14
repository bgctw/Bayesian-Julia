# This file was generated, do not modify it. # hide
using Turing
using Statistics: mean, std
using Random:seed!
seed!(123)
setprogress!(false) # hide

@model linreg(X, y; predictors=size(X, 2)) = begin
	#priors
	α ~ Normal(mean(y), 2.5 * std(y))
	β ~ filldist(TDist(3), predictors)
	σ ~ Exponential(1)

	#likelihood
	y ~ MvNormal(α .+ X * β, σ)
end;