tazoot_swap_LMM_twoIncorrect
================
Jenny
2025-05-09

``` r
## Summary statistics
d <- data %>% group_by(Validity, Target, targetContrast, nontargetContrast) %>% 
  summarise(mean=mean(twoIncorrect), sd=sd(twoIncorrect), n=n_distinct(SID)) %>% mutate(se = sd / sqrt(n),
         ci.lower = mean - 1.96 * se,
         ci.upper = mean + 1.96 * se)
knitr::kable(d, digits=3, caption=sprintf("twoIncorrect swap"))
```

| Validity | Target | targetContrast | nontargetContrast | mean | sd | n | se | ci.lower | ci.upper |
|:---|:---|:---|:---|---:|---:|---:|---:|---:|---:|
| 1 | 1 | 1 | 1 | 57.616 | 15.442 | 18 | 3.640 | 50.482 | 64.750 |
| 1 | 1 | 1 | 0 | 33.004 | 17.647 | 18 | 4.159 | 24.852 | 41.157 |
| 1 | 1 | 0 | 1 | 88.269 | 11.705 | 15 | 3.022 | 82.346 | 94.193 |
| 1 | 1 | 0 | 0 | 0.000 | NA | 1 | NA | NA | NA |
| 1 | 2 | 1 | 1 | 37.380 | 20.078 | 18 | 4.732 | 28.104 | 46.655 |
| 1 | 2 | 1 | 0 | 23.094 | 18.189 | 18 | 4.287 | 14.691 | 31.497 |
| 1 | 2 | 0 | 1 | 84.529 | 12.491 | 17 | 3.029 | 78.591 | 90.466 |
| 1 | 2 | 0 | 0 | 0.000 | 0.000 | 3 | 0.000 | 0.000 | 0.000 |
| 2 | 1 | 1 | 1 | 49.661 | 17.889 | 18 | 4.217 | 41.397 | 57.926 |
| 2 | 1 | 1 | 0 | 45.682 | 25.165 | 17 | 6.103 | 33.719 | 57.644 |
| 2 | 1 | 0 | 1 | 62.295 | 29.846 | 10 | 9.438 | 43.796 | 80.794 |
| 2 | 1 | 0 | 0 | 0.000 | NA | 1 | NA | NA | NA |
| 2 | 2 | 1 | 1 | 41.161 | 28.005 | 16 | 7.001 | 27.438 | 54.883 |
| 2 | 2 | 1 | 0 | 23.125 | 29.701 | 16 | 7.425 | 8.571 | 37.679 |
| 2 | 2 | 0 | 1 | 80.539 | 23.047 | 10 | 7.288 | 66.254 | 94.823 |
| 3 | 1 | 1 | 1 | 48.378 | 14.398 | 18 | 3.394 | 41.727 | 55.030 |
| 3 | 1 | 1 | 0 | 46.880 | 22.112 | 18 | 5.212 | 36.665 | 57.095 |
| 3 | 1 | 0 | 1 | 74.693 | 19.836 | 7 | 7.497 | 59.998 | 89.388 |
| 3 | 2 | 1 | 1 | 42.101 | 18.654 | 16 | 4.664 | 32.960 | 51.241 |
| 3 | 2 | 1 | 0 | 31.125 | 28.891 | 17 | 7.007 | 17.391 | 44.859 |
| 3 | 2 | 0 | 1 | 83.866 | 17.553 | 12 | 5.067 | 73.934 | 93.797 |
| 3 | 2 | 0 | 0 | 0.000 | NA | 1 | NA | NA | NA |

twoIncorrect swap

``` r
library(ggplot2)
d <- data %>%
  mutate(TNTC = paste0("T", targetContrast, "_N", nontargetContrast))
ggplot(d, aes(x = Validity, y = twoIncorrect, color = TNTC)) + 
  geom_point() + stat_summary(
    fun = "mean",
    geom = "point",
    color = "red",
    size = 4
  ) +
  facet_grid(~Target) +
  theme_minimal()
```

![](tazoot_swap_LMM_twoIncorrect_files/figure-gfm/swapPlot-1.png)<!-- -->
\# full model \## combined contrast

