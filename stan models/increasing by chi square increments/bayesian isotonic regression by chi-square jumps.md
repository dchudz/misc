


## Samples from uniform prior

I recently read [a paper that Andrew Gelman wrote back in 1996](http://www.stat.columbia.edu/~gelman/research/published/deep.pdf) about scale-insensitivity as a way to think about what prior distributions might be reasonable for Bayesian models. As one example, he describes fitting a function $f(t)$ known to be increasing and where $f(0)=0$ and $f(1)=1$ are known. We're estimating the function at $k-1$ equally spaces sample points, with $\theta_i=f(\frac{i}{k})$ (for $i \in \{1,2,3,...,k-1\}$)

at equally that's constrained to be increasing, and how you'll really be led astray by a prior that's uniform over the function values at discrete points (with a restriction that the values are increasing). As the number of points in the discretization increases, the mass of the prior concentrates around a straight line, which is bad.


The paper doesn't include an examples of sampels from this distribution, so I've added it here to help with intuition:

(top p. 220 is all the explanation we need)

![plot of chunk sample_from_restricted_uniform](figure/sample_from_restricted_uniform.png) 

  


## Setting up the prior


(Use same method as below to show samples for low and high variance (relative to mean))

(add 0 to these plots... dedup on sample_num, N... add t=0,y=0,mu=0 to each...)

![plot of chunk samples_from_mu_prior_and_hyperparameters](figure/samples_from_mu_prior_and_hyperparameters1.png) ![plot of chunk samples_from_mu_prior_and_hyperparameters](figure/samples_from_mu_prior_and_hyperparameters2.png) 


note that there's no control over the shape of the functuin $f$ independent of the mean and variance of $f(1)$. I believe this will be true of any model composed of independent "jumps" (conditional on the mean/variance of $f(1)$, my jumps are independent). A natural extension would be to add a correlation structure to the jumps.

Here are samples from the prior. First showing everything, and then zoomed in a bit.

![plot of chunk samples_from_mu_prior_and_hyperparameters2](figure/samples_from_mu_prior_and_hyperparameters21.png) ![plot of chunk samples_from_mu_prior_and_hyperparameters2](figure/samples_from_mu_prior_and_hyperparameters22.png) 


## Fitting the model




Plot the data with the model fit:

![plot of chunk display_fit](figure/display_fit.png) 


I think the hyperparameters are mostly shrinkages from prior to toward truth?

Aggregates and not are not too terribly different

![plot of chunk posterior_hyperparameters](figure/posterior_hyperparameters1.png) ![plot of chunk posterior_hyperparameters](figure/posterior_hyperparameters2.png) ![plot of chunk posterior_hyperparameters](figure/posterior_hyperparameters3.png) 


Plot samples:

![plot of chunk plot_posterior_sample_mus](figure/plot_posterior_sample_mus.png) 

