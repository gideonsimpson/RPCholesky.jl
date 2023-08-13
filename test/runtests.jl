using Test
using RPCholesky

@testset "Factorization" begin
    @test include("factorization/factor1.jl")
end