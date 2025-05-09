tazoot_swap_LMM
================
Jenny
2025-04-30

``` r
d <- data
swap.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity * Target * targetContrast * nontargetContrast + (1|SID), data = d)
summary(swap.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: 
    ## point93_SwapAcc ~ Validity * Target * targetContrast * nontargetContrast +  
    ##     (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1866.2
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.1124 -0.5787  0.0368  0.5907  3.2419 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  56.14    7.493  
    ##  Residual             380.90   19.517  
    ## Number of obs: 223, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                                                 Estimate Std. Error       df
    ## (Intercept)                                      39.0248     5.8790 174.1480
    ## Validity.L                                       -7.7079    10.9187 189.7054
    ## Validity.Q                                        3.2013     2.9785 191.4471
    ## Target.L                                         -1.5129     2.4308 191.1086
    ## targetContrast.L                                  0.4276     7.8603 194.3756
    ## nontargetContrast.L                             -32.1900     7.8100 193.4802
    ## Validity.L:Target.L                               3.6386     4.2033 190.3289
    ## Validity.Q:Target.L                              -4.0960     4.2099 191.3034
    ## Validity.L:targetContrast.L                     -13.7434    15.4427 189.7356
    ## Validity.Q:targetContrast.L                       4.0533     4.2345 191.3301
    ## Target.L:targetContrast.L                        12.4946     3.4795 191.7982
    ## Validity.L:nontargetContrast.L                   -6.0548    15.4038 189.6872
    ## Validity.Q:nontargetContrast.L                    0.6999     3.7245 189.8279
    ## Target.L:nontargetContrast.L                     -1.2411     3.0626 189.7311
    ## targetContrast.L:nontargetContrast.L            -33.3323    11.0204 193.5420
    ## Validity.L:Target.L:targetContrast.L              6.8594     6.0367 190.5180
    ## Validity.Q:Target.L:targetContrast.L             -6.5182     5.9874 191.3693
    ## Validity.L:Target.L:nontargetContrast.L          -6.6716     5.3515 190.2719
    ## Validity.Q:Target.L:nontargetContrast.L           2.4845     5.2676 189.8398
    ## Validity.L:targetContrast.L:nontargetContrast.L -16.1027    21.7783 189.6771
    ##                                                 t value Pr(>|t|)    
    ## (Intercept)                                       6.638 3.89e-10 ***
    ## Validity.L                                       -0.706 0.481096    
    ## Validity.Q                                        1.075 0.283818    
    ## Target.L                                         -0.622 0.534431    
    ## targetContrast.L                                  0.054 0.956675    
    ## nontargetContrast.L                              -4.122 5.58e-05 ***
    ## Validity.L:Target.L                               0.866 0.387771    
    ## Validity.Q:Target.L                              -0.973 0.331806    
    ## Validity.L:targetContrast.L                      -0.890 0.374617    
    ## Validity.Q:targetContrast.L                       0.957 0.339672    
    ## Target.L:targetContrast.L                         3.591 0.000419 ***
    ## Validity.L:nontargetContrast.L                   -0.393 0.694710    
    ## Validity.Q:nontargetContrast.L                    0.188 0.851149    
    ## Target.L:nontargetContrast.L                     -0.405 0.685748    
    ## targetContrast.L:nontargetContrast.L             -3.025 0.002827 ** 
    ## Validity.L:Target.L:targetContrast.L              1.136 0.257260    
    ## Validity.Q:Target.L:targetContrast.L             -1.089 0.277683    
    ## Validity.L:Target.L:nontargetContrast.L          -1.247 0.214048    
    ## Validity.Q:Target.L:nontargetContrast.L           0.472 0.637711    
    ## Validity.L:targetContrast.L:nontargetContrast.L  -0.739 0.460582    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

    ## fit warnings:
    ## fixed-effect model matrix is rank deficient so dropping 4 columns / coefficients

``` r
aov.swap <- Anova(swap.lmm.lme4)
```

# validity

``` r
d <- data
swap_validity.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validity.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 2118.8
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.06139 -0.64037 -0.00236  0.74440  2.21287 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  65.7     8.105  
    ##  Residual             795.2    28.199  
    ## Number of obs: 223, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   48.748      2.827  13.723  17.243 1.08e-10 ***
    ## Validity.L    -2.470      3.290 208.299  -0.751    0.454    
    ## Validity.Q     3.373      3.275 208.296   1.030    0.304    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
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
swap_validityTP.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1495.2
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.15469 -0.59214  0.09021  0.70610  2.92130 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  66.02    8.125  
    ##  Residual             510.12   22.586  
    ## Number of obs: 165, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error       df t value Pr(>|t|)    
    ## (Intercept)  39.1828     2.7406  14.6230  14.297 5.38e-10 ***
    ## Validity.L    1.6308     3.0687 149.4438   0.531    0.596    
    ## Validity.Q    0.6648     3.0448 150.2239   0.218    0.827    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L -0.025       
    ## Validity.Q  0.010 -0.029

