library(rstan)
library(ggplot2)
library(plyr)
library(reshape2)
setwd(Sys.getenv("GITHUB_PATH"))
setwd("./misc/stan models/increasing by chi square increments/")
source("data generation function.R")


set.seed(38836)

# Some parameter combinations lead the model to take a long time to converge -- I'm not exactly sure why
# this doesn't worry me so much, because if I do give the model enough iterations to converge, everything is ok
# e.g. changing s from 1 to 3
parameters <- list(
  k_0 = 20,
  s = 1,
  N = 50,
  sigma_0_sq = 1
)
#we'll also aggregate the fake data, for modeling at a coarser discretization
N2 = 10  #number of bins for coarser data



fake_data <- generate_data(
  k_0 = parameters$k_0,
  s = parameters$s,
  N = parameters$N,
  sigma_0_sq = parameters$sigma_0_sq
  )


#plot the fake data:

#times for aggregated fake data need to be shifted left so they're at the middle of the aggregated range
fake_data$group <- ceiling((fake_data$t)*N2)
fake_data
fake_data_aggregate <- ddply(fake_data, "group", summarize, t=mean(t), y=mean(y))
fake_data_aggregate

# Let's plot the original fake data and the aggregates
fake_data_plot_with_aggregate <- 
  fake_data_plot +
  geom_point(data=fake_data_aggregate, 
                         mapping=aes(x=t,y=y, color="y aggregated"),
                         size=5, alpha=.5)

fake_data_plot_with_aggregate


# fitting stan model to (unaggregated) data
increasing_model_dat <- parameters
increasing_model_dat$y <- fake_data$y
fit1 <- stan("chi_square_jumps.stan", data = increasing_model_dat, iter = 1000, chains = 4)
print(fit1)

# let's plot the fake data with the posterior means of the mu's:
mu_means <- get_posterior_mean(fit1,pars="mu")[,5]
mu_means
model_plot <- fake_data_plot_with_aggregate + geom_line(aes(x=fake_data$t,y=mu_means, color="fitted mu"))
model_plot



# New model for aggregated data
# Note that I'm only changing y's and N 
# (it's important that we can change the scale of discretization and keep the other parameters the same)

increasing_model_dat_aggregated <- parameters
increasing_model_dat_aggregated$N <- N2
increasing_model_dat_aggregated$y <- fake_data_aggregate$y

fit1_aggregated <- stan(fit= fit1, data = increasing_model_dat_aggregated, iter = 1000, chains = 4)
print(fit1_aggregated)

# let's add the posterior means of the aggregated model to the plot
mu_means_aggregated <- get_posterior_mean(fit1_aggregated,pars="mu")[,5]
model_plot_with_aggregated <- model_plot + 
  geom_line(aes(x=fake_data_aggregate$t,y=mu_means_aggregated[1:N2], color="fitted mu on aggregated ys")) +
  ggtitle("the data, the true mu's, and the posterior means for each model")

jpeg("data and posterior means at two scales.jpeg")
print(model_plot_with_aggregated)
dev.off()

# this looks nice!
# the posterior means are a lot "smoother" than the truth -- but I don't think this should worry me 
# (they're means after all)

#now I should plot some samples from each version (aggregated and not)
#(only works for multi-dimensional parameters)
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

fit1_samples <- samples_from_fit_to_DF(fit1, "mu", 10)
fit1_samples$t <- fake_data$t  #using R's vector recycling feels dirty

fit1_aggregated_samples <- samples_from_fit_to_DF(fit1_aggregated, "mu", 10)
fit1_aggregated_samples$t <- fake_data_aggregate$t

plot_samples <- ggplot(data=rbind(fit1_samples, fit1_aggregated_samples)) + 
  geom_line(mapping=aes(x=t, y=mu, group=sample_num,color=model)) +
  ggtitle("ten random samples from each model (aggregated and unaggregated) posterior")
plot_samples
#these samples look reasonable -- aggregated and unaggregated versions are not so different 

jpeg("plot of samples from posteriors.jpeg")
print(plot_samples)
dev.off()
