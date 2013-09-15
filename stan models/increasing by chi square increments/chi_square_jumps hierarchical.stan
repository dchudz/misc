# A model for an increasing function

data {
  int<lower=0> N;
  real y[N]; 
}
parameters {
  real<lower=10,upper=50> k_0;
  real<lower=0, upper=2> s;
  vector<lower=0>[N] jump;                  # these are the jumps of our increasing function  theta
  real<lower=0, upper=1>sigma_y;          # determines variance for y's:
                                            #   y_i ~ N(theta_i, sqrt(sigma_y_sq*N))
}
transformed parameters {
  vector<lower=0>[N] theta;
  theta <- cumulative_sum(s*jump);
  #theta <- cumulative_sum(jump);

} 
model {
  for (i in 1:N) {
    jump[i] ~ chi_square(k_0/N);
  }
  for (i in 1:N) {
    y[i] ~ normal(theta[i], sigma_y*sqrt(N));
  }
}
  