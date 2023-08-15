using LinearAlgebra
using Random

h = 1.0; # kernel width
K(x,y) = exp(-(x-y)^2 / (2*h^2))

N = 10; # number of points
x_pts = LinRange(0,1,N);

A = [K(x_, y_) for x_ in x_pts, y_ in x_pts];

# factor
Random.seed!(100)
F, _ = rpcholesky(A, N, τ=0., verbose=false);

# check error
opnorm(A - F*F')< 10 * eps(1.)