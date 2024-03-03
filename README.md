# RPCholesky.jl
[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://gideonsimpson.github.io/RPCholesky.jl/dev)

Randomly Pivoted Cholesky algorithm, implemented in Julia, based on the
description in <https://arxiv.org/abs/2207.06503> by Chen et al. 

## Getting RPCholesky.jl
This package has been added to General Registry.  You can install it with the command:
```
(@v1.x) pkg> add RPCholesky
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
