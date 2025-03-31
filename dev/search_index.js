var documenterSearchIndex = {"docs":
[{"location":"krr1/#Kernel-Ridge-Regression","page":"Kernel Ridge Regression","title":"Kernel Ridge Regression","text":"","category":"section"},{"location":"krr1/","page":"Kernel Ridge Regression","title":"Kernel Ridge Regression","text":"One of the key applications of the method is to solving the ridge regressino problem.  This is performed with","category":"page"},{"location":"krr1/","page":"Kernel Ridge Regression","title":"Kernel Ridge Regression","text":"RPCholesky.rpc_krr","category":"page"},{"location":"krr1/#RPCholesky.rpc_krr","page":"Kernel Ridge Regression","title":"RPCholesky.rpc_krr","text":"rpc_krr(A, y, r, b, λ; tol = 1e-8, eps = 1e-12, verbose = false)\n\nUse RP Cholesky to accelerate ridge regression as in Algorithm 2.3 of Chen et al.\n\nFields\n\nA - an spd matrix\ny - right-hand side of the ridge regression problem\nr - maximum desired rank\nb - block size \nλ - ridge regression regularization\ntol = 1e-8 - approximation tolerance\neps = 1e-12 - floating point stability parameter\nverbose = false - provide diagnostic details\n\n\n\n\n\nrpc_krr(A, y, r, b, λ; tol = 1e-8, eps = 1e-12, verbose = false)\n\nUse RP Cholesky to accelerate ridge regression as in Algorithm 2.3 of Chen et al.\n\nFields\n\nA - an spd matrix\ny - right-hand side of the ridge regression problem\nr - maximum desired rank\nλ - ridge regression regularization\ntol = 1e-8 - approximation tolerance\nverbose = false - provide diagnostic details\n\n\n\n\n\n","category":"function"},{"location":"krr1/","page":"Kernel Ridge Regression","title":"Kernel Ridge Regression","text":"The following example shows how this can be used in a regression problem:","category":"page"},{"location":"krr1/","page":"Kernel Ridge Regression","title":"Kernel Ridge Regression","text":"using LinearAlgebra\nusing RPCholesky\nusing Random\nusing Plots\n\nf(x) = x * sin(x); # function to regress\n\nN = 25;\nx_pts = LinRange(0,10,N);\ny_pts = f.(x_pts);\n\n# set kernel\nh = 1.;\nK(x,y) = exp(-(x-y)^2 / (2*h^2))\nA = [K(x_,y_) for x_ in x_pts, y_ in x_pts];\nλ = 1e-8;\n\n# rank k RPCholesky approximation\nk = 8; \nRandom.seed!(100)\nβ_rpc, S_rpc = rpc_krr(A, y_pts, k , λ);\nf_rpc(x) = β_rpc ⋅ K.(x_pts[S_rpc],x);\n\n# compare\nx_plt = LinRange(0,10,100)\nplot(x_plt, f.(x_plt), label=\"Truth\")\nplot!(x_plt, f_rpc.(x_plt),label=\"Approximation\")\nscatter!(x_pts, y_pts, label=\"Data\")\nxlabel!(\"x\")","category":"page"},{"location":"#RPCholesky.jl-Documentation","page":"Home","title":"RPCholesky.jl Documentation","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Randomly Pivoted Cholesky algorithm, implemented in Julia, based on the description in [1]","category":"page"},{"location":"#Acknowledgements","page":"Home","title":"Acknowledgements","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"This package has been developed in conjunction with R.J. Webber and D. Aristoff.","category":"page"},{"location":"","page":"Home","title":"Home","text":"This work was supported in part by the US National Science Foundation Grant DMS-2111278.","category":"page"},{"location":"#References","page":"Home","title":"References","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Y. Chen, E. N. Epperly, J. A. Tropp and R. J. Webber. Randomly pivoted Cholesky: Practical approximation of a kernel matrix with few entry evaluations (Feb 2023). Accessed on Aug 7, 2023, arXiv:2207.06503 [cs, math, stat].\n\n\n\nM. Díaz, E. N. Epperly, Z. Frangella, J. A. Tropp and R. J. Webber. Robust, randomized preconditioning for kernel ridge regression (Apr 2023). Accessed on May 1, 2023, arXiv:2304.12465 [cs, math, stat].\n\n\n\n","category":"page"},{"location":"rpc1/#RPCholesky-Factorization","page":"Factorization","title":"RPCholesky Factorization","text":"","category":"section"},{"location":"rpc1/","page":"Factorization","title":"Factorization","text":"Given a spd matrix A, the rank k random Cholesky factorization can be obtained with ","category":"page"},{"location":"rpc1/","page":"Factorization","title":"Factorization","text":"RPCholesky.rpc","category":"page"},{"location":"rpc1/#RPCholesky.rpc","page":"Factorization","title":"RPCholesky.rpc","text":"rpc(A, r, b; tol = 1e-8, eps = 1e-12, verbose = false)\n\nPerform the RPCholesky factorization for matrix A of rank at most r.  This corresponds to Algorithm 3 of Chen et al.\n\nThis returns the factorization F, along with the array of pivots, S.\n\nFields\n\nA - an spd matrix\nr - maximum desired rank\nb - block size \ntol = 1e-8 - approximation tolerance\neps = 1e-12 - floating point stability parameter\nverbose = false - provide diagnostic details\n\n\n\n\n\nrpc(A, r; tol = 1e-8, verbose = false)\n\nPerform the RPCholesky factorization for matrix A of rank at most r.  This corresponds to Algorithm 2.1 of Chen et al.\n\nFields\n\nA - an spd matrix\nr - maximum desired rank\ntol = 1e-8 - approximation tolerance\nverbose = false - provide diagnostic details\n\n\n\n\n\n","category":"function"},{"location":"rpc1/","page":"Factorization","title":"Factorization","text":"Its usage is illustrated in the following simple example, which returns the factorization Aapprox FF.","category":"page"},{"location":"rpc1/","page":"Factorization","title":"Factorization","text":"using LinearAlgebra\nusing RPCholesky\nusing Random\n\nh = 1.0; # kernel width\nK(x,y) = exp(-(x-y)^2 / (2*h^2))\n\nN = 10; # number of points\nx_pts = LinRange(0,1,N);\n\n# consruct kernel matrix\nA = [K(x_, y_) for x_ in x_pts, y_ in x_pts];\n\nRandom.seed!(100); # set seed for reproducibility\n# factor\nk = 5;\nF, S = rpc(A, 5);\n\n# check error\nprintln(tr(A - F*F')); # trace norm\nprintln(opnorm(A - F*F')); # spectral norm\nprintln(norm(A - F*F'));   # Frobenius norm","category":"page"}]
}
