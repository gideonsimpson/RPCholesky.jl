push!(LOAD_PATH, "../src/")
using RPCholesky
using Documenter
makedocs(checkdocs=:none,
    sitename="RPCholesky.jl",
    modules=[RPCholesky],
    pages=[
        "Home" => "index.md",
        "Factorization" =>"rpc1.md",
        "Kernel Ridge Regression" =>"krr1.md"
    ])
deploydocs(;
    repo="github.com/gideonsimpson/RPCholesky.jl",
)