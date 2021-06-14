# This file was generated, do not modify it.

using Plots, StatsPlots, Distributions, LaTeXStrings

dice = DiscreteUniform(1, 6)
plot(dice,
    label="six-sided Dice",
    ms=5,
    xlabel=L"\theta",
    ylabel="Mass",
    ylims=(0, 0.3)
)
vline!([mean(dice)], lw=5, col=:red, label=L"E(\theta)")
savefig(joinpath(@OUTPUT, "dice.svg")); # hide

using Turing
setprogress!(false) # hide

@model dice_throw(y) = begin
    #Our prior belief about the probability of each result in a six-sided dice.
    #p is a vector of length 6 each with probability p that sums up to 1.
    p ~ Dirichlet(6, 1)

    #Each outcome of the six-sided dice has a probability p.
    for i in eachindex(y)
        y[i] ~ Categorical(p)
    end
end;

mean(Dirichlet(6, 1))

sum(mean(Dirichlet(6, 1)))

using Random

Random.seed!(123);

data = rand(DiscreteUniform(1, 6), 1_000);

first(data, 5)

model = dice_throw(data);

chain = sample(model, NUTS(), 2_000);

summaries, quantiles = describe(chain);

summaries

sum(summaries[:, :mean])

summarystats(chain[:, 1:3, :])

summarystats(chain[[:var"p[1]", :var"p[2]"]])

sum([idx * i for (i, idx) in enumerate(summaries[:, :mean])])

typeof(chain)

plot(chain)
savefig(joinpath(@OUTPUT, "chain.svg")); # hide

prior_chain = sample(model, Prior(), 2_000);

missing_data = Vector{Missing}(missing, 1) # vector of `missing`
model_predict = dice_throw(missing_data) # instantiate the "predictive model"
prior_check = predict(model_predict, prior_chain);

typeof(prior_check)

summarystats(prior_check)

posterior_check = predict(model_predict, chain);
summarystats(posterior_check)

