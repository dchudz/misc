library("ggplot2")

# "generate_data" generates fake data according to this model (which is the same as the stan model I fit it to):
# 
# For i in 1:N
#
#   mu_i ~ mu_{i-1} + s*chi_square(k_0/N)   (mu_0 = 0)
#   y_y ~ N(mu_i, sqrt(sigma_0_sq*N))
#   
generate_data <- function(k_0, s, N, sigma_0_sq) {
  mu <- s*cumsum(rchisq(N, k_0/N))
  y <- mu + rnorm(N, sd=sqrt(sigma_0_sq*N))
  t <- seq(1/N,1,1/N)
  data.frame(t=t, mu=mu, y=y)
}


# E [ mu_N ]  = sum(E[ s*rchisq(k_0/N) ])
#             = s * chi_squared(k_0)
#             = s * k_0
#
# Var[ mu_N ] = sum(Var[ s*rchisq(k_0/N) ])
#             = s^2 * Var(chi_squared(N)
#             = s^2 * 2 * k_0
#             = 2*s* E[mu_n]

generate_data_mean_var <- function(mean_mu_N, sigma_mu_N_sq, N, sigma_0_sq) {
  s = sigma_mu_N_sq / (2 * mean_mu_N)
  k_0 = mean_mu_N / s
  generate_data(k_0, s, N, sigma_0_sq)  
}


# mean is uniform on [0,100]
# variance is uniform [0,2*mean_mu_n]  (much larger stddev than means seems unlikely here)

generate_data_including_hyperparameters <- function(N) {
  
  print(mean_mu_N <- runif(1)*1000)
  print(sigma_mu_N <- runif(1)*mean_mu_N)
  print(sigma_0 <- runif(1)*100)
  
  
  sigma_mu_N_sq <- sigma_mu_N**2
  sigma_0_sq <- sigma_0**2 

  s = sigma_mu_N_sq / (2 * mean_mu_N)
  k_0 = mean_mu_N / s
  generate_data(k_0, s, N, sigma_0_sq)  
}



# Some code that looks into whether our fake data generation is working right:

require(plyr)
samples <- ldply(1:20, function(x) {
  fake_data <- generate_data_including_hyperparameters(50)
  fake_data$sample_number <- x
  fake_data
})

ggplot() + geom_line(data=samples, mapping=aes(x=t,y=mu, color="mu", group=sample_number))

                     )
plot_fake_data <- function(fake_data) {
  fake_data_plot <- ggplot() + scale_color_discrete("") +
    geom_line(data=fake_data, mapping=aes(x=t,y=mu, color="mu")) +
    geom_point(data=fake_data, mapping=aes(x=t,y=y,color="y")) 
  print(fake_data_plot)
}


plot_fake_data(generate_data_including_hyperparameters(20))

fake_data <- generate_data_mean_var(10, 10, 200, 1)
plot_fake_data(fake_data)


mean_mu_N = 10
sigma_mu_N_sq = 10
N = 20
sigma_0_sq = 1 

samples <- sapply(1:1000, function(x) generate_data_mean_var(mean_mu_N, sigma_mu_N_sq, N, sigma_0_sq)$mu[N])
mean(samples)
var(samples)

mean_mu_N <- 20
samples <- sapply(1:1000, function(x) generate_data_mean_var(mean_mu_N, sigma_mu_N_sq, N, sigma_0_sq)$mu[N])
mean(samples)
var(samples)
