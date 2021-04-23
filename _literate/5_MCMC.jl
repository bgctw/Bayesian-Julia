# # Markov Chain Monte Carlo (MCMC)

# The main computational barrier for Bayesian statistics is the denominator $P(\text{data})$ of the Bayes formula:

# $$ P(\theta \mid \text{data})=\frac{P(\theta) \cdot P(\text{data} \mid \theta)}{P(\text{data})} \label{bayes} $$

# In discrete cases we can turn the denominator into a sum of all parameters using the chain rule of probability:

# $$ P(A,B \mid C)=P(A \mid B,C) \times P(B \mid C) \label{chainrule} $$

# This is also called marginalization:

# $$ P(\text{data})=\sum_{\theta} P(\text{data} \mid \theta) \times P(\theta) \label{discretemarginalization} $$

# However, in the continuous cases the denominator $P(\text{data})$ becomes a very large and complicated integral to calculate:

# $$ P(\text{data})=\int_{\theta} P(\text{data} \mid \theta) \times P(\theta)d \theta \label{continuousmarginalization} $$

# In many cases this integral becomes *intractable* (incalculable) and therefore we must find other ways to calculate
# the posterior probability $P(\theta \mid \text{data})$ in \eqref{bayes} without using the denominator $P(\text{data})$.

# ## What is the denominator $P(\text{data})$ for?

# Quick answer: to normalize the posterior in order to make it a valid probability distribution. This means that the sum of all probabilities
# of the possible events in the probability distribution must be equal to 1:

# - in the case of discrete probability distribution:  $\sum_{\theta} P(\theta \mid \text{data}) = 1$
# - in the case of continuous probability distribution: $\int_{\theta} P(\theta \mid \text{data})d \theta = 1$

# ## What if we remove this denominator?

# When we remove the denominator $(\text{data})$ we have that the posterior $P(\theta \mid \text{data})$ is **proportional** to the
# prior multiplied by the likelihood $P(\theta) \cdot P(\text{data} \mid \theta)$[^propto].

# $$ P(\theta \mid \text{data}) \propto P(\theta) \cdot P(\text{data} \mid \theta) \label{proptobayes} $$

# This [YouTube video](https://youtu.be/8FbqSVFzmoY) explains the denominator problem very well, see below:

# ~~~
# <style>.embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; } .embed-container iframe, .embed-container object, .embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }</style><div class='embed-container'><iframe src='https://www.youtube.com/embed/8FbqSVFzmoY' frameborder='0' allowfullscreen></iframe></div>
# ~~~

# ## Markov Chain Monte Carlo - (MCMC)

# This is where Markov Chain Monte Carlo comes in. MCMC is a broad class of computational tools for approximating integrals and generating samples from
# a posterior probability (Brooks, Gelman, Jones & Meng, 2011). MCMC is used when it is not possible to sample $\theta$ directly from the subsequent
# probabilistic distribution $P(\theta \mid \text{data})$. Instead, we sample in an iterative manner such that at each step of the process we expect the
# distribution from which we sample $P^* (\theta^* \mid \text{data})$ (here $*$ means simulated) becomes increasingly similar to the posterior
# $P(\theta \mid \text{data})$. All of this is to eliminate the (often impossible) calculation of the denominator $P(\text{data})$.

# The idea is to define an ergodic Markov chain (that is to say that there is a single stationary distribution) of which the set of possible states
# is the sample space and the stationary distribution is the distribution to be approximated (or sampled). Let $X_0, X_1, \dots, X_n$ be a
# simulation of the chain. The Markov chain converges to the stationary distribution of any initial state $X_0$ after a large enough number
# of iterations $r$, the distribution of the state $X_r$ will be similar to the stationary distribution, so we can use it as a sample.
# Markov chains have a property that the probability distribution of the next state depends only on the current state and not on the
# sequence of events that preceded: $P(X_{n+1}=x \mid X_{0},X_{1},X_{2},\ldots ,X_{n}) = P(X_{n+1}=x \mid X_{n})$. This property is
# called Markovian, after the mathematician [Andrey Markov](https://en.wikipedia.org/wiki/Andrey_Markov) (see figure below).
# Similarly, repeating this argument with $X_r$ as the starting point, we can use $X_{2r}$ as a sample, and so on.
# We can then use the state sequence $X_r, X_{2r}, X_{3r}, \dots$ as almost independent samples of the stationary distribution
# of the Markov chain.

