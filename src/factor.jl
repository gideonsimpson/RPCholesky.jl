
"""
    rpcholesky(A, k; τ = 1e-8, verbose = false)

Perform the RPCholesky factorization for matrix `A` of rank at most `k`.  This
corresponds to Algorithm 2.1 of Chen et al.

This returns the factorization `F`, along with the array of pivots, `S`.

### Fields
* `A` - an spd matrix
* `k` - maximum desired rank
* `τ = 1e-8` - approximation tolerance
* `verbose = false` - provide diagnostic details
"""
function rpcholesky(A, k; τ = 1e-8, verbose = false)
    N, _ = size(A);
    F = zeros(N,k);
    S = Int[];
    d = diag(A);
    g = zeros(N);
    s = 0;
    trA = tr(A);
    for i in 1:k
        
        if(sum(d)>0)
            s = rand(Categorical(d/sum(d)))
        else
            @warn "[$(i)]: NOT A PROBABILITY VECTOR"
            F = F[:, 1:i-1]
            break
        end

        if (i==1)
            @. g = A[:, s];
        else
            g .= A[:, s] - (F[:, 1:i-1] * F[s, 1:i-1]);
        end
            
        if(g[s]>0)
            F[:, i] .= g / sqrt(g[s])
            push!(S,s);
        else
            @warn "[$(i)]: NON-POSITIVE PIVOT VALUE";
            F = F[:, 1:i-1]
            break
        end
        @. d -= abs(F[:, i])^2
        @. d = max(d, 0)

        if (sum(d) < τ * trA)
            if(verbose)
                @warn "[$(i)]: TOLERANCE SATISFIED"
            end
            F = F[:, 1:i]
            break
        end

    end

    return F, S

end