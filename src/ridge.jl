"""
    ridge_rpcholesky(A, y, k, λ; τ=1e-8, verbose=false)

Use RP Cholesky to accelerate ridge regression as in Algorithm 2.3 of Chen et
al.
"""
function ridge_rpcholesky(A, y, k, λ; τ=1e-8, verbose=false)
    N, _ = size(A);
    _, S = rpcholesky(A, k, τ=τ, verbose = verbose);

    AS = A[S,:];
    ASS = A[S,S];
    ASASt = AS*AS';
    β = (ASASt + λ * N * ASS)\(AS * y);

    return β, S


end