# ![Andrey Markov](/pages/images/andrey_markov.jpg)
#
# \center{*Andrey Markov*} \\

# The effectiveness of this approach depends on:

# 1. how big $r$ must be to ensure a suitably good sample; and

# 2. computational power required for each iteration of the Markov chain.

# In addition, it is customary to discard the first iterations of the algorithm as they are usually not representative
# of the distribution to be approximated. In the initial iterations of MCMC algorithms, generally the Markov current is
# in a *warm-up* process[^warmup] and its state is far from ideal to start a reliable sampling. It is generally recommended
# to discard half of the iterations (Gelman, Carlin, Stern, Dunson, Vehtari, & Rubin, 2013a). For example:
# if the Markov chain has 4,000 iterations, we discard the first 2,000 as warm-up.

# ### Monte Carlo Method

# Stanislaw Ulam (figure below), who participated in the Manhattan project and when trying to calculate the neutron diffusion
# process for the hydrogen bomb ended up creating a class of methods called **_Monte Carlo_**.

# ![Stanislaw Ulam](/pages/images/stanislaw.jpg)
#
# \center{*Stanislaw Ulam*} \\

# Monte Carlo methods have the underlying concept of using randomness to solve problems that can be deterministic in principle.
# They are often used in physical and mathematical problems and are most useful when it is difficult or impossible to use other approaches.
# Monte Carlo methods are used mainly in three classes of problems: optimization, numerical integration and generating sample from a
# probability distribution.

# The idea for the method came to Ulam while playing solitaire during his recovery from surgery, as he thought about playing hundreds
# of games to statistically estimate the probability of a successful outcome. As he himself mentions in Eckhardt (1987):
#
# > "The first thoughts and attempts I made to practice [the Monte Carlo method] were suggested by a question which occurred to me
# > in 1946 as I was convalescing from an illness and playing solitaires. The question was what are the chances that a Canfield solitaire
# > laid out with 52 cards will come out successfully? After spending a lot of time trying to estimate them by pure combinatorial
# > calculations, I wondered whether a more practical method than "abstract thinking" might not be to lay it out say one hundred times and
# > simply observe and count the number of successful plays. This was already possible to envisage with the beginning of the new era of
# > fast computers, and I immediately thought of problems of neutron diffusion and other questions of mathematical physics, and more
# > generally how to change processes described by certain differential equations into an equivalent form interpretable as a succession
# > of random operations. Later... [in 1946, I ] described the idea to John von Neumann and we began to plan actual calculations."

# Because it was secret, von Neumann and Ulam's work required a codename. A colleague of von Neumann and Ulam, Nicholas Metropolis
# (figure below), suggested using the name "Monte Carlo", which refers to Casino Monte Carlo in Monaco, where Ulam's uncle
# (Michał Ulam) borrowed money from relatives to gamble.

# ![Nicholas Metropolis](/pages/images/nicholas_metropolis.png)
#
# \center{*Nicholas Metropolis*} \\

# The [applications of the Monte Carlo method](https://en.wikipedia.org/wiki/Monte_Carlo_method#Applications) are numerous:
# physical sciences, engineering, climate change, computational biology, computer graphics, applied statistics, artificial intelligence,
# search and rescue, finance and business and law. In the scope of these tutorials we will focus on applied statistics and specifically
# in the context of Bayesian inference: providing a random sample of the posterior distribution.

# ### Simulations

# I will do some simulations to ilustrate MCMC algorithms and techniques. So, here's the initial setup:

using Plots, StatsPlots, Distributions, LaTeXStrings, Random

Random.seed!(123);

# Let's start with a toy problem of a multivariate normal distribution of $X$ and $Y$, where

# $$
# \begin{bmatrix}
# X \\
# Y
# \end{bmatrix} \sim \text{Multivariate Normal} \left(
# \begin{bmatrix}
# \mu_X \\
# \mu_Y
# \end{bmatrix}, \mathbf{\Sigma}
# \right) \\
# \mathbf{\Sigma} \sim
# \begin{pmatrix}
# \sigma^2_{X} & \sigma_{X}\sigma_{Y} \rho \\
# \sigma_{X}\sigma_{Y} \rho & \sigma^2_{Y}
# \end{pmatrix}
# \label{mvnormal}
# $$

