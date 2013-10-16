# The model is:
# For i in 1:N
#
#   mu_i ~ mu_{i-1} + s*chi_square(k_0/N)   (mu_0 = 0)
#   y_y ~ N(mu_i, sqrt(sigma_0_sq*N))
#   
# A better model (hierarchical) would (instead of assuming they're known) 
# put a prior on the hyperparameters: 
#   k_0
#   s
#   sigma_0_sq

data {
  real<lower=0> k_0;
  real<lower=0> s;
  int<lower=0> N;
  real<lower=0> sigma_0_sq;
  real y[N]; 
}
parameters {
  vector<lower=0>[N] jump;
}
transformed parameters {
  vector<lower=0>[N] mu;
  mu <- cumulative_sum(s*jump);
}
model {
  for (i in 1:N) {
    jump[i] ~ chi_square(k_0/N);
  }
  for (i in 1:N) {
    y[i] ~ normal(mu[i], sqrt(sigma_0_sq*N));
  }
}
  