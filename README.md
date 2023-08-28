# RPCholesky.jl
Randomly Pivoted Cholesky algorithm, implemented in Julia, based on the description in https://arxiv.org/abs/2207.06503 by Chen et al. 

## Getting RPCholesky.jl
This package has been added to General Registry.  You can install it with the command:
```
(@v1.9) pkg> add RPCholesky
``` 

## Usage
Given a spd matrix `A`, the rank `k` random Cholesky factorization can be obtained with
```
julia> using RPCholesky
julia> F, S = rpcholesky(A, k);
```
where `F*F'≈A` and `S` is the array of randomly selected pivots.

For solving the Kernel ridge regression problem with $N\times N$ kernel matrix $A = (K(x_i, x_j))$,
$(A + \lambda N I)\beta = y$,  RPCholesky can be used to solve a smaller rank `k` linear system:
```
julia> β, S = ridge_rpcholesky(A, y, k, λ);
julia> f_apx(x_) = β ⋅ K.(x[S],x_);
```
## TO DO
* Implement blocked RPCholesky
* Implement RPCholesky accelerated spectral clustering
## About
This package has been developed in conjunction with R.J. Webber and D. Aristoff.

This work has been supported by:
* NSF DMS-2111278
## References
* Y. Chen, E. N. Epperly, J. A. Tropp, and R. J. Webber, “Randomly pivoted Cholesky: Practical approximation of a kernel matrix with few entry evaluations.” arXiv, Feb. 22, 2023. doi: 10.48550/arXiv.2207.06503.
* M. Díaz, E. N. Epperly, Z. Frangella, J. A. Tropp, and R. J. Webber, “Robust, randomized preconditioning for kernel ridge regression.” arXiv, Aug. 02, 2023. doi: 10.48550/arXiv.2304.12465.
