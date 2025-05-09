tazoot_swap_LMM_twoIncorrect
================
Jenny
2025-05-09

``` r
d <- data
swap.lmm.lme4 <- lmer(twoIncorrect ~ Validity * Target * targetContrast * nontargetContrast + (1|SID), data = d)
summary(swap.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: 
    ## twoIncorrect ~ Validity * Target * targetContrast * nontargetContrast +  
    ##     (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 2015.8
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.9570 -0.5702  0.0000  0.5903  3.2299 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  57.87    7.607  
    ##  Residual             381.95   19.544  
    ## Number of obs: 241, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                                                 Estimate Std. Error t value
    ## (Intercept)                                      37.0041     3.5140  10.530
    ## Validity.L                                       -3.6918     4.7906  -0.771
    ## Validity.Q                                        0.7796     6.9009   0.113
    ## Target.L                                         -1.3623     4.7455  -0.287
    ## targetContrast.L                                 -2.3538     4.1232  -0.571
    ## nontargetContrast.L                             -34.9170     4.0375  -8.648
    ## Validity.L:Target.L                               3.5594     4.0457   0.880
    ## Validity.Q:Target.L                              -3.8750     4.1604  -0.931
    ## Validity.L:targetContrast.L                      -8.1594     6.7668  -1.206
    ## Validity.Q:targetContrast.L                       0.7082     9.7531   0.073
    ## Target.L:targetContrast.L                        12.8159     6.7045   1.912
    ## Validity.L:nontargetContrast.L                   -0.5747     6.5968  -0.087
    ## Validity.Q:nontargetContrast.L                   -2.7520     9.6897  -0.284
    ## Target.L:nontargetContrast.L                     -0.9567     6.5381  -0.146
    ## targetContrast.L:nontargetContrast.L            -37.2415     5.7161  -6.515
    ## Validity.L:Target.L:targetContrast.L              6.6123     5.7442   1.151
    ## Validity.Q:Target.L:targetContrast.L             -6.0941     5.8868  -1.035
    ## Validity.L:Target.L:nontargetContrast.L          -6.9993     5.1201  -1.367
    ## Validity.Q:Target.L:nontargetContrast.L           2.5389     5.1968   0.489
    ## Validity.L:targetContrast.L:nontargetContrast.L  -8.0250     9.3697  -0.856
    ## Validity.Q:targetContrast.L:nontargetContrast.L  -4.9350    13.6890  -0.361
    ## Target.L:targetContrast.L:nontargetContrast.L     0.3285     9.2043   0.036

    ## fit warnings:
    ## fixed-effect model matrix is rank deficient so dropping 2 columns / coefficients

``` r
aov.swap <- Anova(swap.lmm.lme4)
```

# validity

``` r
d <- data
swap_validity.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validity.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 2306.1
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.95214 -0.64378  0.00288  0.77833  2.02894 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  50.32    7.094  
    ##  Residual             856.42   29.265  
    ## Number of obs: 241, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   48.223      2.640  18.264
    ## Validity.L    -1.249      3.237  -0.386
    ## Validity.Q     2.649      3.339   0.793
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.064       
    ## Validity.Q -0.033  0.059

``` r
aov.swap_validity <- Anova(swap_validity.lmm.lme4)
```

## TP

