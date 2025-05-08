tazoot_swap_LLM
================
Jenny
2025-04-30

``` r
d <- data
swap.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity * Target * targetContrast * nontargetContrast + (1|SID), data = d)
summary(swap.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: 
    ## point95_SwapAcc ~ Validity * Target * targetContrast * nontargetContrast +  
    ##     (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1946.8
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.91306 -0.68149 -0.00738  0.57733  2.99174 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  88.01    9.381  
    ##  Residual             565.07   23.771  
    ## Number of obs: 223, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                                                 Estimate Std. Error t value
    ## (Intercept)                                      32.2911     7.1844   4.495
    ## Validity.L                                       -3.7031    13.2992  -0.278
    ## Validity.Q                                        0.8391     3.6282   0.231
    ## Target.L                                          2.8910     2.9610   0.976
    ## targetContrast.L                                  0.4246     9.5764   0.044
    ## nontargetContrast.L                             -36.3141     9.5147  -3.817
    ## Validity.L:Target.L                               4.1625     5.1198   0.813
    ## Validity.Q:Target.L                              -0.5703     5.1281  -0.111
    ## Validity.L:targetContrast.L                      -8.6324    18.8095  -0.459
    ## Validity.Q:targetContrast.L                      -0.3633     5.1581  -0.070
    ## Target.L:targetContrast.L                         5.5290     4.2385   1.304
    ## Validity.L:nontargetContrast.L                   -4.1494    18.7620  -0.221
    ## Validity.Q:nontargetContrast.L                   -0.3920     4.5366  -0.086
    ## Target.L:nontargetContrast.L                     -2.4490     3.7303  -0.657
    ## targetContrast.L:nontargetContrast.L            -40.6882    13.4258  -3.031
    ## Validity.L:Target.L:targetContrast.L              8.4185     7.3531   1.145
    ## Validity.Q:Target.L:targetContrast.L             -0.5150     7.2934  -0.071
    ## Validity.L:Target.L:nontargetContrast.L          -0.2480     6.5183  -0.038
    ## Validity.Q:Target.L:nontargetContrast.L           3.8709     6.4161   0.603
    ## Validity.L:targetContrast.L:nontargetContrast.L  -8.4354    26.5262  -0.318

    ## fit warnings:
    ## fixed-effect model matrix is rank deficient so dropping 4 columns / coefficients

``` r
aov.swap <- Anova(swap.lmm.lme4)
```

# validity

``` r
d <- data
swap_validity.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validity.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 2174.8
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.76543 -0.86148  0.01068  0.87809  2.16163 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  104.5   10.22   
    ##  Residual             1017.7   31.90   
    ## Number of obs: 223, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   43.240      3.406  12.696
    ## Validity.L    -1.465      3.723  -0.393
    ## Validity.Q     2.530      3.706   0.683
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L -0.001       
    ## Validity.Q  0.003 -0.003

``` r
aov.swap_validity <- Anova(swap_validity.lmm.lme4)
```

## TP

``` r
d <- data %>% filter(targetContrast==1)
swap_validityTP.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTP.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1516.9
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.7129 -0.7877 -0.1916  0.7045  3.0174 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 160.8    12.68   
    ##  Residual             556.2    23.58   
    ## Number of obs: 165, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)  31.7972     3.7571   8.463
    ## Validity.L    2.5926     3.2062   0.809
    ## Validity.Q    0.7321     3.1831   0.230
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L -0.020       
    ## Validity.Q  0.008 -0.030

``` r
aov.swap_validityTP <- Anova(swap_validityTP.lmm.lme4)
```

## TA

``` r
d <- data %>% filter(targetContrast==0)
swap_validityTA.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTA.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 524.6
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.82367 -0.08186  0.12113  0.52860  0.93899 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  76.52    8.748  
    ##  Residual             617.13   24.842  
    ## Number of obs: 58, groups:  SID, 14
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   77.973      4.115  18.947
    ## Validity.L    -4.008      5.775  -0.694
    ## Validity.Q     4.508      5.755   0.783
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.096       
    ## Validity.Q -0.006  0.072

``` r
aov.swap_validityTA <- Anova(swap_validityTA.lmm.lme4)
```

