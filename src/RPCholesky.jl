module RPCholesky

using LinearAlgebra
using Distributions

include("factor.jl")
export rpcholesky
include("ridge.jl")
export ridge_rpcholesky

end # module RPCholesky
