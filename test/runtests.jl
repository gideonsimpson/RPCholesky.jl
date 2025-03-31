using Test
using RPCholesky
using LinearAlgebra
using Random

# common kernel
h = 1;
K(x,y) = exp(-(x-y)^2 / (2*h^2))
# common functions
f(x) = x * sin(x); # function to regress


Random.seed!(100);

@testset "Factorization" begin
    @test include("factor/factor1.jl")
    @test include("factor/factor2.jl")
end

@testset "Kernel Ridge Regression" begin
    @test include("kernel/kernel1.jl")
    @test include("kernel/kernel2.jl")
end