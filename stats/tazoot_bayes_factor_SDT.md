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
    ## [1] nontargetContrast + Target + nontargetContrast:Target + SID                                                                                                   : 10350668   ±2.94%
    ## [2] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + SID                                                           : 6517555    ±4.53%
    ## [3] nontargetContrast + Target + nontargetContrast:Target + Validity + SID                                                                                        : 1939916    ±18.88%
    ## [4] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                         : 1014464    ±2.64%
    ## [5] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + nontargetContrast:Target:Validity +     SID : 757733.9   ±25.4%
    ## [6] nontargetContrast + Target + nontargetContrast:Target + Validity + Target:Validity + SID                                                                      : 256309.3   ±4.49%
    ## [7] nontargetContrast + Target + SID                                                                                                                              : 228.9203   ±3.68%
    ## [8] nontargetContrast + SID                                                                                                                                       : 116.4391   ±1.03%
    ## [9] nontargetContrast + Target + Validity + nontargetContrast:Validity + SID                                                                                      : 74.39877   ±2.29%
    ## [10] nontargetContrast + Validity + nontargetContrast:Validity + SID                                                                                              : 34.26062   ±1.29%
    ## [11] nontargetContrast + Target + Validity + SID                                                                                                                  : 29.64623   ±2.6%
    ## [12] nontargetContrast + Validity + SID                                                                                                                           : 15.65784   ±1.6%
    ## [13] nontargetContrast + Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                                                   : 11.1001    ±2.92%
    ## [14] nontargetContrast + Target + Validity + Target:Validity + SID                                                                                                : 4.404858   ±3.61%
    ## [15] Target + SID                                                                                                                                                 : 1.568554   ±0.77%
    ## [16] Target + Validity + SID                                                                                                                                      : 0.2107845  ±2.46%
    ## [17] Validity + SID                                                                                                                                               : 0.1259216  ±0.68%
    ## [18] Target + Validity + Target:Validity + SID                                                                                                                    : 0.02861115 ±1.7%
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

    ## [1] 3.35971

``` r
bf_fullmodel <- as.vector(bf_det_dPrime[4])[[1]]/as.vector(bf_det_dPrime[6])[[1]] #the numerator contains all main effect and interaction effects
print(bf_fullmodel)
```

    ## [1] 3.957969

## det dprime T1

