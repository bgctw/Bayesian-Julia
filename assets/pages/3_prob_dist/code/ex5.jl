# This file was generated, do not modify it. # hide
bar(NegativeBinomial(1, 0.5),
        label=L"k=1",
        alpha=0.3,
        xlabel=L"\theta",
        ylabel="Mass"
    )
bar!(NegativeBinomial(2, 0.5), label=L"k=2", alpha=0.3)
savefig(joinpath(@OUTPUT, "negbinomial.svg")); # hide