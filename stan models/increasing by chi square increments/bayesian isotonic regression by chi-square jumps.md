



## Samples from uniform prior 

uniform conditional on increasing is the same as uniform, then sort.
why?

$$p(\mu_k=x | \mu_1 < \mu_2 < ... < \mu_N )$$

is proportional to the probability that the first $k-1$ $\mu_i$'s are less than $x$ and the last $n-k$ $\mu_i$'s are greater than $x$. 

If instead we get $\mu_i$'s by drawing each from i.i.d. uniform and sorting, then 

$$p(\mu_k=x)$$

is proportional the probability that $k-1$ $\mu_i$'s are less than $x$ and exactly $n-k$ $\mu_i$'s are greater than $x$. 

(concentrate on straight line)

![plot of chunk sample_from_restricted_uniform](figure/sample_from_restricted_uniform1.png) ![plot of chunk sample_from_restricted_uniform](figure/sample_from_restricted_uniform2.png) 

  


## Setting up the prior

Here are samples from the prior. First showing everything, and then zoomed in a bit.

![plot of chunk samples_from_mU_prior](figure/samples_from_mU_prior.png) 


## Fitting the model




Plot the data with the model fit:

![plot of chunk display_fit](figure/display_fit.png) 


I think the hyperparameters are mostly shrinkages from prior to toward truth?

Aggregates and not are not too terribly different

![plot of chunk posterior_hyperparameters](figure/posterior_hyperparameters1.png) ![plot of chunk posterior_hyperparameters](figure/posterior_hyperparameters2.png) ![plot of chunk posterior_hyperparameters](figure/posterior_hyperparameters3.png) 


Plot samples:

![plot of chunk plot_posterior_sample_mus](figure/plot_posterior_sample_mus.png) 

