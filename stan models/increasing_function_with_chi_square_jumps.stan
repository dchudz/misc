data {
  real<lower=0> k_0;
  real<lower=0> s;
  int<lower=0> N;
  real<lower=0> sigma_0_sq;
  real y[N+1]; 
}
parameters {
  real<lower=0> jump[N];
}
transformed parameters {
  real mu[N+1];
  mu[1] <- 0;
  for (i in 2:(N+1)) {
    mu[i] <- mu[i-1] + s*jump[i-1];
  }
}
model {
  for (i in 1:N) {
    jump[i] ~ chi_square(k_0/N);
  }
  for (i in 1:(N+1)) {
    y[i] ~ normal(mu[i], sqrt(sigma_0_sq*N));
  }
}
