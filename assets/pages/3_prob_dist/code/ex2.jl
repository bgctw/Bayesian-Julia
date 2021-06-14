# This file was generated, do not modify it. # hide
bar(Bernoulli(0.5),
        label=L"p=0.5",
        alpha=0.3,
        xlabel=L"\theta",
        ylabel="Mass",
        ylim=(0, 1)
    )
bar!(Bernoulli(0.2), label=L"p=0.2", alpha=0.3)
savefig(joinpath(@OUTPUT, "bernoulli.svg")); # hide