# A model for an increasing function

data {
  int<lower=0> N;
  real y[N]; 
}
parameters {
  vector<lower=0>[N] jump;                  # these are the jumps of our increasing function  theta
  real<lower=0, upper=1000>mu_N;        # mean of distribution that  theta_N  comes from 
                                            # (via the smaller jumps)
  real<lower=0, upper=mu_N>sigma_N; # stdev for distribution for theta_N
  real<lower=0, upper=mu_N/10>sigma_y;          # determines variance for y's:
                                            #   y_i ~ N(theta_i, sqrt(sigma_y_sq*N))
}
transformed parameters {
  vector<lower=0>[N] theta;
  real<lower=0> k_0;
  real<lower=0> s;
  real<lower=0> sigma_N_sq;
  real<lower=0> sigma_y_sq;
  sigma_y_sq <- pow(sigma_y, 2);
  sigma_N_sq <- pow(sigma_N , 2);
  s <- sigma_N_sq / (2 * mu_N);
  k_0 <- mu_N / s;
  theta <- cumlative_sum(s*jump);
} 
model {
  for (i in 1:N) {
    jump[i] ~ chi_square(k_0/N);
  }
  for (i in 1:N) {
    y[i] ~ normal(theta[i], sqrt(sigma_y_sq*N));
  }
}
  