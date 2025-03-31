
"""
    rpc(A, r, b; tol = 1e-8, eps = 1e-12, verbose = false)

Perform the RPCholesky factorization for matrix `A` of rank at most `r`.  This
corresponds to Algorithm 3 of Chen et al.

This returns the factorization `F`, along with the array of pivots, `S`.

### Fields
* `A` - an spd matrix
* `r` - maximum desired rank
* `b` - block size 
* `tol = 1e-8` - approximation tolerance
* `eps = 1e-12` - floating point stability parameter
* `verbose = false` - provide diagnostic details
"""
function rpc(A, r, b; tol = 1e-8, eps=1e-12, verbose = false)
    N, _ = size(A);
    F = zeros(N, r + b);
    G = zeros(N, b);
    S = Int[];
    d = diag(A);
    trA = tr(A);

    for i = 1:r
        
        s = rand(Categorical(d/sum(d)), b)
        setdiff!(s, S)
        unique!(s);
        nS = length(S);
        ns = length(s);

        G[:,1:length(s)] = A[:, s] - F[:,1:nS] * (F[s,1:nS]');
        chol = cholesky(G[s,1:ns] + eps * I);
        
        GRinv = G[:,1:length(s)]/chol.U;

        F[:,nS+ 1:nS + ns] = GRinv;
        d .= clamp.(d - sum(abs2, GRinv,dims=2), 0, Inf);
        @. d[s] = 0;
        append!(S,s);

        if (sum(d) < tol * trA)
            if(verbose)
                @warn "[$(i)]: TOLERANCE SATISFIED"
            end
            break
        end

        if (length(S)> r)
            if(verbose)
                @warn "[$(i)]: RANK SATISFIED"
            end
            break
        end
    end
    if length(S)> r
        S = S[1:r];
    end
    F = F[:,1:length(S)]; 


    return F, S

end

"""
    rpc(A, r; tol = 1e-8, verbose = false)

Perform the RPCholesky factorization for matrix `A` of rank at most `r`.  This
corresponds to Algorithm 2.1 of Chen et al.

### Fields
* `A` - an spd matrix
* `r` - maximum desired rank
* `tol = 1e-8` - approximation tolerance
* `verbose = false` - provide diagnostic details
"""
function rpc(A, r; tol = 1e-8, verbose = false)
    return rpc(A, r, 1, tol = tol, eps=eps(), verbose = verbose)
end
