


More samples and fits!




Plot the data with the model fit:


```
## Inference for Stan model: chi_square_jumps hierarchical.
## 4 chains, each with iter=20000; warmup=10000; thin=1; 
## post-warmup draws per chain=10000, total post-warmup draws=40000.
## 
##                mean se_mean       sd   2.5%      25%      50%      75%
## jump[1]         1.1     0.3      4.3    0.0      0.0      0.0      0.2
## jump[2]         1.1     0.3      4.4    0.0      0.0      0.0      0.2
## jump[3]         1.3     0.3      4.6    0.0      0.0      0.0      0.5
## jump[4]         1.3     0.3      4.7    0.0      0.0      0.0      0.4
## jump[5]         4.3     0.3      4.7    0.9      2.0      3.0      4.8
## jump[6]         1.5     0.3      4.8    0.0      0.0      0.1      0.8
## jump[7]         1.2     0.3      4.4    0.0      0.0      0.0      0.3
## jump[8]         1.2     0.3      4.4    0.0      0.0      0.0      0.4
## jump[9]         1.3     0.3      4.5    0.0      0.0      0.1      0.6
## jump[10]        1.4     0.3      4.3    0.0      0.0      0.2      0.9
## jump[11]        1.3     0.3      4.4    0.0      0.0      0.1      0.8
## jump[12]        1.2     0.3      4.3    0.0      0.0      0.0      0.4
## jump[13]        1.1     0.3      4.2    0.0      0.0      0.0      0.2
## jump[14]        1.1     0.3      4.3    0.0      0.0      0.0      0.3
## jump[15]        1.2     0.3      4.3    0.0      0.0      0.0      0.5
## mu_N          775.6     3.6    156.6  428.9    669.7    803.7    903.6
## sigma_N       468.0    10.9    206.2   88.8    318.9    457.8    614.6
## sigma_y        38.6     0.4     10.6   23.9     31.1     36.4     43.9
## theta[1]       14.0     0.9     25.3    0.0      0.0      1.3     16.8
## theta[2]       32.0     1.9     44.6    0.0      0.7     10.6     47.7
## theta[3]       61.3     3.0     69.5    0.0      5.6     33.8     96.8
## theta[4]       88.3     4.3     91.9    0.0     13.1     55.7    139.8
## theta[5]      510.8     4.9    113.8  264.5    441.2    531.1    593.6
## theta[6]      556.4     3.9     91.2  347.5    504.4    567.7    619.2
## theta[7]      575.1     2.9     81.1  399.2    526.3    581.6    630.7
## theta[8]      603.0     2.1     75.1  448.7    555.3    605.2    653.5
## theta[9]      640.0     1.5     74.3  493.1    591.0    639.9    690.1
## theta[10]     693.5     1.4     75.4  545.7    642.7    694.1    745.5
## theta[11]     739.9     1.2     69.6  599.6    694.4    741.2    787.1
## theta[12]     765.9     0.5     66.2  634.0    722.7    766.5    808.9
## theta[13]     783.9     0.6     66.8  654.3    739.9    783.4    826.8
## theta[14]     804.7     1.4     72.0  669.1    757.3    802.3    848.6
## theta[15]     832.9     2.2     84.5  684.2    776.1    825.5    883.0
## k_0            20.4     4.1     61.0    2.1      3.1      4.9      9.9
## s             164.6     5.6    112.5    4.6     74.8    147.8    239.0
## sigma_N_sq 261579.6  8996.9 205614.0 7891.8 101728.5 209597.6 377749.2
## sigma_y_sq   1599.6    35.4    958.8  571.9    964.9   1328.4   1923.8
## lp__         -110.8     0.7     11.5 -129.0   -118.9   -112.2   -104.5
##               97.5% n_eff Rhat
## jump[1]        13.1   245    1
## jump[2]        13.6   235    1
## jump[3]        14.8   238    1
## jump[4]        15.2   245    1
## jump[5]        17.0   221    1
## jump[6]        15.3   245    1
## jump[7]        13.4   241    1
## jump[8]        13.8   239    1
## jump[9]        13.6   240    1
## jump[10]       13.4   256    1
## jump[11]       13.5   246    1
## jump[12]       12.6   253    1
## jump[13]       12.1   241    1
## jump[14]       12.5   247    1
## jump[15]       13.3   250    1
## mu_N          990.1  1875    1
## sigma_N       876.6   358    1
## sigma_y        65.6   763    1
## theta[1]       86.2   714    1
## theta[2]      150.3   527    1
## theta[3]      232.1   532    1
## theta[4]      308.8   461    1
## theta[5]      692.2   532    1
## theta[6]      709.3   551    1
## theta[7]      720.0   779    1
## theta[8]      744.2  1268    1
## theta[9]      785.4  2302    1
## theta[10]     837.4  2812    1
## theta[11]     872.0  3536    1
## theta[12]     895.3 17414    1
## theta[13]     918.8 12957    1
## theta[14]     955.8  2615    1
## theta[15]    1017.3  1504    1
## k_0           191.1   218    1
## s             414.6   399    1
## sigma_N_sq 768503.9   522    1
## sigma_y_sq   4299.3   735    1
## lp__          -82.5   247    1
## 
## Samples were drawn using NUTS2 at Thu Sep 12 16:49:43 2013.
## For each parameter, n_eff is a crude measure of effective sample size,
## and Rhat is the potential scale reduction factor on split chains (at 
## convergence, Rhat=1).
```

