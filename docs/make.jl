if abspath(PROGRAM_FILE) == @__FILE__
    # When running the `make.jl` file as a script, automatically activate the
    # `docs` environment and dev-install the main package into that environment
    import Pkg
    Pkg.activate(@__DIR__)
    Pkg.develop(path=joinpath(@__DIR__, ".."))
    Pkg.instantiate()
end

using RPCholesky
using Documenter
using DocumenterCitations

bib = CitationBibliography(joinpath(@__DIR__, "src", "refs.bib"); style=:numeric)
#checkdocs=:none,
makedocs(
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