# If we designate $\mu_X = \mu_Y = 0$ and $\sigma_X = \sigma_Y = 1$ (mean 0 and standard deviation 1
# for both $X$ and $Y$), we have the following formulation from \eqref{mvnormal}:

# $$
# \begin{bmatrix}
# X \\
# Y
# \end{bmatrix} \sim \text{Multivariate Normal} \left(
# \begin{bmatrix}
# 0 \\
# 0
# \end{bmatrix}, \mathbf{\Sigma}
# \right), \\
# \mathbf{\Sigma} \sim
# \begin{pmatrix}
# 1 & \rho \\
# \rho & 1
# \end{pmatrix}
# \label{stdmvnormal}
# $$

# All that remains is to designate a value of $\rho$ in \eqref{stdmvnormal} for the correlation between $X$ and $Y$.
# For our example we will use correlation of 0.8 ($\rho = 0.8$):

# $$
# \mathbf{\Sigma} \sim
# \begin{pmatrix}
# 1 & 0.8 \\
# 0.8 & 1
# \end{pmatrix}
# \label{Sigma}
# $$

N = 100_000
μ = [0, 0]
Σ = [1 0.8; 0.8 1]

mvnormal = MvNormal(μ, Σ)

data = rand(mvnormal, N)';

# In the figure below it is possible to see a countour plot of the PDF of a multivariate normal distribution composed of two normal
# variables $X$ and $Y$, both with mean 0 and standard deviation 1.
# The correlation between $X$ and $Y$ is $\rho = 0.8$:

x = -3:0.01:3
y = -3:0.01:3
dens_mvnormal = [pdf(mvnormal, [i, j]) for i in x, j in y]
contour(dens_mvnormal, xlabel=L"X", ylabel=L"Y", fill=true)
savefig(joinpath(@OUTPUT, "countour_mvnormal.svg")); # hide

# \fig{countour_mvnormal}
# \center{*Countour Plot of the PDF of a Multivariate Normal Distribution*} \\

# Also a surface plot can be seen below for you to get a 3-D intuition of what is going on:

surface(dens_mvnormal, xlabel=L"X", ylabel=L"Y", zlabel="PDF")
savefig(joinpath(@OUTPUT, "surface_mvnormal.svg")); # hide

# \fig{surface_mvnormal}
# \center{*Surface Plot of the PDF of a Multivariate Normal Distribution*} \\

# ### Metropolis and Metropolis-Hastings

# The first MCMC algorithm widely used to generate samples from Markov chain originated in physics in the 1950s
# (in a very close relationship with the atomic bomb at the Manhattan project) and is called **Metropolis**
# (Metropolis, Rosenbluth, Rosenbluth, Teller, & Teller, 1953) in honor of the first author [Nicholas Metropolis](https://en.wikipedia.org/wiki/Nicholas_Metropolis)
# (figure above). In summary, the Metropolis algorithm is an adaptation of a random walk with
# an acceptance/rejection rule to converge to the target distribution.

# The Metropolis algorithm uses a **proposal distribution** $J_t(\theta^*)$ ($J$ stands for *jumping distribution*
# and $t$ indicates which state of the Markov chain we are in) to define next values of the distribution
# $P^*(\theta^* \mid \text{data})$. This distribution must be symmetrical:

# $$ J_t (\theta^* \mid \theta^{t-1}) = J_t(\theta^{t-1} \mid \theta^*) \label{symjump} $$

# In the 1970s, a generalization of the Metropolis algorithm emerged that **does not** require that the proposal distributions
# be symmetric. The generalization was proposed by [Wilfred Keith Hastings](https://en.wikipedia.org/wiki/W._K._Hastings)
# (Hastings, 1970) (figure below) and is called **Metropolis-Hastings algorithm**.

# ![Wilfred Hastings](/pages/images/hastings.jpg)
#
# \center{*Wilfred Hastings*} \\

# #### Metropolis Algorithm

# The essence of the algorithm is a random walk through the parameters' sample space, where the probability of the Markov chain
# changing state is defined as:

# $$ P_{\text{change}} = \min \left( {\frac{P (\theta_{\text{proposed}})}{P (\theta_{\text{current}})}}, 1 \right) \label{proposal} $$

# This means that the Markov chain will only change to a new state under two conditions:

