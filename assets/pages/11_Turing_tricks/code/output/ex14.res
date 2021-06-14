Chains MCMC chain (2000×21×4 Array{Float64, 3}):

Iterations        = 1:2000
Thinning interval = 1
Number of chains  = 4
Samples per chain = 2000
Wall duration     = 21.56 seconds
Compute duration  = 41.53 seconds
parameters        = α, β[2], β[3], σ, αⱼ[2], β[4], τ, αⱼ[1], β[1]
internals         = lp, n_steps, is_accept, acceptance_rate, log_density, hamiltonian_energy, hamiltonian_energy_error, max_hamiltonian_energy_error, tree_depth, numerical_error, step_size, nom_step_size

Summary Statistics
  parameters       mean       std   naive_se      mcse         ess      rhat   ess_per_sec
      Symbol    Float64   Float64    Float64   Float64     Float64   Float64       Float64

           α    70.5812    5.4308     0.0607    0.1280   1269.5933    1.0030       30.5690
        β[1]     3.2343    1.2497     0.0140    0.0213   3236.9970    1.0004       77.9398
        β[2]   -11.5969    1.2638     0.0141    0.0208   3666.7958    0.9998       88.2884
        β[3]     7.1794    1.2530     0.0140    0.0187   3578.8368    1.0001       86.1706
        β[4]     1.2237    1.2440     0.0139    0.0199   3499.0445    1.0004       84.2494
           σ     6.0019    0.2792     0.0031    0.0038   5204.3562    0.9999      125.3095
           τ     6.4990    6.1496     0.0688    0.1521   1893.9997    1.0005       45.6034
       αⱼ[1]    -3.3312    5.2955     0.0592    0.1271   1253.5382    1.0035       30.1825
       αⱼ[2]     3.8291    5.3137     0.0594    0.1282   1258.8535    1.0032       30.3104

Quantiles
  parameters       2.5%      25.0%      50.0%      75.0%     97.5%
      Symbol    Float64    Float64    Float64    Float64   Float64

           α    58.8438    68.2133    70.6765    73.1325   81.0192
        β[1]     0.8145     2.3821     3.2137     4.0686    5.6916
        β[2]   -14.0398   -12.4602   -11.5944   -10.7501   -9.0831
        β[3]     4.7196     6.3402     7.1896     8.0161    9.5842
        β[4]    -1.2125     0.3873     1.2269     2.0585    3.6969
           σ     5.4759     5.8147     5.9903     6.1763    6.5757
           τ     1.9584     3.3180     4.7112     7.2937   23.0001
       αⱼ[1]   -13.5006    -5.6777    -3.4063    -1.1556    8.3378
       αⱼ[2]    -6.2870     1.4706     3.6184     6.0691   15.6051
