Chains MCMC chain (2000×17×4 Array{Float64, 3}):

Iterations        = 1:2000
Thinning interval = 1
Number of chains  = 4
Samples per chain = 2000
Wall duration     = 7.1 seconds
Compute duration  = 13.98 seconds
parameters        = α, β[2], β[3], σ, β[1]
internals         = lp, n_steps, is_accept, acceptance_rate, log_density, hamiltonian_energy, hamiltonian_energy_error, max_hamiltonian_energy_error, tree_depth, numerical_error, step_size, nom_step_size

Summary Statistics
  parameters       mean       std   naive_se      mcse         ess      rhat   ess_per_sec
      Symbol    Float64   Float64    Float64   Float64     Float64   Float64       Float64

           α    33.0817    7.8834     0.0881    0.1648   1963.7866    1.0004      140.5113
        β[1]   -49.8382    7.0620     0.0790    0.1465   1978.3683    1.0004      141.5547
        β[2]    21.9659    3.5974     0.0402    0.0754   1982.2875    1.0004      141.8351
        β[3]     0.2861    0.8925     0.0100    0.0164   2672.0353    1.0004      191.1874
           σ    17.8607    0.5952     0.0067    0.0091   4872.8538    1.0003      348.6587

Quantiles
  parameters       2.5%      25.0%      50.0%      75.0%      97.5%
      Symbol    Float64    Float64    Float64    Float64    Float64

           α    18.2807    27.5711    32.9860    38.2013    49.1213
        β[1]   -63.1163   -54.7251   -49.8893   -45.2805   -35.2841
        β[2]    14.6186    19.6251    22.0079    24.4810    28.7655
        β[3]    -1.3836    -0.2987     0.2439     0.8195     2.2040
           σ    16.7442    17.4363    17.8496    18.2599    19.0619