# 1. When the probability of the parameters proposed by the random walk $P(\theta_{\text{proposed}})$ is **greater** than the probability of the parameters of the current state $P(\theta_{\text{current}})$, we change with 100% probability. Note that if $P(\theta_{\text{proposed}}) > P(\theta_{\text{current}})$ then the function $\min$ chooses the value 1 which means 100%.
# 2. When the probability of the parameters proposed by the random walk $P(\theta_{\text{proposed}})$ is **less** than the probability of the parameters of the current state $P(\theta_{\text{current}})$, we changed with a probability equal to the proportion of that difference. Note that if $P(\theta_{\text{proposed}}) < P(\theta_{\text{current}})$ then the function $\min$ **does not** choose the value 1, but the value $\frac{P(\theta_{\text{proposed}})}{P(\theta_{\text{current}})}$ which equates the proportion of the probability of the proposed parameters to the probability of the parameters at the current state.

# Anyway, at each iteration of the Metropolis algorithm, even if the Markov chain changes state or not, we sample the parameter
# $\theta$ anyway. That is, if the chain does not change to a new state, $\theta$ will be sampled twice (or
# more if the current is stationary in the same state).

# The Metropolis-Hastings algorithm can be described in the following way [^metropolis] ($\theta$ is the parameter, or set of
# parameters, of interest and $y$ is the data):

# 1. Define a starting point $\theta^0$ of which $p(\theta^0 \mid y) > 0$, or sample it from an initial distribution $p_0(\theta)$. $p_0(\theta)$ can be a normal distribution or a prior distribution of $\theta$ ($p(\theta)$).
#
# 2. For $t = 1, 2, \dots$:

#    -   Sample a proposed $\theta^*$ from a proposal distribution in time $t$, $J_t (\theta^* \mid \theta^{t-1})$.

#    -   Calculate the ratio of probabilities:

#        -   **Metropolis**: $r = \frac{p(\theta^*  \mid y)}{p(\theta^{t-1} \mid y)}$
#        -   **Metropolis-Hastings**: $r = \frac{\frac{p(\theta^* \mid y)}{J_t(\theta^* \mid \theta^{t-1})}}{\frac{p(\theta^{t-1} \mid y)}{J_t(\theta^{t-1} \mid \theta^*)}}$

#    -   Assign:

#        $$
#        \theta^t =
#        \begin{cases}
#        \theta^* & \text{with probability } \min (r, 1) \\
#        \theta^{t-1} & \text{otherwise}
#        \end{cases}
#        $$

# #### Limitations of the Metropolis Algorithm

# The limitations of the Metropolis-Hastings algorithm are mainly computational. With randomly generated proposals,
# it usually takes a large number of iterations to enter areas of higher (more likely) posterior densities. Even
# efficient Metropolis-Hastings algorithms sometimes accept less than 25% of the proposals (Roberts, Gelman & Gilks, 1997).
# In lower-dimensional situations, the increased computational power can compensate for the lower efficiency to some extent.
# But in higher-dimensional and more complex modeling situations, bigger and faster computers alone are rarely
# enough to overcome the challenge.

# #### Metropolis - Implementation

# In our toy example we will assume that $J_t (\theta^* \mid \theta^{t-1})$ is symmetric, thus
# $J_t(\theta^* \mid \theta^{t-1}) = J_t (\theta^{t-1} \mid \theta^*)$, so I'll just implement
# the Metropolis algorithm (not the Metropolis-Hastings algorithm).

# Below I created a Metropolis sampler for our toy example. At the end it prints the acceptance rate of
# the proposals. Here I am using the same proposal distribution for both $X$ and $Y$: a uniform distribution
# parameterized with a `width` parameter:

# $$
# X \sim \text{Uniform} \left( X - \frac{\text{width}}{2}, X + \frac{\text{width}}{2} \right) \\
# Y \sim \text{Uniform} \left( Y - \frac{\text{width}}{2}, Y + \frac{\text{width}}{2} \right)
# $$

# I will use the already known `Distributions.jl` `MvNormal` from the plots above along with the `logpdf()`
# function to calculate the PDF of the proposed and current $\theta$s. It is easier to work with
# probability logs than with the absolute values. This is due to computational complexity and
# also numerical underflow. Mathematically we will compute:

