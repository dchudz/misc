library(rstan)
library(ggplot2)
library(plyr)
library(reshape2)
setwd(Sys.getenv("GITHUB_PATH"))
setwd("./misc/stan models/increasing by chi square increments/")
source("data generation function.R")

N=50
N2=10

generate_data_and_fit_both_models <- function(N, N2) {
  
  #Generate fake data and aggregated fake data
  fake_data <- generate_data_including_hyperparameters(N)
  fake_data$group <- ceiling((fake_data$t)*N2)
  fake_data_aggregate <- ddply(fake_data, "group", summarize, t=mean(t), y=mean(y))
  
  # plot with the original fake data and the aggregates
  fake_data_plot_with_aggregate <- 
  
  fit1 <- stan("chi_square_jumps hierarchical.stan", 
                 data = list(N=N, y=fake_data$y), iter = 2000, chains = 4)
  print(fit1)  
  
  #add fitted theta's from this model to plot
  fake_data$posterior_theta_means <- get_posterior_mean(fit1,pars="theta")[,5]

  #fit aggregates model
  fit1_aggregated <- stan(fit= fit1, data = list(N=N2, y=fake_data_aggregate$y), iter = 2000, chains = 4)
  print(fit1_aggregated)
    
  #add fitted theta's from aggregated model to plot  
  fake_data_aggregate$poserior_theta_means <- get_posterior_mean(fit1_aggregated,pars="theta")[,5]
  
  fake_data_plot_with_aggregate <- plot_fake_data(fake_data)  +
    geom_line(data=fake_data, aes(x=t,y=posterior_theta_means, color="posterior theta means")) +
    geom_point(data=fake_data_aggregate, mapping=aes(x=t,y=y, color="y aggregated"), size=5, alpha=.5) + 
    geom_line(data=fake_data_aggregate, aes(x=t,y=poserior_theta_means, color="posterior theta means from aggregates")) +
    ggtitle("true theta's, y's, the posterior theta means for each model")
    
  #return useful stuff
  list(fake_data=fake_data, 
       fake_data_aggregate=fake_data_aggregate, 
       fit=fit1,
       fit_aggregated=fit1_aggregated,
       plot=fake_data_plot_with_aggregate)
  
}



plot_posteriors_both_models <- function(fits, par) {
  fake_data <- fits$fake_data
  fit <- fits$fit
  fit_aggregated <- fits$fit_aggregated
  truth_global_for_silly_reasons <<- fake_data[1,par]  #global for silly reasons
  s <- extract(fit, pars=par)[[par]]
  s2 <- extract(fit_aggregated, pars=par)[[par]]
  samplesDF <- rbind(data.frame(par=s, model="not aggregated"),
                     data.frame(par=s2, model="aggregated"))
  print(
    ggplot(data=samplesDF) + 
    geom_histogram(mapping=aes(par, ..density.., fill=model), alpha=.5,position="dodge") +
    geom_vline(aes(xintercept = truth_global_for_silly_reasons)) + 
      ggtitle(paste("posterior for parameter",par,"from both models, with truth"))
  )
}

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


plot_samples <- function(fit, n) {

  fit_samples <- samples_from_fit_to_DF(fit$fit, "theta", n)
  fit_samples$t <- fit$fake_data$t  #using R's vector recycling feels dirty
  
  fit_aggregated_samples <- samples_from_fit_to_DF(fit$fit_aggregated, "theta", n)
  fit_aggregated_samples$t <- fit$fake_data_aggregate$t
  
  fake_data <- fit$fake_data
  fake_data$model = "truth"
  fake_data$sample_num = "0"
  fake_data <- fake_data[,names(fit_samples)]
  
  
  plot_samples <- ggplot(data=rbind(fit_samples, fit_aggregated_samples, fake_data)) + 
    geom_line(mapping=aes(x=t, y=theta, group=sample_num,color=model, 
                          size=ifelse(model=="truth","truth","models" )), alpha=1) +
    ggtitle("samples from each model (aggregated and unaggregated) posterior theta") +
    scale_size_discrete("")
  plot_samples

}