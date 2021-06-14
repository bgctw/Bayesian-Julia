# This file was generated, do not modify it. # hide
bar(Binomial(5, 0.5),
        label=L"p=0.5",
        alpha=0.3,
        xlabel=L"\theta",
        ylabel="Mass"
    )
bar!(Binomial(5, 0.2), label=L"p=0.2", alpha=0.3)
savefig(joinpath(@OUTPUT, "binomial.svg")); # hide