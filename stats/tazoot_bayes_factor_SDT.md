tazoot_bayes_factor_SDT
================
Jenny Motzer
2025-06-26

\#det \## dprime

``` r
d <- data
bf_det_dPrime <- anovaBF(det_dPrime_sub ~ Validity * nontargetContrast * Target + SID, data = data, whichRandom = "SID", progress = FALSE)
bf_det_dPrime=sort(bf_det_dPrime, decreasing = TRUE)
print(bf_det_dPrime)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Target + nontargetContrast:Target + SID                                                                                                   : 10350194   ±2.34%
    ## [2] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + SID                                                           : 6239377    ±2.36%
    ## [3] nontargetContrast + Target + nontargetContrast:Target + Validity + SID                                                                                        : 1721781    ±7.31%
    ## [4] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                         : 1170448    ±10.88%
    ## [5] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + nontargetContrast:Target:Validity +     SID : 526339.7   ±3.65%
    ## [6] nontargetContrast + Target + nontargetContrast:Target + Validity + Target:Validity + SID                                                                      : 257677.1   ±3.86%
    ## [7] nontargetContrast + Target + SID                                                                                                                              : 224.106    ±2.16%
    ## [8] nontargetContrast + SID                                                                                                                                       : 115.5421   ±1.1%
    ## [9] nontargetContrast + Target + Validity + nontargetContrast:Validity + SID                                                                                      : 71.3317    ±2.53%
    ## [10] nontargetContrast + Validity + nontargetContrast:Validity + SID                                                                                              : 34.05154   ±1.69%
    ## [11] nontargetContrast + Target + Validity + SID                                                                                                                  : 29.68881   ±1.96%
    ## [12] nontargetContrast + Validity + SID                                                                                                                           : 15.57377   ±1.68%
    ## [13] nontargetContrast + Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                                                   : 10.72052   ±2.46%
    ## [14] nontargetContrast + Target + Validity + Target:Validity + SID                                                                                                : 4.251238   ±4.29%
    ## [15] Target + SID                                                                                                                                                 : 1.620801   ±1.38%
    ## [16] Target + Validity + SID                                                                                                                                      : 0.2020925  ±1.26%
    ## [17] Validity + SID                                                                                                                                               : 0.1270714  ±1.59%
    ## [18] Target + Validity + Target:Validity + SID                                                                                                                    : 0.02757502 ±1.59%
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

    ## [1] 3.623792

``` r
bf_fullmodel <- as.vector(bf_det_dPrime[4])[[1]]/as.vector(bf_det_dPrime[6])[[1]] #the numerator contains all main effect and interaction effects
print(bf_fullmodel)
```

    ## [1] 4.542305

## det dprime T1

``` r
d <- data %>% filter(Target==1)
bf_det_dPrimeT1 <- anovaBF(det_dPrime_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_det_dPrimeT1=sort(bf_det_dPrimeT1, decreasing = TRUE)
print(bf_det_dPrimeT1)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Validity + nontargetContrast:Validity + SID : 0.8959608  ±3.78%
    ## [2] Validity + SID                                                  : 0.3304188  ±0.69%
    ## [3] nontargetContrast + SID                                         : 0.284193   ±1.44%
    ## [4] nontargetContrast + Validity + SID                              : 0.09788356 ±2.77%
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

    ## [1] 9.153332

## det dprime T2

``` r
d <- data %>% filter(Target==2)
bf_det_dPrimeT2 <- anovaBF(det_dPrime_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_det_dPrimeT2=sort(bf_det_dPrimeT2, decreasing = TRUE)
print(bf_det_dPrimeT2)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + SID                                         : 5495030   ±1.29%
    ## [2] nontargetContrast + Validity + SID                              : 692693.8  ±1.53%
    ## [3] nontargetContrast + Validity + nontargetContrast:Validity + SID : 259451.5  ±2.31%
    ## [4] Validity + SID                                                  : 0.1129196 ±1.63%
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

    ## [1] 0.3745544

# crit

``` r
d <- data
bf_det_crit <- anovaBF(det_crit_sub ~ Validity * nontargetContrast * Target + SID, data = data, whichRandom = "SID", progress = FALSE)
bf_det_crit=sort(bf_det_crit, decreasing = TRUE)
print(bf_det_crit)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Target + nontargetContrast:Target + Validity + SID                                                                                         : 2.630998e+41 ±22.95%
    ## [2] nontargetContrast + Target + Validity + SID                                                                                                                    : 2.009102e+41 ±1.85%
    ## [3] nontargetContrast + Target + SID                                                                                                                               : 9.976172e+40 ±1.53%
    ## [4] nontargetContrast + Target + nontargetContrast:Target + SID                                                                                                    : 9.132355e+40 ±3.04%
    ## [5] nontargetContrast + Target + Validity + Target:Validity + SID                                                                                                  : 6.041045e+40 ±3.65%
    ## [6] nontargetContrast + Target + nontargetContrast:Target + Validity + Target:Validity + SID                                                                       : 5.833925e+40 ±3.36%
    ## [7] nontargetContrast + Target + Validity + nontargetContrast:Validity + SID                                                                                       : 5.068383e+40 ±1.89%
    ## [8] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + SID                                                            : 5.006298e+40 ±5.73%
    ## [9] nontargetContrast + Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                                                     : 2.006329e+40 ±26.12%
    ## [10] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                         : 1.381356e+40 ±2.49%
    ## [11] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + nontargetContrast:Target:Validity +     SID : 2.629842e+39 ±4.05%
    ## [12] nontargetContrast + Validity + SID                                                                                                                            : 1.376949e+37 ±1.27%
    ## [13] nontargetContrast + SID                                                                                                                                       : 1.034601e+37 ±1.16%
    ## [14] nontargetContrast + Validity + nontargetContrast:Validity + SID                                                                                               : 3.061069e+36 ±2.1%
    ## [15] Target + SID                                                                                                                                                  : 14.97306     ±1.02%
    ## [16] Target + Validity + SID                                                                                                                                       : 3.21555      ±1.45%
    ## [17] Target + Validity + Target:Validity + SID                                                                                                                     : 0.4990592    ±14.9%
    ## [18] Validity + SID                                                                                                                                                : 0.2013673    ±0.76%
    ## 
    ## Against denominator:
    ##   det_crit_sub ~ SID 
    ## ---
    ## Bayes factor type: BFlinearModel, JZS

\#calculate BF for detCrit Validity:nontargetContrast

``` r
bf_highestmodel <- as.vector(bf_det_crit[7])[[1]]/as.vector(bf_det_crit[2])[[1]] #the highest ranked model
print(bf_highestmodel)
```

    ## [1] 0.252271

``` r
bf_fullmodel <- as.vector(bf_det_crit[9])[[1]]/as.vector(bf_det_crit[6])[[1]] #the numerator contains all main effect and interaction effects
print(bf_fullmodel)
```

    ## [1] 0.3439073

## det crit T1

``` r
d <- data %>% filter(Target==1)
bf_det_critT1 <- anovaBF(det_crit_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_det_critT1=sort(bf_det_critT1, decreasing = TRUE)
print(bf_det_critT1)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Validity + SID                              : 9.701252e+20 ±1.21%
    ## [2] nontargetContrast + Validity + nontargetContrast:Validity + SID : 2.368955e+20 ±3.55%
    ## [3] nontargetContrast + SID                                         : 2.21095e+20  ±1.01%
    ## [4] Validity + SID                                                  : 0.3670646    ±1.45%
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

    ## [1] 0.2441906

## det crit T2

``` r
d <- data %>% filter(Target==2)
bf_det_critT2 <- anovaBF(det_crit_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_det_critT2=sort(bf_det_critT2, decreasing = TRUE)
print(bf_det_critT2)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + SID                                         : 2.983228e+19 ±1.54%
    ## [2] nontargetContrast + Validity + SID                              : 4.104484e+18 ±1.99%
    ## [3] nontargetContrast + Validity + nontargetContrast:Validity + SID : 1.241441e+18 ±1.96%
    ## [4] Validity + SID                                                  : 0.1028856    ±0.99%
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

    ## [1] 0.3024598

\#dis \## dprime

``` r
d <- data
bf_dis_dPrime <- anovaBF(dis_dPrime_sub ~ Validity * nontargetContrast * Target + SID, data = data, whichRandom = "SID", progress = FALSE)
bf_dis_dPrime=sort(bf_dis_dPrime, decreasing = TRUE)
print(bf_dis_dPrime)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Target + nontargetContrast:Target + Validity + SID                                                                                        : 9.777239e+16 ±11.98%
    ## [2] nontargetContrast + Target + Validity + SID                                                                                                                   : 9.515284e+16 ±2.31%
    ## [3] nontargetContrast + Target + Validity + nontargetContrast:Validity + SID                                                                                      : 7.150874e+16 ±6.11%
    ## [4] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + SID                                                           : 5.459234e+16 ±3.11%
    ## [5] nontargetContrast + Target + Validity + Target:Validity + SID                                                                                                 : 2.977488e+16 ±6.9%
    ## [6] nontargetContrast + Target + nontargetContrast:Target + Validity + Target:Validity + SID                                                                      : 2.240692e+16 ±2.02%
    ## [7] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                         : 1.870453e+16 ±10.61%
    ## [8] nontargetContrast + Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                                                    : 1.780585e+16 ±1.69%
    ## [9] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + nontargetContrast:Target:Validity +     SID : 2.69883e+15  ±4.07%
    ## [10] nontargetContrast + Target + SID                                                                                                                             : 1.419617e+12 ±1.82%
    ## [11] nontargetContrast + Target + nontargetContrast:Target + SID                                                                                                  : 1.0086e+12   ±2.49%
    ## [12] nontargetContrast + Validity + SID                                                                                                                           : 2323247111   ±1.04%
    ## [13] Target + Validity + SID                                                                                                                                      : 1624585613   ±1.98%
    ## [14] nontargetContrast + Validity + nontargetContrast:Validity + SID                                                                                              : 1093573809   ±1.67%
    ## [15] Target + Validity + Target:Validity + SID                                                                                                                    : 428879957    ±17.04%
    ## [16] nontargetContrast + SID                                                                                                                                      : 438256.2     ±5.6%
    ## [17] Target + SID                                                                                                                                                 : 277302.6     ±0.73%
    ## [18] Validity + SID                                                                                                                                               : 1079.747     ±3.01%
    ## 
    ## Against denominator:
    ##   dis_dPrime_sub ~ SID 
    ## ---
    ## Bayes factor type: BFlinearModel, JZS

## calculate BF for disPrime Validity:nontargetContrast

``` r
bf_highestmodel <- as.vector(bf_dis_dPrime[3])[[1]]/as.vector(bf_dis_dPrime[2])[[1]] #the highest ranked model
print(bf_highestmodel)
```

    ## [1] 0.7515145

``` r
bf_fullmodel <- as.vector(bf_dis_dPrime[8])[[1]]/as.vector(bf_dis_dPrime[6])[[1]] #the numerator contains all main effect and interaction effects
print(bf_fullmodel)
```

    ## [1] 0.7946587

## dis dprime T1

``` r
d <- data %>% filter(Target==1)
bf_dis_dPrimeT1 <- anovaBF(dis_dPrime_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_dis_dPrimeT1=sort(bf_dis_dPrimeT1, decreasing = TRUE)
print(bf_dis_dPrimeT1)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Validity + SID                              : 90054107 ±7.16%
    ## [2] nontargetContrast + Validity + nontargetContrast:Validity + SID : 35034012 ±1.78%
    ## [3] nontargetContrast + SID                                         : 24069.62 ±1.2%
    ## [4] Validity + SID                                                  : 261.3987 ±0.63%
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

    ## [1] 0.3890329

## dis dprime T2

``` r
d <- data %>% filter(Target==2)
bf_dis_dPrimeT2 <- anovaBF(dis_dPrime_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_dis_dPrimeT2=sort(bf_dis_dPrimeT2, decreasing = TRUE)
print(bf_dis_dPrimeT2)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Validity + SID                              : 154.2087 ±11.46%
    ## [2] nontargetContrast + Validity + nontargetContrast:Validity + SID : 47.2699  ±1.11%
    ## [3] nontargetContrast + SID                                         : 44.40782 ±0.92%
    ## [4] Validity + SID                                                  : 1.979665 ±0.83%
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

    ## [1] 0.306532

# crit

``` r
d <- data
bf_dis_crit <- anovaBF(dis_crit_sub ~ Validity * nontargetContrast * Target + SID, data = data, whichRandom = "SID", progress = FALSE)
bf_dis_crit=sort(bf_dis_crit, decreasing = TRUE)
print(bf_dis_crit)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] Target + SID                                                                                                                                                   : 0.4321818    ±1.02%
    ## [2] nontargetContrast + SID                                                                                                                                        : 0.1638383    ±8.85%
    ## [3] Validity + SID                                                                                                                                                 : 0.07213112   ±0.93%
    ## [4] nontargetContrast + Target + SID                                                                                                                               : 0.06489722   ±2.42%
    ## [5] Target + Validity + Target:Validity + SID                                                                                                                      : 0.03490625   ±1.31%
    ## [6] Target + Validity + SID                                                                                                                                        : 0.03163519   ±1.59%
    ## [7] nontargetContrast + Target + nontargetContrast:Target + SID                                                                                                    : 0.02643174   ±1.7%
    ## [8] nontargetContrast + Validity + SID                                                                                                                             : 0.01045646   ±1.25%
    ## [9] nontargetContrast + Target + Validity + Target:Validity + SID                                                                                                  : 0.005942017  ±6.11%
    ## [10] nontargetContrast + Target + Validity + SID                                                                                                                   : 0.004683836  ±3.27%
    ## [11] nontargetContrast + Target + nontargetContrast:Target + Validity + Target:Validity + SID                                                                      : 0.002235424  ±3.91%
    ## [12] nontargetContrast + Target + nontargetContrast:Target + Validity + SID                                                                                        : 0.00189778   ±2.6%
    ## [13] nontargetContrast + Validity + nontargetContrast:Validity + SID                                                                                               : 0.001165095  ±2.47%
    ## [14] nontargetContrast + Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                                                    : 0.0006072785 ±3.97%
    ## [15] nontargetContrast + Target + Validity + nontargetContrast:Validity + SID                                                                                      : 0.0005399193 ±5.18%
    ## [16] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                         : 0.0002546291 ±3.45%
    ## [17] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + SID                                                           : 0.0002281407 ±8.29%
    ## [18] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + nontargetContrast:Target:Validity +     SID : 0.0001308133 ±6.63%
    ## 
    ## Against denominator:
    ##   dis_crit_sub ~ SID 
    ## ---
    ## Bayes factor type: BFlinearModel, JZS

\#calculate BF for disCrit Validity:nontargetContrast

``` r
bf_highestmodel <- as.vector(bf_dis_crit[13])[[1]]/as.vector(bf_dis_crit[8])[[1]] #the highest ranked model
print(bf_highestmodel)
```

    ## [1] 0.1114235

``` r
bf_fullmodel <- as.vector(bf_dis_crit[16])[[1]]/as.vector(bf_dis_crit[11])[[1]] #the numerator contains all main effect and interaction effects
print(bf_fullmodel)
```

    ## [1] 0.1139064

## dis crit T1

``` r
d <- data %>% filter(Target==1)
bf_dis_critT1 <- anovaBF(dis_crit_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_dis_critT1=sort(bf_dis_critT1, decreasing = TRUE)
print(bf_dis_critT1)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + SID                                         : 0.3649382   ±13.78%
    ## [2] Validity + SID                                                  : 0.1643916   ±2.25%
    ## [3] nontargetContrast + Validity + SID                              : 0.05251885  ±1.88%
    ## [4] nontargetContrast + Validity + nontargetContrast:Validity + SID : 0.009487223 ±1.75%
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

    ## [1] 0.1806442

## dis crit T2

``` r
d <- data %>% filter(Target==2)
bf_dis_critT2 <- anovaBF(dis_crit_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_dis_critT2=sort(bf_dis_critT2, decreasing = TRUE)
print(bf_dis_critT2)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] Validity + SID                                                  : 1.145403  ±0.69%
    ## [2] nontargetContrast + Validity + SID                              : 0.3306175 ±1.58%
    ## [3] nontargetContrast + SID                                         : 0.2821956 ±0.95%
    ## [4] nontargetContrast + Validity + nontargetContrast:Validity + SID : 0.1755389 ±1.36%
    ## 
    ## Against denominator:
    ##   dis_crit_sub ~ SID 
    ## ---
    ## Bayes factor type: BFlinearModel, JZS

## calculate BF for disCrit T2 Validity:nontargetContrast

``` r
bf <- as.vector(bf_dis_critT2[4])[[1]]/as.vector(bf_dis_critT2[3])[[1]] 
print(bf)
```

    ## [1] 0.6220469