![plot of chunk display_many_fits](figure/display_many_fits1.png) ![plot of chunk display_many_fits](figure/display_many_fits2.png) ![plot of chunk display_many_fits](figure/display_many_fits3.png) 

```
## Inference for Stan model: chi_square_jumps hierarchical.
## 4 chains, each with iter=20000; warmup=10000; thin=1; 
## post-warmup draws per chain=10000, total post-warmup draws=40000.
## 
##                mean se_mean       sd   2.5%     25%      50%      75%
## jump[1]         1.0     0.2      3.0    0.0     0.0      0.1      0.6
## jump[2]         0.9     0.1      2.8    0.0     0.0      0.1      0.5
## jump[3]         1.3     0.2      3.2    0.0     0.0      0.2      0.9
## jump[4]         1.6     0.2      3.4    0.0     0.1      0.5      1.4
## jump[5]         1.5     0.2      3.5    0.0     0.0      0.4      1.3
## jump[6]         1.5     0.2      3.5    0.0     0.0      0.3      1.2
## jump[7]         1.5     0.2      3.5    0.0     0.0      0.3      1.2
## jump[8]         1.9     0.2      3.8    0.0     0.1      0.6      1.9
## jump[9]         1.6     0.2      3.6    0.0     0.0      0.4      1.5
## jump[10]        1.6     0.2      3.6    0.0     0.0      0.3      1.4
## mu_N          628.9     5.4    193.9  318.6   465.1    611.9    788.4
## sigma_N       356.7    10.2    214.6   52.4   181.6    321.5    502.2
## sigma_y        35.2     0.1      9.5   21.6    28.5     33.5     39.9
## theta[1]       16.1     0.3     21.1    0.0     0.5      7.8     24.7
## theta[2]       30.1     0.6     29.6    0.0     5.2     22.0     47.0
## theta[3]       57.7     0.9     43.7    0.2    21.0     52.3     86.5
## theta[4]      105.9     0.7     55.4    4.9    66.2    106.3    142.3
## theta[5]      147.6     0.7     58.0   26.4   110.6    149.0    185.5
## theta[6]      186.0     0.6     59.0   64.1   148.7    187.4    224.1
## theta[7]      221.2     0.8     62.2   92.3   182.1    222.7    261.6
## theta[8]      285.1     0.6     64.7  155.4   243.3    284.6    326.4
## theta[9]      328.7     0.6     67.1  199.2   285.4    327.4    370.9
## theta[10]     369.5     0.8     76.8  226.7   319.3    366.5    415.4
## k_0            17.7     1.8     31.7    2.1     3.8      7.4     16.5
## s             117.8     4.4    105.6    3.6    32.8     84.1    178.0
## sigma_N_sq 173295.6  7216.3 186835.5 2742.2 32970.7 103376.2 252234.4
## sigma_y_sq   1327.3    10.0    786.7  468.5   813.3   1121.6   1593.5
## lp__          -61.5     0.4      7.8  -76.5   -67.2    -61.4    -55.9
##               97.5% n_eff Rhat
## jump[1]         9.2   383    1
## jump[2]         9.0   589    1
## jump[3]        10.4   370    1
## jump[4]        11.9   368    1
## jump[5]        11.5   372    1
## jump[6]        11.1   357    1
## jump[7]        11.4   376    1
## jump[8]        12.8   378    1
## jump[9]        12.3   376    1
## jump[10]       12.1   377    1
## mu_N          979.6  1283    1
## sigma_N       827.8   444    1
## sigma_y        58.7  5912    1
## theta[1]       73.0  3792    1
## theta[2]      101.6  2154    1
## theta[3]      154.6  2560    1
## theta[4]      219.5  5648    1
## theta[5]      260.8  7963    1
## theta[6]      301.2  9546    1
## theta[7]      341.7  6238    1
## theta[8]      414.5 13591    1
## theta[9]      465.4 12912    1
## theta[10]     531.4  8720    1
## k_0           111.5   303    1
## s             381.5   570    1
## sigma_N_sq 685254.5   670    1
## sigma_y_sq   3450.1  6207    1
## lp__          -46.5   438    1
## 
## Samples were drawn using NUTS2 at Thu Sep 12 16:51:11 2013.
## For each parameter, n_eff is a crude measure of effective sample size,
## and Rhat is the potential scale reduction factor on split chains (at 
## convergence, Rhat=1).
```

![plot of chunk display_many_fits](figure/display_many_fits4.png) ![plot of chunk display_many_fits](figure/display_many_fits5.png) ![plot of chunk display_many_fits](figure/display_many_fits6.png) 