``` r
d <- data %>% mutate(combinedContrast = paste(targetContrast, nontargetContrast, sep = "_"))
d <- d %>%
  mutate(combinedContrast = factor(combinedContrast,
                                   levels =  c("1_1", "1_0", "0_1"),
                                   ordered = TRUE))
swap.lmm.lme4 <- lmer(twoIncorrect ~ Validity * Target * combinedContrast + (1|SID), data = d)
summary(swap.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity * Target * combinedContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 2398
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.9379 -0.5978  0.0394  0.6670  3.2111 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  52.49    7.245  
    ##  Residual             390.10   19.751  
    ## Number of obs: 279, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                                      Estimate Std. Error       df t value
    ## (Intercept)                           52.6299     2.1073  18.0214  24.975
    ## Validity1                              1.2975     1.6651 245.7581   0.779
    ## Validity2                             -2.4521     1.7649 246.4557  -1.389
    ## Target1                                3.3900     1.2305 246.4960   2.755
    ## combinedContrast.L                    22.7215     2.2290 248.7744  10.193
    ## combinedContrast.Q                    23.1102     2.0389 245.9701  11.335
    ## Validity1:Target1                      2.3052     1.6652 245.7700   1.384
    ## Validity2:Target1                     -0.8901     1.7675 247.1812  -0.504
    ## Validity1:combinedContrast.L           4.6703     2.9631 245.9589   1.576
    ## Validity2:combinedContrast.L          -4.5922     3.1817 246.2586  -1.443
    ## Validity1:combinedContrast.Q           8.5844     2.7993 244.8363   3.067
    ## Validity2:combinedContrast.Q          -3.7549     2.9168 245.0513  -1.287
    ## Target1:combinedContrast.L            -6.8014     2.2169 246.3962  -3.068
    ## Target1:combinedContrast.Q            -5.6641     2.0390 245.9654  -2.778
    ## Validity1:Target1:combinedContrast.L   1.0698     2.9644 246.2358   0.361
    ## Validity2:Target1:combinedContrast.L  -1.9452     3.1840 246.6154  -0.611
    ## Validity1:Target1:combinedContrast.Q   6.5705     2.8013 245.1637   2.346
    ## Validity2:Target1:combinedContrast.Q  -4.8287     2.9186 245.3236  -1.654
    ##                                      Pr(>|t|)    
    ## (Intercept)                          1.96e-15 ***
    ## Validity1                             0.43660    
    ## Validity2                             0.16599    
    ## Target1                               0.00631 ** 
    ## combinedContrast.L                    < 2e-16 ***
    ## combinedContrast.Q                    < 2e-16 ***
    ## Validity1:Target1                     0.16752    
    ## Validity2:Target1                     0.61501    
    ## Validity1:combinedContrast.L          0.11627    
    ## Validity2:combinedContrast.L          0.15021    
    ## Validity1:combinedContrast.Q          0.00241 ** 
    ## Validity2:combinedContrast.Q          0.19919    
    ## Target1:combinedContrast.L            0.00240 ** 
    ## Target1:combinedContrast.Q            0.00589 ** 
    ## Validity1:Target1:combinedContrast.L  0.71849    
    ## Validity2:Target1:combinedContrast.L  0.54182    
    ## Validity1:Target1:combinedContrast.Q  0.01980 *  
    ## Validity2:Target1:combinedContrast.Q  0.09931 .  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
aov.swap <- Anova(swap.lmm.lme4)
print(aov.swap)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                                     Chisq Df Pr(>Chisq)    
    ## Validity                           1.3579  2  0.5071374    
    ## Target                            14.7177  1  0.0001249 ***
    ## combinedContrast                 234.2451  2  < 2.2e-16 ***
    ## Validity:Target                    1.5548  2  0.4595985    
    ## Validity:combinedContrast         11.8418  4  0.0185673 *  
    ## Target:combinedContrast           13.5186  2  0.0011600 ** 
    ## Validity:Target:combinedContrast   6.0736  4  0.1937186    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## targetContrast and nontargetContrast

``` r
d <- data 
swap.lmm.lme4 <- lmer(twoIncorrect ~ Validity * Target * targetContrast * nontargetContrast + (1|SID), data = d)
summary(swap.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: 
    ## twoIncorrect ~ Validity * Target * targetContrast * nontargetContrast +  
    ##     (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 2439.5
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.9490 -0.5802  0.0307  0.6504  3.2228 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  52.35    7.235  
    ##  Residual             387.10   19.675  
    ## Number of obs: 285, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                                               Estimate Std. Error        df
    ## (Intercept)                                   37.43252    3.34748  91.14510
    ## Validity1                                      3.31120    3.46498 258.61819
    ## Validity2                                     -3.23511    5.57335 250.78499
    ## Target1                                        2.57616    3.30631 251.48505
    ## targetContrast1                                2.44527    2.87992 257.11706
    ## nontargetContrast1                            24.62909    2.83616 255.65723
    ## Validity1:Target1                              1.34008    2.08792 248.18039
    ## Validity2:Target1                             -0.58794    2.25259 249.42326
    ## Validity1:targetContrast1                     -5.41566    3.45827 258.12250
    ## Validity2:targetContrast1                      3.17010    5.56531 249.97170
    ## Target1:targetContrast1                        4.37617    3.30156 250.86799
    ## Validity1:nontargetContrast1                   1.49375    3.41832 256.93966
    ## Validity2:nontargetContrast1                  -0.75280    5.56388 250.40352
    ## Target1:nontargetContrast1                    -1.49606    3.23000 250.41911
    ## targetContrast1:nontargetContrast1           -18.51033    2.83625 255.66951
    ## Validity1:Target1:targetContrast1             -0.75574    2.08806 248.17303
    ## Validity2:Target1:targetContrast1              1.37411    2.24278 248.55680
    ## Validity1:Target1:nontargetContrast1           3.64532    1.91326 246.42142
    ## Validity2:Target1:nontargetContrast1          -2.26898    1.95026 246.72971
    ## Validity1:targetContrast1:nontargetContrast1   2.11187    3.41837 256.95096
    ## Validity2:targetContrast1:nontargetContrast1   0.07685    5.55586 250.39954
    ## Target1:targetContrast1:nontargetContrast1     0.43226    3.21758 250.29861
    ##                                              t value Pr(>|t|)    
    ## (Intercept)                                   11.182  < 2e-16 ***
    ## Validity1                                      0.956   0.3402    
    ## Validity2                                     -0.580   0.5621    
    ## Target1                                        0.779   0.4366    
    ## targetContrast1                                0.849   0.3966    
    ## nontargetContrast1                             8.684 4.61e-16 ***
    ## Validity1:Target1                              0.642   0.5216    
    ## Validity2:Target1                             -0.261   0.7943    
    ## Validity1:targetContrast1                     -1.566   0.1186    
    ## Validity2:targetContrast1                      0.570   0.5694    
    ## Target1:targetContrast1                        1.325   0.1862    
    ## Validity1:nontargetContrast1                   0.437   0.6625    
    ## Validity2:nontargetContrast1                  -0.135   0.8925    
    ## Target1:nontargetContrast1                    -0.463   0.6436    
    ## targetContrast1:nontargetContrast1            -6.526 3.60e-10 ***
    ## Validity1:Target1:targetContrast1             -0.362   0.7177    
    ## Validity2:Target1:targetContrast1              0.613   0.5406    
    ## Validity1:Target1:nontargetContrast1           1.905   0.0579 .  
    ## Validity2:Target1:nontargetContrast1          -1.163   0.2458    
    ## Validity1:targetContrast1:nontargetContrast1   0.618   0.5373    
    ## Validity2:targetContrast1:nontargetContrast1   0.014   0.9890    
    ## Target1:targetContrast1:nontargetContrast1     0.134   0.8932    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

    ## fit warnings:
    ## fixed-effect model matrix is rank deficient so dropping 2 columns / coefficients

``` r
aov.swap <- Anova(swap.lmm.lme4)
print(aov.swap)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                                                    Chisq Df Pr(>Chisq)    
    ## Validity                                          1.3972  2  0.4972759    
    ## Target                                           14.6044  1  0.0001326 ***
    ## targetContrast                                   79.5686  1  < 2.2e-16 ***
    ## nontargetContrast                                50.9272  1  9.586e-13 ***
    ## Validity:Target                                   1.5652  2  0.4572125    
    ## Validity:targetContrast                           4.3042  2  0.1162409    
    ## Target:targetContrast                             9.6904  1  0.0018523 ** 
    ## Validity:nontargetContrast                        3.4338  2  0.1796214    
    ## Target:nontargetContrast                          0.4078  1  0.5230795    
    ## targetContrast:nontargetContrast                 55.5004  1  9.344e-14 ***
    ## Validity:Target:targetContrast                    0.3857  2  0.8246094    
    ## Validity:Target:nontargetContrast                 3.6913  2  0.1579237    
    ## Validity:targetContrast:nontargetContrast         0.4952  2  0.7806912    
    ## Target:targetContrast:nontargetContrast           0.0180  1  0.8931309    
    ## Validity:Target:targetContrast:nontargetContrast          0               
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## T1

``` r
d <- data %>% filter(Target==1)
swapT1.lmm.lme4 <- lmer(twoIncorrect ~ Validity * targetContrast * nontargetContrast + (1|SID), data = d)
summary(swapT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity * targetContrast * nontargetContrast +  
    ##     (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1172.2
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.1990 -0.6023  0.0000  0.7215  3.0836 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  82.28    9.071  
    ##  Residual             294.90   17.173  
    ## Number of obs: 141, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                                              Estimate Std. Error      df
    ## (Intercept)                                    40.097      5.350 113.389
    ## Validity1                                       4.466      6.676 120.237
    ## Validity2                                      -3.318      2.834 115.867
    ## targetContrast1                                 6.733      4.910 119.336
    ## nontargetContrast1                             23.133      4.864 118.184
    ## Validity1:targetContrast1                      -5.985      6.681 120.268
    ## Validity2:targetContrast1                       4.038      2.807 115.233
    ## Validity1:nontargetContrast1                    5.015      6.669 119.700
    ## Validity2:nontargetContrast1                   -2.944      2.362 113.286
    ## targetContrast1:nontargetContrast1            -18.078      4.870 118.201
    ## Validity1:targetContrast1:nontargetContrast1    2.236      6.876 119.375
    ##                                              t value Pr(>|t|)    
    ## (Intercept)                                    7.495 1.58e-11 ***
    ## Validity1                                      0.669 0.504814    
    ## Validity2                                     -1.171 0.244120    
    ## targetContrast1                                1.371 0.172897    
    ## nontargetContrast1                             4.756 5.63e-06 ***
    ## Validity1:targetContrast1                     -0.896 0.372121    
    ## Validity2:targetContrast1                      1.439 0.152915    
    ## Validity1:nontargetContrast1                   0.752 0.453560    
    ## Validity2:nontargetContrast1                  -1.246 0.215201    
    ## targetContrast1:nontargetContrast1            -3.712 0.000315 ***
    ## Validity1:targetContrast1:nontargetContrast1   0.325 0.745625    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldty1 Vldty2 trgtC1 nntrC1 Vldty1:tC1 Vldty2:tC1 Vldty1:nC1
    ## Validity1   -0.635                                                             
    ## Validity2   -0.265  0.141                                                      
    ## trgtCntrst1 -0.864  0.692  0.294                                               
    ## nntrgtCntr1 -0.839  0.677  0.286  0.915                                        
    ## Vldty1:trC1  0.635 -0.938 -0.217 -0.693 -0.677                                 
    ## Vldty2:trC1  0.266 -0.213 -0.649 -0.290 -0.287  0.141                          
    ## Vldty1:nnC1  0.621 -0.921 -0.225 -0.677 -0.693  0.921      0.225               
    ## Vldty2:nnC1  0.219 -0.176 -0.428 -0.244 -0.240  0.179      0.415      0.089    
    ## trgtCnt1:C1  0.839 -0.677 -0.291 -0.916 -0.942  0.678      0.287      0.692    
    ## Vldt1:C1:C1 -0.640  0.923  0.291  0.699  0.713 -0.924     -0.289     -0.941    
    ##             Vldty2:nC1 tC1:C1
    ## Validity1                    
    ## Validity2                    
    ## trgtCntrst1                  
    ## nntrgtCntr1                  
    ## Vldty1:trC1                  
    ## Vldty2:trC1                  
    ## Vldty1:nnC1                  
    ## Vldty2:nnC1                  
    ## trgtCnt1:C1  0.245           
    ## Vldt1:C1:C1 -0.258     -0.714
    ## fit warnings:
    ## fixed-effect model matrix is rank deficient so dropping 1 column / coefficient

``` r
aov.swapT1 <- Anova(swapT1.lmm.lme4)
print(aov.swapT1)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                                             Chisq Df Pr(>Chisq)    
    ## Validity                                   1.6438  2   0.439606    
    ## targetContrast                            22.2374  1  2.409e-06 ***
    ## nontargetContrast                         20.4909  1  5.992e-06 ***
    ## Validity:targetContrast                    3.7047  2   0.156864    
    ## Validity:nontargetContrast                 9.7907  2   0.007481 ** 
    ## targetContrast:nontargetContrast          24.6745  1  6.788e-07 ***
    ## Validity:targetContrast:nontargetContrast  0.1057  1   0.745055    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## T2

``` r
d <- data %>% filter(Target==2)
swapT2.lmm.lme4 <- lmer(twoIncorrect ~ Validity * targetContrast * nontargetContrast + (1|SID), data = d)
summary(swapT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity * targetContrast * nontargetContrast +  
    ##     (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1249.6
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.6424 -0.6668  0.0125  0.6162  3.1669 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  38.89    6.236  
    ##  Residual             462.13   21.497  
    ## Number of obs: 144, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                                              Estimate Std. Error       df
    ## (Intercept)                                   35.2073     3.9283  81.2047
    ## Validity1                                      0.9232     3.9450 127.6616
    ## Validity2                                     -2.6568     3.4333 121.1775
    ## targetContrast1                               -2.3004     3.6366 127.1507
    ## nontargetContrast1                            26.0735     3.5864 126.3100
    ## Validity1:targetContrast1                     -3.5934     3.9344 126.7264
    ## Validity2:targetContrast1                      1.8375     3.4346 120.1506
    ## Validity1:nontargetContrast1                  -1.3764     3.8771 125.5649
    ## Validity2:nontargetContrast1                   1.7394     3.0712 118.0892
    ## targetContrast1:nontargetContrast1           -18.9913     3.5703 126.2989
    ## Validity1:targetContrast1:nontargetContrast1   1.4371     3.5745 126.7516
    ##                                              t value Pr(>|t|)    
    ## (Intercept)                                    8.963 9.23e-14 ***
    ## Validity1                                      0.234    0.815    
    ## Validity2                                     -0.774    0.441    
    ## targetContrast1                               -0.633    0.528    
    ## nontargetContrast1                             7.270 3.31e-11 ***
    ## Validity1:targetContrast1                     -0.913    0.363    
    ## Validity2:targetContrast1                      0.535    0.594    
    ## Validity1:nontargetContrast1                  -0.355    0.723    
    ## Validity2:nontargetContrast1                   0.566    0.572    
    ## targetContrast1:nontargetContrast1            -5.319 4.58e-07 ***
    ## Validity1:targetContrast1:nontargetContrast1   0.402    0.688    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldty1 Vldty2 trgtC1 nntrC1 Vldty1:tC1 Vldty2:tC1 Vldty1:nC1
    ## Validity1   -0.447                                                             
    ## Validity2    0.256 -0.417                                                      
    ## trgtCntrst1 -0.766  0.469 -0.264                                               
    ## nntrgtCntr1 -0.731  0.435 -0.216  0.791                                        
    ## Vldty1:trC1  0.436 -0.714  0.248 -0.480 -0.437                                 
    ## Vldty2:trC1 -0.248  0.246 -0.598  0.275  0.218 -0.412                          
    ## Vldty1:nnC1  0.404 -0.677  0.194 -0.436 -0.465  0.678     -0.191               
    ## Vldty2:nnC1 -0.197  0.196 -0.445  0.208  0.226 -0.193      0.450     -0.388    
    ## trgtCnt1:C1  0.732 -0.434  0.204 -0.788 -0.820  0.433     -0.211      0.452    
    ## Vldt1:C1:C1 -0.360  0.655 -0.024  0.384  0.404 -0.653      0.024     -0.683    
    ##             Vldty2:nC1 tC1:C1
    ## Validity1                    
    ## Validity2                    
    ## trgtCntrst1                  
    ## nntrgtCntr1                  
    ## Vldty1:trC1                  
    ## Vldty2:trC1                  
    ## Vldty1:nnC1                  
    ## Vldty2:nnC1                  
    ## trgtCnt1:C1 -0.206           
    ## Vldt1:C1:C1  0.010     -0.414
    ## fit warnings:
    ## fixed-effect model matrix is rank deficient so dropping 1 column / coefficient

``` r
aov.swapT2 <- Anova(swapT2.lmm.lme4)
print(aov.swapT2)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                                             Chisq Df Pr(>Chisq)    
    ## Validity                                   1.0114  2     0.6031    
    ## targetContrast                            60.2841  1  8.211e-15 ***
    ## nontargetContrast                         31.6577  1  1.839e-08 ***
    ## Validity:targetContrast                    0.7462  2     0.6886    
    ## Validity:nontargetContrast                 0.3625  2     0.8342    
    ## targetContrast:nontargetContrast          32.0505  1  1.502e-08 ***
    ## Validity:targetContrast:nontargetContrast  0.1616  1     0.6877    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## TP

``` r
d <- data %>% filter(targetContrast==1)
swapTP.lmm.lme4 <- lmer(twoIncorrect ~ Validity * Target * nontargetContrast + (1|SID), data = d)
summary(swapTP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity * Target * nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1811.5
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.54012 -0.69706 -0.01169  0.66781  3.03277 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  64.88    8.055  
    ##  Residual             407.33   20.182  
    ## Number of obs: 208, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                                       Estimate Std. Error        df t value
    ## (Intercept)                           39.86551    2.36049  17.37279  16.889
    ## Validity1                             -2.09219    1.96293 179.58557  -1.066
    ## Validity2                             -0.07141    2.00324 180.29841  -0.036
    ## Target1                                6.96146    1.40295 179.88963   4.962
    ## nontargetContrast1                     6.08415    1.40247 179.74637   4.338
    ## Validity1:Target1                      0.57521    1.96318 179.63838   0.293
    ## Validity2:Target1                      0.78628    2.00361 180.37601   0.392
    ## Validity1:nontargetContrast1           3.64022    1.96283 179.56480   1.855
    ## Validity2:nontargetContrast1          -0.64640    2.00089 179.81401  -0.323
    ## Target1:nontargetContrast1            -1.02605    1.40242 179.73114  -0.732
    ## Validity1:Target1:nontargetContrast1   3.60757    1.96280 179.55699   1.838
    ## Validity2:Target1:nontargetContrast1  -2.29225    2.00096 179.82894  -1.146
    ##                                      Pr(>|t|)    
    ## (Intercept)                          3.22e-12 ***
    ## Validity1                              0.2879    
    ## Validity2                              0.9716    
    ## Target1                              1.61e-06 ***
    ## nontargetContrast1                   2.39e-05 ***
    ## Validity1:Target1                      0.7699    
    ## Validity2:Target1                      0.6952    
    ## Validity1:nontargetContrast1           0.0653 .  
    ## Validity2:nontargetContrast1           0.7470    
    ## Target1:nontargetContrast1             0.4653    
    ## Validity1:Target1:nontargetContrast1   0.0677 .  
    ## Validity2:Target1:nontargetContrast1   0.2535    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldty1 Vldty2 Targt1 nntrC1 Vl1:T1 Vl2:T1 Vl1:C1 Vl2:C1
    ## Validity1   -0.018                                                        
    ## Validity2    0.016 -0.498                                                 
    ## Target1     -0.019  0.023 -0.012                                          
    ## nntrgtCntr1  0.000  0.000 -0.011 -0.011                                   
    ## Vldty1:Trg1  0.013 -0.016  0.009 -0.030  0.008                            
    ## Vldty2:Trg1 -0.007  0.009 -0.041  0.027 -0.003 -0.498                     
    ## Vldty1:nnC1  0.000  0.000  0.008  0.008 -0.029 -0.005  0.002              
    ## Vldty2:nnC1 -0.006  0.008 -0.007 -0.003  0.025  0.002 -0.013 -0.498       
    ## Trgt1:nntC1 -0.006  0.007 -0.003  0.000 -0.031  0.000 -0.011  0.022 -0.011
    ## Vldt1:T1:C1  0.004 -0.005  0.002  0.000  0.022  0.000  0.008 -0.016  0.008
    ## Vldt2:T1:C1 -0.002  0.002 -0.013 -0.011 -0.011  0.008 -0.007  0.008 -0.038
    ##             Tr1:C1 V1:T1:
    ## Validity1                
    ## Validity2                
    ## Target1                  
    ## nntrgtCntr1              
    ## Vldty1:Trg1              
    ## Vldty2:Trg1              
    ## Vldty1:nnC1              
    ## Vldty2:nnC1              
    ## Trgt1:nntC1              
    ## Vldt1:T1:C1 -0.029       
    ## Vldt2:T1:C1  0.025 -0.498

``` r
aov.swapTP <- Anova(swapTP.lmm.lme4)
print(aov.swapTP)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                                     Chisq Df Pr(>Chisq)    
    ## Validity                           1.5383  2     0.4634    
    ## Target                            24.6350  1  6.928e-07 ***
    ## nontargetContrast                 18.7281  1  1.507e-05 ***
    ## Validity:Target                    0.4525  2     0.7975    
    ## Validity:nontargetContrast         4.0138  2     0.1344    
    ## Target:nontargetContrast           0.4553  1     0.4998    
    ## Validity:Target:nontargetContrast  3.4487  2     0.1783    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## TP T1

``` r
d <- data %>% filter(Target==1, targetContrast==1)
swapTPT1.lmm.lme4 <- lmer(twoIncorrect ~ Validity * nontargetContrast + (1|SID), data = d)
summary(swapTPT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity * nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 901.3
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.3055 -0.6983 -0.0519  0.7367  3.0556 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  70.73    8.41   
    ##  Residual             292.97   17.12   
    ## Number of obs: 107, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                              Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)                   46.8332     2.5829 17.0794  18.132 1.36e-12 ***
    ## Validity1                     -1.5233     2.3356 84.1597  -0.652  0.51605    
    ## Validity2                      0.7274     2.3544 84.3608   0.309  0.75811    
    ## nontargetContrast1             5.0518     1.6559 84.2275   3.051  0.00305 ** 
    ## Validity1:nontargetContrast1   7.2541     2.3356 84.1597   3.106  0.00259 ** 
    ## Validity2:nontargetContrast1  -2.9512     2.3544 84.3608  -1.253  0.21350    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldty1 Vldty2 nntrC1 Vl1:C1
    ## Validity1   -0.005                            
    ## Validity2    0.010 -0.504                     
    ## nntrgtCntr1 -0.007  0.008 -0.015              
    ## Vldty1:nnC1  0.005 -0.005  0.011 -0.008       
    ## Vldty2:nnC1 -0.010  0.011 -0.021  0.015 -0.504

``` r
aov.swapTPT1 <- Anova(swapTPT1.lmm.lme4)
print(aov.swapTPT1)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                             Chisq Df Pr(>Chisq)   
    ## Validity                   0.4102  2   0.814584   
    ## nontargetContrast          9.4251  1   0.002140 **
    ## Validity:nontargetContrast 9.7773  2   0.007531 **
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## TP T2

``` r
d <- data %>% filter(Target==2, targetContrast==1)
swapTPT2.lmm.lme4 <- lmer(twoIncorrect ~ Validity * nontargetContrast + (1|SID), data = d)
summary(swapTPT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity * nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 897.1
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.09720 -0.73471 -0.00505  0.63556  2.70850 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  89.69    9.47   
    ##  Residual             499.22   22.34   
    ## Number of obs: 101, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                              Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)                   32.8147     3.1578 17.3672  10.392 7.09e-09 ***
    ## Validity1                     -2.5780     3.1003 79.0599  -0.832  0.40817    
    ## Validity2                     -0.7186     3.2088 80.8013  -0.224  0.82336    
    ## nontargetContrast1             6.9778     2.2319 79.3030   3.126  0.00247 ** 
    ## Validity1:nontargetContrast1   0.1651     3.0990 78.9161   0.053  0.95765    
    ## Validity2:nontargetContrast1   1.7102     3.1957 79.3774   0.535  0.59404    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldty1 Vldty2 nntrC1 Vl1:C1
    ## Validity1   -0.037                            
    ## Validity2    0.028 -0.493                     
    ## nntrgtCntr1  0.008 -0.008 -0.008              
    ## Vldty1:nnC1 -0.006  0.006  0.006 -0.052       
    ## Vldty2:nnC1 -0.005  0.005  0.006  0.035 -0.492

``` r
aov.swapTPT2 <- Anova(swapTPT2.lmm.lme4)
print(aov.swapTPT2)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                             Chisq Df Pr(>Chisq)   
    ## Validity                   1.2506  2   0.535095   
    ## nontargetContrast          9.7750  1   0.001769 **
    ## Validity:nontargetContrast 0.4186  2   0.811165   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## TA

``` r
d <- data %>% filter(targetContrast==0)
swapTA.lmm.lme4 <- lmer(twoIncorrect ~ Validity  * Target * nontargetContrast + (1|SID), data = d)
summary(swapTA.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity * Target * nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 613.6
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.2214 -0.3341  0.0892  0.6274  1.9569 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  33.69    5.804  
    ##  Residual             309.23   17.585  
    ## Number of obs: 77, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                              Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)                    38.825      5.197 55.425   7.471 6.12e-10 ***
    ## Validity1                       4.530      6.008 66.897   0.754   0.4535    
    ## Validity2                       1.001      9.506 58.286   0.105   0.9165    
    ## Target1                        -5.646      5.566 60.015  -1.014   0.3145    
    ## nontargetContrast1             39.896      4.906 65.893   8.132 1.56e-11 ***
    ## Validity1:Target1               6.136      2.859 57.204   2.146   0.0361 *  
    ## Validity2:Target1              -4.735      3.190 58.058  -1.484   0.1431    
    ## Validity1:nontargetContrast1    3.309      5.901 66.814   0.561   0.5768    
    ## Validity2:nontargetContrast1   -8.693      9.488 58.346  -0.916   0.3633    
    ## Target1:nontargetContrast1      1.591      5.401 58.443   0.295   0.7693    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldty1 Vldty2 Targt1 nntrC1 Vl1:T1 Vl2:T1 Vl1:C1 Vl2:C1
    ## Validity1   -0.483                                                        
    ## Validity2    0.049 -0.465                                                 
    ## Target1      0.174  0.266 -0.670                                          
    ## nntrgtCntr1 -0.867  0.462 -0.045 -0.169                                   
    ## Vldty1:Trg1 -0.027  0.032  0.233 -0.313  0.000                            
    ## Vldty2:Trg1 -0.186  0.171 -0.136  0.123  0.156 -0.407                     
    ## Vldty1:nnC1  0.450 -0.885  0.444 -0.288 -0.484  0.018 -0.151              
    ## Vldty2:nnC1 -0.047  0.440 -0.944  0.660  0.052 -0.220  0.156 -0.485       
    ## Trgt1:nntC1 -0.159 -0.284  0.660 -0.919  0.177  0.218 -0.101  0.294 -0.662
    ## fit warnings:
    ## fixed-effect model matrix is rank deficient so dropping 2 columns / coefficients

``` r
aov.swapTA <- Anova(swapTA.lmm.lme4)
print(aov.swapTA)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                                      Chisq Df Pr(>Chisq)    
    ## Validity                            8.8736  2    0.01183 *  
    ## Target                              1.8227  1    0.17699    
    ## nontargetContrast                 106.7041  1    < 2e-16 ***
    ## Validity:Target                     5.0537  2    0.07991 .  
    ## Validity:nontargetContrast          0.8572  2    0.65141    
    ## Target:nontargetContrast            0.0868  1    0.76830    
    ## Validity:Target:nontargetContrast           0               
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## TA T1

``` r
d <- data %>% filter(Target==1, targetContrast==0)
swapTAT1.lmm.lme4 <- lmer(twoIncorrect ~ Validity * nontargetContrast + (1|SID), data = d)
summary(swapTAT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity * nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 267.7
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.32138 -0.34907  0.05318  0.46013  1.48692 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 159.8    12.64   
    ##  Residual             269.3    16.41   
    ## Number of obs: 34, groups:  SID, 17
    ## 
    ## Fixed effects:
    ##                              Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)                    36.074     10.022  24.319   3.599 0.001418 ** 
    ## Validity1                       6.440     13.341  19.312   0.483 0.634688    
    ## Validity2                     -10.753      4.508  17.194  -2.386 0.028815 *  
    ## nontargetContrast1             37.800      9.349  16.895   4.043 0.000854 ***
    ## Validity1:nontargetContrast1    8.803     13.433  18.644   0.655 0.520253    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldty1 Vldty2 nntrC1
    ## Validity1   -0.670                     
    ## Validity2   -0.227  0.151              
    ## nntrgtCntr1 -0.895  0.686  0.241       
    ## Vldty1:nnC1  0.659 -0.952 -0.249 -0.712
    ## fit warnings:
    ## fixed-effect model matrix is rank deficient so dropping 1 column / coefficient

``` r
aov.swapTAT1 <- Anova(swapTAT1.lmm.lme4)
print(aov.swapTAT1)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                              Chisq Df Pr(>Chisq)    
    ## Validity                   14.7263  2  0.0006342 ***
    ## nontargetContrast          41.1886  1  1.382e-10 ***
    ## Validity:nontargetContrast  0.4295  1  0.5122477    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## TA T2

``` r
d <- data %>% filter(Target==2, targetContrast==0)
swapTAT2.lmm.lme4 <- lmer(twoIncorrect ~ Validity * nontargetContrast + (1|SID), data = d)
summary(swapTAT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity * nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 337.1
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.5913 -0.3000  0.0060  0.8579  1.1658 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   2.146   1.465  
    ##  Residual             278.531  16.689  
    ## Number of obs: 43, groups:  SID, 17
    ## 
    ## Fixed effects:
    ##                              Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)                   40.8960     5.1845 34.2099   7.888 3.33e-09 ***
    ## Validity1                      1.3826     5.4327 37.7627   0.254    0.800    
    ## Validity2                     -2.4498     4.1007 29.8112  -0.597    0.555    
    ## nontargetContrast1            42.0844     5.0828 36.7486   8.280 6.35e-10 ***
    ## Validity1:nontargetContrast1   0.1656     5.0842 37.3511   0.033    0.974    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldty1 Vldty2 nntrC1
    ## Validity1   -0.512                     
    ## Validity2    0.241 -0.352              
    ## nntrgtCntr1 -0.855  0.468 -0.159       
    ## Vldty1:nnC1  0.438 -0.767  0.027 -0.469
    ## fit warnings:
    ## fixed-effect model matrix is rank deficient so dropping 1 column / coefficient

``` r
aov.swapTAT2 <- Anova(swapTAT2.lmm.lme4)
print(aov.swapTAT2)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                              Chisq Df Pr(>Chisq)    
    ## Validity                    0.3802  2     0.8269    
    ## nontargetContrast          88.1951  1     <2e-16 ***
    ## Validity:nontargetContrast  0.0011  1     0.9740    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## NP

``` r
d <- data %>% filter(nontargetContrast==1)
swapNP.lmm.lme4 <- lmer(twoIncorrect ~ Validity * targetContrast + (1|SID), data = d)
summary(swapNP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity * targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1513.9
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.4503 -0.5136  0.0454  0.6169  2.9210 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  33.76    5.81   
    ##  Residual             360.10   18.98   
    ## Number of obs: 175, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                           Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)                 62.558      2.032  19.393  30.790   <2e-16 ***
    ## Validity1                    4.381      2.001 155.555   2.189   0.0301 *  
    ## Validity2                   -4.349      2.153 156.447  -2.020   0.0450 *  
    ## targetContrast1            -16.390      1.501 159.593 -10.922   <2e-16 ***
    ## Validity1:targetContrast1   -3.051      2.001 155.486  -1.525   0.1293    
    ## Validity2:targetContrast1    3.769      2.152 156.217   1.752   0.0818 .  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldty1 Vldty2 trgtC1 Vl1:C1
    ## Validity1   -0.114                            
    ## Validity2    0.046 -0.457                     
    ## trgtCntrst1 -0.170  0.132 -0.052              
    ## Vldty1:trC1  0.097 -0.150  0.062 -0.154       
    ## Vldty2:trC1 -0.034  0.059 -0.243  0.057 -0.454

``` r
aov.swapNP <- Anova(swapNP.lmm.lme4)
print(aov.swapNP)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                           Chisq Df Pr(>Chisq)    
    ## Validity                  4.713  2    0.09475 .  
    ## targetContrast          127.162  1    < 2e-16 ***
    ## Validity:targetContrast   3.738  2    0.15427    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## NP T1

``` r
d <- data %>% filter(Target==1, nontargetContrast==1)
swapNPT1.lmm.lme4 <- lmer(twoIncorrect ~ Validity * targetContrast + (1|SID), data = d)
summary(swapNPT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity * targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 709.9
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.3680 -0.5946  0.0179  0.6406  2.9131 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  36.55    6.045  
    ##  Residual             279.16   16.708  
    ## Number of obs: 86, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                           Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)                 63.225      2.418  20.088  26.152  < 2e-16 ***
    ## Validity1                    9.721      2.580  67.954   3.768 0.000347 ***
    ## Validity2                   -7.048      2.728  67.758  -2.584 0.011935 *  
    ## targetContrast1            -11.340      1.953  70.488  -5.806 1.68e-07 ***
    ## Validity1:targetContrast1   -3.991      2.580  67.954  -1.547 0.126597    
    ## Validity2:targetContrast1    4.824      2.728  67.758   1.769 0.081477 .  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldty1 Vldty2 trgtC1 Vl1:C1
    ## Validity1   -0.150                            
    ## Validity2   -0.010 -0.395                     
    ## trgtCntrst1 -0.260  0.186  0.013              
    ## Vldty1:trC1  0.150 -0.223  0.028 -0.186       
    ## Vldty2:trC1  0.010  0.028 -0.305 -0.013 -0.395

``` r
aov.swapNPT1 <- Anova(swapNPT1.lmm.lme4)
print(aov.swapNPT1)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                           Chisq Df Pr(>Chisq)    
    ## Validity                13.5158  2   0.001162 ** 
    ## targetContrast          37.3278  1  9.985e-10 ***
    ## Validity:targetContrast  3.9785  2   0.136801    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## NP T2

``` r
d <- data %>% filter(Target==2,nontargetContrast==1)
swapNPT2.lmm.lme4 <- lmer(twoIncorrect ~ Validity * targetContrast + (1|SID), data = d)
summary(swapNPT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity * targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 759.9
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.85566 -0.47508  0.08485  0.51579  2.89698 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  29.49    5.43   
    ##  Residual             386.14   19.65   
    ## Number of obs: 89, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                           Estimate Std. Error       df t value Pr(>|t|)    
    ## (Intercept)                61.3606     2.5026  17.1329  24.518 8.77e-15 ***
    ## Validity1                  -0.4881     2.8762  69.2267  -0.170    0.866    
    ## Validity2                  -1.1937     3.1470  71.6816  -0.379    0.706    
    ## targetContrast1           -21.2676     2.1452  71.9577  -9.914 4.28e-15 ***
    ## Validity1:targetContrast1  -2.2254     2.8764  69.2356  -0.774    0.442    
    ## Validity2:targetContrast1   2.0239     3.1409  70.3099   0.644    0.521    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldty1 Vldty2 trgtC1 Vl1:C1
    ## Validity1   -0.127                            
    ## Validity2    0.098 -0.490                     
    ## trgtCntrst1 -0.135  0.098 -0.091              
    ## Vldty1:trC1  0.082 -0.098  0.078 -0.147       
    ## Vldty2:trC1 -0.070  0.074 -0.196  0.106 -0.488

``` r
aov.swapNPT2 <- Anova(swapNPT2.lmm.lme4)
print(aov.swapNPT2)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                            Chisq Df Pr(>Chisq)    
    ## Validity                  0.2697  2     0.8739    
    ## targetContrast          103.1746  1     <2e-16 ***
    ## Validity:targetContrast   0.6921  2     0.7075    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## NA

``` r
d <- data %>% filter(nontargetContrast==0)
swapNA.lmm.lme4 <- lmer(twoIncorrect ~ Validity  * targetContrast + (1|SID), data = d)
summary(swapNA.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity * targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 973.3
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.95811 -0.55489  0.02205  0.56956  2.08156 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 139.9    11.83   
    ##  Residual             472.2    21.73   
    ## Number of obs: 110, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                           Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)                 10.222      6.625  83.061   1.543 0.126623    
    ## Validity1                    4.383      7.035 100.273   0.623 0.534654    
    ## Validity2                   -3.280      8.558  89.819  -0.383 0.702419    
    ## targetContrast1             23.830      6.007  99.599   3.967 0.000137 ***
    ## Validity1:targetContrast1  -10.386      7.022 100.094  -1.479 0.142266    
    ## Validity2:targetContrast1    4.104      8.548  89.585   0.480 0.632289    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldty1 Vldty2 trgtC1 Vl1:C1
    ## Validity1   -0.521                            
    ## Validity2    0.215 -0.413                     
    ## trgtCntrst1 -0.850  0.570 -0.234              
    ## Vldty1:trC1  0.520 -0.910  0.374 -0.573       
    ## Vldty2:trC1 -0.213  0.372 -0.936  0.236 -0.410

``` r
aov.swapNA <- Anova(swapNA.lmm.lme4)
print(aov.swapNA)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                           Chisq Df Pr(>Chisq)    
    ## Validity                 3.7298  2  0.1549106    
    ## targetContrast          14.4971  1  0.0001404 ***
    ## Validity:targetContrast  2.2069  2  0.3317268    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## NA T1

``` r
d <- data %>% filter(Target==1, nontargetContrast==0)
swapNAT1.lmm.lme4 <- lmer(twoIncorrect ~ Validity * targetContrast + (1|SID), data = d)
summary(swapNAT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity * targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 455.4
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.16179 -0.55108 -0.03353  0.56371  1.65648 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 199.6    14.13   
    ##  Residual             273.1    16.53   
    ## Number of obs: 55, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                           Estimate Std. Error      df t value Pr(>|t|)   
    ## (Intercept)                 12.287      9.896  47.721   1.242  0.22043   
    ## Validity1                    3.172     13.053  38.895   0.243  0.80927   
    ## Validity2                    3.672      3.260  33.654   1.126  0.26797   
    ## targetContrast1             29.491      9.328  38.445   3.162  0.00306 **
    ## Validity1:targetContrast1  -11.946     13.255  38.736  -0.901  0.37302   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldty1 Vldty2 trgtC1
    ## Validity1   -0.659                     
    ## Validity2   -0.158  0.062              
    ## trgtCntrst1 -0.914  0.700  0.176       
    ## Vldty1:trC1  0.669 -0.971 -0.184 -0.711
    ## fit warnings:
    ## fixed-effect model matrix is rank deficient so dropping 1 column / coefficient

``` r
aov.swapNAT1 <- Anova(swapNAT1.lmm.lme4)
print(aov.swapNAT1)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                           Chisq Df Pr(>Chisq)    
    ## Validity                 6.9963  2  0.0302529 *  
    ## targetContrast          12.8550  1  0.0003366 ***
    ## Validity:targetContrast  0.8123  1  0.3674527    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## NA T2

``` r
d <- data %>% filter(Target==2, nontargetContrast==0)
swapNAT2.lmm.lme4 <- lmer(twoIncorrect ~ Validity * targetContrast + (1|SID), data = d)
summary(swapNAT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity * targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 473.1
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.5039 -0.6762 -0.1211  0.4274  2.2805 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 277.9    16.67   
    ##  Residual             368.3    19.19   
    ## Number of obs: 55, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                           Estimate Std. Error     df t value Pr(>|t|)   
    ## (Intercept)                  4.298      7.416 47.006   0.579  0.56503   
    ## Validity1                    6.410      6.684 38.465   0.959  0.34356   
    ## Validity2                   -1.924      3.910 33.926  -0.492  0.62582   
    ## targetContrast1             22.019      6.268 37.701   3.513  0.00117 **
    ## Validity1:targetContrast1   -9.633      6.374 38.638  -1.511  0.13886   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldty1 Vldty2 trgtC1
    ## Validity1   -0.423                     
    ## Validity2    0.135 -0.301              
    ## trgtCntrst1 -0.769  0.487 -0.137       
    ## Vldty1:trC1  0.400 -0.835  0.021 -0.471
    ## fit warnings:
    ## fixed-effect model matrix is rank deficient so dropping 1 column / coefficient

``` r
aov.swapNAT2 <- Anova(swapNAT2.lmm.lme4)
print(aov.swapNAT2)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                           Chisq Df Pr(>Chisq)   
    ## Validity                 1.0599  2   0.588637   
    ## targetContrast          10.0838  1   0.001496 **
    ## Validity:targetContrast  2.2839  1   0.130723   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## TPNP

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==1)
swapTPNP.lmm.lme4 <- lmer(twoIncorrect ~ Validity * Target + (1|SID), data = d)
summary(swapTPNP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity * Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 883.5
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.27680 -0.68172  0.03135  0.61096  2.91098 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  31.55    5.617  
    ##  Residual             344.46   18.560  
    ## Number of obs: 104, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                   Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)        45.9751     2.2544 17.1007  20.393 1.94e-13 ***
    ## Validity1           1.5225     2.5533 81.5238   0.596  0.55262    
    ## Validity2          -0.6627     2.5951 82.2684  -0.255  0.79906    
    ## Target1             5.9099     1.8247 81.8592   3.239  0.00174 ** 
    ## Validity1:Target1   4.2083     2.5533 81.5238   1.648  0.10316    
    ## Validity2:Target1  -1.5610     2.5951 82.2684  -0.602  0.54914    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldty1 Vldty2 Targt1 Vl1:T1
    ## Validity1   -0.024                            
    ## Validity2    0.012 -0.492                     
    ## Target1     -0.034  0.030 -0.015              
    ## Vldty1:Trg1  0.024 -0.021  0.011 -0.030       
    ## Vldty2:Trg1 -0.012  0.011 -0.053  0.015 -0.492

``` r
aov.swapTPNP <- Anova(swapTPNP.lmm.lme4)
print(aov.swapTPNP)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                   Chisq Df Pr(>Chisq)   
    ## Validity         0.4027  2   0.817606   
    ## Target          10.8232  1   0.001002 **
    ## Validity:Target  2.7743  2   0.249782   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## TPNA

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==0)
swapTPNA.lmm.lme4 <- lmer(twoIncorrect ~ Validity * Target + (1|SID), data = d)
summary(swapTPNA.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity * Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 915
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.1285 -0.6465 -0.0730  0.5369  2.6179 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 145.7    12.07   
    ##  Residual             423.2    20.57   
    ## Number of obs: 104, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                   Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)        33.8652     3.4912 17.2357   9.700 2.13e-08 ***
    ## Validity1          -5.8163     2.8306 81.4414  -2.055 0.043105 *  
    ## Validity2           0.7013     2.9017 81.9331   0.242 0.809616    
    ## Target1             7.8344     2.0243 81.7088   3.870 0.000218 ***
    ## Validity1:Target1  -2.8793     2.8313 81.4897  -1.017 0.312187    
    ## Validity2:Target1   2.8137     2.9031 82.0287   0.969 0.335294    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldty1 Vldty2 Targt1 Vl1:T1
    ## Validity1   -0.018                            
    ## Validity2    0.022 -0.504                     
    ## Target1     -0.013  0.016 -0.009              
    ## Vldty1:Trg1  0.009 -0.011  0.006 -0.031       
    ## Vldty2:Trg1 -0.005  0.007 -0.029  0.039 -0.505

``` r
aov.swapTPNA <- Anova(swapTPNA.lmm.lme4)
print(aov.swapTPNA)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                   Chisq Df Pr(>Chisq)    
    ## Validity         5.0861  2  0.0786254 .  
    ## Target          14.6494  1  0.0001295 ***
    ## Validity:Target  1.3132  2  0.5186214    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## TANP

``` r
d <- data %>% filter(targetContrast==0, nontargetContrast==1)
swapTANP.lmm.lme4 <- lmer(twoIncorrect ~ Validity * Target + (1|SID), data = d)
summary(swapTANP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity * Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 588.1
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.1744 -0.3974  0.1084  0.6503  1.9284 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  34.43    5.868  
    ##  Residual             318.83   17.856  
    ## Number of obs: 71, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                   Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)         78.726      2.660 16.786  29.601 6.32e-16 ***
    ## Validity1            7.833      2.896 54.230   2.704  0.00913 ** 
    ## Validity2           -7.687      3.228 54.623  -2.381  0.02077 *  
    ## Target1             -4.058      2.244 56.387  -1.808  0.07588 .  
    ## Validity1:Target1    6.138      2.903 55.454   2.114  0.03898 *  
    ## Validity2:Target1   -4.744      3.239 56.288  -1.464  0.14866    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldty1 Vldty2 Targt1 Vl1:T1
    ## Validity1   -0.224                            
    ## Validity2    0.058 -0.409                     
    ## Target1      0.108 -0.066 -0.083              
    ## Vldty1:Trg1 -0.054  0.104  0.041 -0.257       
    ## Vldty2:Trg1 -0.078  0.048  0.060  0.064 -0.407

``` r
aov.swapTANP <- Anova(swapTANP.lmm.lme4)
print(aov.swapTANP)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                  Chisq Df Pr(>Chisq)  
    ## Validity        8.7731  2    0.01244 *
    ## Target          1.7989  1    0.17984  
    ## Validity:Target 4.9074  2    0.08598 .
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

# validity

``` r
d <- data
swap_validity.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validity.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 2719.7
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.98279 -0.67195  0.00048  0.78184  2.03491 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  39.06    6.25   
    ##  Residual             826.11   28.74   
    ## Number of obs: 285, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   48.939      2.261  17.232  21.641  6.2e-14 ***
    ## Validity1      1.837      2.345 268.188   0.783    0.434    
    ## Validity2     -2.405      2.466 268.293  -0.975    0.330    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.073       
    ## Validity2  0.039 -0.479

``` r
aov.swap_validity <- Anova(swap_validity.lmm.lme4)
print(aov.swap_validity)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)
    ## Validity 1.0807  2     0.5825

## TP

``` r
d <- data %>% filter(targetContrast==1)
swap_validityTP.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1885.2
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.20840 -0.62388  0.04653  0.71231  2.89161 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  58.28    7.634  
    ##  Residual             500.13   22.363  
    ## Number of obs: 208, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error       df t value Pr(>|t|)    
    ## (Intercept)  40.0641     2.3766  17.4117  16.858 3.19e-12 ***
    ## Validity1    -2.2908     2.1739 188.6570  -1.054    0.293    
    ## Validity2     0.1472     2.2165 189.4712   0.066    0.947    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.018       
    ## Validity2  0.016 -0.499

``` r
aov.swap_validityTP <- Anova(swap_validityTP.lmm.lme4)
print(aov.swap_validityTP)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)
    ## Validity 1.3906  2     0.4989

### T1

``` r
d <- data %>% filter(targetContrast==1, Target==1)
swap_validityTPT1.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTPT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 928.8
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.2748 -0.6061 -0.0105  0.6737  2.9005 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  61.34    7.832  
    ##  Residual             347.61   18.644  
    ## Number of obs: 107, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)  46.8602     2.5807 17.0959  18.158  1.3e-12 ***
    ## Validity1    -1.5502     2.5437 87.1881  -0.609    0.544    
    ## Validity2     0.7813     2.5634 87.4142   0.305    0.761    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.005       
    ## Validity2  0.010 -0.504

``` r
aov.swap_validityTPT1 <- Anova(swap_validityTPT1.lmm.lme4)
print(aov.swap_validityTPT1)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)
    ## Validity 0.3714  2     0.8305

### T2

``` r
d <- data %>% filter(targetContrast==1, Target==2)
swap_validityTPT2.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTPT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 918.5
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.63573 -0.67729 -0.05705  0.68246  2.25544 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  89.96    9.485  
    ##  Residual             539.20   23.221  
    ## Number of obs: 101, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)  32.7669     3.2223 17.3168  10.169 1.01e-08 ***
    ## Validity1    -2.5303     3.2215 82.0311  -0.785    0.434    
    ## Validity2    -0.6657     3.3336 83.8822  -0.200    0.842    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.038       
    ## Validity2  0.029 -0.493

``` r
aov.swap_validityTPT2 <- Anova(swap_validityTPT2.lmm.lme4)
print(aov.swap_validityTPT2)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)
    ## Validity 1.0727  2     0.5849

## TA

``` r
d <- data %>% filter(targetContrast==0)
swap_validityTA.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTA.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 720.4
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.6235 -0.2631  0.3192  0.6966  1.1783 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  31.25    5.59   
    ##  Residual             815.65   28.56   
    ## Number of obs: 77, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   73.817      3.663 16.236  20.151 6.45e-13 ***
    ## Validity1      3.349      4.384 68.505   0.764    0.448    
    ## Validity2     -5.591      4.950 64.460  -1.129    0.263    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.250       
    ## Validity2  0.094 -0.425

``` r
aov.swap_validityTA <- Anova(swap_validityTA.lmm.lme4)
print(aov.swap_validityTA)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)
    ## Validity 1.3738  2     0.5031

### T1

``` r
d <- data %>% filter(targetContrast==0, Target==1)
swap_validityTAT1.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTAT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 302.3
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.0296 -0.2736  0.3550  0.6314  1.5877 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0.0     0.00   
    ##  Residual             746.1    27.31   
    ## Number of obs: 34, groups:  SID, 17
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   71.359      4.956  31.000  14.399 2.82e-15 ***
    ## Validity1     11.393      6.333  31.000   1.799   0.0817 .  
    ## Validity2    -14.727      6.868  31.000  -2.144   0.0400 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.287       
    ## Validity2 -0.057 -0.313
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_validityTAT1 <- Anova(swap_validityTAT1.lmm.lme4)
print(aov.swap_validityTAT1)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)  
    ## Validity 6.0109  2    0.04952 *
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

### T2

``` r
d <- data %>% filter(targetContrast==0, Target==2)
swap_validityTAT2.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTAT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 395
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.6031 -0.1862  0.3352  0.6378  0.9466 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0.0     0.00   
    ##  Residual             884.5    29.74   
    ## Number of obs: 43, groups:  SID, 17
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   76.601      4.722 40.000  16.221   <2e-16 ***
    ## Validity1     -4.752      6.086 40.000  -0.781    0.440    
    ## Validity2      3.938      7.196 40.000   0.547    0.587    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.263       
    ## Validity2  0.211 -0.501
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_validityTAT2 <- Anova(swap_validityTAT2.lmm.lme4)
print(aov.swap_validityTAT2)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)
    ## Validity 0.6422  2     0.7254

## NP

``` r
d <- data %>% filter(nontargetContrast==1)
swap_validityNP.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityNP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1620.8
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.47337 -0.64096  0.01299  0.72975  1.86971 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  27.69    5.263  
    ##  Residual             643.99   25.377  
    ## Number of obs: 175, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   59.403      2.301  18.459  25.812 6.09e-16 ***
    ## Validity1      6.304      2.627 158.216   2.400   0.0176 *  
    ## Validity2     -4.579      2.781 159.379  -1.646   0.1017    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.097       
    ## Validity2  0.041 -0.468

``` r
aov.swap_validityNP <- Anova(swap_validityNP.lmm.lme4)
print(aov.swap_validityNP)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##          Chisq Df Pr(>Chisq)  
    ## Validity 6.109  2    0.04715 *
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

### T1

``` r
d <- data %>% filter(nontargetContrast==1, Target==1)
swap_validityNPT1.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityNPT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 754.6
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.43220 -0.68136 -0.04373  0.61743  2.19916 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  28.27    5.317  
    ##  Residual             424.06   20.593  
    ## Number of obs: 86, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   60.275      2.572 18.488  23.439 3.31e-15 ***
    ## Validity1     11.196      3.055 70.054   3.665 0.000477 ***
    ## Validity2     -6.142      3.178 70.033  -1.933 0.057304 .  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.094       
    ## Validity2  0.008 -0.449

``` r
aov.swap_validityNPT1 <- Anova(swap_validityNPT1.lmm.lme4)
print(aov.swap_validityNPT1)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)   
    ## Validity 13.539  2   0.001148 **
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

### T2

``` r
d <- data %>% filter(nontargetContrast==1, Target==2)
swap_validityNPT2.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityNPT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 839.2
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.03526 -0.68473 -0.06574  0.82162  1.47524 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0.0     0.00   
    ##  Residual             877.2    29.62   
    ## Number of obs: 89, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   58.862      3.165 86.000  18.600   <2e-16 ***
    ## Validity1      1.418      4.286 86.000   0.331    0.742    
    ## Validity2     -2.556      4.611 86.000  -0.554    0.581    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.122       
    ## Validity2  0.084 -0.485
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_validityNPT2 <- Anova(swap_validityNPT2.lmm.lme4)
print(aov.swap_validityNPT2)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)
    ## Validity 0.3123  2     0.8554

## NA

``` r
d <- data %>% filter(nontargetContrast==0)
swap_validityNA.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityNA.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1004.9
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.98812 -0.75346 -0.00613  0.72074  2.41838 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  82.92    9.106  
    ##  Residual             561.30   23.692  
    ## Number of obs: 110, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   32.314      3.125 17.152  10.339 8.67e-09 ***
    ## Validity1     -6.787      3.148 92.268  -2.156   0.0337 *  
    ## Validity2      1.195      3.274 91.926   0.365   0.7161    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.046       
    ## Validity2  0.038 -0.498

``` r
aov.swap_validityNA <- Anova(swap_validityNA.lmm.lme4)
print(aov.swap_validityNA)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)  
    ## Validity 5.3174  2    0.07004 .
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

### T1

``` r
d <- data %>% filter(nontargetContrast==0, Target==1)
swap_validityNAT1.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityNAT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 479.7
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.3687 -0.5344  0.1284  0.7507  1.5349 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 140.8    11.87   
    ##  Residual             375.6    19.38   
    ## Number of obs: 55, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   40.375      3.837 16.687  10.524  8.8e-09 ***
    ## Validity1     -8.965      3.679 35.341  -2.437    0.020 *  
    ## Validity2      2.460      3.741 35.825   0.658    0.515    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.018       
    ## Validity2  0.014 -0.497

``` r
aov.swap_validityNAT1 <- Anova(swap_validityNAT1.lmm.lme4)
print(aov.swap_validityNAT1)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##          Chisq Df Pr(>Chisq)  
    ## Validity 6.344  2    0.04192 *
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

### T2

``` r
d <- data %>% filter(nontargetContrast==0, Target==2)
swap_validityNAT2.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityNAT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 493.7
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.9624 -0.7507 -0.1248  0.5688  2.6749 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 151.6    12.31   
    ##  Residual             511.9    22.63   
    ## Number of obs: 55, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)  24.1839     4.2406 17.1465   5.703 2.51e-05 ***
    ## Validity1    -4.2373     4.2347 36.9986  -1.001    0.324    
    ## Validity2    -0.3424     4.5330 37.2592  -0.076    0.940    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.075       
    ## Validity2  0.065 -0.502

``` r
aov.swap_validityNAT2 <- Anova(swap_validityNAT2.lmm.lme4)
print(aov.swap_validityNAT2)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)
    ## Validity 1.4474  2      0.485

## TPNP

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==1)
swap_validityTPNP.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTPNP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 906.7
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.35698 -0.53936  0.06847  0.64143  2.78124 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  22.27    4.719  
    ##  Residual             389.09   19.725  
    ## Number of obs: 104, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)  46.1500     2.2330 17.1370  20.667 1.49e-13 ***
    ## Validity1     1.3477     2.7114 84.6108   0.497    0.620    
    ## Validity2    -0.5454     2.7522 85.3647  -0.198    0.843    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.024       
    ## Validity2  0.012 -0.493

``` r
aov.swap_validityTPNP <- Anova(swap_validityTPNP.lmm.lme4)
print(aov.swap_validityTPNP)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)
    ## Validity 0.2499  2     0.8825

### T1

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==1, Target==1)
swap_validityTPNP_T1.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTPNP_T1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 438.3
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.5435 -0.8628  0.0212  0.6411  3.1507 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance  Std.Dev. 
    ##  SID      (Intercept) 3.282e-15 5.728e-08
    ##  Residual             2.553e+02 1.598e+01
    ## Number of obs: 54, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   51.885      2.174 51.000  23.864   <2e-16 ***
    ## Validity1      5.731      3.075 51.000   1.864   0.0681 .  
    ## Validity2     -2.224      3.075 51.000  -0.723   0.4728    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1  0.000       
    ## Validity2  0.000 -0.500
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_validityTPNP_T1 <- Anova(swap_validityTPNP_T1.lmm.lme4)
print(aov.swap_validityTPNP_T1)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)
    ## Validity 3.5319  2      0.171

### T2

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==1, Target==2)
swap_validityTPNP_T2.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTPNP_T2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 436.5
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.82847 -0.64268  0.09215  0.60055  2.58896 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  38.75    6.225  
    ##  Residual             468.52   21.645  
    ## Number of obs: 50, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)  40.0554     3.4053 16.3106  11.762  2.2e-09 ***
    ## Validity1    -2.6759     4.2568 30.6172  -0.629    0.534    
    ## Validity2     0.8586     4.3934 32.0398   0.195    0.846    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.053       
    ## Validity2  0.026 -0.484

``` r
aov.swap_validityTPNP_T2 <- Anova(swap_validityTPNP_T2.lmm.lme4)
print(aov.swap_validityTPNP_T2)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)
    ## Validity 0.4107  2     0.8144

## TANP

``` r
d <- data %>% filter(targetContrast==0, nontargetContrast==1)
swap_validityTANP.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTANP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 606
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.5871 -0.3600  0.1908  0.6083  1.5438 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  27.34    5.229  
    ##  Residual             342.60   18.509  
    ## Number of obs: 71, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   79.207      2.613 16.788  30.309 4.27e-16 ***
    ## Validity1      7.177      2.964 57.336   2.421   0.0187 *  
    ## Validity2     -8.075      3.315 58.437  -2.436   0.0179 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.214       
    ## Validity2  0.079 -0.432

``` r
aov.swap_validityTANP <- Anova(swap_validityTANP.lmm.lme4)
print(aov.swap_validityTANP)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)  
    ## Validity 8.2384  2    0.01626 *
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

### T1

``` r
d <- data %>% filter(targetContrast==0, nontargetContrast==1, Target==1)
swap_validityTANP_T1.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTANP_T1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 265
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.3214 -0.3644  0.1210  0.5380  1.4869 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 159.8    12.64   
    ##  Residual             269.3    16.41   
    ## Number of obs: 32, groups:  SID, 17
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   73.873      4.491  15.396  16.451 3.49e-11 ***
    ## Validity1     15.244      4.156  18.106   3.668  0.00175 ** 
    ## Validity2    -10.753      4.508  17.194  -2.386  0.02882 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.249       
    ## Validity2 -0.006 -0.320

``` r
aov.swap_validityTANP_T1 <- Anova(swap_validityTANP_T1.lmm.lme4)
print(aov.swap_validityTANP_T1)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)    
    ## Validity 15.086  2  0.0005298 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

### T2

``` r
d <- data %>% filter(targetContrast==0, nontargetContrast==1, Target==2)
swap_validityTANP_T2.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTANP_T2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 316.9
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.4968 -0.3207  0.1584  0.8946  1.1345 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   2.126   1.458  
    ##  Residual             294.142  17.151  
    ## Number of obs: 39, groups:  SID, 17
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   82.980      2.839 16.597  29.231 1.04e-15 ***
    ## Validity1      1.548      3.701 27.041   0.418    0.679    
    ## Validity2     -2.449      4.214 28.619  -0.581    0.566    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.206       
    ## Validity2  0.159 -0.492

``` r
aov.swap_validityTANP_T2 <- Anova(swap_validityTANP_T2.lmm.lme4)
print(aov.swap_validityTANP_T2)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)
    ## Validity 0.3609  2     0.8349

## TPNA

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==0)
swap_validityTPNA.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTPNA.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 941
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.93092 -0.56967  0.03008  0.59282  2.05167 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 143.1    11.96   
    ##  Residual             485.3    22.03   
    ## Number of obs: 104, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)  34.0633     3.5556 17.2000   9.580  2.6e-08 ***
    ## Validity1    -6.0144     3.0304 84.4199  -1.985   0.0504 .  
    ## Validity2     0.8469     3.1051 84.9627   0.273   0.7857    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.018       
    ## Validity2  0.023 -0.504

``` r
aov.swap_validityTPNA <- Anova(swap_validityTPNA.lmm.lme4)
print(aov.swap_validityTPNA)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)  
    ## Validity 4.6505  2    0.09776 .
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

### T1

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==0, Target==1)
swap_validityTPNA_T1.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTPNA_T1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 452.7
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.16179 -0.56418 -0.07447  0.56606  1.65648 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 199.6    14.13   
    ##  Residual             273.1    16.53   
    ## Number of obs: 53, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   41.778      4.034 17.182  10.356 8.32e-09 ***
    ## Validity1     -8.774      3.201 33.332  -2.741  0.00976 ** 
    ## Validity2      3.672      3.260 33.654   1.126  0.26797    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.010       
    ## Validity2  0.020 -0.509

``` r
aov.swap_validityTPNA_T1 <- Anova(swap_validityTPNA_T1.lmm.lme4)
print(aov.swap_validityTPNA_T1)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)  
    ## Validity 7.6134  2    0.02222 *
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

### T2

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==0, Target==2)
swap_validityTPNA_T2.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTPNA_T2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 451.5
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.4749 -0.6769 -0.1216  0.4495  2.2422 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 285.4    16.89   
    ##  Residual             381.9    19.54   
    ## Number of obs: 51, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   26.336      4.845 17.207   5.435 4.27e-05 ***
    ## Validity1     -3.242      3.833 31.593  -0.846    0.404    
    ## Validity2     -1.884      3.985 32.307  -0.473    0.640    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.030       
    ## Validity2  0.030 -0.501

``` r
aov.swap_validityTPNA_T2 <- Anova(swap_validityTPNA_T2.lmm.lme4)
print(aov.swap_validityTPNA_T2)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)
    ## Validity 1.7877  2     0.4091

## T1

``` r
d <- data %>% filter(Target==1)
swap_validityT1.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1291.3
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.32032 -0.64466 -0.01091  0.78416  2.15182 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  45.91    6.776  
    ##  Residual             578.70   24.056  
    ## Number of obs: 141, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   52.746      2.590  17.170  20.362 1.83e-13 ***
    ## Validity1      3.979      2.806 123.079   1.418    0.159    
    ## Validity2     -2.873      2.894 123.604  -0.993    0.323    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.060       
    ## Validity2  0.011 -0.467

``` r
aov.swap_validityT1 <- Anova(swap_validityT1.lmm.lme4)
print(aov.swap_validityT1)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)
    ## Validity 2.1502  2     0.3413

## T2

``` r
d <- data %>% filter(Target==2)
swap_validityT2.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1399.1
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.45971 -0.79336  0.04606  0.95241  1.71229 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)    0      0.0    
    ##  Residual             1082     32.9    
    ## Number of obs: 144, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error       df t value Pr(>|t|)    
    ## (Intercept)  45.5962     2.7615 141.0000  16.512   <2e-16 ***
    ## Validity1    -0.4979     3.7508 141.0000  -0.133    0.895    
    ## Validity2    -1.9305     4.0269 141.0000  -0.479    0.632    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr) Vldty1
    ## Validity1 -0.114       
    ## Validity2  0.087 -0.490
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_validityT2 <- Anova(swap_validityT2.lmm.lme4)
print(aov.swap_validityT2)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##          Chisq Df Pr(>Chisq)
    ## Validity 0.408  2     0.8155

# target

``` r
d <- data
swap_target.lmm.lme4 <- lmer(twoIncorrect ~ Target + (1|SID), data = d)
summary(swap_target.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 2719.7
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.12443 -0.66096 -0.04051  0.73343  2.19877 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  40.41    6.357  
    ##  Residual             810.58   28.471  
    ## Number of obs: 285, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   49.105      2.260  16.997  21.728 7.72e-14 ***
    ## Target1        3.821      1.690 268.556   2.262   0.0245 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##         (Intr)
    ## Target1 0.007

``` r
aov.swap_target <- Anova(swap_target.lmm.lme4)
print(aov.swap_target)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##         Chisq Df Pr(>Chisq)  
    ## Target 5.1146  1    0.02373 *
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## TP

``` r
d <- data %>% filter(targetContrast==1)
swap_targetTP.lmm.lme4 <- lmer(twoIncorrect ~ Target + (1|SID), data = d)
summary(swap_targetTP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1868.8
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.04255 -0.61365 -0.01778  0.67903  2.77658 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  63.25    7.953  
    ##  Residual             446.77   21.137  
    ## Number of obs: 208, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   39.811      2.381  17.369  16.723 3.80e-12 ***
    ## Target1        7.032      1.468 189.898   4.791 3.34e-06 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##         (Intr)
    ## Target1 -0.019

``` r
aov.swap_targetTP <- Anova(swap_targetTP.lmm.lme4)
print(aov.swap_targetTP)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##         Chisq Df Pr(>Chisq)    
    ## Target 22.949  1  1.664e-06 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## TA

``` r
d <- data %>% filter(targetContrast==0)
swap_targetTA.lmm.lme4 <- lmer(twoIncorrect ~ Target + (1|SID), data = d)
summary(swap_targetTA.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 727
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.5750 -0.2376  0.2860  0.7609  1.0104 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  27.3     5.225  
    ##  Residual             821.2    28.657  
    ## Number of obs: 77, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   74.286      3.544 16.069  20.962 4.26e-13 ***
    ## Target1       -1.373      3.303 67.376  -0.416    0.679    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##         (Intr)
    ## Target1 0.112

``` r
aov.swap_targetTA <- Anova(swap_targetTA.lmm.lme4)
print(aov.swap_targetTA)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##         Chisq Df Pr(>Chisq)
    ## Target 0.1729  1     0.6776

## NP

``` r
d <- data %>% filter(nontargetContrast==1)
swap_targetNP.lmm.lme4 <- lmer(twoIncorrect ~ Target + (1|SID), data = d)
summary(swap_targetNP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1630.7
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.30591 -0.70811 -0.04997  0.81474  1.70058 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  21.7     4.658  
    ##  Residual             666.2    25.812  
    ## Number of obs: 175, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   59.992      2.244  18.345   26.73 3.79e-16 ***
    ## Target1        1.174      1.956 161.605    0.60    0.549    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##         (Intr)
    ## Target1 0.014

``` r
aov.swap_targetNP <- Anova(swap_targetNP.lmm.lme4)
print(aov.swap_targetNP)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##         Chisq Df Pr(>Chisq)
    ## Target 0.3605  1     0.5482

## NA

``` r
d <- data %>% filter(nontargetContrast==0)
swap_targetNA.lmm.lme4 <- lmer(twoIncorrect ~ Target + (1|SID), data = d)
summary(swap_targetNA.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1001.9
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.23088 -0.82417 -0.04037  0.51960  2.89082 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  88.39    9.402  
    ##  Residual             512.56   22.640  
    ## Number of obs: 110, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   32.032      3.099 17.219  10.336 8.38e-09 ***
    ## Target1        7.977      2.164 92.156   3.687 0.000383 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##         (Intr)
    ## Target1 -0.001

``` r
aov.swap_targetNA <- Anova(swap_targetNA.lmm.lme4)
print(aov.swap_targetNA)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##         Chisq Df Pr(>Chisq)    
    ## Target 13.594  1  0.0002269 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## TPNP

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==1)
swap_targetTPNP.lmm.lme4 <- lmer(twoIncorrect ~ Target + (1|SID), data = d)
summary(swap_targetTPNP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 901
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.23761 -0.70886  0.05814  0.56545  2.97232 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  32.75    5.723  
    ##  Residual             340.71   18.458  
    ## Number of obs: 104, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   45.916      2.260 17.066  20.317 2.14e-13 ***
    ## Target1        5.969      1.813 85.781   3.292  0.00145 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##         (Intr)
    ## Target1 -0.032

``` r
aov.swap_targetTPNP <- Anova(swap_targetTPNP.lmm.lme4)
print(aov.swap_targetTPNP)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##         Chisq Df Pr(>Chisq)    
    ## Target 10.836  1  0.0009952 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## TANP

``` r
d <- data %>% filter(targetContrast==0, nontargetContrast==1)
swap_targetTANP.lmm.lme4 <- lmer(twoIncorrect ~ Target + (1|SID), data = d)
summary(swap_targetTANP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 616.6
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.8452 -0.3625  0.1452  0.7932  1.2283 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  10.45    3.233  
    ##  Residual             383.75   19.589  
    ## Number of obs: 71, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   80.216      2.473 15.503  32.439 1.13e-15 ***
    ## Target1       -3.046      2.345 60.662  -1.299    0.199    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##         (Intr)
    ## Target1 0.095

``` r
aov.swap_targetTANP <- Anova(swap_targetTANP.lmm.lme4)
print(aov.swap_targetTANP)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##         Chisq Df Pr(>Chisq)
    ## Target 1.6871  1      0.194

## TPNA

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==0)
swap_targetTPNA.lmm.lme4 <- lmer(twoIncorrect ~ Target + (1|SID), data = d)
summary(swap_targetTPNA.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Target + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 936.6
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.93083 -0.76996  0.02263  0.52171  2.49103 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 145.8    12.07   
    ##  Residual             434.4    20.84   
    ## Number of obs: 104, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   33.820      3.506 17.217   9.646 2.33e-08 ***
    ## Target1        7.807      2.049 85.677   3.811  0.00026 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##         (Intr)
    ## Target1 -0.012

``` r
aov.swap_targetTPNA <- Anova(swap_targetTPNA.lmm.lme4)
print(aov.swap_targetTPNA)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##         Chisq Df Pr(>Chisq)    
    ## Target 14.521  1  0.0001386 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

# target contrast

``` r
d <- data
swap_targetContrast.lmm.lme4 <- lmer(twoIncorrect ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrast.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 2634.2
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.2688 -0.5367  0.1437  0.7174  2.5858 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  36.73    6.06   
    ##  Residual             596.11   24.42   
    ## Number of obs: 285, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                 Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)       56.975      2.177  21.806   26.18   <2e-16 ***
    ## targetContrast1  -16.951      1.641 273.956  -10.33   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrst1 -0.353

``` r
aov.swap_targetContrast <- Anova(swap_targetContrast.lmm.lme4)
print(aov.swap_targetContrast)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                 Chisq Df Pr(>Chisq)    
    ## targetContrast 106.64  1  < 2.2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## T1

``` r
d <- data %>% filter(Target==1)
swap_targetContrastT1.lmm.lme4 <- lmer(twoIncorrect ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1265.1
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.6488 -0.4902  0.0587  0.6496  2.5422 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  56.57    7.521  
    ##  Residual             450.92   21.235  
    ## Number of obs: 141, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                 Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)       59.743      2.763  23.034  21.619  < 2e-16 ***
    ## targetContrast1  -12.880      2.120 128.595  -6.075 1.31e-08 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrst1 -0.407

``` r
aov.swap_targetContrastT1 <- Anova(swap_targetContrastT1.lmm.lme4)
print(aov.swap_targetContrastT1)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                 Chisq Df Pr(>Chisq)    
    ## targetContrast 36.902  1  1.242e-09 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## T2

``` r
d <- data %>% filter(Target==2)
swap_targetContrastT2.lmm.lme4 <- lmer(twoIncorrect ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1341
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.9525 -0.5619  0.1099  0.6752  2.5110 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   9.905   3.147  
    ##  Residual             681.477  26.105  
    ## Number of obs: 144, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                 Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)       54.152      2.495  22.754  21.703  < 2e-16 ***
    ## targetContrast1  -21.313      2.381 132.997  -8.951 2.69e-15 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrst1 -0.386

``` r
aov.swap_targetContrastT2 <- Anova(swap_targetContrastT2.lmm.lme4)
print(aov.swap_targetContrastT2)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                 Chisq Df Pr(>Chisq)    
    ## targetContrast 80.115  1  < 2.2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## NP

``` r
d <- data %>% filter(nontargetContrast==1)
swap_targetContrastNP.lmm.lme4 <- lmer(twoIncorrect ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1534.9
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.9127 -0.4666  0.0952  0.6591  2.8196 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  29.85    5.464  
    ##  Residual             371.84   19.283  
    ## Number of obs: 175, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                 Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)       63.244      1.974  18.917   32.04   <2e-16 ***
    ## targetContrast1  -17.050      1.496 163.071  -11.40   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrst1 -0.152

``` r
aov.swap_targetContrastNP <- Anova(swap_targetContrastNP.lmm.lme4)
print(aov.swap_targetContrastNP)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                 Chisq Df Pr(>Chisq)    
    ## targetContrast 129.88  1  < 2.2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

### T1

``` r
d <- data %>% filter(nontargetContrast==1, Target==1)
swap_targetContrastNPT1.lmm.lme4 <- lmer(twoIncorrect ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNPT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 740.9
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.9445 -0.5759  0.0519  0.5964  2.5298 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  29.59    5.44   
    ##  Residual             332.14   18.22   
    ## Number of obs: 86, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                 Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)       64.486      2.420  18.916   26.65  < 2e-16 ***
    ## targetContrast1  -12.601      2.052  73.865   -6.14 3.78e-08 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrst1 -0.229

``` r
aov.swap_targetContrastNPT1 <- Anova(swap_targetContrastNPT1.lmm.lme4)
print(aov.swap_targetContrastNPT1)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                Chisq Df Pr(>Chisq)    
    ## targetContrast  37.7  1   8.25e-10 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

### T2

``` r
d <- data %>% filter(nontargetContrast==1, Target==2)
swap_targetContrastNPT2.lmm.lme4 <- lmer(twoIncorrect ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNPT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 776.3
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -3.09138 -0.51262  0.08192  0.57536  3.00040 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  28.98    5.383  
    ##  Residual             372.28   19.295  
    ## Number of obs: 89, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                 Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)       61.504      2.435  17.021   25.26 6.23e-15 ***
    ## targetContrast1  -21.527      2.073  75.172  -10.38 3.56e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrst1 -0.113

``` r
aov.swap_targetContrastNPT2 <- Anova(swap_targetContrastNPT2.lmm.lme4)
print(aov.swap_targetContrastNPT2)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                 Chisq Df Pr(>Chisq)    
    ## targetContrast 107.82  1  < 2.2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## NA

``` r
d <- data %>% filter(nontargetContrast==0)
swap_targetContrastNA.lmm.lme4 <- lmer(twoIncorrect ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNA.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 998.5
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.67907 -0.72847  0.01865  0.58166  2.20288 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 120.9    11.00   
    ##  Residual             488.8    22.11   
    ## Number of obs: 110, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                 Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)       14.160      5.568  71.027   2.543 0.013176 *  
    ## targetContrast1   19.821      4.934 103.436   4.018 0.000112 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrst1 -0.799

``` r
aov.swap_targetContrastNA <- Anova(swap_targetContrastNA.lmm.lme4)
print(aov.swap_targetContrastNA)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                 Chisq Df Pr(>Chisq)    
    ## targetContrast 16.141  1   5.88e-05 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

### T1

``` r
d <- data %>% filter(nontargetContrast==0, Target==1)
swap_targetContrastNAT1.lmm.lme4 <- lmer(twoIncorrect ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNAT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 478
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -1.85409 -0.47753  0.04024  0.61777  1.77095 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 184.0    13.56   
    ##  Residual             310.9    17.63   
    ## Number of obs: 55, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                 Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)       17.187      7.614 52.808   2.257 0.028163 *  
    ## targetContrast1   24.511      6.905 42.435   3.550 0.000957 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrst1 -0.852

``` r
aov.swap_targetContrastNAT1 <- Anova(swap_targetContrastNAT1.lmm.lme4)
print(aov.swap_targetContrastNAT1)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                 Chisq Df Pr(>Chisq)    
    ## targetContrast 12.602  1  0.0003853 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

### T2

``` r
d <- data %>% filter(nontargetContrast==0, Target==2)
swap_targetContrastNAT2.lmm.lme4 <- lmer(twoIncorrect ~ targetContrast + (1|SID), data = d)
summary(swap_targetContrastNAT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 490.6
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.5420 -0.6161 -0.1550  0.4853  2.4181 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept) 243.9    15.62   
    ##  Residual             384.2    19.60   
    ## Number of obs: 55, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                 Estimate Std. Error     df t value Pr(>|t|)   
    ## (Intercept)        8.671      6.612 44.211   1.311  0.19648   
    ## targetContrast1   17.609      5.507 42.202   3.197  0.00263 **
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrst1 -0.726

``` r
aov.swap_targetContrastNAT2 <- Anova(swap_targetContrastNAT2.lmm.lme4)
print(aov.swap_targetContrastNAT2)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                 Chisq Df Pr(>Chisq)   
    ## targetContrast 10.223  1   0.001387 **
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

# nontarget contrast

``` r
d <- data
swap_nontargetContrast.lmm.lme4 <- lmer(twoIncorrect ~ nontargetContrast + (1|SID), data = d)
summary(swap_targetContrast.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ targetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 2634.2
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.2688 -0.5367  0.1437  0.7174  2.5858 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  36.73    6.06   
    ##  Residual             596.11   24.42   
    ## Number of obs: 285, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                 Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)       56.975      2.177  21.806   26.18   <2e-16 ***
    ## targetContrast1  -16.951      1.641 273.956  -10.33   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrst1 -0.353

``` r
aov.swap_nontargetContrast <- Anova(swap_nontargetContrast.lmm.lme4)
print(aov.swap_nontargetContrast)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                   Chisq Df Pr(>Chisq)    
    ## nontargetContrast 82.42  1  < 2.2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## T1

``` r
d <- data %>% filter(Target==1)
swap_nontargetContrastT1.lmm.lme4 <- lmer(twoIncorrect ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1269.5
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.54127 -0.71118  0.01196  0.76123  1.94338 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  59.52    7.715  
    ##  Residual             463.91   21.539  
    ## Number of obs: 141, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)          50.631      2.606  17.774  19.431 2.03e-13 ***
    ## nontargetContrast1   10.511      1.864 123.413   5.638 1.11e-07 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCntr1 -0.155

``` r
aov.swap_nontargetContrastT1 <- Anova(swap_nontargetContrastT1.lmm.lme4)
print(aov.swap_nontargetContrastT1)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                    Chisq Df Pr(>Chisq)    
    ## nontargetContrast 31.784  1  1.723e-08 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## T2

``` r
d <- data %>% filter(Target==2)
swap_nontargetContrastT2.lmm.lme4 <- lmer(twoIncorrect ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1358.9
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.12757 -0.84799 -0.06028  0.89000  2.69437 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   4.357   2.087  
    ##  Residual             778.376  27.899  
    ## Number of obs: 144, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)          41.440      2.444  19.243  16.958 4.97e-13 ***
    ## nontargetContrast1   17.546      2.393 129.273   7.331 2.21e-11 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCntr1 -0.231

``` r
aov.swap_nontargetContrastT2 <- Anova(swap_nontargetContrastT2.lmm.lme4)
print(aov.swap_nontargetContrastT2)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                    Chisq Df Pr(>Chisq)    
    ## nontargetContrast 53.746  1  2.281e-13 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## TP

``` r
d <- data %>% filter(targetContrast==1)
swap_nontargetContrastTP.lmm.lme4 <- lmer(twoIncorrect ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1874.2
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.60294 -0.67185  0.00158  0.69096  2.73457 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  61.15    7.82   
    ##  Residual             460.24   21.45   
    ## Number of obs: 208, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)          40.026      2.369  17.376  16.893 3.19e-12 ***
    ## nontargetContrast1    6.120      1.489 189.772   4.111 5.87e-05 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCntr1 0.000

``` r
aov.swap_nontargetContrastTP <- Anova(swap_nontargetContrastTP.lmm.lme4)
print(aov.swap_nontargetContrastTP)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                    Chisq Df Pr(>Chisq)    
    ## nontargetContrast 16.898  1  3.944e-05 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

### T1

``` r
d <- data %>% filter(targetContrast==1, Target==1)
swap_nontargetContrastTPT1.lmm.lme4 <- lmer(twoIncorrect ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTPT1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 924.8
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.03377 -0.73095 -0.00182  0.57864  2.82298 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  67.87    8.238  
    ##  Residual             313.30   17.700  
    ## Number of obs: 107, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)          46.797      2.589 17.069  18.077 1.44e-12 ***
    ## nontargetContrast1    5.088      1.712 88.220   2.972  0.00381 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCntr1 -0.007

``` r
aov.swap_nontargetContrastTPT1 <- Anova(swap_nontargetContrastTPT1.lmm.lme4)
print(aov.swap_nontargetContrastTPT1)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                    Chisq Df Pr(>Chisq)   
    ## nontargetContrast 8.8331  1   0.002958 **
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

### T2

``` r
d <- data %>% filter(targetContrast==1, Target==2)
swap_nontargetContrastTPT2.lmm.lme4 <- lmer(twoIncorrect ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTPT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 914.7
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.09159 -0.80441 -0.06746  0.63577  2.61107 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  94.17    9.704  
    ##  Residual             484.01   22.000  
    ## Number of obs: 101, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)          32.755      3.171 17.328  10.330 7.93e-09 ***
    ## nontargetContrast1    6.922      2.195 83.193   3.154  0.00224 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCntr1 0.007

``` r
aov.swap_nontargetContrastTPT2 <- Anova(swap_nontargetContrastTPT2.lmm.lme4)
print(aov.swap_nontargetContrastTPT2)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                    Chisq Df Pr(>Chisq)   
    ## nontargetContrast 9.9489  1   0.001609 **
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## TA

``` r
d <- data %>% filter(targetContrast==0)
swap_nontargetContrastTA.lmm.lme4 <- lmer(twoIncorrect ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTA.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 663.9
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -4.1316 -0.2504  0.1170  0.6443  1.1312 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  10.65    3.263  
    ##  Residual             361.04   19.001  
    ## Number of obs: 77, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)          40.229      4.182 44.662   9.620 1.86e-12 ***
    ## nontargetContrast1   40.291      4.101 74.869   9.825 4.16e-15 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCntr1 -0.832

``` r
aov.swap_nontargetContrastTA <- Anova(swap_nontargetContrastTA.lmm.lme4)
print(aov.swap_nontargetContrastTA)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                    Chisq Df Pr(>Chisq)    
    ## nontargetContrast 96.526  1  < 2.2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

### T1

``` r
d <- data %>% filter(targetContrast==0, Target==1)
swap_nontargetContrastTAT1.lmm.lme4 <- lmer(twoIncorrect ~ nontargetContrast + (1|SID), data = d)
print(swap_nontargetContrastTAT1.lmm.lme4)
```

    ## Linear mixed model fit by REML ['lmerModLmerTest']
    ## Formula: twoIncorrect ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## REML criterion at convergence: 295.9412
    ## Random effects:
    ##  Groups   Name        Std.Dev.
    ##  SID      (Intercept)  5.943  
    ##  Residual             21.884  
    ## Number of obs: 34, groups:  SID, 17
    ## Fixed Effects:
    ##        (Intercept)  nontargetContrast1  
    ##              37.65               39.53

``` r
aov.swap_nontargetContrastTAT1 <- Anova(swap_nontargetContrastTAT1.lmm.lme4)
summary(aov.swap_nontargetContrastTAT1)
```

    ##      Chisq             Df      Pr(>Chisq)       
    ##  Min.   :23.43   Min.   :1   Min.   :1.297e-06  
    ##  1st Qu.:23.43   1st Qu.:1   1st Qu.:1.297e-06  
    ##  Median :23.43   Median :1   Median :1.297e-06  
    ##  Mean   :23.43   Mean   :1   Mean   :1.297e-06  
    ##  3rd Qu.:23.43   3rd Qu.:1   3rd Qu.:1.297e-06  
    ##  Max.   :23.43   Max.   :1   Max.   :1.297e-06

### T2

``` r
d <- data %>% filter(targetContrast==0, Target==2)
swap_nontargetContrastTAT2.lmm.lme4 <- lmer(twoIncorrect ~ nontargetContrast + (1|SID), data = d)
summary(swap_nontargetContrastTAT2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 351.2
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.8460 -0.2844  0.0117  0.8133  1.1404 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   5.523   2.35   
    ##  Residual             257.404  16.04   
    ## Number of obs: 43, groups:  SID, 17
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)          41.708      4.280 34.446   9.744 1.97e-11 ***
    ## nontargetContrast1   41.608      4.243 39.294   9.807 4.09e-12 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCntr1 -0.808

``` r
aov.swap_nontargetContrastTAT2 <- Anova(swap_nontargetContrastTAT2.lmm.lme4)
print(aov.swap_nontargetContrastTAT2)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                    Chisq Df Pr(>Chisq)    
    ## nontargetContrast 96.174  1  < 2.2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
