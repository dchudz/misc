library("ggplot2")
library(rstan)
library(ggplot2)
library(plyr)
library(reshape2)

# "generate_data" generates fake data according to this model (which is the same as the stan model I fit it to):
# 
# For i in 1:N
#
#   theta_i ~ theta_{i-1} + s*chi_square(k_0/N)   (theta_0 = 0)
#   y_y ~ N(theta_i, sqrt(sigma_y_sq*N))
#   
generate_data <- function(k_0, s, N, sigma_y) {
  theta <- s*cumsum(rchisq(N, k_0/N))
  y <- theta + rnorm(N, sd=sigma_y*sqrt(N))
  t <- seq(1/N,1,1/N)
  data.frame(t=t, theta=theta, y=y)
}

# "generate_data_including_hyperparameters":
#   samples the hyperparameters and then uses generate_data_mean_var to generate 
#   data from the distributions determined by those hyperparameters
generate_data_including_hyperparameters <- function(N) {
  k_0 <- 10 + runif(1)*40
  s  <- runif(1)*2
  sigma_y <- runif(1)*1
  fake_data <- generate_data(k_0, s, N, sigma_y)  
  fake_data$s <- s
  fake_data$k_0 <- k_0
  fake_data$sigma_y = sigma_y
  fake_data
}

#plotting the data
plot_fake_data <- function(fake_data) {
  fake_data_plot <- ggplot(data=fake_data) + scale_color_discrete("") +
    geom_line(mapping=aes(x=t,y=theta, color="true theta")) +
    geom_point(mapping=aes(x=t,y=y,color="y")) 
  fake_data_plot
}


plot_posteriors <- function(fits, par) {
  fake_data <- fits$fake_data
  fit <- fits$fit
  truth_global_for_silly_reasons <<- fake_data[1,par]  #global for silly reasons
  s <- extract(fit, pars=par)[[par]]
  samplesDF <- data.frame(par=s, model="not aggregated")
  
  print(
    ggplot(data=samplesDF) + 
      geom_histogram(mapping=aes(par, ..density..), alpha=.5,position="dodge") +
      geom_vline(aes(xintercept = truth_global_for_silly_reasons)) +  xlab(par) + 
      ggtitle(paste("posterior for",par,"with line at truth"))
  )
}

# plot posterior for parameter with line at truth
plot_posteriors <- function(fit, par, truth) {
  truth_global_for_silly_reasons <<- truth  #global for silly reasons
  ggplot(data=data.frame(par=extract(fit, pars=par)[[par]])) + 
    geom_histogram(mapping=aes(par, ..density..)) +
    geom_vline(mapping=aes(xintercept = truth_global_for_silly_reasons)) +
    ggtitle(paste("samples from posterior for",par,"with line at truth"))                   
}


# put samples (from a vector parameter like theta) in a data frame:
samples_from_fit_to_DF <- function(fit, parameter, num_samples) {
  samples = extract(fit,pars=parameter)[[parameter]]
  sample_nums = sample.int(nrow(samples),num_samples)
  sampleDFwide <- data.frame(t(samples[sample_nums,]))
  names(sampleDFwide) <- sample_nums
  sampleDFlong <- melt(sampleDFwide)
  names(sampleDFlong) <- c("sample_num", parameter)
  sampleDFlong$model = deparse(substitute(fit))
  sampleDFlong
} 

#plot samples from posterior for theta
plot_samples <- function(fit, n) {
  fit_samples <- samples_from_fit_to_DF(fit$fit, "theta", n)
  fit_samples$t <- fit$fake_data$t  #using R's vector recycling feels dirty
  fit_samples$model = "model"  
  
  fake_data <- fit$fake_data
  fake_data$model = "truth"
  fake_data$sample_num = "0"
  fake_data <- fake_data[,names(fit_samples)]
  
  ggplot(data=rbind(fit_samples, fake_data)) + 
    geom_line(mapping=aes(x=t, y=theta, group=sample_num,color=model, color=model, size=model), alpha=1) +
    ggtitle("samples from posterior theta") +
    scale_size_discrete("", range=c(.5,2), guide="none")
  
}