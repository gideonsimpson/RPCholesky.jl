# RPCholesky Factorization

Given a spd matrix `A`, the rank `k` random Cholesky factorization can be obtained with 
```@docs
    rpcholesky
```
Its usage is illustrated in the following simple example, which returns the
factorization ``A\approx FF'``.
```@example
using LinearAlgebra
using RPCholesky
using Random

h = 1.0; # kernel width
K(x,y) = exp(-(x-y)^2 / (2*h^2))

N = 10; # number of points
x_pts = LinRange(0,1,N);

# consruct kernel matrix
A = [K(x_, y_) for x_ in x_pts, y_ in x_pts];

Random.seed!(100); # set seed for reproducibility
# factor
k = 5;
F, S = rpcholesky(A, 5);

# check error
@show opnorm(A - F*F'); # spectral norm
@show norm(A - F*F');   # Frobenius norm
```