``` r
d <- data %>% filter(Target==1)
bf_det_dPrimeT1 <- anovaBF(det_dPrime_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_det_dPrimeT1=sort(bf_det_dPrimeT1, decreasing = TRUE)
print(bf_det_dPrimeT1)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Validity + nontargetContrast:Validity + SID : 0.8333284  ±1.25%
    ## [2] Validity + SID                                                  : 0.3304613  ±0.68%
    ## [3] nontargetContrast + SID                                         : 0.2819467  ±1.84%
    ## [4] nontargetContrast + Validity + SID                              : 0.09524478 ±1.65%
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

    ## [1] 8.749334

## det dprime T2

``` r
d <- data %>% filter(Target==2)
bf_det_dPrimeT2 <- anovaBF(det_dPrime_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_det_dPrimeT2=sort(bf_det_dPrimeT2, decreasing = TRUE)
print(bf_det_dPrimeT2)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + SID                                         : 5456500   ±0.85%
    ## [2] nontargetContrast + Validity + SID                              : 695768.3  ±2.39%
    ## [3] nontargetContrast + Validity + nontargetContrast:Validity + SID : 288883.9  ±3.94%
    ## [4] Validity + SID                                                  : 0.1106735 ±0.78%
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

    ## [1] 0.4152013

# crit

``` r
d <- data
bf_det_crit <- anovaBF(det_crit_sub ~ Validity * nontargetContrast * Target + SID, data = data, whichRandom = "SID", progress = FALSE)
bf_det_crit=sort(bf_det_crit, decreasing = TRUE)
print(bf_det_crit)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Target + Validity + SID                                                                                                                    : 1.937337e+41 ±6.56%
    ## [2] nontargetContrast + Target + nontargetContrast:Target + Validity + SID                                                                                         : 1.871243e+41 ±7.2%
    ## [3] nontargetContrast + Target + SID                                                                                                                               : 1.05451e+41  ±3.66%
    ## [4] nontargetContrast + Target + nontargetContrast:Target + SID                                                                                                    : 8.863556e+40 ±1.94%
    ## [5] nontargetContrast + Target + Validity + Target:Validity + SID                                                                                                  : 5.929606e+40 ±2.88%
    ## [6] nontargetContrast + Target + nontargetContrast:Target + Validity + Target:Validity + SID                                                                       : 5.781413e+40 ±5.49%
    ## [7] nontargetContrast + Target + Validity + nontargetContrast:Validity + SID                                                                                       : 5.375692e+40 ±4.24%
    ## [8] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + SID                                                            : 4.931597e+40 ±3.24%
    ## [9] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                          : 1.548927e+40 ±5.49%
    ## [10] nontargetContrast + Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                                                    : 1.450158e+40 ±3.26%
    ## [11] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + nontargetContrast:Target:Validity +     SID : 2.47715e+39  ±3.51%
    ## [12] nontargetContrast + Validity + SID                                                                                                                            : 1.400579e+37 ±1.79%
    ## [13] nontargetContrast + SID                                                                                                                                       : 1.013007e+37 ±0.94%
    ## [14] nontargetContrast + Validity + nontargetContrast:Validity + SID                                                                                               : 3.263858e+36 ±4.68%
    ## [15] Target + SID                                                                                                                                                  : 16.1755      ±6.2%
    ## [16] Target + Validity + SID                                                                                                                                       : 3.173664     ±1.33%
    ## [17] Target + Validity + Target:Validity + SID                                                                                                                     : 0.4510226    ±1.87%
    ## [18] Validity + SID                                                                                                                                                : 0.2033361    ±1.63%
    ## 
    ## Against denominator:
    ##   det_crit_sub ~ SID 
    ## ---
    ## Bayes factor type: BFlinearModel, JZS

## calculate BF for detCrit Validity:nontargetContrast

``` r
bf_highestmodel <- as.vector(bf_det_crit[7])[[1]]/as.vector(bf_det_crit[2])[[1]] #the highest ranked model
print(bf_highestmodel)
```

    ## [1] 0.2872792

``` r
bf_fullmodel <- as.vector(bf_det_crit[9])[[1]]/as.vector(bf_det_crit[6])[[1]] #the numerator contains all main effect and interaction effects
print(bf_fullmodel)
```

    ## [1] 0.2679149

## det crit T1

``` r
d <- data %>% filter(Target==1)
bf_det_critT1 <- anovaBF(det_crit_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_det_critT1=sort(bf_det_critT1, decreasing = TRUE)
print(bf_det_critT1)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Validity + SID                              : 1.18865e+21  ±18.33%
    ## [2] nontargetContrast + Validity + nontargetContrast:Validity + SID : 2.250558e+20 ±1.58%
    ## [3] nontargetContrast + SID                                         : 2.16994e+20  ±0.8%
    ## [4] Validity + SID                                                  : 0.3644146    ±0.76%
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

    ## [1] 0.1893372

## det crit T2

``` r
d <- data %>% filter(Target==2)
bf_det_critT2 <- anovaBF(det_crit_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_det_critT2=sort(bf_det_critT2, decreasing = TRUE)
print(bf_det_critT2)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + SID                                         : 2.936995e+19 ±0.93%
    ## [2] nontargetContrast + Validity + SID                              : 4.075067e+18 ±1.37%
    ## [3] nontargetContrast + Validity + nontargetContrast:Validity + SID : 1.24506e+18  ±2.75%
    ## [4] Validity + SID                                                  : 0.1030487    ±0.79%
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

    ## [1] 0.305531

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
    ## [1] nontargetContrast + Target + Validity + SID                                                                                                                   : 9.465251e+16 ±2.67%
    ## [2] nontargetContrast + Target + nontargetContrast:Target + Validity + SID                                                                                        : 8.300851e+16 ±3.48%
    ## [3] nontargetContrast + Target + Validity + nontargetContrast:Validity + SID                                                                                      : 6.488734e+16 ±3.69%
    ## [4] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + SID                                                           : 5.828981e+16 ±3.89%
    ## [5] nontargetContrast + Target + Validity + Target:Validity + SID                                                                                                 : 2.761096e+16 ±2.55%
    ## [6] nontargetContrast + Target + nontargetContrast:Target + Validity + Target:Validity + SID                                                                      : 2.235161e+16 ±2.12%
    ## [7] nontargetContrast + Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                                                    : 1.920943e+16 ±2.44%
    ## [8] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                         : 1.701853e+16 ±2.91%
    ## [9] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + nontargetContrast:Target:Validity +     SID : 2.738736e+15 ±4.76%
    ## [10] nontargetContrast + Target + SID                                                                                                                             : 1.413696e+12 ±1.55%
    ## [11] nontargetContrast + Target + nontargetContrast:Target + SID                                                                                                  : 945646101683 ±1.92%
    ## [12] nontargetContrast + Validity + SID                                                                                                                           : 2306558657   ±1.06%
    ## [13] Target + Validity + SID                                                                                                                                      : 1564770575   ±1.27%
    ## [14] nontargetContrast + Validity + nontargetContrast:Validity + SID                                                                                              : 1111107378   ±2.16%
    ## [15] Target + Validity + Target:Validity + SID                                                                                                                    : 366693904    ±2.03%
    ## [16] nontargetContrast + SID                                                                                                                                      : 393025.5     ±1.08%
    ## [17] Target + SID                                                                                                                                                 : 281356.8     ±1.48%
    ## [18] Validity + SID                                                                                                                                               : 1034.719     ±0.62%
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

    ## [1] 0.7816951

``` r
bf_fullmodel <- as.vector(bf_dis_dPrime[8])[[1]]/as.vector(bf_dis_dPrime[6])[[1]] #the numerator contains all main effect and interaction effects
print(bf_fullmodel)
```

    ## [1] 0.7614006

## dis dprime T1

``` r
d <- data %>% filter(Target==1)
bf_dis_dPrimeT1 <- anovaBF(dis_dPrime_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_dis_dPrimeT1=sort(bf_dis_dPrimeT1, decreasing = TRUE)
print(bf_dis_dPrimeT1)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Validity + SID                              : 82344911 ±1.32%
    ## [2] nontargetContrast + Validity + nontargetContrast:Validity + SID : 33871014 ±1.43%
    ## [3] nontargetContrast + SID                                         : 23460.29 ±0.76%
    ## [4] Validity + SID                                                  : 261.6895 ±0.56%
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

    ## [1] 0.411331

## dis dprime T2

``` r
d <- data %>% filter(Target==2)
bf_dis_dPrimeT2 <- anovaBF(dis_dPrime_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_dis_dPrimeT2=sort(bf_dis_dPrimeT2, decreasing = TRUE)
print(bf_dis_dPrimeT2)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Validity + SID                              : 139.6399 ±2.18%
    ## [2] nontargetContrast + Validity + nontargetContrast:Validity + SID : 47.0648  ±1.08%
    ## [3] nontargetContrast + SID                                         : 44.97024 ±1.4%
    ## [4] Validity + SID                                                  : 1.998431 ±1.4%
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

    ## [1] 0.3370442

# crit

``` r
d <- data
bf_dis_crit <- anovaBF(dis_crit_sub ~ Validity * nontargetContrast * Target + SID, data = data, whichRandom = "SID", progress = FALSE)
bf_dis_crit=sort(bf_dis_crit, decreasing = TRUE)
print(bf_dis_crit)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] Target + SID                                                                                                                                                   : 0.4382065    ±1.29%
    ## [2] nontargetContrast + SID                                                                                                                                        : 0.1492889    ±2.27%
    ## [3] Validity + SID                                                                                                                                                 : 0.07175288   ±0.89%
    ## [4] nontargetContrast + Target + SID                                                                                                                               : 0.06709497   ±3.81%
    ## [5] Target + Validity + Target:Validity + SID                                                                                                                      : 0.03652103   ±2.37%
    ## [6] Target + Validity + SID                                                                                                                                        : 0.03121563   ±1.44%
    ## [7] nontargetContrast + Target + nontargetContrast:Target + SID                                                                                                    : 0.02675583   ±2.47%
    ## [8] nontargetContrast + Validity + SID                                                                                                                             : 0.0101184    ±0.97%
    ## [9] nontargetContrast + Target + Validity + Target:Validity + SID                                                                                                  : 0.005260566  ±2.09%
    ## [10] nontargetContrast + Target + Validity + SID                                                                                                                   : 0.004508545  ±2.15%
    ## [11] nontargetContrast + Target + nontargetContrast:Target + Validity + Target:Validity + SID                                                                      : 0.002257974  ±2.68%
    ## [12] nontargetContrast + Target + nontargetContrast:Target + Validity + SID                                                                                        : 0.002038054  ±4.34%
    ## [13] nontargetContrast + Validity + nontargetContrast:Validity + SID                                                                                               : 0.001154344  ±2.3%
    ## [14] nontargetContrast + Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                                                    : 0.0006386712 ±7.73%
    ## [15] nontargetContrast + Target + Validity + nontargetContrast:Validity + SID                                                                                      : 0.0005216176 ±4.45%
    ## [16] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                         : 0.0002757065 ±8.16%
    ## [17] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + SID                                                           : 0.0002160261 ±4.49%
    ## [18] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + nontargetContrast:Target:Validity +     SID : 0.0001109934 ±3.39%
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

    ## [1] 0.1140836

``` r
bf_fullmodel <- as.vector(bf_dis_crit[16])[[1]]/as.vector(bf_dis_crit[11])[[1]] #the numerator contains all main effect and interaction effects
print(bf_fullmodel)
```

    ## [1] 0.1221035

## dis crit T1

``` r
d <- data %>% filter(Target==1)
bf_dis_critT1 <- anovaBF(dis_crit_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_dis_critT1=sort(bf_dis_critT1, decreasing = TRUE)
print(bf_dis_critT1)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + SID                                         : 0.3120418   ±0.96%
    ## [2] Validity + SID                                                  : 0.1654845   ±0.83%
    ## [3] nontargetContrast + Validity + SID                              : 0.05277189  ±1.85%
    ## [4] nontargetContrast + Validity + nontargetContrast:Validity + SID : 0.009651517 ±2.84%
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

    ## [1] 0.1828913

## dis crit T2

``` r
d <- data %>% filter(Target==2)
bf_dis_critT2 <- anovaBF(dis_crit_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_dis_critT2=sort(bf_dis_critT2, decreasing = TRUE)
print(bf_dis_critT2)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] Validity + SID                                                  : 1.144778  ±0.74%
    ## [2] nontargetContrast + Validity + SID                              : 0.3275484 ±1.16%
    ## [3] nontargetContrast + SID                                         : 0.28203   ±1.29%
    ## [4] nontargetContrast + Validity + nontargetContrast:Validity + SID : 0.1788476 ±1.86%
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

    ## [1] 0.6341437