## TPNP

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==1)
swap_validityTPNP.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTPNP.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 721.1
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.49584 -0.71509 -0.03864  0.73547  2.48610 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 138.6    11.77   
    ##  Residual             441.2    21.00   
    ## Number of obs: 81, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   36.901      3.838   9.615
    ## Validity.L     1.928      4.118   0.468
    ## Validity.Q     1.464      4.031   0.363
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L -0.030       
    ## Validity.Q  0.018 -0.037

``` r
aov.swap_validityTPNP <- Anova(swap_validityTPNP.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==1, Target==1)
swap_validityTPNP_T1.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTPNP_T1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 400.8
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.3725 -0.6802  0.1202  0.5917  2.5011 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  94.39    9.716  
    ##  Residual             572.76   23.932  
    ## Number of obs: 45, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   36.820      4.361   8.443
    ## Validity.L     2.259      6.179   0.366
    ## Validity.Q     3.454      6.179   0.559
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L 0.000        
    ## Validity.Q 0.000  0.000

``` r
aov.swap_validityTPNP_T1 <- Anova(swap_validityTPNP_T1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==1, Target==2)
swap_validityTPNP_T2.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTPNP_T2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 307.1
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.75873 -0.81876  0.07367  0.52616  2.72431 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0.0     0.00   
    ##  Residual             497.6    22.31   
    ## Number of obs: 36, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   37.815      3.746  10.094
    ## Validity.L     1.636      6.634   0.247
    ## Validity.Q    -1.734      6.339  -0.274
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L -0.109       
    ## Validity.Q  0.066 -0.079
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_validityTPNP_T2 <- Anova(swap_validityTPNP_T2.lmm.lme4)
```

## TANP

``` r
d <- data %>% filter(targetContrast==0, nontargetContrast==1)
swap_validityTANP.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTANP.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 487.6
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.4942 -0.1379  0.1266  0.4776  1.0080 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  67.73    8.23   
    ##  Residual             429.08   20.71   
    ## Number of obs: 56, groups:  SID, 14
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   80.279      3.622  22.166
    ## Validity.L    -1.135      4.907  -0.231
    ## Validity.Q     3.371      4.927   0.684
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.107       
    ## Validity.Q -0.010  0.090

