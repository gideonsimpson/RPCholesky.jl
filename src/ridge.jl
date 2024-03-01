"""
    ridge_rpcholesky(A, y, k, λ; τ=1e-8, verbose=false)

Use RP Cholesky to accelerate ridge regression as in Algorithm 2.3 of Chen et
al.

This returns the approximate solution of `(A + N λ I) β = y` along with the
pivots from the factorization. 

### Fields
* `A` - the matrix, assumed to be spd
* `y` - the right handside vector
* `k` - maximum rank of approximation 
* `λ` - ridge regression regularizaiton parameter
* `τ = 1e-8` - approximation tolerance
* `verbose = false` - provide diagnostic details
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