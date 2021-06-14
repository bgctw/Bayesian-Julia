# This file was generated, do not modify it. # hide
bar(Poisson(1),
        label=L"\lambda=1",
        alpha=0.3,
        xlabel=L"\theta",
        ylabel="Mass"
    )
bar!(Poisson(4), label=L"\lambda=4", alpha=0.3)
savefig(joinpath(@OUTPUT, "poisson.svg")); # hide