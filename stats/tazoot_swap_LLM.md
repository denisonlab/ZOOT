tazoot_swap_LMM
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

### T1

``` r
d <- data %>% filter(targetContrast==1, Target==1)
swap_validityTPT1.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTPT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 826.9
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.39776 -0.89328 -0.07528  0.65490  2.44933 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  90.22    9.499  
    ##  Residual             702.17   26.498  
    ## Number of obs: 89, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   32.789      3.730   8.790
    ## Validity.L     3.667      4.838   0.758
    ## Validity.Q     1.052      4.897   0.215
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.000       
    ## Validity.Q -0.013  0.000

``` r
aov.swap_validityTPT1 <- Anova(swap_validityTPT1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(targetContrast==1, Target==2)
swap_validityTPT2.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTPT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 685.4
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.64766 -0.82327 -0.07215  0.69164  2.18164 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 129.9    11.40   
    ##  Residual             517.2    22.74   
    ## Number of obs: 76, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)  30.7019     3.9612   7.751
    ## Validity.L    1.4418     4.6684   0.309
    ## Validity.Q    0.2611     4.5369   0.058
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L -0.064       
    ## Validity.Q  0.041 -0.075

``` r
aov.swap_validityTPT2 <- Anova(swap_validityTPT2.lmm.lme4)
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

### T1

``` r
d <- data %>% filter(targetContrast==0, Target==1)
swap_validityTAT1.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTAT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 242.7
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.12305 -0.08023  0.05027  0.64686  1.07489 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)    0      0.00   
    ##  Residual             1053     32.45   
    ## Number of obs: 27, groups:  SID, 13
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   72.332      6.468  11.184
    ## Validity.L    -9.967     11.848  -0.841
    ## Validity.Q     8.830     10.517   0.840
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L 0.216        
    ## Validity.Q 0.179  0.163 
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_validityTAT1 <- Anova(swap_validityTAT1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(targetContrast==0, Target==2)
swap_validityTAT2.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTAT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 251.7
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -4.2799 -0.2392  0.0940  0.4145  1.0132 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   4.865   2.206  
    ##  Residual             347.670  18.646  
    ## Number of obs: 31, groups:  SID, 13
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)  83.5772     3.4640  24.127
    ## Validity.L   -0.8983     5.5121  -0.163
    ## Validity.Q   -4.8124     6.2597  -0.769
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.034       
    ## Validity.Q -0.168  0.022

``` r
aov.swap_validityTAT2 <- Anova(swap_validityTAT2.lmm.lme4)
```

## NP

