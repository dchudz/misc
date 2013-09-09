


More samples and fits!




Plot the data with the model fit:


```
## [1] "list"
```

```
## [1] "fake_data"           "fake_data_aggregate" "fit"                
## [4] "fit_aggregated"      "plot"
```

```
## NULL
```

![plot of chunk display_many_fits](figure/display_many_fits1.png) 

```
## Inference for Stan model: chi_square_jumps hierarchical.
## 4 chains, each with iter=2000; warmup=1000; thin=1; 
## post-warmup draws per chain=1000, total post-warmup draws=4000.
## 
##                   mean se_mean       sd    2.5%      25%      50%      75%
## jump[1]            0.6     0.2      2.0     0.0      0.0      0.1      0.5
## jump[2]            0.5     0.1      2.0     0.0      0.0      0.1      0.3
## jump[3]            0.7     0.2      2.4     0.0      0.0      0.1      0.5
## jump[4]            1.2     0.3      2.7     0.0      0.0      0.5      1.2
## jump[5]            4.2     0.4      3.3     1.0      1.9      3.1      5.3
## jump[6]            1.1     0.2      2.7     0.0      0.0      0.2      1.0
## jump[7]            1.2     0.2      2.5     0.0      0.2      0.6      1.3
## jump[8]            0.5     0.2      2.1     0.0      0.0      0.1      0.3
## jump[9]            0.5     0.2      1.9     0.0      0.0      0.0      0.3
## jump[10]           0.8     0.2      2.4     0.0      0.0      0.1      0.6
## mean_mu_N        795.7    12.9    162.3   404.8    698.3    838.9    920.2
## sigma_mu_N       493.4    29.1    192.7   182.0    329.3    475.8    654.6
## sigma_0           33.8     1.2     12.7    18.5     24.1     31.2     39.9
## mu[1]             32.3     3.6     40.9     0.0      0.5     15.0     52.0
## mu[2]             58.0     6.2     55.1     0.0     11.7     45.4     89.1
## mu[3]             95.0     9.2     75.7     0.4     36.0     84.4    135.9
## mu[4]            188.4     8.9    105.0    15.1    110.7    178.0    258.3
## mu[5]            656.8     6.2     98.6   423.2    603.9    668.1    719.4
## mu[6]            723.5     3.3     81.2   546.0    673.6    727.0    778.7
## mu[7]            827.7     4.8     70.0   666.6    786.8    836.5    877.4
## mu[8]            852.4     2.6     61.9   714.1    815.6    856.1    894.1
## mu[9]            876.4     1.4     61.0   751.9    840.1    877.3    915.2
## mu[10]           921.4     3.3     76.4   785.5    873.7    914.9    961.7
## k_0                9.6     2.0     19.7     2.1      3.3      4.8      9.4
## s                170.6    14.6    106.8    21.5     77.6    152.6    255.4
## sigma_mu_N_sq 280562.0 26498.6 201389.6 33117.1 108462.2 226368.4 428440.9
## sigma_0_sq      1302.4    90.9   1080.6   342.1    580.8    972.0   1589.4
## lp__             -63.6     0.8      6.1   -76.1    -67.4    -63.7    -59.2
##                  97.5% n_eff Rhat
## jump[1]            3.2   121  1.0
## jump[2]            3.5   184  1.0
## jump[3]            4.3   127  1.0
## jump[4]            6.3   109  1.0
## jump[5]           13.8    60  1.1
## jump[6]            6.9   127  1.0
## jump[7]            5.7   165  1.0
## jump[8]            4.2   156  1.0
## jump[9]            3.7   116  1.0
## jump[10]           5.3   127  1.0
## mean_mu_N        988.7   157  1.0
## sigma_mu_N       864.5    44  1.1
## sigma_0           65.7   119  1.0
## mu[1]            137.8   132  1.0
## mu[2]            194.3    79  1.0
## mu[3]            284.0    67  1.1
## mu[4]            420.7   139  1.0
## mu[5]            833.5   254  1.0
## mu[6]            870.4   593  1.0
## mu[7]            942.9   212  1.0
## mu[8]            960.6   549  1.0
## mu[9]            999.1  1787  1.0
## mu[10]          1090.4   548  1.0
## k_0               41.4    97  1.0
## s                406.5    54  1.1
## sigma_mu_N_sq 747326.4    58  1.1
## sigma_0_sq      4316.5   141  1.0
## lp__             -52.4    63  1.0
## 
## Samples were drawn using NUTS2 at Sun Sep 08 22:02:35 2013.
## For each parameter, n_eff is a crude measure of effective sample size,
## and Rhat is the potential scale reduction factor on split chains (at 
## convergence, Rhat=1).
```

![plot of chunk display_many_fits](figure/display_many_fits2.png) ![plot of chunk display_many_fits](figure/display_many_fits3.png) ![plot of chunk display_many_fits](figure/display_many_fits4.png) ![plot of chunk display_many_fits](figure/display_many_fits5.png) 

