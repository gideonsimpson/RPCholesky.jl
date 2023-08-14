# RPCholesky.jl
Randomly Pivoted Cholesky algorithm, implemented in Julia, based on the description in https://arxiv.org/abs/2207.06503 by Chen et al. 
## Usage
Given a spd matrix `A`, the rank `k` random Cholesky factorization can be obtained with
```
> using RPCholesky
> F, S = rpcholesky(A, k);
```
where `F*F'≈A` and `S` is the array of randomly selected pivots.

For solving the Kernel ridge regression problem with $N\times N$ kernel matrix $A = (K(x_i, x_j))$,
$$
(A + \lambda N I)\beta = y,
$$
RPCholesky can be used to solve a smaller rank `k` linear system:
```
> β, S = ridge_rpcholesky(A, y, k, λ);
> f_apx(x_) = β ⋅ K.(x[S],x_);
```
## References
* Y. Chen, E. N. Epperly, J. A. Tropp, and R. J. Webber, “Randomly pivoted Cholesky: Practical approximation of a kernel matrix with few entry evaluations.” arXiv, Feb. 22, 2023. doi: 10.48550/arXiv.2207.06503.
* M. Díaz, E. N. Epperly, Z. Frangella, J. A. Tropp, and R. J. Webber, “Robust, randomized preconditioning for kernel ridge regression.” arXiv, Aug. 02, 2023. doi: 10.48550/arXiv.2304.12465.
