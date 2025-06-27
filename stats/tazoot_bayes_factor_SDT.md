tazoot_bayes_factor_SDT
================
Jenny Motzer
2025-06-26

# det

## dprime

``` r
d <- data
bf_det_dPrime <- anovaBF(det_dPrime_sub ~ Validity * nontargetContrast * Target + SID, data = data, whichRandom = "SID", progress = FALSE)
bf_det_dPrime=sort(bf_det_dPrime, decreasing = TRUE)
print(bf_det_dPrime)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Target + nontargetContrast:Target + SID                                                                                                   : 10687672   ±2.47%
    ## [2] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + SID                                                           : 6844168    ±6.7%
    ## [3] nontargetContrast + Target + nontargetContrast:Target + Validity + SID                                                                                        : 1752969    ±3.74%
    ## [4] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                         : 1398899    ±27.97%
    ## [5] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + nontargetContrast:Target:Validity +     SID : 532385.7   ±3.32%
    ## [6] nontargetContrast + Target + nontargetContrast:Target + Validity + Target:Validity + SID                                                                      : 254473.1   ±4.48%
    ## [7] nontargetContrast + Target + SID                                                                                                                              : 219.5295   ±1.85%
    ## [8] nontargetContrast + SID                                                                                                                                       : 115.341    ±1.58%
    ## [9] nontargetContrast + Target + Validity + nontargetContrast:Validity + SID                                                                                      : 81.27632   ±6.19%
    ## [10] nontargetContrast + Validity + nontargetContrast:Validity + SID                                                                                              : 36.16835   ±2.67%
    ## [11] nontargetContrast + Target + Validity + SID                                                                                                                  : 30.21975   ±1.99%
    ## [12] nontargetContrast + Validity + SID                                                                                                                           : 15.66332   ±1.7%
    ## [13] nontargetContrast + Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                                                   : 11.77861   ±4.29%
    ## [14] nontargetContrast + Target + Validity + Target:Validity + SID                                                                                                : 4.403082   ±2.49%
    ## [15] Target + SID                                                                                                                                                 : 1.578417   ±0.74%
    ## [16] Target + Validity + SID                                                                                                                                      : 0.2002893  ±1.12%
    ## [17] Validity + SID                                                                                                                                               : 0.126038   ±0.81%
    ## [18] Target + Validity + Target:Validity + SID                                                                                                                    : 0.02986874 ±2.7%
    ## 
    ## Against denominator:
    ##   det_dPrime_sub ~ SID 
    ## ---
    ## Bayes factor type: BFlinearModel, JZS

## calculate BF for detPrime Validity:nontargetContrast

``` r
bf_highestmodel <- as.vector(bf_det_dPrime[2])[[1]]/as.vector(bf_det_dPrime[3])[[1]] #the highest ranked model
print(bf_highestmodel)
```

    ## [1] 3.904328

``` r
bf_fullmodel <- as.vector(bf_det_dPrime[4])[[1]]/as.vector(bf_det_dPrime[6])[[1]] #the numerator contains all main effect and interaction effects
print(bf_fullmodel)
```

    ## [1] 5.497239

## det dprime T1

``` r
d <- data %>% filter(Target==1)
bf_det_dPrimeT1 <- anovaBF(det_dPrime_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_det_dPrimeT1=sort(bf_det_dPrimeT1, decreasing = TRUE)
print(bf_det_dPrimeT1)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Validity + nontargetContrast:Validity + SID : 0.8595666  ±1.94%
    ## [2] Validity + SID                                                  : 0.3300642  ±0.89%
    ## [3] nontargetContrast + SID                                         : 0.2931598  ±4.47%
    ## [4] nontargetContrast + Validity + SID                              : 0.09394078 ±1.49%
    ## 
    ## Against denominator:
    ##   det_dPrime_sub ~ SID 
    ## ---
    ## Bayes factor type: BFlinearModel, JZS

## calculate BF for detPrime T1 Validity:nontargetContrast

``` r
bf <- as.vector(bf_det_dPrimeT1[1])[[1]]/as.vector(bf_det_dPrimeT1[4])[[1]] 
print(bf)
```

    ## [1] 9.150089

## det dprime T2

``` r
d <- data %>% filter(Target==2)
bf_det_dPrimeT2 <- anovaBF(det_dPrime_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_det_dPrimeT2=sort(bf_det_dPrimeT2, decreasing = TRUE)
print(bf_det_dPrimeT2)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + SID                                         : 5590890  ±2.03%
    ## [2] nontargetContrast + Validity + SID                              : 679900.5 ±3.02%
    ## [3] nontargetContrast + Validity + nontargetContrast:Validity + SID : 266569.2 ±2.71%
    ## [4] Validity + SID                                                  : 0.111018 ±0.64%
    ## 
    ## Against denominator:
    ##   det_dPrime_sub ~ SID 
    ## ---
    ## Bayes factor type: BFlinearModel, JZS

## calculate BF for detPrime T2 Validity:nontargetContrast

``` r
bf <- as.vector(bf_det_dPrimeT2[3])[[1]]/as.vector(bf_det_dPrimeT2[2])[[1]] 
print(bf)
```

    ## [1] 0.3920709

# crit

``` r
d <- data
bf_det_crit <- anovaBF(det_crit_sub ~ Validity * nontargetContrast * Target + SID, data = data, whichRandom = "SID", progress = FALSE)
bf_det_crit=sort(bf_det_crit, decreasing = TRUE)
print(bf_det_crit)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Target + nontargetContrast:Target + Validity + SID                                                                                         : 2.119789e+41 ±9.74%
    ## [2] nontargetContrast + Target + Validity + SID                                                                                                                    : 2.049113e+41 ±2.13%
    ## [3] nontargetContrast + Target + nontargetContrast:Target + SID                                                                                                    : 1.025269e+41 ±8.39%
    ## [4] nontargetContrast + Target + SID                                                                                                                               : 9.710114e+40 ±1.15%
    ## [5] nontargetContrast + Target + Validity + Target:Validity + SID                                                                                                  : 5.84895e+40  ±2.92%
    ## [6] nontargetContrast + Target + nontargetContrast:Target + Validity + Target:Validity + SID                                                                       : 5.560586e+40 ±2.56%
    ## [7] nontargetContrast + Target + Validity + nontargetContrast:Validity + SID                                                                                       : 5.210309e+40 ±2.5%
    ## [8] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + SID                                                            : 4.805503e+40 ±2.34%
    ## [9] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                          : 1.584945e+40 ±4.27%
    ## [10] nontargetContrast + Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                                                    : 1.437139e+40 ±2.64%
    ## [11] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + nontargetContrast:Target:Validity +     SID : 2.902109e+39 ±14.82%
    ## [12] nontargetContrast + Validity + SID                                                                                                                            : 1.436366e+37 ±3.55%
    ## [13] nontargetContrast + SID                                                                                                                                       : 1.058982e+37 ±4.3%
    ## [14] nontargetContrast + Validity + nontargetContrast:Validity + SID                                                                                               : 3.235858e+36 ±5.5%
    ## [15] Target + SID                                                                                                                                                  : 19.98363     ±17.5%
    ## [16] Target + Validity + SID                                                                                                                                       : 3.226789     ±2.89%
    ## [17] Target + Validity + Target:Validity + SID                                                                                                                     : 0.4573675    ±3.55%
    ## [18] Validity + SID                                                                                                                                                : 0.1976836    ±0.69%
    ## 
    ## Against denominator:
    ##   det_crit_sub ~ SID 
    ## ---
    ## Bayes factor type: BFlinearModel, JZS

## calculate BF for detCrit Validity:nontargetContrast

``` r
bf_highestmodel <- as.vector(bf_det_crit[8])[[1]]/as.vector(bf_det_crit[2])[[1]] #the highest ranked model
print(bf_highestmodel)
```

    ## [1] 0.2345163

``` r
bf_fullmodel <- as.vector(bf_det_crit[10])[[1]]/as.vector(bf_det_crit[6])[[1]] #the numerator contains all main effect and interaction effects
print(bf_fullmodel)
```

    ## [1] 0.258451

## det crit T1

``` r
d <- data %>% filter(Target==1)
bf_det_critT1 <- anovaBF(det_crit_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_det_critT1=sort(bf_det_critT1, decreasing = TRUE)
print(bf_det_critT1)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Validity + SID                              : 9.871724e+20 ±1.47%
    ## [2] nontargetContrast + Validity + nontargetContrast:Validity + SID : 2.24728e+20  ±1.19%
    ## [3] nontargetContrast + SID                                         : 2.236437e+20 ±1.44%
    ## [4] Validity + SID                                                  : 0.3740031    ±1.54%
    ## 
    ## Against denominator:
    ##   det_crit_sub ~ SID 
    ## ---
    ## Bayes factor type: BFlinearModel, JZS

## calculate BF for detCrit T1 Validity:nontargetContrast

``` r
bf <- as.vector(bf_det_critT1[2])[[1]]/as.vector(bf_det_critT1[1])[[1]] 
print(bf)
```

    ## [1] 0.2276482

## det crit T2

``` r
d <- data %>% filter(Target==2)
bf_det_critT2 <- anovaBF(det_crit_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_det_critT2=sort(bf_det_critT2, decreasing = TRUE)
print(bf_det_critT2)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + SID                                         : 2.935313e+19 ±0.91%
    ## [2] nontargetContrast + Validity + SID                              : 3.989599e+18 ±1.02%
    ## [3] nontargetContrast + Validity + nontargetContrast:Validity + SID : 1.278287e+18 ±5.86%
    ## [4] Validity + SID                                                  : 0.1061798    ±1.68%
    ## 
    ## Against denominator:
    ##   det_crit_sub ~ SID 
    ## ---
    ## Bayes factor type: BFlinearModel, JZS

## calculate BF for detCrit T2 Validity:nontargetContrast

``` r
bf <- as.vector(bf_det_critT2[3])[[1]]/as.vector(bf_det_critT2[2])[[1]] 
print(bf)
```

    ## [1] 0.320405

# dis

## dprime

``` r
d <- data
bf_dis_dPrime <- anovaBF(dis_dPrime_sub ~ Validity * nontargetContrast * Target + SID, data = data, whichRandom = "SID", progress = FALSE)
bf_dis_dPrime=sort(bf_dis_dPrime, decreasing = TRUE)
print(bf_dis_dPrime)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Target + Validity + SID                                                                                                                   : 9.790136e+16 ±2.66%
    ## [2] nontargetContrast + Target + nontargetContrast:Target + Validity + SID                                                                                        : 8.882583e+16 ±3.06%
    ## [3] nontargetContrast + Target + Validity + nontargetContrast:Validity + SID                                                                                      : 6.39795e+16  ±2.69%
    ## [4] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + SID                                                           : 5.557889e+16 ±3.82%
    ## [5] nontargetContrast + Target + Validity + Target:Validity + SID                                                                                                 : 2.925949e+16 ±6.01%
    ## [6] nontargetContrast + Target + nontargetContrast:Target + Validity + Target:Validity + SID                                                                      : 2.300286e+16 ±2.5%
    ## [7] nontargetContrast + Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                                                    : 1.900928e+16 ±2.5%
    ## [8] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                         : 1.651888e+16 ±2.73%
    ## [9] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + nontargetContrast:Target:Validity +     SID : 2.625195e+15 ±3.47%
    ## [10] nontargetContrast + Target + SID                                                                                                                             : 2.144771e+12 ±34.04%
    ## [11] nontargetContrast + Target + nontargetContrast:Target + SID                                                                                                  : 1.071885e+12 ±8.33%
    ## [12] nontargetContrast + Validity + SID                                                                                                                           : 2369947201   ±1.77%
    ## [13] Target + Validity + SID                                                                                                                                      : 1574748881   ±1.24%
    ## [14] nontargetContrast + Validity + nontargetContrast:Validity + SID                                                                                              : 1075915092   ±1.56%
    ## [15] Target + Validity + Target:Validity + SID                                                                                                                    : 364147846    ±1.62%
    ## [16] nontargetContrast + SID                                                                                                                                      : 394794.4     ±0.79%
    ## [17] Target + SID                                                                                                                                                 : 280039.5     ±1.53%
    ## [18] Validity + SID                                                                                                                                               : 1032.284     ±0.6%
    ## 
    ## Against denominator:
    ##   dis_dPrime_sub ~ SID 
    ## ---
    ## Bayes factor type: BFlinearModel, JZS

## calculate BF for disPrime Validity:nontargetContrast

``` r
bf_highestmodel <- as.vector(bf_dis_dPrime[3])[[1]]/as.vector(bf_dis_dPrime[1])[[1]] #the highest ranked model
print(bf_highestmodel)
```

    ## [1] 0.6535098

``` r
bf_fullmodel <- as.vector(bf_dis_dPrime[7])[[1]]/as.vector(bf_dis_dPrime[6])[[1]] #the numerator contains all main effect and interaction effects
print(bf_fullmodel)
```

    ## [1] 0.8263875

## dis dprime T1

``` r
d <- data %>% filter(Target==1)
bf_dis_dPrimeT1 <- anovaBF(dis_dPrime_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_dis_dPrimeT1=sort(bf_dis_dPrimeT1, decreasing = TRUE)
print(bf_dis_dPrimeT1)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Validity + SID                              : 81212331 ±1.02%
    ## [2] nontargetContrast + Validity + nontargetContrast:Validity + SID : 34669765 ±2.09%
    ## [3] nontargetContrast + SID                                         : 25003.98 ±4.92%
    ## [4] Validity + SID                                                  : 262.4916 ±0.98%
    ## 
    ## Against denominator:
    ##   dis_dPrime_sub ~ SID 
    ## ---
    ## Bayes factor type: BFlinearModel, JZS

## calculate BF for disPrime T1 Validity:nontargetContrast

``` r
bf <- as.vector(bf_dis_dPrimeT1[2])[[1]]/as.vector(bf_dis_dPrimeT1[1])[[1]] 
print(bf)
```

    ## [1] 0.4269027

## dis dprime T2

``` r
d <- data %>% filter(Target==2)
bf_dis_dPrimeT2 <- anovaBF(dis_dPrime_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_dis_dPrimeT2=sort(bf_dis_dPrimeT2, decreasing = TRUE)
print(bf_dis_dPrimeT2)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Validity + SID                              : 139.5895 ±2.08%
    ## [2] nontargetContrast + Validity + nontargetContrast:Validity + SID : 49.76208 ±1.57%
    ## [3] nontargetContrast + SID                                         : 44.96311 ±1.43%
    ## [4] Validity + SID                                                  : 1.977489 ±0.74%
    ## 
    ## Against denominator:
    ##   dis_dPrime_sub ~ SID 
    ## ---
    ## Bayes factor type: BFlinearModel, JZS

## calculate BF for disPrime T2 Validity:nontargetContrast

``` r
bf <- as.vector(bf_dis_dPrimeT2[2])[[1]]/as.vector(bf_dis_dPrimeT2[1])[[1]] 
print(bf)
```

    ## [1] 0.3564888

# crit

``` r
d <- data
bf_dis_crit <- anovaBF(dis_crit_sub ~ Validity * nontargetContrast * Target + SID, data = data, whichRandom = "SID", progress = FALSE)
bf_dis_crit=sort(bf_dis_crit, decreasing = TRUE)
print(bf_dis_crit)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] Target + SID                                                                                                                                                   : 0.4373651    ±1.28%
    ## [2] nontargetContrast + SID                                                                                                                                        : 0.147773     ±1.5%
    ## [3] Validity + SID                                                                                                                                                 : 0.07113936   ±0.72%
    ## [4] nontargetContrast + Target + SID                                                                                                                               : 0.06326406   ±1.68%
    ## [5] Target + Validity + Target:Validity + SID                                                                                                                      : 0.03577368   ±2.05%
    ## [6] Target + Validity + SID                                                                                                                                        : 0.03218884   ±2.59%
    ## [7] nontargetContrast + Target + nontargetContrast:Target + SID                                                                                                    : 0.02643508   ±2.61%
    ## [8] nontargetContrast + Validity + SID                                                                                                                             : 0.01024443   ±1.18%
    ## [9] nontargetContrast + Target + Validity + Target:Validity + SID                                                                                                  : 0.005350967  ±2.46%
    ## [10] nontargetContrast + Target + Validity + SID                                                                                                                   : 0.004493841  ±1.65%
    ## [11] nontargetContrast + Target + nontargetContrast:Target + Validity + Target:Validity + SID                                                                      : 0.002219266  ±2.17%
    ## [12] nontargetContrast + Target + nontargetContrast:Target + Validity + SID                                                                                        : 0.001902123  ±3.89%
    ## [13] nontargetContrast + Validity + nontargetContrast:Validity + SID                                                                                               : 0.001144339  ±2.14%
    ## [14] nontargetContrast + Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                                                    : 0.0005805703 ±3.24%
    ## [15] nontargetContrast + Target + Validity + nontargetContrast:Validity + SID                                                                                      : 0.0005039365 ±2.2%
    ## [16] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                         : 0.0002818875 ±8.08%
    ## [17] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + SID                                                           : 0.0002177762 ±2.81%
    ## [18] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + nontargetContrast:Target:Validity +     SID : 0.0001235235 ±4.95%
    ## 
    ## Against denominator:
    ##   dis_crit_sub ~ SID 
    ## ---
    ## Bayes factor type: BFlinearModel, JZS

## calculate BF for disCrit Validity:nontargetContrast

``` r
bf_highestmodel <- as.vector(bf_dis_crit[13])[[1]]/as.vector(bf_dis_crit[8])[[1]] #the highest ranked model
print(bf_highestmodel)
```

    ## [1] 0.1117035

``` r
bf_fullmodel <- as.vector(bf_dis_crit[16])[[1]]/as.vector(bf_dis_crit[11])[[1]] #the numerator contains all main effect and interaction effects
print(bf_fullmodel)
```

    ## [1] 0.1270184

## dis crit T1

``` r
d <- data %>% filter(Target==1)
bf_dis_critT1 <- anovaBF(dis_crit_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_dis_critT1=sort(bf_dis_critT1, decreasing = TRUE)
print(bf_dis_critT1)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + SID                                         : 0.3100363  ±0.92%
    ## [2] Validity + SID                                                  : 0.1661326  ±1.15%
    ## [3] nontargetContrast + Validity + SID                              : 0.05118372 ±1.38%
    ## [4] nontargetContrast + Validity + nontargetContrast:Validity + SID : 0.01000497 ±4.2%
    ## 
    ## Against denominator:
    ##   dis_crit_sub ~ SID 
    ## ---
    ## Bayes factor type: BFlinearModel, JZS

## calculate BF for disCrit T1 Validity:nontargetContrast

``` r
bf <- as.vector(bf_dis_critT1[4])[[1]]/as.vector(bf_dis_critT1[3])[[1]] 
print(bf)
```

    ## [1] 0.1954717

## dis crit T2

``` r
d <- data %>% filter(Target==2)
bf_dis_critT2 <- anovaBF(dis_crit_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_dis_critT2=sort(bf_dis_critT2, decreasing = TRUE)
print(bf_dis_critT2)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] Validity + SID                                                  : 1.17131   ±1.38%
    ## [2] nontargetContrast + Validity + SID                              : 0.3359177 ±2.43%
    ## [3] nontargetContrast + SID                                         : 0.2791748 ±0.78%
    ## [4] nontargetContrast + Validity + nontargetContrast:Validity + SID : 0.1823773 ±1.9%
    ## 
    ## Against denominator:
    ##   dis_crit_sub ~ SID 
    ## ---
    ## Bayes factor type: BFlinearModel, JZS

## calculate BF for disCrit T2 Validity:nontargetContrast

``` r
bf <- as.vector(bf_dis_critT2[4])[[1]]/as.vector(bf_dis_critT2[2])[[1]] 
print(bf)
```

    ## [1] 0.5429225
