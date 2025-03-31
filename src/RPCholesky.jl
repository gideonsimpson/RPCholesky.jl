module RPCholesky

using LinearAlgebra
using Distributions

include("factor.jl")
export rpc
include("ridge.jl")
export rpc_krr

end # module RPCholesky
