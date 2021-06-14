Chains MCMC chain (2000×20×4 Array{Float64, 3}):

Iterations        = 1:2000
Thinning interval = 1
Number of chains  = 4
Samples per chain = 2000
parameters        = real_β[1], real_β[2], real_β[3], α, β[2], β[3], σ, β[1]
internals         = lp, n_steps, is_accept, acceptance_rate, log_density, hamiltonian_energy, hamiltonian_energy_error, max_hamiltonian_energy_error, tree_depth, numerical_error, step_size, nom_step_size

Summary Statistics
  parameters       mean       std   naive_se      mcse         ess      rhat
      Symbol    Float64   Float64    Float64   Float64     Float64   Float64

   real_β[1]     6.3091    2.1682     0.0242    0.0258   7986.0277    0.9997
   real_β[2]     0.5035    0.0621     0.0007    0.0010   3232.3091    1.0001
   real_β[3]    -0.0699    0.2179     0.0024    0.0040   2672.0353    1.0004
           α    33.0817    7.8834     0.0881    0.1648   1963.7866    1.0004
        β[1]   -49.8382    7.0620     0.0790    0.1465   1978.3683    1.0004
        β[2]    21.9659    3.5974     0.0402    0.0754   1982.2875    1.0004
        β[3]     0.2861    0.8925     0.0100    0.0164   2672.0353    1.0004
           σ    17.8607    0.5952     0.0067    0.0091   4872.8538    1.0003

Quantiles
  parameters       2.5%      25.0%      50.0%      75.0%      97.5%
      Symbol    Float64    Float64    Float64    Float64    Float64

   real_β[1]     2.0583     4.8243     6.3155     7.7857    10.5884
   real_β[2]     0.3830     0.4606     0.5036     0.5455     0.6218
   real_β[3]    -0.5382    -0.2001    -0.0596     0.0729     0.3379
           α    18.2807    27.5711    32.9860    38.2013    49.1213
        β[1]   -63.1163   -54.7251   -49.8893   -45.2805   -35.2841
        β[2]    14.6186    19.6251    22.0079    24.4810    28.7655
        β[3]    -1.3836    -0.2987     0.2439     0.8195     2.2040
           σ    16.7442    17.4363    17.8496    18.2599    19.0619
