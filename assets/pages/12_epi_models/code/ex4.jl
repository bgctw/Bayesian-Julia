# This file was generated, do not modify it. # hide
using Plots, StatsPlots, LaTeXStrings
@df br plot(:date, :new_confirmed, xlab=L"t", ylab="infected", label=false, title="Brasil COVID 2020")
savefig(joinpath(@OUTPUT, "infected.svg")); # hide