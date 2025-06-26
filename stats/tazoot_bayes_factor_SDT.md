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
    ## [1] nontargetContrast + Target + nontargetContrast:Target + SID                                                                                                   : 6040281    ±1.63%
    ## [2] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + SID                                                           : 1277355    ±2.02%
    ## [3] nontargetContrast + Target + nontargetContrast:Target + Validity + SID                                                                                        : 667362.8   ±2.36%
    ## [4] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                         : 291286.5   ±3.47%
    ## [5] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + nontargetContrast:Target:Validity +     SID : 148183.4   ±4.6%
    ## [6] nontargetContrast + Target + nontargetContrast:Target + Validity + Target:Validity + SID                                                                      : 135045.5   ±3.56%
    ## [7] nontargetContrast + Target + SID                                                                                                                              : 2703.802   ±1.4%
    ## [8] nontargetContrast + SID                                                                                                                                       : 1041.956   ±1.43%
    ## [9] nontargetContrast + Target + Validity + nontargetContrast:Validity + SID                                                                                      : 383.9492   ±2.41%
    ## [10] nontargetContrast + Target + Validity + SID                                                                                                                  : 300.8442   ±11.32%
    ## [11] nontargetContrast + Validity + nontargetContrast:Validity + SID                                                                                              : 138.0093   ±7%
    ## [12] nontargetContrast + Validity + SID                                                                                                                           : 98.86846   ±3.39%
    ## [13] nontargetContrast + Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                                                   : 74.69565   ±2.46%
    ## [14] nontargetContrast + Target + Validity + Target:Validity + SID                                                                                                : 51.61497   ±2.91%
    ## [15] Target + SID                                                                                                                                                 : 2.041402   ±1.34%
    ## [16] Target + Validity + SID                                                                                                                                      : 0.2010291  ±10.07%
    ## [17] Validity + SID                                                                                                                                               : 0.09161357 ±1.81%
    ## [18] Target + Validity + Target:Validity + SID                                                                                                                    : 0.03334149 ±3.59%
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

    ## [1] 1.914034

``` r
bf_fullmodel <- as.vector(bf_det_dPrime[4])[[1]]/as.vector(bf_det_dPrime[6])[[1]] #the numerator contains all main effect and interaction effects
print(bf_fullmodel)
```

    ## [1] 2.15695

## det dprime T1

