library("ggplot2")

# "generate_data" generates fake data according to this model (which is the same as the stan model I fit it to):
# 
# For i in 1:N
#
#   theta_i ~ theta_{i-1} + s*chi_square(k_0/N)   (theta_0 = 0)
#   y_y ~ N(theta_i, sqrt(sigma_y_sq*N))
#   
generate_data <- function(k_0, s, N, sigma_y_sq) {
  theta <- s*cumsum(rchisq(N, k_0/N))
  y <- theta + rnorm(N, sd=sqrt(sigma_y_sq*N))
  t <- seq(1/N,1,1/N)
  data.frame(t=t, theta=theta, y=y)
}



# "generate_data_mean_var" generates data from the same model as above, but with the mean/variance
#   specified instead of k_0/s.
#
# E [ theta_N ]  = sum(E[ s*rchisq(k_0/N) ])
#             = s * chi_squared(k_0)
#             = s * k_0
#
# Var[ theta_N ] = sum(Var[ s*rchisq(k_0/N) ])
#             = s^2 * Var(chi_squared(N)
#             = s^2 * 2 * k_0
#             = 2*s* E[theta_n]
generate_data_mean_var <- function(mu_N, sigma_N_sq, N, sigma_y_sq) {
  s = sqrt(sigma_N_sq / (2 * mu_N))
  k_0 = mu_N / s
  generate_data(k_0, s, N, sigma_y_sq)  
}


# "generate_data_including_hyperparameters":
#   samples the hyperparameters and then uses generate_data_mean_var to generate 
#   data from the distributions determined by those hyperparameters
generate_data_including_hyperparameters <- function(N) {
  
  mu_N <- runif(1)*1000
  sigma_N <- runif(1)*mu_N
  sigma_y <- runif(1)*(mu_N)/50
  
  
  sigma_N_sq <- sigma_N**2
  sigma_y_sq <- sigma_y**2 

  s = sigma_N_sq / (2 * mu_N)
  k_0 = mu_N / s
  
  fake_data <- generate_data(k_0, s, N, sigma_y_sq)  
  fake_data$mu_N = mu_N
  fake_data$sigma_N = sigma_N
  fake_data$sigma_y = sigma_y
  fake_data
}

#plotting the data
plot_fake_data <- function(fake_data) {
  fake_data_plot <- ggplot(data=fake_data) + scale_color_discrete("") +
    geom_line(mapping=aes(x=t,y=theta, color="theta")) +
    geom_point(mapping=aes(x=t,y=y,color="y")) 
  fake_data_plot
}

plot_fake_data(generate_data_including_hyperparameters(100))