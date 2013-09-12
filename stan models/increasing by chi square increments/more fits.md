


More samples and fits!




Plot the data with the model fit:


```
## Inference for Stan model: chi_square_jumps hierarchical.
## 4 chains, each with iter=2000; warmup=1000; thin=1; 
## post-warmup draws per chain=1000, total post-warmup draws=4000.
## 
##                mean se_mean       sd   2.5%     25%      50%      75%
## jump[1]         2.8     1.2      8.3    0.0     0.0      0.0      0.5
## jump[2]         2.9     1.2      8.2    0.0     0.0      0.0      0.7
## jump[3]         3.2     1.2      8.6    0.0     0.0      0.1      1.1
## jump[4]         3.2     1.2      8.6    0.0     0.0      0.0      1.1
## jump[5]         6.1     1.2      8.1    0.5     2.1      3.3      6.1
## jump[6]         3.5     1.2      8.6    0.0     0.0      0.2      1.7
## jump[7]         3.0     1.2      8.4    0.0     0.0      0.0      0.7
## jump[8]         2.9     1.1      8.0    0.0     0.0      0.1      1.0
## jump[9]         3.0     1.1      8.1    0.0     0.0      0.1      1.0
## jump[10]        3.1     1.2      8.1    0.0     0.0      0.4      1.5
## jump[11]        3.1     1.1      8.0    0.0     0.0      0.3      1.3
## jump[12]        2.9     1.2      8.2    0.0     0.0      0.1      0.9
## jump[13]        2.8     1.1      8.1    0.0     0.0      0.0      0.6
## jump[14]        2.9     1.2      8.4    0.0     0.0      0.1      0.7
## jump[15]        2.9     1.1      8.0    0.0     0.0      0.1      0.9
## mu_N          779.1     7.1    152.7  443.6   674.8    806.5    906.1
## sigma_N       421.7    34.1    222.5   52.4   253.6    415.5    579.9
## sigma_y        40.8     1.5     12.2   24.3    31.8     38.3     47.0
## theta[1]       18.4     2.8     27.7    0.0     0.0      3.6     29.8
## theta[2]       41.1     6.5     49.4    0.0     1.6     18.6     70.3
## theta[3]       74.1    10.3     75.2    0.0     9.7     46.3    129.3
## theta[4]      105.6    14.5    100.5    0.0    16.7     70.8    182.8
## theta[5]      483.7    18.4    125.8  237.8   388.3    507.8    581.1
## theta[6]      535.8    14.1    103.6  319.0   469.6    553.7    610.8
## theta[7]      560.0    10.5     90.0  369.9   503.3    571.2    624.1
## theta[8]      590.3     6.9     81.9  415.2   537.8    597.7    645.1
## theta[9]      626.1     5.5     77.7  467.2   577.8    627.6    678.3
## theta[10]     683.4     5.6     79.8  516.0   631.2    685.5    738.4
## theta[11]     732.0     5.0     73.8  576.7   686.5    732.9    783.0
## theta[12]     761.2     3.4     69.4  620.9   719.2    761.0    807.9
## theta[13]     782.8     2.9     69.2  643.7   737.7    783.3    828.9
## theta[14]     807.0     4.7     74.0  662.2   757.3    804.6    855.7
## theta[15]     838.2     5.9     86.2  687.0   778.8    832.2    892.5
## k_0            45.9    16.9    114.6    2.1     3.2      5.9     17.2
## s             144.3    18.0    115.8    1.6    44.5    126.0    223.4
## sigma_N_sq 227371.9 28595.1 204918.9 2748.7 64289.7 172619.9 336330.4
## sigma_y_sq   1814.8   150.1   1161.0  589.9  1014.2   1463.5   2204.9
## lp__         -107.7     2.4     13.8 -128.1  -118.0   -110.2    -99.5
##               97.5% n_eff Rhat
## jump[1]        32.9    50  1.1
## jump[2]        33.3    49  1.1
## jump[3]        34.2    48  1.1
## jump[4]        34.5    49  1.1
## jump[5]        35.3    48  1.1
## jump[6]        34.3    49  1.1
## jump[7]        34.2    49  1.1
## jump[8]        31.4    51  1.1
## jump[9]        32.3    50  1.1
## jump[10]       32.1    48  1.1
## jump[11]       32.3    50  1.1
## jump[12]       31.5    51  1.1
## jump[13]       33.0    50  1.1
## jump[14]       33.9    50  1.1
## jump[15]       31.5    50  1.1
## mu_N          993.2   458  1.0
## sigma_N       874.8    43  1.1
## sigma_y        70.1    62  1.1
## theta[1]       89.1    96  1.1
## theta[2]      162.5    57  1.1
## theta[3]      244.5    54  1.1
## theta[4]      322.9    48  1.1
## theta[5]      680.6    47  1.1
## theta[6]      701.6    54  1.1
## theta[7]      715.9    73  1.1
## theta[8]      738.2   141  1.0
## theta[9]      777.3   198  1.0
## theta[10]     836.4   206  1.0
## theta[11]     869.3   221  1.0
## theta[12]     893.7   407  1.0
## theta[13]     915.6   567  1.0
## theta[14]     953.1   251  1.0
## theta[15]    1023.4   217  1.0
## k_0           486.8    46  1.1
## s             407.1    41  1.1
## sigma_N_sq 765335.0    51  1.1
## sigma_y_sq   4913.5    60  1.1
## lp__          -77.2    33  1.2
## 
## Samples were drawn using NUTS2 at Wed Sep 11 15:32:02 2013.
## For each parameter, n_eff is a crude measure of effective sample size,
## and Rhat is the potential scale reduction factor on split chains (at 
## convergence, Rhat=1).
```