``` r
aov.swap_validityTANP <- Anova(swap_validityTANP.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(targetContrast==0, nontargetContrast==1, Target==1)
swap_validityTANP_T1.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTANP_T1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 229.1
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.35280 -0.09852  0.11089  0.54553  1.01584 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  36.64    6.053  
    ##  Residual             859.27   29.313  
    ## Number of obs: 26, groups:  SID, 13
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   74.375      6.196  12.004
    ## Validity.L   -10.021     10.784  -0.929
    ## Validity.Q     3.727      9.836   0.379
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L 0.212        
    ## Validity.Q 0.134  0.160

``` r
aov.swap_validityTANP_T1 <- Anova(swap_validityTANP_T1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(targetContrast==0, nontargetContrast==1, Target==2)
swap_validityTANP_T2.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTANP_T2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 208.7
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.2408 -0.4405  0.1089  0.7755  1.2598 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  0.00    0.000   
    ##  Residual             99.09    9.954   
    ## Number of obs: 30, groups:  SID, 13
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   86.227      1.842  46.799
    ## Validity.L     4.754      3.014   1.577
    ## Validity.Q    -1.509      3.359  -0.449
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.070       
    ## Validity.Q -0.145  0.047
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_validityTANP_T2 <- Anova(swap_validityTANP_T2.lmm.lme4)
```

## TPNA

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==0)
swap_validityTPNA.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTPNA.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 739.5
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.9086 -0.6037 -0.1347  0.3788  2.9977 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 517.7    22.75   
    ##  Residual             315.7    17.77   
    ## Number of obs: 84, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)  27.0687     6.1907   4.372
    ## Validity.L    4.2229     3.3699   1.253
    ## Validity.Q    0.8016     3.3858   0.237
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L -0.010       
    ## Validity.Q  0.002 -0.025

``` r
aov.swap_validityTPNA <- Anova(swap_validityTPNA.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==1, Target==1)
swap_validityTPNA_T1.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTPNA_T1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 400.8
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.3725 -0.6802  0.1202  0.5917  2.5011 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  94.39    9.716  
    ##  Residual             572.76   23.932  
    ## Number of obs: 45, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   36.820      4.361   8.443
    ## Validity.L     2.259      6.179   0.366
    ## Validity.Q     3.454      6.179   0.559
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L 0.000        
    ## Validity.Q 0.000  0.000

``` r
aov.swap_validityTPNA_T1 <- Anova(swap_validityTPNA_T1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==1, Target==2)
swap_validityTPNA_T2.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTPNA_T2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 307.1
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.75873 -0.81876  0.07367  0.52616  2.72431 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0.0     0.00   
    ##  Residual             497.6    22.31   
    ## Number of obs: 36, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   37.815      3.746  10.094
    ## Validity.L     1.636      6.634   0.247
    ## Validity.Q    -1.734      6.339  -0.274
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L -0.109       
    ## Validity.Q  0.066 -0.079
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_validityTPNA_T2 <- Anova(swap_validityTPNA_T2.lmm.lme4)
```

# target

``` r
d <- data
swap_target.lmm.lme4 <- lmer(point95_SwapAcc ~ Target + (1|SID), data = d)
summary(swap_target.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 2179.4
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.83070 -0.83559 -0.02003  0.87457  2.16326 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  103.3   10.16   
    ##  Residual             1012.2   31.82   
    ## Number of obs: 223, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   43.322      3.391  12.776
    ## Target.L       2.820      3.023   0.933
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L 0.028

``` r
aov.swap_target <- Anova(swap_target.lmm.lme4)
```

## TP

``` r
d <- data %>% filter(targetContrast==1)
swap_targetTP.lmm.lme4 <- lmer(point95_SwapAcc ~ Target + (1|SID), data = d)
summary(swap_targetTP.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1521.8
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.7871 -0.8013 -0.1676  0.7271  3.0814 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 161.7    12.72   
    ##  Residual             553.8    23.53   
    ## Number of obs: 165, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   31.764      3.766   8.435
    ## Target.L      -1.433      2.609  -0.549
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L 0.041

``` r
aov.swap_targetTP <- Anova(swap_targetTP.lmm.lme4)
```

## TA

``` r
d <- data %>% filter(targetContrast==0)
swap_targetTA.lmm.lme4 <- lmer(point95_SwapAcc ~ Target + (1|SID), data = d)
summary(swap_targetTA.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 529.4
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -3.05939 -0.08888  0.18364  0.55577  1.00881 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  57.07    7.555  
    ##  Residual             607.61   24.650  
    ## Number of obs: 58, groups:  SID, 14
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   77.949      3.892  20.029
    ## Target.L       6.840      4.643   1.473
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L -0.058

``` r
aov.swap_targetTA <- Anova(swap_targetTA.lmm.lme4)
```

## TPNP

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==1)
swap_targetTPNP.lmm.lme4 <- lmer(point95_SwapAcc ~ Target + (1|SID), data = d)
summary(swap_targetTPNP.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 726.6
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.56997 -0.75205 -0.06542  0.78971  2.57055 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 138.3    11.76   
    ##  Residual             437.3    20.91   
    ## Number of obs: 81, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)  36.9447     3.8367   9.629
    ## Target.L      0.1757     3.3169   0.053
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L 0.071

``` r
aov.swap_targetTPNP <- Anova(swap_targetTPNP.lmm.lme4)
```

## TANP

``` r
d <- data %>% filter(targetContrast==0, nontargetContrast==1)
swap_targetTANP.lmm.lme4 <- lmer(point95_SwapAcc ~ Target + (1|SID), data = d)
summary(swap_targetTANP.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 490.6
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.4324 -0.1385  0.1386  0.5811  1.1468 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  39.88    6.315  
    ##  Residual             418.39   20.455  
    ## Number of obs: 56, groups:  SID, 14
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   80.225      3.266  24.562
    ## Target.L       6.921      3.924   1.764
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L -0.060

``` r
aov.swap_targetTANP <- Anova(swap_targetTANP.lmm.lme4)
```

## TPNA

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==0)
swap_targetTPNA.lmm.lme4 <- lmer(point95_SwapAcc ~ Target + (1|SID), data = d)
summary(swap_targetTPNA.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 745.3
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.0812 -0.4491 -0.1595  0.3407  2.8881 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 511.2    22.61   
    ##  Residual             317.3    17.81   
    ## Number of obs: 84, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   27.068      6.158   4.396
    ## Target.L      -1.870      2.775  -0.674
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L 0.019

``` r
aov.swap_targetTPNA <- Anova(swap_targetTPNA.lmm.lme4)
```

# target contrast

``` r
d <- data
swap_targetContrast.lmm.lme4 <- lmer(point95_SwapAcc ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrast.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 2078.1
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.3452 -0.7012  0.0967  0.5763  2.7048 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  58.0     7.616  
    ##  Residual             643.8    25.374  
    ## Number of obs: 223, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error t value
    ## (Intercept)        54.333      2.782   19.53
    ## targetContrast.L   31.626      2.779   11.38
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.349

``` r
aov.swap_targetContrast <- Anova(swap_targetContrast.lmm.lme4)
```

## T1

``` r
d <- data %>% filter(Target==1)
swap_targetContrastT1.lmm.lme4 <- lmer(point95_SwapAcc ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1098.7
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.6587 -0.7576  0.1139  0.6117  2.3818 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  29.72    5.451  
    ##  Residual             808.65   28.437  
    ## Number of obs: 116, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error t value
    ## (Intercept)        52.286      3.448  15.165
    ## targetContrast.L   27.581      4.452   6.195
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.494

``` r
aov.swap_targetContrastT1 <- Anova(swap_targetContrastT1.lmm.lme4)
```

## T2

``` r
d <- data %>% filter(Target==2)
swap_targetContrastT2.lmm.lme4 <- lmer(point95_SwapAcc ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 967.8
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.6704 -0.5943  0.0429  0.7601  2.9035 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  11.31    3.363  
    ##  Residual             533.61   23.100  
    ## Number of obs: 107, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error t value
    ## (Intercept)        56.968      2.621   21.73
    ## targetContrast.L   36.668      3.498   10.48
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.400

``` r
aov.swap_targetContrastT2 <- Anova(swap_targetContrastT2.lmm.lme4)
```

# nontarget contrast

``` r
d <- data
swap_nontargetContrast.lmm.lme4 <- lmer(point95_SwapAcc ~ nontargetContrast + (1|SID), data = d)
summary(swap_targetContrast.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 2078.1
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.3452 -0.7012  0.0967  0.5763  2.7048 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  58.0     7.616  
    ##  Residual             643.8    25.374  
    ## Number of obs: 223, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error t value
    ## (Intercept)        54.333      2.782   19.53
    ## targetContrast.L   31.626      2.779   11.38
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.349

``` r
aov.swap_nontargetContrast <- Anova(swap_nontargetContrast.lmm.lme4)
```

## T1

``` r
d <- data %>% filter(Target==1)
swap_nontargetContrastT1.lmm.lme4 <- lmer(point95_SwapAcc ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1118
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.74938 -0.82239 -0.08944  0.83566  2.38640 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  70.22    8.38   
    ##  Residual             930.75   30.51   
    ## Number of obs: 116, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error t value
    ## (Intercept)            39.03       3.63   10.75
    ## nontargetContrast.L   -15.90       4.12   -3.86
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.177

``` r
aov.swap_nontargetContrastT1 <- Anova(swap_nontargetContrastT1.lmm.lme4)
```

## T2

``` r
d <- data %>% filter(Target==2)
swap_nontargetContrastT2.lmm.lme4 <- lmer(point95_SwapAcc ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1009.1
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.21660 -0.78280 -0.00049  0.87114  2.54042 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  31.91    5.649  
    ##  Residual             778.30   27.898  
    ## Number of obs: 107, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error t value
    ## (Intercept)           41.756      3.145  13.278
    ## nontargetContrast.L  -24.973      3.934  -6.347
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.205

``` r
aov.swap_nontargetContrastT2 <- Anova(swap_nontargetContrastT2.lmm.lme4)
```