``` r
d <- data %>% filter(nontargetContrast==1)
swap_validityNP.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityNP.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1313.1
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.7225 -0.6659  0.1093  0.8254  1.7909 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 125.1    11.18   
    ##  Residual             881.9    29.70   
    ## Number of obs: 137, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   53.796      3.866  13.916
    ## Validity.L    -2.387      4.442  -0.537
    ## Validity.Q     3.359      4.407   0.762
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L 0.015        
    ## Validity.Q 0.000  0.016

``` r
aov.swap_validityNP <- Anova(swap_validityNP.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(nontargetContrast==1, Target==1)
swap_validityNPT1.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityNPT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 677.3
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.51874 -0.97333  0.00175  0.79431  1.71872 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 119.5    10.93   
    ##  Residual             965.7    31.08   
    ## Number of obs: 71, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   49.939      4.680  10.671
    ## Validity.L    -4.942      6.532  -0.757
    ## Validity.Q     1.961      6.343   0.309
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L 0.059        
    ## Validity.Q 0.035  0.051

``` r
aov.swap_validityNPT1 <- Anova(swap_validityNPT1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(nontargetContrast==1, Target==2)
swap_validityNPT2.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityNPT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 617.9
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.0079 -0.7609  0.1612  0.8069  1.4115 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0.0     0.00   
    ##  Residual             902.2    30.04   
    ## Number of obs: 66, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)  59.7060     3.6999  16.137
    ## Validity.L   -0.6315     6.3340  -0.100
    ## Validity.Q    2.5751     6.4819   0.397
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L -0.018       
    ## Validity.Q -0.032 -0.013
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_validityNPT2 <- Anova(swap_validityNPT2.lmm.lme4)
```

## TA

``` r
d <- data %>% filter(nontargetContrast==0)
swap_validityNA.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityNA.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 774.7
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.59083 -0.48757 -0.05089  0.33879  2.70257 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 402.0    20.05   
    ##  Residual             423.4    20.58   
    ## Number of obs: 86, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   25.911      5.641   4.593
    ## Validity.L     2.794      3.873   0.721
    ## Validity.Q     1.494      3.863   0.387
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L -0.017       
    ## Validity.Q  0.004 -0.035

``` r
aov.swap_validityNA <- Anova(swap_validityNA.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(nontargetContrast==0, Target==1)
swap_validityNAT1.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityNAT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 412.1
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.6739 -0.6447 -0.1244  0.3976  2.2248 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 267.7    16.36   
    ##  Residual             657.9    25.65   
    ## Number of obs: 45, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   27.553      5.709   4.827
    ## Validity.L     5.074      6.623   0.766
    ## Validity.Q     1.597      6.679   0.239
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.000       
    ## Validity.Q -0.008  0.000

``` r
aov.swap_validityNAT1 <- Anova(swap_validityNAT1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(nontargetContrast==0, Target==2)
swap_validityNAT2.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityNAT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 360.7
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.4021 -0.4582 -0.1033  0.3126  2.6899 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 337.2    18.36   
    ##  Residual             399.0    19.98   
    ## Number of obs: 41, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   24.066      5.737   4.195
    ## Validity.L     0.593      5.546   0.107
    ## Validity.Q     1.057      5.520   0.191
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L -0.057       
    ## Validity.Q  0.032 -0.077

``` r
aov.swap_validityNAT2 <- Anova(swap_validityNAT2.lmm.lme4)
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

## T1

``` r
d <- data %>% filter(Target==1)
swap_validityT1.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1126.3
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.48702 -0.99238 -0.01167  0.75881  1.92408 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   67.5    8.216  
    ##  Residual             1067.9   32.679  
    ## Number of obs: 116, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   41.547      3.714  11.187
    ## Validity.L    -1.628      5.316  -0.306
    ## Validity.Q     1.403      5.230   0.268
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L 0.036        
    ## Validity.Q 0.020  0.031

``` r
aov.swap_validityT1 <- Anova(swap_validityT1.lmm.lme4)
```

## T2

``` r
d <- data %>% filter(Target==2)
swap_validityT2.lmm.lme4 <- lmer(point95_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1037
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.45855 -0.78854  0.03528  0.90382  1.71844 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   15.31   3.913  
    ##  Residual             1104.94  33.241  
    ## Number of obs: 107, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   46.032      3.378  13.626
    ## Validity.L    -1.525      5.556  -0.274
    ## Validity.Q     3.172      5.603   0.566
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L -0.043       
    ## Validity.Q -0.012 -0.033

``` r
aov.swap_validityT2 <- Anova(swap_validityT2.lmm.lme4)
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

## NP

``` r
d <- data %>% filter(nontargetContrast==1)
swap_targetNP.lmm.lme4 <- lmer(point95_SwapAcc ~ Target + (1|SID), data = d)
summary(swap_targetNP.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1316.7
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.9081 -0.8182  0.0737  0.8049  1.8385 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 116.2    10.78   
    ##  Residual             867.6    29.46   
    ## Number of obs: 137, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   54.028      3.775  14.312
    ## Target.L       5.718      3.579   1.598
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L 0.027

``` r
aov.swap_targetNP <- Anova(swap_targetNP.lmm.lme4)
```

## NA

``` r
d <- data %>% filter(nontargetContrast==0)
swap_targetNA.lmm.lme4 <- lmer(point95_SwapAcc ~ Target + (1|SID), data = d)
summary(swap_targetNA.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 779.9
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.5555 -0.4295 -0.1200  0.3588  2.5891 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 398.2    19.95   
    ##  Residual             420.1    20.50   
    ## Number of obs: 86, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   25.894      5.616   4.611
    ## Target.L      -1.914      3.153  -0.607
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L 0.023

``` r
aov.swap_targetNA <- Anova(swap_targetNA.lmm.lme4)
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

## NP

``` r
d <- data %>% filter(nontargetContrast==1)
swap_targetContrastNP.lmm.lme4 <- lmer(point95_SwapAcc ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNP.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1231.3
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.5885 -0.5656  0.1098  0.6295  2.6335 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  75.45    8.686  
    ##  Residual             455.22   21.336  
    ## Number of obs: 137, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error t value
    ## (Intercept)        58.152      2.933   19.83
    ## targetContrast.L   29.738      2.670   11.14
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.136

``` r
aov.swap_targetContrastNP <- Anova(swap_targetContrastNP.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(nontargetContrast==1, Target==1)
swap_targetContrastNPT1.lmm.lme4 <- lmer(point95_SwapAcc ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNPT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 655.5
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.7899 -0.5659  0.1754  0.5924  2.2770 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 101.2    10.06   
    ##  Residual             623.6    24.97   
    ## Number of obs: 71, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error t value
    ## (Intercept)        55.391      4.068   13.62
    ## targetContrast.L   26.263      4.428    5.93
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.226

``` r
aov.swap_targetContrastNPT1 <- Anova(swap_targetContrastNPT1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(nontargetContrast==1, Target==2)
swap_targetContrastNPT2.lmm.lme4 <- lmer(point95_SwapAcc ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNPT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 555.1
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.1791 -0.5936 -0.0182  0.6904  3.5599 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0.0     0.00   
    ##  Residual             303.6    17.42   
    ## Number of obs: 66, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error t value
    ## (Intercept)        61.925      2.154   28.75
    ## targetContrast.L   33.877      3.046   11.12
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.091 
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_targetContrastNPT2 <- Anova(swap_targetContrastNPT2.lmm.lme4)
```

## NA

``` r
d <- data %>% filter(nontargetContrast==0)
swap_targetContrastNA.lmm.lme4 <- lmer(point95_SwapAcc ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNA.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 758.6
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.0814 -0.4245 -0.1406  0.3629  2.9793 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 515.1    22.70   
    ##  Residual             310.0    17.61   
    ## Number of obs: 86, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error t value
    ## (Intercept)        -6.910      9.229  -0.749
    ## targetContrast.L  -48.163     10.057  -4.789
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.744

``` r
aov.swap_targetContrastNA <- Anova(swap_targetContrastNA.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(nontargetContrast==0, Target==1)
swap_targetContrastNAT1.lmm.lme4 <- lmer(point95_SwapAcc ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNAT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 411.7
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.0722 -0.4613 -0.1040  0.3443  2.3125 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 391.9    19.80   
    ##  Residual             520.1    22.81   
    ## Number of obs: 45, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error t value
    ## (Intercept)       -0.9006    13.6871  -0.066
    ## targetContrast.L -41.5878    17.9431  -2.318
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.893

``` r
aov.swap_targetContrastNAT1 <- Anova(swap_targetContrastNAT1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(nontargetContrast==0, Target==2)
swap_targetContrastNAT2.lmm.lme4 <- lmer(point95_SwapAcc ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNAT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 353.3
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.3726 -0.3639 -0.2140  0.3498  2.2500 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 518.6    22.77   
    ##  Residual             223.8    14.96   
    ## Number of obs: 41, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error t value
    ## (Intercept)         -7.71      10.39  -0.742
    ## targetContrast.L   -46.91      12.03  -3.898
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.790

``` r
aov.swap_targetContrastNAT2 <- Anova(swap_targetContrastNAT2.lmm.lme4)
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

## TP

``` r
d <- data %>% filter(targetContrast==1)
swap_nontargetContrastTP.lmm.lme4 <- lmer(point95_SwapAcc ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTP.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1513.7
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.0493 -0.7076 -0.1340  0.6497  2.9984 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 164.1    12.81   
    ##  Residual             524.5    22.90   
    ## Number of obs: 165, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error t value
    ## (Intercept)           31.938      3.760   8.495
    ## nontargetContrast.L   -7.438      2.525  -2.945
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L -0.008

``` r
aov.swap_nontargetContrastTP <- Anova(swap_nontargetContrastTP.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(targetContrast==1, Target==1)
swap_nontargetContrastTPT1.lmm.lme4 <- lmer(point95_SwapAcc ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTPT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 830.8
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.61938 -0.79242 -0.08866  0.61365  2.61076 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  94.3     9.711  
    ##  Residual             678.3    26.044  
    ## Number of obs: 89, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error t value
    ## (Intercept)           32.749      3.730   8.779
    ## nontargetContrast.L   -5.758      3.906  -1.474
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.009

``` r
aov.swap_nontargetContrastTPT1 <- Anova(swap_nontargetContrastTPT1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(targetContrast==1, Target==2)
swap_nontargetContrastTPT2.lmm.lme4 <- lmer(point95_SwapAcc ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTPT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 684.1
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.15426 -0.76150 -0.07692  0.73861  2.54096 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 141.3    11.89   
    ##  Residual             455.5    21.34   
    ## Number of obs: 76, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error t value
    ## (Intercept)           31.069      3.945   7.875
    ## nontargetContrast.L   -9.324      3.482  -2.678
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L -0.031

``` r
aov.swap_nontargetContrastTPT2 <- Anova(swap_nontargetContrastTPT2.lmm.lme4)
```

## TA

``` r
d <- data %>% filter(targetContrast==0)
swap_nontargetContrastTA.lmm.lme4 <- lmer(point95_SwapAcc ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTA.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 507.5
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.5731 -0.2136  0.1684  0.4855  0.8915 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  65.92    8.119  
    ##  Residual             409.66   20.240  
    ## Number of obs: 58, groups:  SID, 14
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error t value
    ## (Intercept)           40.057      8.156   4.911
    ## nontargetContrast.L  -57.071     10.991  -5.193
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.903

``` r
aov.swap_nontargetContrastTA <- Anova(swap_nontargetContrastTA.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(targetContrast==0, Target==1)
swap_nontargetContrastTAT1.lmm.lme4 <- lmer(point95_SwapAcc ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTAT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 243.9
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.53284 -0.00876  0.27018  0.45804  0.82945 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  25.44    5.044  
    ##  Residual             838.95   28.965  
    ## Number of obs: 27, groups:  SID, 13
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error t value
    ## (Intercept)            37.40      15.02   2.490
    ## nontargetContrast.L   -53.57      21.11  -2.538
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.923

``` r
aov.swap_nontargetContrastTAT1 <- Anova(swap_nontargetContrastTAT1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(targetContrast==0, Target==2)
swap_nontargetContrastTAT2.lmm.lme4 <- lmer(point95_SwapAcc ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTAT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: point95_SwapAcc ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 220.4
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.9052 -0.5830 -0.1253  0.6288  1.4002 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0.0     0.00   
    ##  Residual             101.7    10.08   
    ## Number of obs: 31, groups:  SID, 13
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error t value
    ## (Intercept)           42.940      5.126   8.378
    ## nontargetContrast.L  -60.726      7.249  -8.378
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.935 
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_nontargetContrastTAT2 <- Anova(swap_nontargetContrastTAT2.lmm.lme4)
```
