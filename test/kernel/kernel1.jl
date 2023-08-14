
f(x) = x * sin(x); # function to regress

N = 100;

# x_pts = rand(Uniform(0,10),N)
x_pts = LinRange(0,10,N);
y_pts = f.(x_pts);

h = 1.;
K(x,y) = exp(-(x-y)^2 / (2*h^2))
A = [K(x_,y_) for x_ in x_pts, y_ in x_pts];
λ = 1e-8;

# rank k RPCholesky approximation
k = 20; 

β_rpc, S_rpc = ridge_rpcholesky(A, y_pts,k , λ, τ=1e-12);
f_rpc(x) = β_rpc ⋅ K.(x_pts[S_rpc],x);

# check error
norm(f_rpc.(x_pts) - y_pts, Inf)< 0.1