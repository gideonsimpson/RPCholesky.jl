N = 10; # number of points
x_pts = LinRange(0,1,N);

A = [K(x_, y_) for x_ in x_pts, y_ in x_pts];

# factor
F, _ = rpc(A, N, tol=0., verbose=false);

# check error
norm(A - F*F')< 10 * eps(1.)
