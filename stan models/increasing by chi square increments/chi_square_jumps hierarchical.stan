# A model for an increasing function

data {
  int<lower=0> N;
  real y[N]; 
}
parameters {
  vector<lower=0>[N] jump;                  # these are the jumps of our increasing function  mu
  real<lower=0, upper=1000>mean_mu_N;        # mean of distribution that  mu_N  comes from 
                                            # (via the smaller jumps)
  real<lower=0, upper=mean_mu_N>sigma_mu_N; # stdev for distribution for mu_N
  real<lower=0, upper=mean_mu_N/10>sigma_0;          # determines variance for y's:
                                            #   y_i ~ N(mu_i, sqrt(sigma_0_sq*N))
}
transformed parameters {
  vector<lower=0>[N] mu;
  real<lower=0> k_0;
  real<lower=0> s;
  real<lower=0> sigma_mu_N_sq;
  real<lower=0> sigma_0_sq;
  sigma_0_sq <- pow(sigma_0, 2);
  sigma_mu_N_sq <- pow(sigma_mu_N , 2);
  s <- sigma_mu_N_sq / (2 * mean_mu_N);
  k_0 <- mean_mu_N / s;
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
  