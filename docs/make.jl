push!(LOAD_PATH, "../src/")
using RPCholesky
using Documenter
using DocumenterCitations

bib = CitationBibliography(joinpath(@__DIR__, "src", "refs.bib"); style=:numeric)

makedocs(checkdocs=:none,
    sitename="RPCholesky.jl",
    modules=[RPCholesky],
    format=Documenter.HTML(
        # ...
        assets=String["assets/citations.css"],
    ),
    plugins=[bib],
    pages=[
        "Home" => "index.md",
        "Factorization" =>"rpc1.md",
        "Kernel Ridge Regression" =>"krr1.md"
    ])
deploydocs(;
    repo="github.com/gideonsimpson/RPCholesky.jl",
)