![plot of chunk display_many_fits](figure/display_many_fits1.png) ![plot of chunk display_many_fits](figure/display_many_fits2.png) ![plot of chunk display_many_fits](figure/display_many_fits3.png) ![plot of chunk display_many_fits](figure/display_many_fits4.png) ![plot of chunk display_many_fits](figure/display_many_fits5.png) 

```
## Inference for Stan model: chi_square_jumps hierarchical.
## 4 chains, each with iter=2000; warmup=1000; thin=1; 
## post-warmup draws per chain=1000, total post-warmup draws=4000.
## 
##                mean se_mean      sd   2.5%     25%     50%      75%
## jump[1]         5.7     1.7     9.4    0.2     1.9     2.9      5.4
## jump[2]         4.8     1.5     9.7    0.2     1.6     2.6      4.2
## jump[3]         3.4     1.4     8.8    0.0     0.4     1.0      2.4
## jump[4]         2.4     1.1     8.7    0.0     0.1     0.6      1.1
## jump[5]         2.6     1.2     8.6    0.0     0.1     0.6      1.4
## jump[6]         2.9     1.3     9.1    0.0     0.4     0.8      1.8
## jump[7]         3.5     1.2     8.8    0.0     0.9     1.5      2.6
## jump[8]         2.3     1.2     9.0    0.0     0.0     0.3      1.2
## jump[9]         2.3     1.2     8.5    0.0     0.1     0.2      1.2
## jump[10]        3.7     1.3     9.4    0.0     0.8     1.7      2.8
## mu_N          766.3    47.2   148.8  442.0   668.1   783.6    899.9
## sigma_N       288.5    26.1   131.0   69.0   207.8   293.0    339.8
## sigma_y        20.1     3.0     9.1    9.7    13.5    17.6     24.4
## theta[1]      154.7     4.4    60.5   17.4   120.9   156.0    188.8
## theta[2]      285.4    10.4    57.9  146.8   252.4   296.3    325.2
## theta[3]      349.4     6.0    46.9  227.8   327.8   352.3    378.4
## theta[4]      380.1     3.9    38.5  284.7   361.1   383.5    402.2
## theta[5]      414.3     2.3    37.1  339.0   391.2   414.3    437.0
## theta[6]      464.2     3.1    42.2  381.5   437.1   464.1    488.6
## theta[7]      546.4     3.0    39.3  462.1   524.2   550.9    570.9
## theta[8]      573.9     1.8    36.6  500.9   552.8   571.5    595.2
## theta[9]      599.0     7.8    42.9  528.9   570.4   594.4    621.0
## theta[10]     682.7     4.7    54.8  572.0   649.9   683.6    714.4
## k_0            34.6    13.0    86.3    3.3    10.1    15.8     23.0
## s              63.4     9.7    56.4    3.5    31.4    53.5     74.8
## sigma_N_sq 100414.5 15880.0 99035.7 4767.1 43198.8 85867.1 115445.8
## sigma_y_sq    485.7   140.4   509.5   93.7   182.8   309.6    594.1
## lp__          -50.1     1.2     5.6  -64.6   -52.9   -48.9    -46.7
##               97.5% n_eff Rhat
## jump[1]        30.5    30  1.2
## jump[2]        26.8    44  1.1
## jump[3]        25.0    39  1.1
## jump[4]        21.4    68  1.1
## jump[5]        20.4    51  1.1
## jump[6]        20.6    49  1.1
## jump[7]        19.8    52  1.1
## jump[8]        21.0    54  1.1
## jump[9]        19.9    50  1.1
## jump[10]       21.7    50  1.1
## mu_N          987.9    10  1.2
## sigma_N       632.1    25  1.2
## sigma_y        43.2     9  1.2
## theta[1]      274.8   187  1.0
## theta[2]      380.3    31  1.1
## theta[3]      429.6    61  1.1
## theta[4]      449.3   100  1.0
## theta[5]      494.5   251  1.0
## theta[6]      551.8   183  1.0
## theta[7]      617.9   167  1.0
## theta[8]      646.5   391  1.0
## theta[9]      699.2    30  1.1
## theta[10]     793.5   135  1.0
## k_0           217.5    44  1.1
## s             238.3    34  1.2
## sigma_N_sq 399543.9    39  1.1
## sigma_y_sq   1869.8    13  1.1
## lp__          -41.5    23  1.2
## 
## Samples were drawn using NUTS2 at Wed Sep 11 15:32:31 2013.
## For each parameter, n_eff is a crude measure of effective sample size,
## and Rhat is the potential scale reduction factor on split chains (at 
## convergence, Rhat=1).
```

![plot of chunk display_many_fits](figure/display_many_fits6.png) ![plot of chunk display_many_fits](figure/display_many_fits7.png) ![plot of chunk display_many_fits](figure/display_many_fits8.png) ![plot of chunk display_many_fits](figure/display_many_fits9.png) ![plot of chunk display_many_fits](figure/display_many_fits10.png) 

