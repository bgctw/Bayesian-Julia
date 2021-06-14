# This file was generated, do not modify it. # hide
using Turing
using LazyArrays
using Random:seed!
seed!(123)
setprogress!(false) # hide

@model logreg(X,  y; predictors=size(X, 2)) = begin
	#priors
	α ~ Normal(0, 2.5)
	β ~ filldist(TDist(3), predictors)

	#likelihood
	y ~ arraydist(LazyArray(@~ BernoulliLogit.(α .+ X * β)))
end;