```
## Inference for Stan model: chi_square_jumps hierarchical.
## 4 chains, each with iter=2000; warmup=1000; thin=1; 
## post-warmup draws per chain=1000, total post-warmup draws=4000.
## 
##                   mean se_mean       sd  2.5%     25%      50%      75%
## jump[1]            0.1     0.0      0.3   0.0     0.0      0.0      0.0
## jump[2]            0.0     0.0      0.2   0.0     0.0      0.0      0.0
## jump[3]            0.0     0.0      0.2   0.0     0.0      0.0      0.0
## jump[4]            0.1     0.0      0.2   0.0     0.0      0.0      0.0
## jump[5]            0.0     0.0      0.2   0.0     0.0      0.0      0.0
## jump[6]            0.0     0.0      0.1   0.0     0.0      0.0      0.0
## jump[7]            0.0     0.0      0.2   0.0     0.0      0.0      0.0
## jump[8]            0.0     0.0      0.1   0.0     0.0      0.0      0.0
## jump[9]            0.0     0.0      0.2   0.0     0.0      0.0      0.0
## jump[10]           0.0     0.0      0.2   0.0     0.0      0.0      0.0
## jump[11]           0.0     0.0      0.2   0.0     0.0      0.0      0.0
## jump[12]           0.0     0.0      0.2   0.0     0.0      0.0      0.0
## jump[13]           0.0     0.0      0.2   0.0     0.0      0.0      0.0
## jump[14]           0.0     0.0      0.2   0.0     0.0      0.0      0.0
## jump[15]           0.0     0.0      0.2   0.0     0.0      0.0      0.0
## mean_mu_N        430.4    17.3    296.0  24.8   151.6    399.4    684.6
## sigma_mu_N       382.5    16.5    273.2  14.7   128.4    351.2    603.5
## sigma_0            1.9     0.0      0.4   1.3     1.6      1.8      2.1
## mu[1]              2.0     0.1      2.6   0.0     0.0      0.3      3.8
## mu[2]              2.8     0.1      2.7   0.0     0.1      2.1      5.0
## mu[3]              3.4     0.1      2.8   0.0     0.6      3.1      5.6
## mu[4]              4.8     0.1      2.8   0.0     2.6      5.0      6.9
## mu[5]              5.6     0.1      2.8   0.1     3.8      5.8      7.5
## mu[6]              6.1     0.1      2.7   0.3     4.4      6.3      7.9
## mu[7]              6.5     0.1      2.7   0.7     4.8      6.6      8.2
## mu[8]              6.8     0.1      2.7   1.1     5.2      6.9      8.5
## mu[9]              7.4     0.1      2.7   1.7     5.8      7.5      9.1
## mu[10]             8.0     0.1      2.7   2.3     6.3      8.0      9.7
## mu[11]             8.9     0.1      2.8   3.3     7.1      8.8     10.6
## mu[12]             9.6     0.1      2.9   4.2     7.7      9.4     11.4
## mu[13]            10.2     0.1      3.0   4.7     8.1      9.9     12.0
## mu[14]            10.9     0.1      3.3   5.2     8.6     10.5     12.8
## mu[15]            11.4     0.1      3.6   5.4     8.9     10.9     13.5
## k_0                3.2     0.3      2.9   2.0     2.2      2.5      3.1
## s                171.8     8.2    129.0   4.3    53.3    153.5    270.9
## sigma_mu_N_sq 220960.0 13025.5 243443.1 217.5 16476.6 123374.0 364219.4
## sigma_0_sq         3.8     0.0      1.9   1.6     2.5      3.3      4.5
## lp__             -82.4     0.6      6.3 -94.1   -86.2    -82.6    -78.9
##                  97.5% n_eff Rhat
## jump[1]            0.4   123    1
## jump[2]            0.2   115    1
## jump[3]            0.2   138    1
## jump[4]            0.5    89    1
## jump[5]            0.3    80    1
## jump[6]            0.2   116    1
## jump[7]            0.1   134    1
## jump[8]            0.1   127    1
## jump[9]            0.3   148    1
## jump[10]           0.2    86    1
## jump[11]           0.3   113    1
## jump[12]           0.2   162    1
## jump[13]           0.1   128    1
## jump[14]           0.3   122    1
## jump[15]           0.2    91    1
## mean_mu_N        967.2   293    1
## sigma_mu_N       912.9   273    1
## sigma_0            3.0  2332    1
## mu[1]              8.1   995    1
## mu[2]              8.5  1250    1
## mu[3]              9.0  1391    1
## mu[4]             10.1  1874    1
## mu[5]             10.8  1738    1
## mu[6]             11.2  1711    1
## mu[7]             11.6  1536    1
## mu[8]             12.0  1610    1
## mu[9]             12.9  2073    1
## mu[10]            13.6  2105    1
## mu[11]            14.9  2376    1
## mu[12]            16.0  2291    1
## mu[13]            16.8  2522    1
## mu[14]            18.5  1941    1
## mu[15]            19.8  2041    1
## k_0                8.2    69    1
## s                437.3   247    1
## sigma_mu_N_sq 833475.2   349    1
## sigma_0_sq         8.7  2209    1
## lp__             -69.3   100    1
## 
## Samples were drawn using NUTS2 at Sun Sep 08 22:03:15 2013.
## For each parameter, n_eff is a crude measure of effective sample size,
## and Rhat is the potential scale reduction factor on split chains (at 
## convergence, Rhat=1).
```

![plot of chunk display_many_fits](figure/display_many_fits6.png) ![plot of chunk display_many_fits](figure/display_many_fits7.png) ![plot of chunk display_many_fits](figure/display_many_fits8.png) 