``` r
d <- data %>% filter(targetContrast==1)
swap_validityTP.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTP.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1569.9
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.16646 -0.64954  0.08013  0.69204  2.90340 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  68.84    8.297  
    ##  Residual             513.81   22.667  
    ## Number of obs: 173, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)  38.8473     2.7509  14.122
    ## Validity.L    2.3060     2.9663   0.777
    ## Validity.Q    0.2362     3.0141   0.078
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.013       
    ## Validity.Q -0.014  0.016

``` r
aov.swap_validityTP <- Anova(swap_validityTP.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(targetContrast==1, Target==1)
swap_validityTPT1.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTPT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 770.4
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.18837 -0.61990 -0.00774  0.58466  2.97544 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  83.64    9.145  
    ##  Residual             345.31   18.583  
    ## Number of obs: 89, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   46.098      3.076  14.987
    ## Validity.L     2.867      3.393   0.845
    ## Validity.Q    -0.170      3.436  -0.049
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.000       
    ## Validity.Q -0.011  0.000

``` r
aov.swap_validityTPT1 <- Anova(swap_validityTPT1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(targetContrast==1, Target==2)
swap_validityTPT2.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTPT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 761
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.63319 -0.97583 -0.09549  0.70873  2.21707 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 109.5    10.47   
    ##  Residual             539.2    23.22   
    ## Number of obs: 84, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)  30.9688     3.7129   8.341
    ## Validity.L    0.8318     4.3661   0.191
    ## Validity.Q    0.5991     4.4657   0.134
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.031       
    ## Validity.Q -0.020  0.034

``` r
aov.swap_validityTPT2 <- Anova(swap_validityTPT2.lmm.lme4)
```

## TA

``` r
d <- data %>% filter(targetContrast==0)
swap_validityTA.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTA.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 634.9
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.5832 -0.1414  0.2867  0.7006  1.0906 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  24.87    4.987  
    ##  Residual             849.42   29.145  
    ## Number of obs: 68, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   73.798      3.928  18.786
    ## Validity.L     1.496      6.231   0.240
    ## Validity.Q     4.912      6.543   0.751
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.236       
    ## Validity.Q -0.073  0.166

``` r
aov.swap_validityTA <- Anova(swap_validityTA.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(targetContrast==0, Target==1)
swap_validityTAT1.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTAT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 283.1
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.9859 -0.2505  0.3425  0.6143  1.5614 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0.0     0.00   
    ##  Residual             771.5    27.78   
    ## Number of obs: 32, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   70.014      5.272  13.280
    ## Validity.L    -8.811      9.487  -0.929
    ## Validity.Q    16.390      8.761   1.871
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L 0.364        
    ## Validity.Q 0.117  0.268 
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_validityTAT1 <- Anova(swap_validityTAT1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(targetContrast==0, Target==2)
swap_validityTAT2.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTAT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 324
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.8016 -0.2151  0.3664  0.6238  1.1471 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0.0     0.00   
    ##  Residual             833.5    28.87   
    ## Number of obs: 36, groups:  SID, 14
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   78.408      5.044  15.544
    ## Validity.L     9.901      7.900   1.253
    ## Validity.Q   -11.085      9.501  -1.167
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.158       
    ## Validity.Q -0.237  0.103
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_validityTAT2 <- Anova(swap_validityTAT2.lmm.lme4)
```

## NP

``` r
d <- data %>% filter(nontargetContrast==1)
swap_validityNP.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityNP.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1373.1
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.38585 -0.67506  0.01584  0.76193  1.77007 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  26.21    5.12   
    ##  Residual             673.57   25.95   
    ## Number of obs: 148, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   59.375      2.531  23.463
    ## Validity.L    -5.089      3.672  -1.386
    ## Validity.Q     4.037      3.783   1.067
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.096       
    ## Validity.Q -0.036  0.077

``` r
aov.swap_validityNP <- Anova(swap_validityNP.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(nontargetContrast==1, Target==1)
swap_validityNPT1.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityNPT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 657.3
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.4203 -0.7107 -0.0625  0.6480  2.1047 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  38.62    6.215  
    ##  Residual             433.40   20.818  
    ## Number of obs: 75, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   60.304      2.917  20.671
    ## Validity.L   -11.868      4.231  -2.805
    ## Validity.Q     5.955      4.196   1.419
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L 0.114        
    ## Validity.Q 0.010  0.093

``` r
aov.swap_validityNPT1 <- Anova(swap_validityNPT1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(nontargetContrast==1, Target==2)
swap_validityNPT2.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityNPT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 687.2
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.98571 -0.68005 -0.03331  0.84715  1.39589 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0.0     0.00   
    ##  Residual             922.5    30.37   
    ## Number of obs: 73, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   58.690      3.588  16.358
    ## Validity.L     1.525      5.997   0.254
    ## Validity.Q     1.330      6.424   0.207
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.091       
    ## Validity.Q -0.094  0.062
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_validityNPT2 <- Anova(swap_validityNPT2.lmm.lme4)
```

## TA

``` r
d <- data %>% filter(nontargetContrast==0)
swap_validityNA.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityNA.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 850.1
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.92067 -0.92356  0.09612  0.66068  2.43731 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  94.26    9.709  
    ##  Residual             586.30   24.214  
    ## Number of obs: 93, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)  30.6955     3.5585   8.626
    ## Validity.L    7.1634     4.3059   1.664
    ## Validity.Q    0.3735     4.4483   0.084
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.036       
    ## Validity.Q -0.031  0.030

``` r
aov.swap_validityNA <- Anova(swap_validityNA.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(nontargetContrast==0, Target==1)
swap_validityNAT1.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityNAT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 398.7
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.2405 -0.5850  0.1611  0.7065  1.4996 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 188.5    13.73   
    ##  Residual             370.2    19.24   
    ## Number of obs: 46, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)  38.9032     4.5525   8.545
    ## Validity.L   11.3396     4.9013   2.314
    ## Validity.Q    0.9268     4.9926   0.186
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.014       
    ## Validity.Q -0.016  0.016

``` r
aov.swap_validityNAT1 <- Anova(swap_validityNAT1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(nontargetContrast==0, Target==2)
swap_validityNAT2.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityNAT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 419.2
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.8617 -0.6330 -0.1219  0.4778  2.6037 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 177.9    13.34   
    ##  Residual             516.7    22.73   
    ## Number of obs: 47, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   22.526      4.808   4.685
    ## Validity.L     2.571      5.681   0.453
    ## Validity.Q    -0.256      5.989  -0.043
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.054       
    ## Validity.Q -0.046  0.046

``` r
aov.swap_validityNAT2 <- Anova(swap_validityNAT2.lmm.lme4)
```

## TPNP

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==1)
swap_validityTPNP.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTPNP.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 749.6
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.27103 -0.53582  0.08101  0.62979  2.68287 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  14.39    3.793  
    ##  Residual             414.89   20.369  
    ## Number of obs: 86, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   45.016      2.407  18.702
    ## Validity.L    -1.312      3.786  -0.347
    ## Validity.Q    -0.550      3.831  -0.144
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.026       
    ## Validity.Q -0.015  0.020

``` r
aov.swap_validityTPNP <- Anova(swap_validityTPNP.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==1, Target==1)
swap_validityTPNP_T1.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTPNP_T1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 363.1
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.50539 -0.84701  0.01104  0.53891  2.99259 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  16.53    4.066  
    ##  Residual             251.88   15.871  
    ## Number of obs: 45, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)  51.5146     2.5883  19.903
    ## Validity.L   -4.2388     4.0978  -1.034
    ## Validity.Q    0.7198     4.0978   0.176
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
swap_validityTPNP_T2.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTPNP_T2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 355.1
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.70518 -0.79383  0.07548  0.51014  2.64136 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0.0     0.00   
    ##  Residual             529.3    23.01   
    ## Number of obs: 41, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   38.042      3.601  10.564
    ## Validity.L     1.153      6.165   0.187
    ## Validity.Q    -1.455      6.310  -0.231
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.058       
    ## Validity.Q -0.033  0.040
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_validityTPNP_T2 <- Anova(swap_validityTPNP_T2.lmm.lme4)
```

## TANP

``` r
d <- data %>% filter(targetContrast==0, nontargetContrast==1)
swap_validityTANP.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTANP.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 521.1
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.9058 -0.3243  0.1115  0.6807  1.4765 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  13.52    3.677  
    ##  Residual             325.88   18.052  
    ## Number of obs: 62, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   80.061      2.571  31.142
    ## Validity.L    -2.288      4.020  -0.569
    ## Validity.Q     8.235      4.192   1.964
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.211       
    ## Validity.Q -0.056  0.152

``` r
aov.swap_validityTANP <- Anova(swap_validityTANP.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(targetContrast==0, nontargetContrast==1, Target==1)
swap_validityTANP_T1.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTANP_T1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 245.1
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.2685 -0.3823  0.1662  0.5235  1.4593 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 173.3    13.16   
    ##  Residual             251.8    15.87   
    ## Number of obs: 30, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   72.061      4.770  15.109
    ## Validity.L   -17.161      5.826  -2.946
    ## Validity.Q    11.722      5.446   2.153
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L 0.287        
    ## Validity.Q 0.060  0.252

``` r
aov.swap_validityTANP_T1 <- Anova(swap_validityTANP_T1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(targetContrast==0, nontargetContrast==1, Target==2)
swap_validityTANP_T2.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTANP_T2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 233.4
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.6526 -0.3506  0.1508  0.8149  1.5965 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0.0     0.00   
    ##  Residual             138.5    11.77   
    ## Number of obs: 32, groups:  SID, 14
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   85.882      2.136  40.215
    ## Validity.L     5.486      3.445   1.593
    ## Validity.Q    -1.932      3.936  -0.491
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.127       
    ## Validity.Q -0.176  0.084
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_validityTANP_T2 <- Anova(swap_validityTANP_T2.lmm.lme4)
```

## TPNA

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==0)
swap_validityTPNA.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTPNA.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 786.3
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.87831 -0.60351  0.07269  0.52940  2.13638 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 170.5    13.06   
    ##  Residual             496.3    22.28   
    ## Number of obs: 87, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   32.772      4.135   7.927
    ## Validity.L     6.071      4.106   1.478
    ## Validity.Q     1.047      4.188   0.250
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.009       
    ## Validity.Q -0.016  0.011

``` r
aov.swap_validityTPNA <- Anova(swap_validityTPNA.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==1, Target==1)
swap_validityTPNA_T1.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTPNA_T1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 363.1
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.50539 -0.84701  0.01104  0.53891  2.99259 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  16.53    4.066  
    ##  Residual             251.88   15.871  
    ## Number of obs: 45, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)  51.5146     2.5883  19.903
    ## Validity.L   -4.2388     4.0978  -1.034
    ## Validity.Q    0.7198     4.0978   0.176
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
swap_validityTPNA_T2.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTPNA_T2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 355.1
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.70518 -0.79383  0.07548  0.51014  2.64136 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0.0     0.00   
    ##  Residual             529.3    23.01   
    ## Number of obs: 41, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   38.042      3.601  10.564
    ## Validity.L     1.153      6.165   0.187
    ## Validity.Q    -1.455      6.310  -0.231
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.058       
    ## Validity.Q -0.033  0.040
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_validityTPNA_T2 <- Anova(swap_validityTPNA_T2.lmm.lme4)
```

## T1

``` r
d <- data %>% filter(Target==1)
swap_validityT1.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1109.9
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.30413 -0.63864  0.00361  0.79428  2.15635 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  63.72    7.983  
    ##  Residual             596.88   24.431  
    ## Number of obs: 121, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   52.418      3.043  17.226
    ## Validity.L    -3.916      3.871  -1.012
    ## Validity.Q     3.985      3.878   1.028
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.068       
    ## Validity.Q -0.002  0.064

``` r
aov.swap_validityT1 <- Anova(swap_validityT1.lmm.lme4)
```

## T2

``` r
d <- data %>% filter(Target==2)
swap_validityT2.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1166.9
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.37964 -0.80169  0.08904  0.93289  1.67587 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)    0      0.00   
    ##  Residual             1132     33.65   
    ## Number of obs: 120, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   44.590      3.095  14.405
    ## Validity.L     1.897      5.191   0.366
    ## Validity.Q     1.201      5.527   0.217
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.084       
    ## Validity.Q -0.086  0.057
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_validityT2 <- Anova(swap_validityT2.lmm.lme4)
```

# target

``` r
d <- data
swap_target.lmm.lme4 <- lmer(twoIncorrect ~ Target + (1|SID), data = d)
summary(swap_target.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 2306.4
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.12266 -0.65226 -0.02677  0.74658  2.22925 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  51.87    7.202  
    ##  Residual             836.37   28.920  
    ## Number of obs: 241, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   48.332      2.637  18.329
    ## Target.L      -6.006      2.640  -2.275
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L 0.004

``` r
aov.swap_target <- Anova(swap_target.lmm.lme4)
```

## TP

``` r
d <- data %>% filter(targetContrast==1)
swap_targetTP.lmm.lme4 <- lmer(twoIncorrect ~ Target + (1|SID), data = d)
summary(swap_targetTP.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1554.7
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.0271 -0.6224 -0.0188  0.6564  2.7798 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  74.56    8.635  
    ##  Residual             450.60   21.227  
    ## Number of obs: 173, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   38.587      2.754  14.013
    ## Target.L     -10.614      2.286  -4.642
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L 0.018

``` r
aov.swap_targetTP <- Anova(swap_targetTP.lmm.lme4)
```

## TA

``` r
d <- data %>% filter(targetContrast==0)
swap_targetTA.lmm.lme4 <- lmer(twoIncorrect ~ Target + (1|SID), data = d)
summary(swap_targetTA.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 641.1
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.5587 -0.2027  0.2603  0.6403  1.0384 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  28.89    5.374  
    ##  Residual             836.19   28.917  
    ## Number of obs: 68, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   73.802      3.811  19.368
    ## Target.L       2.839      4.986   0.569
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L -0.054

``` r
aov.swap_targetTA <- Anova(swap_targetTA.lmm.lme4)
```

## NP

``` r
d <- data %>% filter(nontargetContrast==1)
swap_targetNP.lmm.lme4 <- lmer(twoIncorrect ~ Target + (1|SID), data = d)
summary(swap_targetNP.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1380.8
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.25997 -0.71572 -0.05602  0.85068  1.69292 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  22.53    4.747  
    ##  Residual             684.84   26.169  
    ## Number of obs: 148, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   59.847      2.482  24.111
    ## Target.L      -2.054      3.048  -0.674
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L 0.013

``` r
aov.swap_targetNP <- Anova(swap_targetNP.lmm.lme4)
```

## NA

``` r
d <- data %>% filter(nontargetContrast==0)
swap_targetNA.lmm.lme4 <- lmer(twoIncorrect ~ Target + (1|SID), data = d)
summary(swap_targetNA.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 847.5
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.20230 -0.77296  0.00525  0.55820  2.85949 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 102.0    10.1    
    ##  Residual             524.5    22.9    
    ## Number of obs: 93, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   30.553      3.533   8.648
    ## Target.L     -11.263      3.367  -3.345
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L -0.007

``` r
aov.swap_targetNA <- Anova(swap_targetNA.lmm.lme4)
```

## TPNP

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==1)
swap_targetTPNP.lmm.lme4 <- lmer(twoIncorrect ~ Target + (1|SID), data = d)
summary(swap_targetTPNP.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 744.1
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.10515 -0.72244  0.07554  0.56405  3.05291 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  27.83    5.275  
    ##  Residual             350.90   18.732  
    ## Number of obs: 86, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   44.677      2.440  18.312
    ## Target.L      -9.669      2.863  -3.378
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L 0.040

``` r
aov.swap_targetTPNP <- Anova(swap_targetTPNP.lmm.lme4)
```

## TANP

``` r
d <- data %>% filter(targetContrast==0, nontargetContrast==1)
swap_targetTANP.lmm.lme4 <- lmer(twoIncorrect ~ Target + (1|SID), data = d)
summary(swap_targetTANP.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 527.2
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -4.1266 -0.4497  0.0928  0.7841  1.3303 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   4.302   2.074  
    ##  Residual             333.740  18.269  
    ## Number of obs: 62, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   80.744      2.390  33.786
    ## Target.L       6.237      3.287   1.897
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L -0.031

``` r
aov.swap_targetTANP <- Anova(swap_targetTANP.lmm.lme4)
```

## TPNA

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==0)
swap_targetTPNA.lmm.lme4 <- lmer(twoIncorrect ~ Target + (1|SID), data = d)
summary(swap_targetTPNA.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 782.3
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.91494 -0.78182  0.04618  0.51983  2.44701 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 176.5    13.29   
    ##  Residual             432.3    20.79   
    ## Number of obs: 87, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error t value
    ## (Intercept)   32.633      4.094   7.972
    ## Target.L     -11.046      3.160  -3.496
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L 0.007

``` r
aov.swap_targetTPNA <- Anova(swap_targetTPNA.lmm.lme4)
```

# target contrast

``` r
d <- data
swap_targetContrast.lmm.lme4 <- lmer(twoIncorrect ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrast.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 2233.7
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.2079 -0.4962  0.1633  0.6497  2.5721 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  39.15    6.257  
    ##  Residual             616.99   24.839  
    ## Number of obs: 241, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error t value
    ## (Intercept)        55.977      2.413   23.20
    ## targetContrast.L   24.271      2.533    9.58
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.330

``` r
aov.swap_targetContrast <- Anova(swap_targetContrast.lmm.lme4)
```

## T1

``` r
d <- data %>% filter(Target==1)
swap_targetContrastT1.lmm.lme4 <- lmer(twoIncorrect ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1089.6
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.5555 -0.5125  0.0536  0.6110  2.5089 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  70.69    8.408  
    ##  Residual             469.84   21.676  
    ## Number of obs: 121, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error t value
    ## (Intercept)        58.665      3.133  18.727
    ## targetContrast.L   17.750      3.194   5.558
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.348

``` r
aov.swap_targetContrastT1 <- Anova(swap_targetContrastT1.lmm.lme4)
```

## T2

``` r
d <- data %>% filter(Target==2)
swap_targetContrastT2.lmm.lme4 <- lmer(twoIncorrect ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1116.6
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.92316 -0.58826  0.09704  0.71480  2.56348 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   7.575   2.752  
    ##  Residual             693.318  26.331  
    ## Number of obs: 120, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error t value
    ## (Intercept)        53.392      2.722  19.612
    ## targetContrast.L   31.444      3.715   8.464
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.388

``` r
aov.swap_targetContrastT2 <- Anova(swap_targetContrastT2.lmm.lme4)
```

## NP

``` r
d <- data %>% filter(nontargetContrast==1)
swap_targetContrastNP.lmm.lme4 <- lmer(twoIncorrect ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNP.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1292.7
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.9888 -0.4892  0.1067  0.6600  2.8854 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  25.74    5.073  
    ##  Residual             366.02   19.132  
    ## Number of obs: 148, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error t value
    ## (Intercept)        62.803      2.072   30.31
    ## targetContrast.L   25.119      2.270   11.07
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.134

``` r
aov.swap_targetContrastNP <- Anova(swap_targetContrastNP.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(nontargetContrast==1, Target==1)
swap_targetContrastNPT1.lmm.lme4 <- lmer(twoIncorrect ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNPT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 646.4
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.8157 -0.5411  0.0133  0.5905  2.4978 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  39.85    6.313  
    ##  Residual             337.11   18.361  
    ## Number of obs: 75, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error t value
    ## (Intercept)        63.805      2.722  23.439
    ## targetContrast.L   17.381      3.083   5.637
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.170

``` r
aov.swap_targetContrastNPT1 <- Anova(swap_targetContrastNPT1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(nontargetContrast==1, Target==2)
swap_targetContrastNPT2.lmm.lme4 <- lmer(twoIncorrect ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNPT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 624.2
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.0686 -0.5600  0.0705  0.6816  3.3314 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  16.38    4.047  
    ##  Residual             330.53   18.180  
    ## Number of obs: 73, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error t value
    ## (Intercept)        61.398      2.398   25.60
    ## targetContrast.L   33.267      3.047   10.92
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.118

``` r
aov.swap_targetContrastNPT2 <- Anova(swap_targetContrastNPT2.lmm.lme4)
```

## NA

``` r
d <- data %>% filter(nontargetContrast==0)
swap_targetContrastNA.lmm.lme4 <- lmer(twoIncorrect ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNA.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 842.4
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.67632 -0.66662  0.04569  0.59442  2.18029 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 145.0    12.04   
    ##  Residual             484.9    22.02   
    ## Number of obs: 93, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error t value
    ## (Intercept)        12.942      5.834   2.218
    ## targetContrast.L  -27.997      6.992  -4.004
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.749

``` r
aov.swap_targetContrastNA <- Anova(swap_targetContrastNA.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(nontargetContrast==0, Target==1)
swap_targetContrastNAT1.lmm.lme4 <- lmer(twoIncorrect ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNAT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 396.2
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.8575 -0.5541  0.1054  0.6557  1.5527 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 246.2    15.69   
    ##  Residual             281.8    16.79   
    ## Number of obs: 46, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error t value
    ## (Intercept)        15.693      7.792   2.014
    ## targetContrast.L  -35.116      9.398  -3.736
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.792

``` r
aov.swap_targetContrastNAT1 <- Anova(swap_targetContrastNAT1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(nontargetContrast==0, Target==2)
swap_targetContrastNAT2.lmm.lme4 <- lmer(twoIncorrect ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNAT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 415.1
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.6061 -0.5593 -0.0826  0.4873  2.4369 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 289.9    17.03   
    ##  Residual             353.4    18.80   
    ## Number of obs: 47, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error t value
    ## (Intercept)         7.217      6.887   1.048
    ## targetContrast.L  -25.195      7.533  -3.345
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.657

``` r
aov.swap_targetContrastNAT2 <- Anova(swap_targetContrastNAT2.lmm.lme4)
```

# nontarget contrast

``` r
d <- data
swap_nontargetContrast.lmm.lme4 <- lmer(twoIncorrect ~ nontargetContrast + (1|SID), data = d)
summary(swap_targetContrast.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 2233.7
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.2079 -0.4962  0.1633  0.6497  2.5721 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  39.15    6.257  
    ##  Residual             616.99   24.839  
    ## Number of obs: 241, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error t value
    ## (Intercept)        55.977      2.413   23.20
    ## targetContrast.L   24.271      2.533    9.58
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.330

``` r
aov.swap_nontargetContrast <- Anova(swap_nontargetContrast.lmm.lme4)
```

## T1

``` r
d <- data %>% filter(Target==1)
swap_nontargetContrastT1.lmm.lme4 <- lmer(twoIncorrect ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1089.9
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.50874 -0.71193 -0.04347  0.75151  1.94021 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  79.41    8.911  
    ##  Residual             466.77   21.605  
    ## Number of obs: 121, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error t value
    ## (Intercept)           49.926      3.069  16.268
    ## nontargetContrast.L  -15.937      2.869  -5.556
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.157

``` r
aov.swap_nontargetContrastT1 <- Anova(swap_nontargetContrastT1.lmm.lme4)
```

## T2

``` r
d <- data %>% filter(Target==2)
swap_nontargetContrastT2.lmm.lme4 <- lmer(twoIncorrect ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1133.8
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.1012 -0.7838 -0.0678  0.8983  2.6653 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  10.08    3.175  
    ##  Residual             799.59   28.277  
    ## Number of obs: 120, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error t value
    ## (Intercept)           40.560      2.771  14.637
    ## nontargetContrast.L  -25.442      3.742  -6.799
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.206

``` r
aov.swap_nontargetContrastT2 <- Anova(swap_nontargetContrastT2.lmm.lme4)
```

## TP

``` r
d <- data %>% filter(targetContrast==1)
swap_nontargetContrastTP.lmm.lme4 <- lmer(twoIncorrect ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTP.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1561.7
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.57884 -0.68146 -0.00527  0.66346  2.73431 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  72.18    8.496  
    ##  Residual             471.14   21.706  
    ## Number of obs: 173, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error t value
    ## (Intercept)           38.855      2.746   14.15
    ## nontargetContrast.L   -8.688      2.336   -3.72
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L -0.004

``` r
aov.swap_nontargetContrastTP <- Anova(swap_nontargetContrastTP.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(targetContrast==1, Target==1)
swap_nontargetContrastTPT1.lmm.lme4 <- lmer(twoIncorrect ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTPT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 767.6
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.97279 -0.70535 -0.06278  0.59488  2.85891 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  90.88    9.533  
    ##  Residual             306.96   17.520  
    ## Number of obs: 89, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error t value
    ## (Intercept)           46.024      3.084  14.923
    ## nontargetContrast.L   -7.765      2.628  -2.954
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.008

``` r
aov.swap_nontargetContrastTPT1 <- Anova(swap_nontargetContrastTPT1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(targetContrast==1, Target==2)
swap_nontargetContrastTPT2.lmm.lme4 <- lmer(twoIncorrect ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTPT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 759.6
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.05709 -0.78974 -0.04454  0.69163  2.55407 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 112.6    10.61   
    ##  Residual             485.0    22.02   
    ## Number of obs: 84, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error t value
    ## (Intercept)           31.105      3.651   8.521
    ## nontargetContrast.L   -9.031      3.407  -2.650
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L -0.017

``` r
aov.swap_nontargetContrastTPT2 <- Anova(swap_nontargetContrastTPT2.lmm.lme4)
```

## TA

``` r
d <- data %>% filter(targetContrast==0)
swap_nontargetContrastTA.lmm.lme4 <- lmer(twoIncorrect ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTA.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 575.7
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -4.4422 -0.2835  0.1155  0.6220  1.1525 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   6.545   2.558  
    ##  Residual             319.488  17.874  
    ## Number of obs: 68, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error t value
    ## (Intercept)           40.427      3.922   10.31
    ## nontargetContrast.L  -57.199      5.461  -10.47
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.814

``` r
aov.swap_nontargetContrastTA <- Anova(swap_nontargetContrastTA.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(targetContrast==0, Target==1)
swap_nontargetContrastTAT1.lmm.lme4 <- lmer(twoIncorrect ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTAT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 277.9
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.1474 -0.3972  0.1613  0.6097  1.1092 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  40.52    6.366  
    ##  Residual             490.14   22.139  
    ## Number of obs: 32, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error t value
    ## (Intercept)           37.006      8.493   4.357
    ## nontargetContrast.L  -55.488     11.731  -4.730
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.862

``` r
aov.swap_nontargetContrastTAT1 <- Anova(swap_nontargetContrastTAT1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(targetContrast==0, Target==2)
swap_nontargetContrastTAT2.lmm.lme4 <- lmer(twoIncorrect ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTAT2.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: twoIncorrect ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 267.5
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.0868 -0.4560  0.0000  0.5325  1.2979 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0       0.0    
    ##  Residual             130      11.4    
    ## Number of obs: 36, groups:  SID, 14
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error t value
    ## (Intercept)           42.600      3.024   14.09
    ## nontargetContrast.L  -60.245      4.276  -14.09
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.778 
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_nontargetContrastTAT2 <- Anova(swap_nontargetContrastTAT2.lmm.lme4)
```