# $$
# \begin{aligned}
# r &= \frac{
# \operatorname{PDF}\left(
# \text{Multivariate Normal} \left(
# \begin{bmatrix}
# x_{\text{proposed}} \\
# y_{\text{proposed}}
# \end{bmatrix}
# \right)
# \Bigg|
# \text{Multivariate Normal} \left(
# \begin{bmatrix}
# \mu_X \\
# \mu_Y
# \end{bmatrix}, \mathbf{\Sigma}
# \right)
# \right)}
# {
# \operatorname{PDF}\left(
# \text{Multivariate Normal} \left(
# \begin{bmatrix}
# x_{\text{current}} \\
# y_{\text{current}}
# \end{bmatrix}
# \right)
# \Bigg|
# \text{Multivariate Normal} \left(
# \begin{bmatrix}
# \mu_X \\
# \mu_Y
# \end{bmatrix}, \mathbf{\Sigma}
# \right)
# \right)}\\
# &=\frac{\operatorname{PDF}_{\text{proposed}}}{\operatorname{PDF}_{\text{current}}}\\
# &= \exp\Big(
# \log\left(\operatorname{PDF}_{\text{proposed}}\right)
# -
# \log\left(\operatorname{PDF}_{\text{current}}\right)
# \Big)
# \end{aligned}
# $$

# Here is a simple implementation in Julia:

function metropolis(S::Int64, width::Float64, ρ::Float64;
                    μ_x::Float64=0.0, μ_y::Float64=0.0,
                    σ_x::Float64=1.0, σ_y::Float64=1.0)
    binormal = MvNormal([μ_x; μ_y], [σ_x ρ; ρ σ_y]);
    draws = Matrix{Float64}(undef, S, 2);
    x = randn(); y = randn();
    accepted = 0::Int64;
    for s in 1:S
        x_ = rand(Uniform(x - width, x + width));
        y_ = rand(Uniform(y - width, y + width));
        r = exp(logpdf(binormal, [x_, y_]) - logpdf(binormal, [x, y]));

        if r > rand(Uniform())
            x = x_;
            y = y_;
            accepted += 1;
        end
        @inbounds draws[s, :] = [x y];
    end
    println("Acceptance rate is: $(accepted / S)")
    return draws
end

# Now let's run our `metropolis()` algorithm for the bivariate normal case with
# `S = 10_000`, `width = 2.75` and `ρ = 0.8`:

X_met = metropolis(10_000, 2.75, 0.8);

# Take a quick peek into `X_met`, we'll see it's a Matrix of $X$ and $Y$ values as columns and the time $t$ as rows:

X_met[1:10, :]

# Also note that the acceptance of the proposals was 20.7%, the expected for Metropolis algorithms (around 20-25%)
# (Roberts et. al, 1997).

# We can construct `Chains` object using `MCMCChains.jl` by passing a matrix along with the parameters names as
# symbols inside the `Chains()` constructor:

using MCMCChains

chain_met = Chains(X_met, [:X, :Y]);

# Then we can get summary statistics regarding our Markov chain derived from the Metropolis algorithm:

summarystats(chain_met)

# Both of `X` and `Y` have mean close to 0 and standard deviation close to 1.
# Take notice of the `ess` (effective sample size - ESS) that is between 800-900.
# So let's calculate the efficiency of our Metropolis algorithm by dividing
# the ESS by the number of sampling iterations that we've performed:

# $$ \text{efficiency} = \frac{\text{ESS}}{\text{Iterations}} \label{ESS} $$

mean(summarystats(chain_met)[:, :ess]) / 10_000

# So, our Metropolis algorithm has around 9% efficiency. Which, in my honest opinion, *sucks*...

# ## Footnotes
# [^propto]: the symbol $\propto$ (`\propto`) should be read as "proportional to".
# [^warmup]: some references call this process *burnin*.
# [^metropolis]: if you want a better explanation of the Metropolis and Metropolis-Hastings algorithms I suggest to see Chib & Greenberg (1995).

# ## References

