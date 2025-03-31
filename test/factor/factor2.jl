N = 100; # number of points
x_pts = LinRange(0,1,N);

A = [K(x_, y_) for x_ in x_pts, y_ in x_pts];

r = 50 # rank
b = 10 # block size 
# factor
F, _ = rpc(A, r, b, tol=1e-8, verbose=false);

# check error
norm(A - F*F')< 1e-6