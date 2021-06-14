Chains MCMC chain (2000×17×4 Array{Float64, 3}):

Iterations        = 1:2000
Thinning interval = 1
Number of chains  = 4
Samples per chain = 2000
Wall duration     = 18.31 seconds
Compute duration  = 34.58 seconds
parameters        = α, β[2], β[3], σ, β[1]
internals         = lp, n_steps, is_accept, acceptance_rate, log_density, hamiltonian_energy, hamiltonian_energy_error, max_hamiltonian_energy_error, tree_depth, numerical_error, step_size, nom_step_size

Summary Statistics
  parameters      mean       std   naive_se      mcse         ess      rhat   ess_per_sec
      Symbol   Float64   Float64    Float64   Float64     Float64   Float64       Float64

           α   21.5966    8.4677     0.0947    0.1507   3132.7509    1.0012       90.6048
        β[1]    2.0162    1.8107     0.0202    0.0301   3272.0541    1.0003       94.6337
        β[2]    0.5797    0.0575     0.0006    0.0009   4148.5161    1.0008      119.9825
        β[3]    0.2484    0.3072     0.0034    0.0046   3759.6902    1.0004      108.7370
           σ   17.8705    0.6031     0.0067    0.0080   6213.8958    1.0007      179.7170

Quantiles
  parameters      2.5%     25.0%     50.0%     75.0%     97.5%
      Symbol   Float64   Float64   Float64   Float64   Float64

           α    5.1125   15.8925   21.5127   27.3617   38.1200
        β[1]   -0.5875    0.6809    1.6771    3.0018    6.3376
        β[2]    0.4683    0.5406    0.5803    0.6185    0.6911
        β[3]   -0.3554    0.0383    0.2512    0.4584    0.8412
           σ   16.7197   17.4624   17.8565   18.2746   19.1021
