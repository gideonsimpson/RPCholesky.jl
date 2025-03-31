"""
    rpc_krr(A, y, r, b, λ; tol = 1e-8, eps = 1e-12, verbose = false)

Use RP Cholesky to accelerate ridge regression as in Algorithm 2.3 of Chen et
al.

### Fields
* `A` - an spd matrix
* `y` - right-hand side of the ridge regression problem
* `r` - maximum desired rank
* `b` - block size 
* `λ` - ridge regression regularization
* `tol = 1e-8` - approximation tolerance
* `eps = 1e-12` - floating point stability parameter
* `verbose = false` - provide diagnostic details
"""
function rpc_krr(A, y, r, b, λ; tol=1e-8, eps = 1e-12, verbose=false)
    N, _ = size(A);
    _, S = rpc(A, r, b, tol=tol, eps = eps, verbose = verbose);

    AS = A[S,:];
    ASS = A[S,S];
    ASASt = AS*AS';
    β = (ASASt + λ * N * ASS)\(AS * y);

    return β, S

end

"""
    rpc_krr(A, y, r, b, λ; tol = 1e-8, eps = 1e-12, verbose = false)

Use RP Cholesky to accelerate ridge regression as in Algorithm 2.3 of Chen et
al.

### Fields
* `A` - an spd matrix
* `y` - right-hand side of the ridge regression problem
* `r` - maximum desired rank
* `λ` - ridge regression regularization
* `tol = 1e-8` - approximation tolerance
* `verbose = false` - provide diagnostic details
"""
function rpc_krr(A, y, r, λ; tol=1e-8, verbose=false)
    N, _ = size(A);
    _, S = rpc(A, r, tol=tol, verbose = verbose);

    AS = A[S,:];
    ASS = A[S,S];
    ASASt = AS*AS';
    β = (ASASt + λ * N * ASS)\(AS * y);

    return β, S

end