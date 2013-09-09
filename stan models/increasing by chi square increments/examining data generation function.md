Now that we're generating hyper-parameters from a distribution, we can sample paths from it. 

Here we are just looking at the mu's (not the y's):

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 

                     

Now we'll plot a few examples of mu's and y's:





Confirm that our function for drawing data from a distribution with specified mean/variance for mu_N actually has that mean/variance:



```r

mean_mu_N = 10
sigma_mu_N_sq = 10
N = 20
sigma_0_sq = 1

samples <- sapply(1:1000, function(x) generate_data_mean_var(mean_mu_N, sigma_mu_N_sq, 
    N, sigma_0_sq)$mu[N])
mean(samples)
```

```
## [1] 9.971
```

```r
var(samples)
```

```
## [1] 10.61
```

```r

mean_mu_N <- 20
samples <- sapply(1:1000, function(x) generate_data_mean_var(mean_mu_N, sigma_mu_N_sq, 
    N, sigma_0_sq)$mu[N])
mean(samples)
```

```
## [1] 19.92
```

```r
var(samples)
```

```
## [1] 10.92
```

