using Test
using RPCholesky

@testset "Factorization" begin
    @test include("factor/factor1.jl")
end

@testset "Kernel Ridge Regression" begin
    @test include("kernel/kernel1.jl")
end