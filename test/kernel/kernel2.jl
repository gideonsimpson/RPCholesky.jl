N = 100;

# x_pts = rand(Uniform(0,10),N)
x_pts = LinRange(0,10,N);
y_pts = f.(x_pts);

A = [K(x_,y_) for x_ in x_pts, y_ in x_pts];
λ = 1e-8;

# rank k RPCholesky approximation
r = 20; 
b = 5;

β_rpc, S_rpc = rpc_krr(A, y_pts, r, b, λ, tol=1e-12);
f2_rpc(x) = β_rpc ⋅ K.(x_pts[S_rpc],x);

# check error
norm(f2_rpc.(x_pts) - y_pts, Inf)< 1e-2