# Betancourt, M. (2017, January 9). A Conceptual Introduction to Hamiltonian Monte Carlo. Retrieved November 6, 2019, from http://arxiv.org/abs/1701.02434
#
# Brooks, S., Gelman, A., Jones, G., & Meng, X.-L. (2011). Handbook of Markov Chain Monte Carlo. Retrieved from https://books.google.com?id=qfRsAIKZ4rIC
#
# Brooks, S. P., & Gelman, A. (1998). General Methods for Monitoring Convergence of Iterative Simulations. Journal of Computational and Graphical Statistics, 7(4), 434–455. https://doi.org/10.1080/10618600.1998.10474787
#
# Casella, G., & George, E. I. (1992). Explaining the gibbs sampler. The American Statistician, 46(3), 167–174. https://doi.org/10.1080/00031305.1992.10475878
#
# Chib, S., & Greenberg, E. (1995). Understanding the Metropolis-Hastings Algorithm. The American Statistician, 49(4), 327–335. https://doi.org/10.1080/00031305.1995.10476177
#
# Duane, S., Kennedy, A. D., Pendleton, B. J., & Roweth, D. (1987). Hybrid Monte Carlo. Physics Letters B, 195(2), 216–222. https://doi.org/10.1016/0370-2693(87)91197-X
#
# Eckhardt, R. (1987). Stan Ulam, John von Neumann, and the Monte Carlo Method. Los Alamos Science, 15(30), 131–136.
#
# Gabry, J., Simpson, D., Vehtari, A., Betancourt, M., & Gelman, A. (2019). Visualization in Bayesian workflow. Journal of the Royal Statistical Society: Series A (Statistics in Society), 182(2), 389–402. https://doi.org/10.1111/rssa.12378
#
# Gelman, A. (1992). Iterative and Non-Iterative Simulation Algorithms. Computing Science and Statistics (Interface Proceedings), 24, 457–511. PROCEEDINGS PUBLISHED BY VARIOUS PUBLISHERS.
#
# Gelman, A. (2008). The folk theorem of statistical computing. Retrieved from https://statmodeling.stat.columbia.edu/2008/05/13/the_folk_theore/
#
# Gelman, A., Carlin, J. B., Stern, H. S., Dunson, D. B., Vehtari, A., & Rubin, D. B. (2013a). Basics of Markov Chain Simulation. In Bayesian Data Analysis. Chapman and Hall/CRC.
#
# Gelman, A., Carlin, J. B., Stern, H. S., Dunson, D. B., Vehtari, A., & Rubin, D. B. (2013b). Bayesian Data Analysis. Chapman and Hall/CRC.
#
# Gelman, A., & Rubin, D. B. (1992). Inference from Iterative Simulation Using Multiple Sequences. Statistical Science, 7(4), 457–472. https://doi.org/10.1214/ss/1177011136
#
# Geman, S., & Geman, D. (1984). Stochastic Relaxation, Gibbs Distributions, and the Bayesian Restoration of Images. IEEE Transactions on Pattern Analysis and Machine Intelligence, PAMI-6(6), 721–741. https://doi.org/10.1109/TPAMI.1984.4767596
#
# Hastings, W. K. (1970). Monte Carlo sampling methods using Markov chains and their applications. Biometrika, 57(1), 97–109. https://doi.org/10.1093/biomet/57.1.97
#
# Hoffman, M. D., & Gelman, A. (2011). The No-U-Turn Sampler: Adaptively Setting Path Lengths in Hamiltonian Monte Carlo. Journal of Machine Learning Research, 15(1), 1593–1623. Retrieved from http://arxiv.org/abs/1111.4246
#
# Metropolis, N., Rosenbluth, A. W., Rosenbluth, M. N., Teller, A. H., & Teller, E. (1953). Equation of State Calculations by Fast Computing Machines. The Journal of Chemical Physics, 21(6), 1087–1092. https://doi.org/10.1063/1.1699114
#
# Neal, Radford M. (1994). An Improved Acceptance Procedure for the Hybrid Monte Carlo Algorithm. Journal of Computational Physics, 111(1), 194–203. https://doi.org/10.1006/jcph.1994.1054
#
# Neal, Radford M. (2003). Slice Sampling. The Annals of Statistics, 31(3), 705–741. Retrieved from https://www.jstor.org/stable/3448413
#
# Neal, Radford M. (2011). MCMC using Hamiltonian dynamics. In S. Brooks, A. Gelman, G. L. Jones, & X.-L. Meng (Eds.), Handbook of markov chain monte carlo.
#
# Roberts, G. O., Gelman, A., & Gilks, W. R. (1997). Weak convergence and optimal scaling of random walk Metropolis algorithms. Annals of Applied Probability, 7(1), 110–120. https://doi.org/10.1214/aoap/1034625254
