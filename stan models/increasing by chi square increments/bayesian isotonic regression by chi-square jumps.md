


*This post will describe a way I came up with of doing Bayesian isotonic regression and implemented in [Stan](http://mc-stan.org/). If you want practical help, expert research, or to learn anything about what's standard in the field, this isn't the place for you (Andrew Gelman pointed me to David Dunson, so maybe check him out). This **is** the place for you if you want to read about how I thought about setting up a model, implemented the model in Stan, and created graphics to understand what was going on.*

*You can see the source for this post, including markdown and and R code, [here](http://github.com/dchudz/misc/blob/master/stan%20models/increasing%20by%20chi%20square%20increments/bayesian%20isotonic%20regression%20by%20chi-square%20jumps.Rmd).*

I recently read [a paper that Andrew Gelman wrote back in 1996](http://www.stat.columbia.edu/~gelman/research/published/deep.pdf) about scale-insensitivity as a way to think about what prior distributions might be reasonable for Bayesian models. As one example, he describes fitting a function $f(t)$ that is known to be increasing and where $f(0)=0$ and $f(1)=1$ are known. We estimate the function at $(N-1)$ equally spaced sample points, with $\theta_i=f(\frac{i}{N})$ (for $i \in \{1,2,3,...,N-1\}$).

What prior should we use for the $\{\theta_i\}$? It might seem reasonable to use the prior for which the posterior mode is the maximum likelihood estimate. That is, make the $\{\theta_i\}$ independent and uniform on $[0,1]$ (with the restriction that non-increasing sets of $\{\theta_i\}$ are given zero probability). But this turns out badly! Gelman notes that this prior on the $\{\theta_i\}$ is the same as the distribution of the order statistics of a samples of size $N-1$ from the uniform distribution on $[0,1]$. As the number of points in the discretization increases, the mass of the prior concentrates around a straight line, which will overwhelm the data and is bad.

To help with intuition, here are some samples from the distribution, for various $N$:

![plot of chunk sample_from_restricted_uniform](figure/sample_from_restricted_uniform.png) 


This weird! Under the uniform distribution, each (legal) path is equally likely. It just turns out that for large $k$, almost all legal paths are basically straight lines. That's why the maximum likelihood estimate can be reasonable while (for large enough $N$) the bulk of the posterior would be basically a straight line no matter what the data say. It reminds me a bit of statistical mechanics, which is largely about micro-level randomness determining macro-level properties. (I'm no expert, but I recommend [this book](http://pages.physics.cornell.edu/~sethna/StatMech/).)

So what model should we use instead? For my convenience (and perhaps to be more realistic) I'll switch to the case where $\theta_N$ ($f(1)$) isn't known to be $1$. The goal is the have a model which will behave in the same way at each scale of discretization -- our results shouldn't differ too much when $N=10$ vs. $N=100$. To accomplish this, I model $\theta_N$ as a jump drawn from a chi squared distribution. This is nice since 1 jump that's distributed as \chi^2(k)$  is then equivalent to  $n$  independent jumps that are distributed as $\chi^2(k/n)$. Then our prior for the function $f$  is independent of the scale of the discretization, as long as we scale the parameter correctly:

$$\theta_i \sim \theta_{i-1} + s \cdot \chi^2(k_0/N)$$ 

(The factor of $s$ lets us control the mean/variance of the jumps independently.)

I chose to express $s$ and $k_0$ in terms of the mean $\mu_N$ and variance $\sigma_N^{2}$ of $\theta_N$:

$$s = \frac{{\sigma_N}^2}{2 \mu_N} $$
$$k_0 = \mu_N / s$$

I'll assume that we have data $y_i$ from a normal distribution centered on $\theta_i$ (independent, conditional on $\theta_i$). The variance of the $\{y_i\}$  should scale with 1/N, since I'm assuming that if we sampled at a coarser scale, the $\{y_i\}$ at a coarser scale would be an average of the $\{y_i\}$ at a finer scale (and thus have lower variance):

$$y_i \sim N(\theta_i, \sqrt{{\sigma_y}^2*N})$$

We need priors for $\mu_N$, $\sigma_N$, and $\sigma_y$. This would naturally depend on the problem at hand, but I decided that both the variance of $\theta_N$ and the variance of the data $y_i$ should be sensitive to the mean $\theta_i$ of $\theta_n$:

$$\mu_N \sim U[0,1000]$$
$$\sigma_N \sim U[0,\mu_N]$$
$$\sigma_y \sim U[0,\frac{\mu_N}{10}]$$

Here are some samples from my prior for the $\theta_i$, conditional on the specified $\mu_N$ and $\sigma_N$:

![plot of chunk samples_from_theta_prior_and_hyperparameters](figure/samples_from_theta_prior_and_hyperparameters1.png) ![plot of chunk samples_from_theta_prior_and_hyperparameters](figure/samples_from_theta_prior_and_hyperparameters2.png) 


Note that there's no control over the shape of the function $f$ independent of the mean and variance of $f(1)$. This is a bit weird, but I believe this will be true of any model composed of "jumps" that are independent (conditional on the mean/variance of $f(1)$). A natural extension would be to add a correlation structure to the jumps.

Here are samples from my prior for $\{\theta_i\}$, sampling from the prior distribution for the hyperparameters $\mu_N$ and $\sigma_N$ (rather than specifying them as above).

![plot of chunk samples_from_theta_prior_and_hyperparameters2](figure/samples_from_theta_prior_and_hyperparameters21.png) ![plot of chunk samples_from_theta_prior_and_hyperparameters2](figure/samples_from_theta_prior_and_hyperparameters22.png) 


Note a couple things:

1. The prior is similar regardless of the scale of discretization $N$.
2. The prior puts reasonable weight on a large range of curve shapes.

A property we'd like this model to have is that we get similar results for the same data at different levels of sampling/aggregation. Here's one sample from the prior for $\{\theta_i\}$ and $\{y_i\}$, along with aggregates $y$'s formed by averaging disjoint sets of 5 $y_i$'s.




![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 


The posterior means for $\{\theta_i\}$ are similar, whether we fit the original or aggregated data:

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


We can also see that that the fits are similar by comparing samples from the posterior for $\{\theta_i\}$ from each model:

![plot of chunk plot_posterior_sample_thetas](figure/plot_posterior_sample_thetas.png) 


The posterior distribution of the hyperparameters is also fairly similar, but sharper for the unaggregated version (as I think you'd expect):

![plot of chunk posterior_hyperparameters](figure/posterior_hyperparameters1.png) ![plot of chunk posterior_hyperparameters](figure/posterior_hyperparameters2.png) ![plot of chunk posterior_hyperparameters](figure/posterior_hyperparameters3.png) 


Please let me know if you have any comments or suggestions! The flexibility of Stan is very powerful, but that includes the power to fit bad model. Examining a model's behavior under simulated data is one way to check it. I haven't done all of the check I'd want to, but hopefully this will provide an interesting example.
