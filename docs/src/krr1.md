# Kernel Ridge Regression
One of the key applications of the method is to solving the ridge regressino problem.  This is performed with
```@docs
    ridge_rpcholesky
```
The following example shows how this can be used in a regression problem:
```@example
using LinearAlgebra
using RPCholesky
using Random
using Plots

f(x) = x * sin(x); # function to regress

N = 25;
x_pts = LinRange(0,10,N);
y_pts = f.(x_pts);

# set kernel
h = 1.;
K(x,y) = exp(-(x-y)^2 / (2*h^2))
A = [K(x_,y_) for x_ in x_pts, y_ in x_pts];
λ = 1e-8;

# rank k RPCholesky approximation
k = 8; 
Random.seed!(100)
β_rpc, S_rpc = ridge_rpcholesky(A, y_pts, k , λ);
f_rpc(x) = β_rpc ⋅ K.(x_pts[S_rpc],x);

# compare
x_plt = LinRange(0,10,100)
plot(x_plt, f.(x_plt), label="Truth")
plot!(x_plt, f_rpc.(x_plt),label="Approximation")
scatter!(x_pts, y_pts, label="Data")
xlabel!("x")
```