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



# "generate_data_mean_var" generates data from the same model as above, but with the mean/variance
#   specified instead of k_0/s.
#
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


# "generate_data_including_hyperparameters":
#   samples the hyperparameters and then uses generate_data_mean_var to generate 
#   data from the distributions determined by those hyperparameters
generate_data_including_hyperparameters <- function(N) {
  
  mean_mu_N <- runif(1)*1000
  sigma_mu_N <- runif(1)*mean_mu_N
  sigma_0 <- runif(1)*(mean_mu_N)/10
  
  
  sigma_mu_N_sq <- sigma_mu_N**2
  sigma_0_sq <- sigma_0**2 

  s = sigma_mu_N_sq / (2 * mean_mu_N)
  k_0 = mean_mu_N / s
  
  fake_data <- generate_data(k_0, s, N, sigma_0_sq)  
  fake_data$mean_mu_N = mean_mu_N
  fake_data$sigma_mu_N = sigma_mu_N
  fake_data$sigma_0 = sigma_0
  fake_data
}

#plotting the data
plot_fake_data <- function(fake_data) {
  fake_data_plot <- ggplot(data=fake_data) + scale_color_discrete("") +
    geom_line(mapping=aes(x=t,y=mu, color="mu")) +
    geom_point(mapping=aes(x=t,y=y,color="y")) 
  fake_data_plot
}