``` r
d <- data %>% filter(Target==1)
bf_det_dPrimeT1 <- anovaBF(det_dPrime_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_det_dPrimeT1=sort(bf_det_dPrimeT1, decreasing = TRUE)
print(bf_det_dPrimeT1)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Validity + nontargetContrast:Validity + SID : 0.5566875  ±2.77%
    ## [2] Validity + SID                                                  : 0.2469937  ±1.08%
    ## [3] nontargetContrast + SID                                         : 0.210675   ±0.83%
    ## [4] nontargetContrast + Validity + SID                              : 0.05204625 ±2.23%
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

    ## [1] 10.69602

## det dprime T2

``` r
d <- data %>% filter(Target==2)
bf_det_dPrimeT2 <- anovaBF(det_dPrime_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_det_dPrimeT2=sort(bf_det_dPrimeT2, decreasing = TRUE)
print(bf_det_dPrimeT2)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + SID                                         : 1820426   ±0.83%
    ## [2] nontargetContrast + Validity + SID                              : 285641.6  ±1.18%
    ## [3] nontargetContrast + Validity + nontargetContrast:Validity + SID : 64212.48  ±1.22%
    ## [4] Validity + SID                                                  : 0.1313783 ±0.6%
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

    ## [1] 0.2248009

# crit

``` r
d <- data
bf_det_crit <- anovaBF(det_crit_sub ~ Validity * nontargetContrast * Target + SID, data = data, whichRandom = "SID", progress = FALSE)
bf_det_crit=sort(bf_det_crit, decreasing = TRUE)
print(bf_det_crit)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Target + Validity + SID                                                                                                                    : 2.471126e+34 ±2.01%
    ## [2] nontargetContrast + Target + nontargetContrast:Target + Validity + SID                                                                                         : 2.379831e+34 ±4.12%
    ## [3] nontargetContrast + Target + SID                                                                                                                               : 1.697179e+34 ±1.49%
    ## [4] nontargetContrast + Target + nontargetContrast:Target + SID                                                                                                    : 1.544739e+34 ±7.04%
    ## [5] nontargetContrast + Target + Validity + Target:Validity + SID                                                                                                  : 1.192731e+34 ±17.22%
    ## [6] nontargetContrast + Target + nontargetContrast:Target + Validity + Target:Validity + SID                                                                       : 9.503514e+33 ±3.15%
    ## [7] nontargetContrast + Target + Validity + nontargetContrast:Validity + SID                                                                                       : 5.03268e+33  ±12.72%
    ## [8] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + SID                                                            : 4.100042e+33 ±2.68%
    ## [9] nontargetContrast + Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                                                     : 1.830122e+33 ±2.66%
    ## [10] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                         : 1.707862e+33 ±2.8%
    ## [11] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + nontargetContrast:Target:Validity +     SID : 4.023091e+32 ±9.25%
    ## [12] nontargetContrast + Validity + SID                                                                                                                            : 5.74813e+31  ±1.24%
    ## [13] nontargetContrast + SID                                                                                                                                       : 5.504882e+31 ±1.41%
    ## [14] nontargetContrast + Validity + nontargetContrast:Validity + SID                                                                                               : 1.008641e+31 ±2.56%
    ## [15] Target + SID                                                                                                                                                  : 4.325792     ±2.83%
    ## [16] Target + Validity + SID                                                                                                                                       : 0.8755455    ±1.65%
    ## [17] Validity + SID                                                                                                                                                : 0.1974235    ±0.71%
    ## [18] Target + Validity + Target:Validity + SID                                                                                                                     : 0.1456552    ±2.27%
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

    ## [1] 0.2114721

``` r
bf_fullmodel <- as.vector(bf_det_crit[9])[[1]]/as.vector(bf_det_crit[6])[[1]] #the numerator contains all main effect and interaction effects
print(bf_fullmodel)
```

    ## [1] 0.1925732

## det crit T1

``` r
d <- data %>% filter(Target==1)
bf_det_critT1 <- anovaBF(det_crit_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_det_critT1=sort(bf_det_critT1, decreasing = TRUE)
print(bf_det_critT1)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Validity + SID                              : 1.074555e+18 ±1.03%
    ## [2] nontargetContrast + Validity + nontargetContrast:Validity + SID : 2.150236e+17 ±2.06%
    ## [3] nontargetContrast + SID                                         : 2.08803e+17  ±0.88%
    ## [4] Validity + SID                                                  : 0.4333528    ±1.86%
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

    ## [1] 0.2001049

## det crit T2

``` r
d <- data %>% filter(Target==2)
bf_det_critT2 <- anovaBF(det_crit_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_det_critT2=sort(bf_det_critT2, decreasing = TRUE)
print(bf_det_critT2)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + SID                                         : 1.422447e+16 ±0.89%
    ## [2] nontargetContrast + Validity + SID                              : 1.58147e+15  ±1.15%
    ## [3] nontargetContrast + Validity + nontargetContrast:Validity + SID : 6.160586e+14 ±1.83%
    ## [4] Validity + SID                                                  : 0.1027511    ±1.12%
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

    ## [1] 0.389548

\#dis \## dprime

``` r
d <- data
bf_dis_dPrime <- anovaBF(dis_dPrime_sub ~ Validity * nontargetContrast * Target + SID, data = data, whichRandom = "SID", progress = FALSE)
bf_dis_dPrime=sort(bf_dis_dPrime, decreasing = TRUE)
print(bf_dis_dPrime)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Target + Validity + SID                                                                                                                   : 2.038334e+15 ±2.18%
    ## [2] nontargetContrast + Target + nontargetContrast:Target + Validity + SID                                                                                        : 1.728034e+15 ±2.26%
    ## [3] nontargetContrast + Target + Validity + nontargetContrast:Validity + SID                                                                                      : 9.548201e+14 ±3.55%
    ## [4] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + SID                                                           : 8.446724e+14 ±3.11%
    ## [5] nontargetContrast + Target + Validity + Target:Validity + SID                                                                                                 : 3.012238e+14 ±1.69%
    ## [6] nontargetContrast + Target + nontargetContrast:Target + Validity + Target:Validity + SID                                                                      : 2.740944e+14 ±3.16%
    ## [7] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                         : 1.405598e+14 ±4.49%
    ## [8] nontargetContrast + Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                                                    : 1.389916e+14 ±2.44%
    ## [9] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + nontargetContrast:Target:Validity +     SID : 3.334937e+13 ±11.57%
    ## [10] nontargetContrast + Target + SID                                                                                                                             : 579400504107 ±2.21%
    ## [11] nontargetContrast + Target + nontargetContrast:Target + SID                                                                                                  : 480561798041 ±8.77%
    ## [12] nontargetContrast + Validity + SID                                                                                                                           : 95386122     ±1.75%
    ## [13] Target + Validity + SID                                                                                                                                      : 84711329     ±1.59%
    ## [14] nontargetContrast + Validity + nontargetContrast:Validity + SID                                                                                              : 33893530     ±5.37%
    ## [15] Target + Validity + Target:Validity + SID                                                                                                                    : 11985158     ±1.96%
    ## [16] nontargetContrast + SID                                                                                                                                      : 210040.9     ±1.29%
    ## [17] Target + SID                                                                                                                                                 : 190663.3     ±1.07%
    ## [18] Validity + SID                                                                                                                                               : 111.268      ±0.94%
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

    ## [1] 0.552547

``` r
bf_fullmodel <- as.vector(bf_dis_dPrime[8])[[1]]/as.vector(bf_dis_dPrime[6])[[1]] #the numerator contains all main effect and interaction effects
print(bf_fullmodel)
```

    ## [1] 0.5070937

## dis dprime T1

``` r
d <- data %>% filter(Target==1)
bf_dis_dPrimeT1 <- anovaBF(dis_dPrime_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_dis_dPrimeT1=sort(bf_dis_dPrimeT1, decreasing = TRUE)
print(bf_dis_dPrimeT1)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Validity + SID                              : 3605801  ±1.16%
    ## [2] nontargetContrast + Validity + nontargetContrast:Validity + SID : 1042648  ±2.52%
    ## [3] nontargetContrast + SID                                         : 27462.99 ±0.75%
    ## [4] Validity + SID                                                  : 19.0453  ±0.52%
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

    ## [1] 0.2891586

## dis dprime T2

``` r
d <- data %>% filter(Target==2)
bf_dis_dPrimeT2 <- anovaBF(dis_dPrime_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_dis_dPrimeT2=sort(bf_dis_dPrimeT2, decreasing = TRUE)
print(bf_dis_dPrimeT2)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + Validity + SID                              : 97.64057 ±1.99%
    ## [2] nontargetContrast + Validity + nontargetContrast:Validity + SID : 47.99443 ±1.41%
    ## [3] nontargetContrast + SID                                         : 28.36794 ±0.81%
    ## [4] Validity + SID                                                  : 2.115194 ±0.6%
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

    ## [1] 0.4915419

# crit

``` r
d <- data
bf_dis_crit <- anovaBF(dis_crit_sub ~ Validity * nontargetContrast * Target + SID, data = data, whichRandom = "SID", progress = FALSE)
bf_dis_crit=sort(bf_dis_crit, decreasing = TRUE)
print(bf_dis_crit)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] Target + SID                                                                                                                                                   : 0.9280851    ±1.96%
    ## [2] nontargetContrast + SID                                                                                                                                        : 0.1599208    ±1.78%
    ## [3] nontargetContrast + Target + SID                                                                                                                               : 0.1365223    ±2%
    ## [4] Target + Validity + Target:Validity + SID                                                                                                                      : 0.07033336   ±1.76%
    ## [5] Validity + SID                                                                                                                                                 : 0.06962215   ±1.65%
    ## [6] Target + Validity + SID                                                                                                                                        : 0.0619467    ±1.22%
    ## [7] nontargetContrast + Target + nontargetContrast:Target + SID                                                                                                    : 0.05758845   ±2.76%
    ## [8] nontargetContrast + Target + Validity + Target:Validity + SID                                                                                                  : 0.01154262   ±3.37%
    ## [9] nontargetContrast + Validity + SID                                                                                                                             : 0.01086434   ±1.97%
    ## [10] nontargetContrast + Target + Validity + SID                                                                                                                   : 0.00967304   ±3.06%
    ## [11] nontargetContrast + Target + nontargetContrast:Target + Validity + Target:Validity + SID                                                                      : 0.004711751  ±5.47%
    ## [12] nontargetContrast + Target + nontargetContrast:Target + Validity + SID                                                                                        : 0.004101983  ±3.92%
    ## [13] nontargetContrast + Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                                                    : 0.001542403  ±2.77%
    ## [14] nontargetContrast + Validity + nontargetContrast:Validity + SID                                                                                               : 0.001489431  ±1.53%
    ## [15] nontargetContrast + Target + Validity + nontargetContrast:Validity + SID                                                                                      : 0.001389774  ±3.89%
    ## [16] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + SID                                         : 0.0006607986 ±5.28%
    ## [17] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + SID                                                           : 0.0005534516 ±4.36%
    ## [18] nontargetContrast + Target + nontargetContrast:Target + Validity + nontargetContrast:Validity + Target:Validity + nontargetContrast:Target:Validity +     SID : 0.000513996  ±34.05%
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

    ## [1] 0.1336268

``` r
bf_fullmodel <- as.vector(bf_dis_crit[16])[[1]]/as.vector(bf_dis_crit[11])[[1]] #the numerator contains all main effect and interaction effects
print(bf_fullmodel)
```

    ## [1] 0.1402448

## dis crit T1

``` r
d <- data %>% filter(Target==1)
bf_dis_critT1 <- anovaBF(dis_crit_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_dis_critT1=sort(bf_dis_critT1, decreasing = TRUE)
print(bf_dis_critT1)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] nontargetContrast + SID                                         : 0.3313399  ±1.28%
    ## [2] Validity + SID                                                  : 0.2131202  ±0.98%
    ## [3] nontargetContrast + Validity + SID                              : 0.07223609 ±2.08%
    ## [4] nontargetContrast + Validity + nontargetContrast:Validity + SID : 0.0130933  ±1.95%
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

    ## [1] 0.181257

## dis crit T2

``` r
d <- data %>% filter(Target==2)
bf_dis_critT2 <- anovaBF(dis_crit_sub ~ Validity * nontargetContrast + SID, data = d, whichRandom = "SID", progress = FALSE)
bf_dis_critT2=sort(bf_dis_critT2, decreasing = TRUE)
print(bf_dis_critT2)
```

    ## Bayes factor analysis
    ## --------------
    ## [1] Validity + SID                                                  : 0.7012549 ±0.5%
    ## [2] nontargetContrast + SID                                         : 0.274509  ±1.7%
    ## [3] nontargetContrast + Validity + SID                              : 0.2036359 ±2.4%
    ## [4] nontargetContrast + Validity + nontargetContrast:Validity + SID : 0.1422612 ±2.02%
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

    ## [1] 0.698606
