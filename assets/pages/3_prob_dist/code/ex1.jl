# This file was generated, do not modify it. # hide
using Plots, StatsPlots, Distributions, LaTeXStrings

bar(DiscreteUniform(1, 6),
        label="6-sided Dice",
        ms=5,
        xlabel=L"\theta",
        ylabel="Mass",
        ylims=(0, 0.3)
    )
savefig(joinpath(@OUTPUT, "discrete_uniform.svg")); # hide