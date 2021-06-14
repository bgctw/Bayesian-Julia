Chains MCMC chain (2000×21×4 Array{Float64, 3}):

Iterations        = 1:2000
Thinning interval = 1
Number of chains  = 4
Samples per chain = 2000
Wall duration     = 23.24 seconds
Compute duration  = 44.22 seconds
parameters        = α, β[2], β[3], σ, zⱼ[1], β[4], τ, zⱼ[2], β[1]
internals         = lp, n_steps, is_accept, acceptance_rate, log_density, hamiltonian_energy, hamiltonian_energy_error, max_hamiltonian_energy_error, tree_depth, numerical_error, step_size, nom_step_size

Summary Statistics
  parameters       mean       std   naive_se      mcse         ess      rhat   ess_per_sec
      Symbol    Float64   Float64    Float64   Float64     Float64   Float64       Float64

           α    70.7171    3.7520     0.0419    0.1314    643.3269    1.0109       14.5473
        β[1]     3.2346    1.2389     0.0139    0.0309   1451.8926    1.0023       32.8312
        β[2]   -11.6361    1.2846     0.0144    0.0353    934.6018    1.0041       21.1338
        β[3]     7.1123    1.2965     0.0145    0.0487    512.8530    1.0100       11.5970
        β[4]     1.1759    1.2408     0.0139    0.0341   1281.9471    1.0016       28.9882
           σ     6.0012    0.2751     0.0031    0.0075    980.0916    1.0066       22.1625
           τ     5.5030    3.3136     0.0370    0.1766    234.6798    1.0115        5.3067
       zⱼ[1]    -0.8301    0.7942     0.0089    0.0242   1008.4716    1.0027       22.8042
       zⱼ[2]     0.8556    0.7647     0.0085    0.0181   1764.2257    1.0038       39.8938

Quantiles
  parameters       2.5%      25.0%      50.0%      75.0%     97.5%
      Symbol    Float64    Float64    Float64    Float64   Float64

           α    62.5296    68.5887    70.8466    72.9431   78.6528
        β[1]     0.8245     2.3811     3.2215     4.0624    5.6575
        β[2]   -14.3082   -12.4932   -11.6406   -10.7912   -9.0889
        β[3]     4.3528     6.2666     7.1660     8.0014    9.5361
        β[4]    -1.1979     0.3184     1.1987     2.0157    3.6219
           σ     5.4719     5.8117     5.9948     6.1887    6.5486
           τ     1.9048     3.2633     4.5779     6.7159   14.0948
       zⱼ[1]    -2.4959    -1.3513    -0.7850    -0.2604    0.5743
       zⱼ[2]    -0.5917     0.3180     0.8285     1.3582    2.4132