``` r
aov.swap_validityTP <- Anova(swap_validityTP.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(targetContrast==1, Target==1)
swap_validityTPT1.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTPT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
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
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   46.098      3.076 14.097  14.987 4.68e-10 ***
    ## Validity.L     2.867      3.393 72.108   0.845    0.401    
    ## Validity.Q    -0.170      3.436 72.365  -0.049    0.961    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
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
swap_validityTPT2.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTPT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
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
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)  30.7019     3.9612 14.1412   7.751 1.85e-06 ***
    ## Validity.L    1.4418     4.6684 61.5114   0.309    0.758    
    ## Validity.Q    0.2611     4.5369 62.9983   0.058    0.954    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
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
swap_validityTA.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTA.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 510.5
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.3696 -0.2401  0.1562  0.5988  1.3262 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0       0.00   
    ##  Residual             525      22.91   
    ## Number of obs: 58, groups:  SID, 14
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   77.593      3.026 55.000  25.646   <2e-16 ***
    ## Validity.L    -6.184      5.232 55.000  -1.182   0.2423    
    ## Validity.Q     9.775      5.249 55.000   1.862   0.0679 .  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.105       
    ## Validity.Q -0.004  0.074
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_validityTA <- Anova(swap_validityTA.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(targetContrast==0, Target==1)
swap_validityTAT1.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTAT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 228.2
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.3600 -0.2947  0.1022  0.5638  1.8073 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0.0     0      
    ##  Residual             575.8    24      
    ## Number of obs: 27, groups:  SID, 13
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   72.504      4.783  24.000  15.158 8.64e-14 ***
    ## Validity.L   -14.091      8.762  24.000  -1.608   0.1209    
    ## Validity.Q    19.439      7.778  24.000   2.499   0.0197 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
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
swap_validityTAT2.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTAT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
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
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)  83.5772     3.4640 15.1755  24.127 1.61e-13 ***
    ## Validity.L   -0.8983     5.5121 23.9100  -0.163    0.872    
    ## Validity.Q   -4.8124     6.2597 23.8140  -0.769    0.450    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
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
swap_validityNP.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityNP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1263.9
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.26761 -0.67085 -0.00821  0.75208  1.86703 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  32.35    5.687  
    ##  Residual             639.74   25.293  
    ## Number of obs: 137, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   59.420      2.625  14.160  22.633 1.61e-12 ***
    ## Validity.L    -5.446      3.769 125.220  -1.445    0.151    
    ## Validity.Q     4.197      3.746 123.180   1.121    0.265    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L 0.020        
    ## Validity.Q 0.002  0.017

``` r
aov.swap_validityNP <- Anova(swap_validityNP.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(nontargetContrast==1, Target==1)
swap_validityNPT1.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityNPT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 620.3
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.4288 -0.7094 -0.1098  0.6504  2.1629 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  54.41    7.377  
    ##  Residual             416.16   20.400  
    ## Number of obs: 71, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   59.319      3.104  14.702  19.110 8.65e-12 ***
    ## Validity.L   -10.078      4.289  56.620  -2.350   0.0223 *  
    ## Validity.Q     4.835      4.164  56.786   1.161   0.2505    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L 0.058        
    ## Validity.Q 0.035  0.051

``` r
aov.swap_validityNPT1 <- Anova(swap_validityNPT1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(nontargetContrast==1, Target==2)
swap_validityNPT2.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityNPT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
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
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)  59.7060     3.6999 63.0000  16.137   <2e-16 ***
    ## Validity.L   -0.6315     6.3340 63.0000  -0.100    0.921    
    ## Validity.Q    2.5751     6.4819 63.0000   0.397    0.693    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
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
swap_validityNA.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityNA.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 784.6
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.93055 -0.66741  0.05077  0.59758  2.45260 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 104.2    10.21   
    ##  Residual             579.4    24.07   
    ## Number of obs: 86, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   32.110      3.711 14.767   8.654 3.64e-07 ***
    ## Validity.L     4.364      4.524 70.386   0.965    0.338    
    ## Validity.Q     1.972      4.504 71.063   0.438    0.663    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L -0.030       
    ## Validity.Q  0.007 -0.033

``` r
aov.swap_validityNA <- Anova(swap_validityNA.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(nontargetContrast==0, Target==1)
swap_validityNAT1.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityNAT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 387.8
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.3171 -0.5524  0.1051  0.6224  1.5570 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 200.7    14.17   
    ##  Residual             343.7    18.54   
    ## Number of obs: 45, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   39.534      4.593 14.001   8.607 5.78e-07 ***
    ## Validity.L     9.973      4.787 28.094   2.083   0.0464 *  
    ## Validity.Q     1.750      4.835 28.805   0.362   0.7201    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.000       
    ## Validity.Q -0.009  0.000

``` r
aov.swap_validityNAT1 <- Anova(swap_validityNAT1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(nontargetContrast==0, Target==2)
swap_validityNAT2.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityNAT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
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
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   24.066      5.737 13.342   4.195 0.000994 ***
    ## Validity.L     0.593      5.546 24.361   0.107 0.915729    
    ## Validity.Q     1.057      5.520 25.324   0.191 0.849675    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
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
swap_validityTPNP.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTPNP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 700.6
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.2620 -0.5261  0.1361  0.5790  2.7098 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0.0     0.00   
    ##  Residual             404.5    20.11   
    ## Number of obs: 81, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error       df t value Pr(>|t|)    
    ## (Intercept) 45.55797    2.23798 78.00000  20.357   <2e-16 ***
    ## Validity.L  -2.36834    3.91339 78.00000  -0.605    0.547    
    ## Validity.Q   0.07523    3.83884 78.00000   0.020    0.984    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L -0.047       
    ## Validity.Q  0.027 -0.033
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_validityTPNP <- Anova(swap_validityTPNP.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==1, Target==1)
swap_validityTPNP_T1.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTPNP_T1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
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
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)  51.5146     2.5883 14.0000  19.903 1.15e-11 ***
    ## Validity.L   -4.2388     4.0978 28.0000  -1.034    0.310    
    ## Validity.Q    0.7198     4.0978 28.0000   0.176    0.862    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
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
swap_validityTPNP_T2.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTPNP_T2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
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
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   37.815      3.746 33.000  10.094 1.28e-11 ***
    ## Validity.L     1.636      6.634 33.000   0.247    0.807    
    ## Validity.Q    -1.734      6.339 33.000  -0.274    0.786    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
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
swap_validityTANP.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTANP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 467.4
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -4.0521 -0.3402  0.0839  0.5611  1.4625 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0.0     0.00   
    ##  Residual             328.8    18.13   
    ## Number of obs: 56, groups:  SID, 14
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   80.490      2.444 53.000  32.931   <2e-16 ***
    ## Validity.L    -2.772      4.213 53.000  -0.658   0.5135    
    ## Validity.Q     8.587      4.254 53.000   2.019   0.0486 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.128       
    ## Validity.Q -0.014  0.090
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_validityTANP <- Anova(swap_validityTANP.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(targetContrast==0, nontargetContrast==1, Target==1)
swap_validityTANP_T1.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTANP_T1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 212.3
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.2599 -0.4209  0.1955  0.4742  1.3798 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 180.8    13.45   
    ##  Residual             290.8    17.05   
    ## Number of obs: 26, groups:  SID, 13
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   71.901      5.227   7.453  13.756 1.45e-06 ***
    ## Validity.L   -15.918      6.597   9.999  -2.413   0.0365 *  
    ## Validity.Q    11.516      6.013  10.260   1.915   0.0837 .  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L 0.185        
    ## Validity.Q 0.117  0.161

``` r
aov.swap_validityTANP_T1 <- Anova(swap_validityTANP_T1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(targetContrast==0, nontargetContrast==1, Target==2)
swap_validityTANP_T2.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTANP_T2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
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
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   86.227      1.842 27.000  46.799   <2e-16 ***
    ## Validity.L     4.754      3.014 27.000   1.577    0.126    
    ## Validity.Q    -1.509      3.359 27.000  -0.449    0.657    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
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
swap_validityTPNA.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTPNA.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 758.8
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.78798 -0.59866  0.02405  0.52920  2.15533 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 177.0    13.30   
    ##  Residual             494.4    22.23   
    ## Number of obs: 84, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   33.132      4.212 14.459   7.866 1.35e-06 ***
    ## Validity.L     5.499      4.213 67.796   1.305    0.196    
    ## Validity.Q     1.514      4.227 68.336   0.358    0.721    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L -0.018       
    ## Validity.Q  0.002 -0.023

``` r
aov.swap_validityTPNA <- Anova(swap_validityTPNA.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==1, Target==1)
swap_validityTPNA_T1.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTPNA_T1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
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
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)  51.5146     2.5883 14.0000  19.903 1.15e-11 ***
    ## Validity.L   -4.2388     4.0978 28.0000  -1.034    0.310    
    ## Validity.Q    0.7198     4.0978 28.0000   0.176    0.862    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
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
swap_validityTPNA_T2.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityTPNA_T2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
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
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   37.815      3.746 33.000  10.094 1.28e-11 ***
    ## Validity.L     1.636      6.634 33.000   0.247    0.807    
    ## Validity.Q    -1.734      6.339 33.000  -0.274    0.786    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
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
swap_validityT1.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1054.8
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.47847 -0.60303 -0.07893  0.67383  2.35335 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  80.54    8.974  
    ##  Residual             542.05   23.282  
    ## Number of obs: 116, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   51.752      3.179  14.124  16.279 1.51e-10 ***
    ## Validity.L    -2.641      3.791 100.023  -0.697    0.488    
    ## Validity.Q     3.261      3.733 100.967   0.873    0.384    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L 0.030        
    ## Validity.Q 0.016  0.030

``` r
aov.swap_validityT1 <- Anova(swap_validityT1.lmm.lme4)
```

## T2

``` r
d <- data %>% filter(Target==2)
swap_validityT2.lmm.lme4 <- lmer(point93_SwapAcc ~ Validity + (1|SID), data = d)
summary(swap_validityT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Validity + (1 | SID)
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
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   46.032      3.378 12.050  13.626  1.1e-08 ***
    ## Validity.L    -1.525      5.556 94.065  -0.274    0.784    
    ## Validity.Q     3.172      5.603 94.181   0.566    0.573    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
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
swap_target.lmm.lme4 <- lmer(point93_SwapAcc ~ Target + (1|SID), data = d)
summary(swap_target.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 2122.3
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.19441 -0.66735 -0.01901  0.79009  2.02244 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  66.71    8.167  
    ##  Residual             786.93   28.052  
    ## Number of obs: 223, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   48.597      2.834  13.721  17.150 1.16e-10 ***
    ## Target.L      -4.412      2.665 208.382  -1.656   0.0993 .  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L 0.029

``` r
aov.swap_target <- Anova(swap_target.lmm.lme4)
```

## TP

``` r
d <- data %>% filter(targetContrast==1)
swap_targetTP.lmm.lme4 <- lmer(point93_SwapAcc ~ Target + (1|SID), data = d)
summary(swap_targetTP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1480.8
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.09613 -0.66510 -0.05155  0.69775  2.78589 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  69.81    8.355  
    ##  Residual             447.04   21.143  
    ## Number of obs: 165, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   38.590      2.719  14.629   14.19 5.92e-10 ***
    ## Target.L     -10.612      2.343 150.693   -4.53 1.19e-05 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L 0.051

``` r
aov.swap_targetTP <- Anova(swap_targetTP.lmm.lme4)
```

## TA

``` r
d <- data %>% filter(targetContrast==0)
swap_targetTA.lmm.lme4 <- lmer(point93_SwapAcc ~ Target + (1|SID), data = d)
summary(swap_targetTA.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 518
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.5965 -0.2402  0.1205  0.7135  1.2023 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0       0.00   
    ##  Residual             534      23.11   
    ## Number of obs: 58, groups:  SID, 14
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   77.663      3.042 56.000  25.534   <2e-16 ***
    ## Target.L       7.702      4.301 56.000   1.791   0.0788 .  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L -0.069
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_targetTA <- Anova(swap_targetTA.lmm.lme4)
```

## NP

``` r
d <- data %>% filter(nontargetContrast==1)
swap_targetNP.lmm.lme4 <- lmer(point93_SwapAcc ~ Target + (1|SID), data = d)
summary(swap_targetNP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1272.1
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.37359 -0.71236 -0.02921  0.87193  1.69015 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  30.75    5.545  
    ##  Residual             652.49   25.544  
    ## Number of obs: 137, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error       df t value Pr(>|t|)    
    ## (Intercept)  59.5009     2.6233  14.0457  22.682 1.82e-12 ***
    ## Target.L     -0.3681     3.0966 124.5265  -0.119    0.906    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L 0.032

``` r
aov.swap_targetNP <- Anova(swap_targetNP.lmm.lme4)
```

## NA

``` r
d <- data %>% filter(nontargetContrast==0)
swap_targetNA.lmm.lme4 <- lmer(point93_SwapAcc ~ Target + (1|SID), data = d)
summary(swap_targetNA.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 782.2
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.2351 -0.7958  0.0061  0.5043  2.8309 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 106.8    10.33   
    ##  Residual             516.0    22.72   
    ## Number of obs: 86, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   31.803      3.634  14.903   8.752 2.95e-07 ***
    ## Target.L     -10.664      3.484  72.125  -3.061   0.0031 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L 0.036

``` r
aov.swap_targetNA <- Anova(swap_targetNA.lmm.lme4)
```

## TPNP

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==1)
swap_targetTPNP.lmm.lme4 <- lmer(point93_SwapAcc ~ Target + (1|SID), data = d)
summary(swap_targetTPNP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 696.1
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.0425 -0.6921 -0.0164  0.6293  3.2486 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   5.429   2.33   
    ##  Residual             349.660  18.70   
    ## Number of obs: 81, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   44.730      2.176 14.075  20.553 6.75e-12 ***
    ## Target.L      -9.595      2.958 66.248  -3.244  0.00185 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L 0.107

``` r
aov.swap_targetTPNP <- Anova(swap_targetTPNP.lmm.lme4)
```

## TANP

``` r
d <- data %>% filter(targetContrast==0, nontargetContrast==1)
swap_targetTANP.lmm.lme4 <- lmer(point93_SwapAcc ~ Target + (1|SID), data = d)
summary(swap_targetTANP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 472.3
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -4.1837 -0.4551  0.0454  0.7877  1.3950 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0.0     0.00   
    ##  Residual             321.3    17.93   
    ## Number of obs: 56, groups:  SID, 14
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   80.437      2.402 54.000  33.494   <2e-16 ***
    ## Target.L       7.697      3.396 54.000   2.266   0.0275 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L -0.071
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_targetTANP <- Anova(swap_targetTANP.lmm.lme4)
```

## TPNA

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==0)
swap_targetTPNA.lmm.lme4 <- lmer(point93_SwapAcc ~ Target + (1|SID), data = d)
summary(swap_targetTPNA.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 755.4
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.90682 -0.78900  0.06386  0.50229  2.43008 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 178.7    13.37   
    ##  Residual             433.0    20.81   
    ## Number of obs: 84, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   32.813      4.139  14.500   7.928 1.21e-06 ***
    ## Target.L     -10.786      3.235  69.347  -3.334  0.00138 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L 0.031

``` r
aov.swap_targetTPNA <- Anova(swap_targetTPNA.lmm.lme4)
```

# target contrast

``` r
d <- data
swap_targetContrast.lmm.lme4 <- lmer(point93_SwapAcc ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrast.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 2034.7
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.5514 -0.4797  0.1554  0.6041  2.7538 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  30.66    5.537  
    ##  Residual             536.85   23.170  
    ## Number of obs: 223, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)        58.116      2.292  18.023   25.36  1.5e-15 ***
    ## targetContrast.L   26.714      2.530 216.464   10.56  < 2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.384

``` r
aov.swap_targetContrast <- Anova(swap_targetContrast.lmm.lme4)
```

## T1

``` r
d <- data %>% filter(Target==1)
swap_targetContrastT1.lmm.lme4 <- lmer(point93_SwapAcc ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1034.4
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.7540 -0.5335  0.0692  0.6094  2.6749 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  76.44    8.743  
    ##  Residual             426.34   20.648  
    ## Number of obs: 116, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)        58.691      3.233  18.687  18.154 2.52e-13 ***
    ## targetContrast.L   17.789      3.274 105.662   5.433 3.58e-07 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.396

``` r
aov.swap_targetContrastT1 <- Anova(swap_targetContrastT1.lmm.lme4)
```

## T2

``` r
d <- data %>% filter(Target==2)
swap_targetContrastT2.lmm.lme4 <- lmer(point93_SwapAcc ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ targetContrast + (1 | SID)
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
    ##                  Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)        56.968      2.621  17.793   21.73 2.93e-14 ***
    ## targetContrast.L   36.668      3.498 101.368   10.48  < 2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
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
swap_targetContrastNP.lmm.lme4 <- lmer(point93_SwapAcc ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1191.8
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -4.1330 -0.4915  0.1315  0.6607  2.8789 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  14.77    3.843  
    ##  Residual             361.38   19.010  
    ## Number of obs: 137, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)        62.944      1.939  15.680   32.47 8.35e-16 ***
    ## targetContrast.L   24.672      2.354 130.704   10.48  < 2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.167

``` r
aov.swap_targetContrastNP <- Anova(swap_targetContrastNP.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(nontargetContrast==1, Target==1)
swap_targetContrastNPT1.lmm.lme4 <- lmer(point93_SwapAcc ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNPT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 610.9
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.7700 -0.5531  0.0501  0.5811  2.5091 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  48.46    6.961  
    ##  Residual             329.53   18.153  
    ## Number of obs: 71, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)        62.909      2.899 15.142  21.704 8.01e-13 ***
    ## targetContrast.L   16.114      3.216 61.015   5.011 4.93e-06 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.229

``` r
aov.swap_targetContrastNPT1 <- Anova(swap_targetContrastNPT1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(nontargetContrast==1, Target==2)
swap_targetContrastNPT2.lmm.lme4 <- lmer(point93_SwapAcc ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNPT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ targetContrast + (1 | SID)
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
    ##                  Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)        61.925      2.154 64.000   28.75   <2e-16 ***
    ## targetContrast.L   33.877      3.046 64.000   11.12   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
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
swap_targetContrastNA.lmm.lme4 <- lmer(point93_SwapAcc ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNA.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 779.5
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.6199 -0.6685  0.0000  0.5064  2.1172 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 178.2    13.35   
    ##  Residual             486.3    22.05   
    ## Number of obs: 86, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error      df t value Pr(>|t|)   
    ## (Intercept)         5.060      9.345  77.818   0.541  0.58972   
    ## targetContrast.L  -39.840     12.260  79.896  -3.250  0.00169 **
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.893

``` r
aov.swap_targetContrastNA <- Anova(swap_targetContrastNA.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(nontargetContrast==0, Target==1)
swap_targetContrastNAT1.lmm.lme4 <- lmer(point93_SwapAcc ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNAT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 387.6
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.84029 -0.58036  0.07305  0.64869  1.53837 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 249.7    15.80   
    ##  Residual             287.4    16.95   
    ## Number of obs: 45, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error     df t value Pr(>|t|)   
    ## (Intercept)         12.69      10.31  42.56   1.230  0.22537   
    ## targetContrast.L   -39.36      13.39  33.27  -2.941  0.00592 **
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.885

``` r
aov.swap_targetContrastNAT1 <- Anova(swap_targetContrastNAT1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(nontargetContrast==0, Target==2)
swap_targetContrastNAT2.lmm.lme4 <- lmer(point93_SwapAcc ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNAT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ targetContrast + (1 | SID)
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
    ##                  Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)         -7.71      10.39  38.72  -0.742 0.462340    
    ## targetContrast.L   -46.91      12.03  26.23  -3.898 0.000602 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
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
swap_nontargetContrast.lmm.lme4 <- lmer(point93_SwapAcc ~ nontargetContrast + (1|SID), data = d)
summary(swap_targetContrast.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 2034.7
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.5514 -0.4797  0.1554  0.6041  2.7538 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  30.66    5.537  
    ##  Residual             536.85   23.170  
    ## Number of obs: 223, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)        58.116      2.292  18.023   25.36  1.5e-15 ***
    ## targetContrast.L   26.714      2.530 216.464   10.56  < 2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.384

``` r
aov.swap_nontargetContrast <- Anova(swap_nontargetContrast.lmm.lme4)
```

## T1

``` r
d <- data %>% filter(Target==1)
swap_nontargetContrastT1.lmm.lme4 <- lmer(point93_SwapAcc ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1038.1
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.48502 -0.73003 -0.04633  0.71083  2.10197 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  91.26    9.553  
    ##  Residual             434.09   20.835  
    ## Number of obs: 116, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)           49.523      3.172  14.603   15.61 1.63e-10 ***
    ## nontargetContrast.L  -14.232      2.818 101.146   -5.05 1.96e-06 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.137

``` r
aov.swap_nontargetContrastT1 <- Anova(swap_nontargetContrastT1.lmm.lme4)
```

## T2

``` r
d <- data %>% filter(Target==2)
swap_nontargetContrastT2.lmm.lme4 <- lmer(point93_SwapAcc ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ nontargetContrast + (1 | SID)
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
    ##                     Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)           41.756      3.145  14.884  13.278 1.18e-09 ***
    ## nontargetContrast.L  -24.973      3.934  95.082  -6.347 7.43e-09 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
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
swap_nontargetContrastTP.lmm.lme4 <- lmer(point93_SwapAcc ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1486.7
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.63024 -0.66372  0.00978  0.65780  2.74126 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  71.39    8.449  
    ##  Residual             463.90   21.538  
    ## Number of obs: 165, groups:  SID, 15
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)           39.325      2.754  14.554  14.280 5.82e-10 ***
    ## nontargetContrast.L   -8.876      2.374 149.956  -3.738 0.000263 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L -0.011

``` r
aov.swap_nontargetContrastTP <- Anova(swap_nontargetContrastTP.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(targetContrast==1, Target==1)
swap_nontargetContrastTPT1.lmm.lme4 <- lmer(point93_SwapAcc ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTPT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ nontargetContrast + (1 | SID)
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
    ##                     Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)           46.024      3.084 14.075  14.923 5.06e-10 ***
    ## nontargetContrast.L   -7.765      2.628 73.200  -2.954  0.00421 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
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
swap_nontargetContrastTPT2.lmm.lme4 <- lmer(point93_SwapAcc ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTPT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ nontargetContrast + (1 | SID)
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
    ##                     Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)           31.069      3.945 14.095   7.875 1.57e-06 ***
    ## nontargetContrast.L   -9.324      3.482 60.972  -2.678   0.0095 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
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
swap_nontargetContrastTA.lmm.lme4 <- lmer(point93_SwapAcc ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTA.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 490.6
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -4.3878 -0.3162  0.1361  0.6044  1.0409 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0.0     0.00   
    ##  Residual             339.3    18.42   
    ## Number of obs: 58, groups:  SID, 14
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)           40.413      6.628  56.000   6.097 1.06e-07 ***
    ## nontargetContrast.L  -57.152      9.373  56.000  -6.097 1.06e-07 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.931 
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_nontargetContrastTA <- Anova(swap_nontargetContrastTA.lmm.lme4)
```

### T1

``` r
d <- data %>% filter(targetContrast==0, Target==1)
swap_nontargetContrastTAT1.lmm.lme4 <- lmer(point93_SwapAcc ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTAT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 233.7
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.7870 -0.2041  0.2244  0.5284  1.1603 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  98.21    9.91   
    ##  Residual             489.81   22.13   
    ## Number of obs: 27, groups:  SID, 13
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error     df t value Pr(>|t|)   
    ## (Intercept)            33.40      12.28  24.37   2.721  0.01183 * 
    ## nontargetContrast.L   -57.49      16.76  14.34  -3.430  0.00394 **
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.907

``` r
aov.swap_nontargetContrastTAT1 <- Anova(swap_nontargetContrastTAT1.lmm.lme4)
```

### T2

``` r
d <- data %>% filter(targetContrast==0, Target==2)
swap_nontargetContrastTAT2.lmm.lme4 <- lmer(point93_SwapAcc ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTAT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: point93_SwapAcc ~ nontargetContrast + (1 | SID)
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
    ##                     Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)           42.940      5.126  29.000   8.378 3.11e-09 ***
    ## nontargetContrast.L  -60.726      7.249  29.000  -8.378 3.11e-09 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.935 
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_nontargetContrastTAT2 <- Anova(swap_nontargetContrastTAT2.lmm.lme4)
```
