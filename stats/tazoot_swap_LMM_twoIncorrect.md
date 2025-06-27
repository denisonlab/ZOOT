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

| Validity | Target | targetContrast | nontargetContrast |   mean |     sd |   n |    se | ci.lower | ci.upper |
|:---------|:-------|:---------------|:------------------|-------:|-------:|----:|------:|---------:|---------:|
| 1        | 1      | 1              | 1                 | 57.616 | 15.442 |  18 | 3.640 |   50.482 |   64.750 |
| 1        | 1      | 1              | 0                 | 33.004 | 17.647 |  18 | 4.159 |   24.852 |   41.157 |
| 1        | 1      | 0              | 1                 | 88.269 | 11.705 |  15 | 3.022 |   82.346 |   94.193 |
| 1        | 1      | 0              | 0                 |  0.000 |     NA |   1 |    NA |       NA |       NA |
| 1        | 2      | 1              | 1                 | 37.380 | 20.078 |  18 | 4.732 |   28.104 |   46.655 |
| 1        | 2      | 1              | 0                 | 23.094 | 18.189 |  18 | 4.287 |   14.691 |   31.497 |
| 1        | 2      | 0              | 1                 | 84.529 | 12.491 |  17 | 3.029 |   78.591 |   90.466 |
| 1        | 2      | 0              | 0                 |  0.000 |  0.000 |   3 | 0.000 |    0.000 |    0.000 |
| 2        | 1      | 1              | 1                 | 49.661 | 17.889 |  18 | 4.217 |   41.397 |   57.926 |
| 2        | 1      | 1              | 0                 | 45.682 | 25.165 |  17 | 6.103 |   33.719 |   57.644 |
| 2        | 1      | 0              | 1                 | 62.295 | 29.846 |  10 | 9.438 |   43.796 |   80.794 |
| 2        | 1      | 0              | 0                 |  0.000 |     NA |   1 |    NA |       NA |       NA |
| 2        | 2      | 1              | 1                 | 41.161 | 28.005 |  16 | 7.001 |   27.438 |   54.883 |
| 2        | 2      | 1              | 0                 | 23.125 | 29.701 |  16 | 7.425 |    8.571 |   37.679 |
| 2        | 2      | 0              | 1                 | 80.539 | 23.047 |  10 | 7.288 |   66.254 |   94.823 |
| 3        | 1      | 1              | 1                 | 48.378 | 14.398 |  18 | 3.394 |   41.727 |   55.030 |
| 3        | 1      | 1              | 0                 | 46.880 | 22.112 |  18 | 5.212 |   36.665 |   57.095 |
| 3        | 1      | 0              | 1                 | 74.693 | 19.836 |   7 | 7.497 |   59.998 |   89.388 |
| 3        | 2      | 1              | 1                 | 42.101 | 18.654 |  16 | 4.664 |   32.960 |   51.241 |
| 3        | 2      | 1              | 0                 | 31.125 | 28.891 |  17 | 7.007 |   17.391 |   44.859 |
| 3        | 2      | 0              | 1                 | 83.866 | 17.553 |  12 | 5.067 |   73.934 |   93.797 |
| 3        | 2      | 0              | 0                 |  0.000 |     NA |   1 |    NA |       NA |       NA |

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
    ## REML criterion at convergence: 2385.1
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
    ##                                        Estimate Std. Error       df t value
    ## (Intercept)                             52.6299     2.1073  18.0214  24.975
    ## Validity.L                              -0.1011     2.0958 245.5505  -0.048
    ## Validity.Q                               3.0032     2.1616 246.4557   1.389
    ## Target.L                                -4.7942     1.7401 246.4960  -2.755
    ## combinedContrast.L                      22.7215     2.2290 248.7744  10.193
    ## combinedContrast.Q                      23.1102     2.0389 245.9701  11.335
    ## Validity.L:Target.L                      3.7204     2.9676 246.1407   1.254
    ## Validity.Q:Target.L                     -1.5416     3.0614 247.1812  -0.504
    ## Validity.L:combinedContrast.L           -3.3576     3.7833 246.7231  -0.887
    ## Validity.Q:combinedContrast.L            5.6243     3.8968 246.2586   1.443
    ## Validity.L:combinedContrast.Q           -9.4850     3.4764 244.9808  -2.728
    ## Validity.Q:combinedContrast.Q            4.5988     3.5723 245.0513   1.287
    ## Target.L:combinedContrast.L              9.6187     3.1352 246.3962   3.068
    ## Target.L:combinedContrast.Q              8.0102     2.8836 245.9654   2.778
    ## Validity.L:Target.L:combinedContrast.L   0.1945     5.3478 246.5537   0.036
    ## Validity.Q:Target.L:combinedContrast.L  -3.3691     5.5149 246.6154  -0.611
    ## Validity.L:Target.L:combinedContrast.Q   8.3123     4.9232 245.6300   1.688
    ## Validity.Q:Target.L:combinedContrast.Q  -8.3636     5.0551 245.3236  -1.654
    ##                                        Pr(>|t|)    
    ## (Intercept)                            1.96e-15 ***
    ## Validity.L                              0.96158    
    ## Validity.Q                              0.16599    
    ## Target.L                                0.00631 ** 
    ## combinedContrast.L                      < 2e-16 ***
    ## combinedContrast.Q                      < 2e-16 ***
    ## Validity.L:Target.L                     0.21115    
    ## Validity.Q:Target.L                     0.61501    
    ## Validity.L:combinedContrast.L           0.37568    
    ## Validity.Q:combinedContrast.L           0.15021    
    ## Validity.L:combinedContrast.Q           0.00683 ** 
    ## Validity.Q:combinedContrast.Q           0.19919    
    ## Target.L:combinedContrast.L             0.00240 ** 
    ## Target.L:combinedContrast.Q             0.00589 ** 
    ## Validity.L:Target.L:combinedContrast.L  0.97102    
    ## Validity.Q:Target.L:combinedContrast.L  0.54182    
    ## Validity.L:Target.L:combinedContrast.Q  0.09261 .  
    ## Validity.Q:Target.L:combinedContrast.Q  0.09931 .  
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
    ## REML criterion at convergence: 2411
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
    ##                                                 Estimate Std. Error       df
    ## (Intercept)                                      37.4325     3.3475  91.1451
    ## Validity.L                                       -2.3952     4.7208 253.7581
    ## Validity.Q                                        3.9622     6.8259 250.7850
    ## Target.L                                         -3.6432     4.6758 251.4851
    ## targetContrast.L                                 -3.4581     4.0728 257.1171
    ## nontargetContrast.L                             -34.8308     4.0109 255.6572
    ## Validity.L:Target.L                               2.0922     3.7548 248.4770
    ## Validity.Q:Target.L                              -1.0183     3.9016 249.4233
    ## Validity.L:targetContrast.L                      -7.6612     6.6705 253.8309
    ## Validity.Q:targetContrast.L                       5.4908     9.6394 249.9717
    ## Target.L:targetContrast.L                         8.7523     6.6031 250.8680
    ## Validity.L:nontargetContrast.L                    2.2347     6.5038 252.0323
    ## Validity.Q:nontargetContrast.L                   -1.3039     9.6369 250.4035
    ## Target.L:nontargetContrast.L                     -2.9921     6.4600 250.4191
    ## targetContrast.L:nontargetContrast.L            -37.0207     5.6725 255.6695
    ## Validity.L:Target.L:targetContrast.L              0.1943     5.3272 248.4914
    ## Validity.Q:Target.L:targetContrast.L             -3.3659     5.4937 248.5568
    ## Validity.L:Target.L:nontargetContrast.L          -7.1017     4.6928 246.4758
    ## Validity.Q:Target.L:nontargetContrast.L           5.5578     4.7771 246.7297
    ## Validity.L:targetContrast.L:nontargetContrast.L  -6.0819     9.2260 252.0450
    ## Validity.Q:targetContrast.L:nontargetContrast.L  -0.1882    13.6090 250.3995
    ## Target.L:targetContrast.L:nontargetContrast.L    -1.2226     9.1007 250.2986
    ##                                                 t value Pr(>|t|)    
    ## (Intercept)                                      11.182  < 2e-16 ***
    ## Validity.L                                       -0.507    0.612    
    ## Validity.Q                                        0.580    0.562    
    ## Target.L                                         -0.779    0.437    
    ## targetContrast.L                                 -0.849    0.397    
    ## nontargetContrast.L                              -8.684 4.61e-16 ***
    ## Validity.L:Target.L                               0.557    0.578    
    ## Validity.Q:Target.L                              -0.261    0.794    
    ## Validity.L:targetContrast.L                      -1.149    0.252    
    ## Validity.Q:targetContrast.L                       0.570    0.569    
    ## Target.L:targetContrast.L                         1.325    0.186    
    ## Validity.L:nontargetContrast.L                    0.344    0.731    
    ## Validity.Q:nontargetContrast.L                   -0.135    0.892    
    ## Target.L:nontargetContrast.L                     -0.463    0.644    
    ## targetContrast.L:nontargetContrast.L             -6.526 3.60e-10 ***
    ## Validity.L:Target.L:targetContrast.L              0.036    0.971    
    ## Validity.Q:Target.L:targetContrast.L             -0.613    0.541    
    ## Validity.L:Target.L:nontargetContrast.L          -1.513    0.131    
    ## Validity.Q:Target.L:nontargetContrast.L           1.163    0.246    
    ## Validity.L:targetContrast.L:nontargetContrast.L  -0.659    0.510    
    ## Validity.Q:targetContrast.L:nontargetContrast.L  -0.014    0.989    
    ## Target.L:targetContrast.L:nontargetContrast.L    -0.134    0.893    
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
    ## REML criterion at convergence: 1161.3
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
    ##                                                 Estimate Std. Error      df
    ## (Intercept)                                       40.097      5.350 113.389
    ## Validity.L                                        -3.969      9.924 120.173
    ## Validity.Q                                         4.064      3.471 115.867
    ## targetContrast.L                                  -9.522      6.944 119.336
    ## nontargetContrast.L                              -32.715      6.879 118.184
    ## Validity.L:targetContrast.L                       -7.932     14.035 120.173
    ## Validity.Q:targetContrast.L                        6.994      4.861 115.233
    ## Validity.L:nontargetContrast.L                     7.086     13.751 119.375
    ## Validity.Q:nontargetContrast.L                    -5.099      4.091 113.286
    ## targetContrast.L:nontargetContrast.L             -36.155      9.741 118.201
    ## Validity.L:targetContrast.L:nontargetContrast.L   -6.324     19.447 119.375
    ##                                                 t value Pr(>|t|)    
    ## (Intercept)                                       7.495 1.58e-11 ***
    ## Validity.L                                       -0.400 0.689909    
    ## Validity.Q                                        1.171 0.244120    
    ## targetContrast.L                                 -1.371 0.172897    
    ## nontargetContrast.L                              -4.756 5.63e-06 ***
    ## Validity.L:targetContrast.L                      -0.565 0.573005    
    ## Validity.Q:targetContrast.L                       1.439 0.152915    
    ## Validity.L:nontargetContrast.L                    0.515 0.607321    
    ## Validity.Q:nontargetContrast.L                   -1.246 0.215201    
    ## targetContrast.L:nontargetContrast.L             -3.712 0.000315 ***
    ## Validity.L:targetContrast.L:nontargetContrast.L  -0.325 0.745625    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##              (Intr) Vldt.L Vldt.Q trgC.L nntC.L Vldty.L:tC.L Vldty.Q:tC.L
    ## Validity.L   0.657                                                       
    ## Validity.Q   0.265  0.336                                                
    ## trgtCntrs.L  0.864  0.718  0.294                                         
    ## nntrgtCnt.L  0.839  0.702  0.286  0.915                                  
    ## Vldty.L:tC.L 0.657  0.958  0.336  0.718  0.702                           
    ## Vldty.Q:tC.L 0.266  0.334  0.649  0.290  0.287  0.334                    
    ## Vldty.L:nC.L 0.640  0.937  0.291  0.699  0.713  0.937        0.289       
    ## Vldty.Q:nC.L 0.219  0.254  0.428  0.244  0.240  0.254        0.415       
    ## trgtC.L:C.L  0.839  0.702  0.291  0.916  0.942  0.702        0.287       
    ## V.L:C.L:C.L  0.640  0.937  0.291  0.699  0.713  0.937        0.289       
    ##              Vldty.L:nC.L Vldty.Q:nC.L tC.L:C
    ## Validity.L                                   
    ## Validity.Q                                   
    ## trgtCntrs.L                                  
    ## nntrgtCnt.L                                  
    ## Vldty.L:tC.L                                 
    ## Vldty.Q:tC.L                                 
    ## Vldty.L:nC.L                                 
    ## Vldty.Q:nC.L 0.258                           
    ## trgtC.L:C.L  0.714        0.245              
    ## V.L:C.L:C.L  0.957        0.258        0.714 
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
    ## REML criterion at convergence: 1238.6
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
    ##                                                 Estimate Std. Error      df
    ## (Intercept)                                       35.207      3.928  81.205
    ## Validity.L                                         0.573      5.071 128.183
    ## Validity.Q                                         3.254      4.205 121.177
    ## targetContrast.L                                   3.253      5.143 127.151
    ## nontargetContrast.L                              -36.873      5.072 126.310
    ## Validity.L:targetContrast.L                       -5.349      7.174 128.365
    ## Validity.Q:targetContrast.L                        3.183      5.949 120.151
    ## Validity.L:nontargetContrast.L                    -1.013      7.149 126.736
    ## Validity.Q:nontargetContrast.L                     3.013      5.319 118.089
    ## targetContrast.L:nontargetContrast.L             -37.983      7.141 126.299
    ## Validity.L:targetContrast.L:nontargetContrast.L   -4.065     10.110 126.752
    ##                                                 t value Pr(>|t|)    
    ## (Intercept)                                       8.963 9.23e-14 ***
    ## Validity.L                                        0.113    0.910    
    ## Validity.Q                                        0.774    0.441    
    ## targetContrast.L                                  0.633    0.528    
    ## nontargetContrast.L                              -7.270 3.31e-11 ***
    ## Validity.L:targetContrast.L                      -0.746    0.457    
    ## Validity.Q:targetContrast.L                       0.535    0.594    
    ## Validity.L:nontargetContrast.L                   -0.142    0.887    
    ## Validity.Q:nontargetContrast.L                    0.566    0.572    
    ## targetContrast.L:nontargetContrast.L             -5.319 4.58e-07 ***
    ## Validity.L:targetContrast.L:nontargetContrast.L  -0.402    0.688    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##              (Intr) Vldt.L Vldt.Q trgC.L nntC.L Vldty.L:tC.L Vldty.Q:tC.L
    ## Validity.L    0.369                                                      
    ## Validity.Q   -0.256  0.020                                               
    ## trgtCntrs.L   0.766  0.389 -0.264                                        
    ## nntrgtCnt.L   0.731  0.375 -0.216  0.791                                 
    ## Vldty.L:tC.L  0.360  0.738  0.014  0.395  0.375                          
    ## Vldty.Q:tC.L -0.248  0.016  0.598 -0.275 -0.218  0.027                   
    ## Vldty.L:nC.L  0.354  0.705 -0.020  0.383  0.408  0.709       -0.013      
    ## Vldty.Q:nC.L -0.197 -0.003  0.445 -0.208 -0.226  0.004        0.450      
    ## trgtC.L:C.L   0.732  0.380 -0.204  0.788  0.820  0.374       -0.211      
    ## V.L:C.L:C.L   0.360  0.709 -0.024  0.384  0.404  0.705       -0.024      
    ##              Vldty.L:nC.L Vldty.Q:nC.L tC.L:C
    ## Validity.L                                   
    ## Validity.Q                                   
    ## trgtCntrs.L                                  
    ## nntrgtCnt.L                                  
    ## Vldty.L:tC.L                                 
    ## Vldty.Q:tC.L                                 
    ## Vldty.L:nC.L                                 
    ## Vldty.Q:nC.L  0.009                          
    ## trgtC.L:C.L   0.402       -0.206             
    ## V.L:C.L:C.L   0.737       -0.010        0.414
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
swapTP.lmm.lme4 <- lmer(twoIncorrect ~ Validity * nontargetContrast + (1|SID), data = d)
summary(swapTP.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity * nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 1852.1
    ## 
    ## Scaled residuals: 
    ##      Min       1Q   Median       3Q      Max 
    ## -2.58243 -0.61551 -0.02338  0.65765  2.77411 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  61.32    7.831  
    ##  Residual             457.63   21.392  
    ## Number of obs: 208, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                                 Estimate Std. Error        df t value Pr(>|t|)
    ## (Intercept)                     40.04868    2.36914  17.38753  16.904 3.12e-12
    ## Validity.L                       3.16595    2.54978 185.63598   1.242   0.2159
    ## Validity.Q                      -0.08988    2.59733 186.36438  -0.035   0.9724
    ## nontargetContrast.L             -8.58185    2.10048 185.78982  -4.086 6.53e-05
    ## Validity.L:nontargetContrast.L   6.65263    3.60626 185.68130   1.845   0.0667
    ## Validity.Q:nontargetContrast.L  -1.14236    3.66954 185.86881  -0.311   0.7559
    ##                                   
    ## (Intercept)                    ***
    ## Validity.L                        
    ## Validity.Q                        
    ## nontargetContrast.L            ***
    ## Validity.L:nontargetContrast.L .  
    ## Validity.Q:nontargetContrast.L    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldt.L Vldt.Q nntC.L V.L:C.
    ## Validity.L   0.011                            
    ## Validity.Q  -0.016  0.013                     
    ## nntrgtCnt.L  0.000 -0.006 -0.011              
    ## Vldty.L:C.L -0.004 -0.008 -0.005  0.018       
    ## Vldty.Q:C.L -0.007 -0.004  0.008 -0.024  0.013

``` r
aov.swapTP <- Anova(swapTP.lmm.lme4)
print(aov.swapTP)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                              Chisq Df Pr(>Chisq)    
    ## Validity                    1.5756  2     0.4548    
    ## nontargetContrast          17.0534  1  3.634e-05 ***
    ## Validity:nontargetContrast  3.5152  2     0.1725    
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
    ## REML criterion at convergence: 897
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
    ##                                Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)                     46.8332     2.5829 17.0794  18.132 1.36e-12 ***
    ## Validity.L                       1.6398     2.8527 84.0911   0.575  0.56694    
    ## Validity.Q                      -0.8909     2.8836 84.3608  -0.309  0.75811    
    ## nontargetContrast.L             -7.1444     2.3419 84.2275  -3.051  0.00305 ** 
    ## Validity.L:nontargetContrast.L  11.5569     4.0343 84.0911   2.865  0.00527 ** 
    ## Validity.Q:nontargetContrast.L  -5.1116     4.0780 84.3608  -1.253  0.21350    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldt.L Vldt.Q nntC.L V.L:C.
    ## Validity.L   0.000                            
    ## Validity.Q  -0.010  0.000                     
    ## nntrgtCnt.L  0.007  0.000 -0.015              
    ## Vldty.L:C.L  0.000  0.000  0.000  0.000       
    ## Vldty.Q:C.L -0.010  0.000  0.021 -0.015  0.000

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
    ## REML criterion at convergence: 892.8
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
    ##                                Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)                     32.8147     3.1578 17.3672  10.392 7.09e-09 ***
    ## Validity.L                       4.1540     3.8157 79.1055   1.089  0.27961    
    ## Validity.Q                       0.8801     3.9300 80.8013   0.224  0.82336    
    ## nontargetContrast.L             -9.8680     3.1564 79.3030  -3.126  0.00247 ** 
    ## Validity.L:nontargetContrast.L   2.0404     5.3982 79.2247   0.378  0.70646    
    ## Validity.Q:nontargetContrast.L   2.9621     5.5351 79.3774   0.535  0.59404    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldt.L Vldt.Q nntC.L V.L:C.
    ## Validity.L   0.026                            
    ## Validity.Q  -0.028  0.028                     
    ## nntrgtCnt.L -0.008 -0.014 -0.008              
    ## Vldty.L:C.L -0.010 -0.017 -0.010  0.039       
    ## Vldty.Q:C.L -0.005 -0.010 -0.006 -0.035  0.027

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
swapTA.lmm.lme4 <- lmer(twoIncorrect ~ Validity  * nontargetContrast + (1|SID), data = d)
summary(swapTA.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity * nontargetContrast + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 632.6
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.6594 -0.3192  0.0286  0.6043  1.5799 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)  27.47    5.242  
    ##  Residual             327.22   18.089  
    ## Number of obs: 77, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##                                Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)                      38.841      5.048  53.652   7.695 3.20e-10 ***
    ## Validity.L                       -3.461      7.640  70.077  -0.453    0.652    
    ## Validity.Q                        5.662      8.749  59.477   0.647    0.520    
    ## nontargetContrast.L             -57.072      6.859  70.825  -8.321 4.31e-12 ***
    ## Validity.L:nontargetContrast.L    1.405     10.718  67.827   0.131    0.896    
    ## Validity.Q:nontargetContrast.L   -5.992     12.385  60.152  -0.484    0.630    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldt.L Vldt.Q nntC.L V.L:C.
    ## Validity.L   0.436                            
    ## Validity.Q  -0.220  0.243                     
    ## nntrgtCnt.L  0.866  0.422 -0.216              
    ## Vldty.L:C.L  0.414  0.880  0.234  0.448       
    ## Vldty.Q:C.L -0.206  0.225  0.897 -0.221  0.247

``` r
aov.swapTA <- Anova(swapTA.lmm.lme4)
print(aov.swapTA)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##                               Chisq Df Pr(>Chisq)    
    ## Validity                     8.3822  2    0.01513 *  
    ## nontargetContrast          107.3653  1    < 2e-16 ***
    ## Validity:nontargetContrast   0.3010  2    0.86029    
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
    ## REML criterion at convergence: 264.6
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
    ##                                Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)                      36.074     10.022  24.319   3.599 0.001418 ** 
    ## Validity.L                       -1.504     19.604  19.515  -0.077 0.939610    
    ## Validity.Q                       13.170      5.521  17.194   2.386 0.028815 *  
    ## nontargetContrast.L             -53.457     13.221  16.895  -4.043 0.000854 ***
    ## Validity.L:nontargetContrast.L   17.607     26.867  18.644   0.655 0.520253    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldt.L Vldt.Q nntC.L
    ## Validity.L  0.681                      
    ## Validity.Q  0.227  0.308               
    ## nntrgtCnt.L 0.895  0.699  0.241        
    ## Vldty.L:C.L 0.659  0.957  0.249  0.712 
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
    ## REML criterion at convergence: 333.9
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
    ##                                Estimate Std. Error       df t value Pr(>|t|)
    ## (Intercept)                     40.8960     5.1845  34.2099   7.888 3.33e-09
    ## Validity.L                      -0.2230     7.1943  37.9800  -0.031    0.975
    ## Validity.Q                       3.0003     5.0223  29.8112   0.597    0.555
    ## nontargetContrast.L            -59.5164     7.1882  36.7486  -8.280 6.35e-10
    ## Validity.L:nontargetContrast.L   0.3312    10.1684  37.3511   0.033    0.974
    ##                                   
    ## (Intercept)                    ***
    ## Validity.L                        
    ## Validity.Q                        
    ## nontargetContrast.L            ***
    ## Validity.L:nontargetContrast.L    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldt.L Vldt.Q nntC.L
    ## Validity.L   0.449                     
    ## Validity.Q  -0.241  0.027              
    ## nntrgtCnt.L  0.855  0.435 -0.159       
    ## Vldty.L:C.L  0.438  0.808 -0.027  0.469
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
    ## REML criterion at convergence: 1509.6
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
    ##                             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)                   62.558      2.032  19.393  30.790   <2e-16 ***
    ## Validity.L                    -3.121      2.527 155.261  -1.235   0.2188    
    ## Validity.Q                     5.326      2.636 156.447   2.020   0.0450 *  
    ## targetContrast.L              23.179      2.122 159.593  10.922   <2e-16 ***
    ## Validity.L:targetContrast.L   -2.333      3.581 156.293  -0.652   0.5156    
    ## Validity.Q:targetContrast.L    6.529      3.727 156.217   1.752   0.0818 .  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldt.L Vldt.Q trgC.L V.L:C.
    ## Validity.L   0.100                            
    ## Validity.Q  -0.046  0.091                     
    ## trgtCntrs.L  0.170  0.116 -0.052              
    ## Vldty.L:C.L  0.088  0.194  0.076  0.138       
    ## Vldty.Q:C.L -0.034  0.080  0.243 -0.057  0.093

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
    ## REML criterion at convergence: 705.6
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
    ##                             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)                   63.225      2.418 20.088  26.152  < 2e-16 ***
    ## Validity.L                    -8.764      3.386 69.077  -2.588   0.0118 *  
    ## Validity.Q                     8.632      3.341 67.758   2.584   0.0119 *  
    ## targetContrast.L              16.038      2.762 70.488   5.806 1.68e-07 ***
    ## Validity.L:targetContrast.L   -3.157      4.789 69.077  -0.659   0.5120    
    ## Validity.Q:targetContrast.L    8.356      4.725 67.758   1.769   0.0815 .  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldt.L Vldt.Q trgC.L V.L:C.
    ## Validity.L  0.168                             
    ## Validity.Q  0.010  0.143                      
    ## trgtCntrs.L 0.260  0.207  0.013               
    ## Vldty.L:C.L 0.168  0.324  0.143  0.207        
    ## Vldty.Q:C.L 0.010  0.143  0.305  0.013  0.143

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
    ## REML criterion at convergence: 755.6
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
    ##                             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)                   61.361      2.503 17.133  24.518 8.77e-15 ***
    ## Validity.L                     1.534      3.554 68.623   0.432    0.667    
    ## Validity.Q                     1.462      3.854 71.682   0.379    0.706    
    ## targetContrast.L              30.077      3.034 71.958   9.914 4.28e-15 ***
    ## Validity.L:targetContrast.L   -2.427      5.033 69.639  -0.482    0.631    
    ## Validity.Q:targetContrast.L    3.506      5.440 70.310   0.644    0.521    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldt.L Vldt.Q trgC.L V.L:C.
    ## Validity.L   0.085                            
    ## Validity.Q  -0.098  0.066                     
    ## trgtCntrs.L  0.135  0.055 -0.091              
    ## Vldty.L:C.L  0.050  0.096  0.033  0.102       
    ## Vldty.Q:C.L -0.070  0.038  0.196 -0.106  0.066

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
    ## REML criterion at convergence: 969
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
    ##                             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)                   10.222      6.625  83.061   1.543 0.126623    
    ## Validity.L                    -3.879      9.268  96.338  -0.419 0.676487    
    ## Validity.Q                     4.018     10.482  89.819   0.383 0.702419    
    ## targetContrast.L             -33.701      8.495  99.599  -3.967 0.000137 ***
    ## Validity.L:targetContrast.L  -16.668     13.108  96.343  -1.272 0.206566    
    ## Validity.Q:targetContrast.L    7.109     14.806  89.585   0.480 0.632289    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldt.L Vldt.Q trgC.L V.L:C.
    ## Validity.L   0.419                            
    ## Validity.Q  -0.215  0.210                     
    ## trgtCntrs.L  0.850  0.460 -0.234              
    ## Vldty.L:C.L  0.418  0.922  0.209  0.460       
    ## Vldty.Q:C.L -0.213  0.212  0.936 -0.236  0.213

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
    ## REML criterion at convergence: 452.3
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
    ##                             Estimate Std. Error      df t value Pr(>|t|)   
    ## (Intercept)                   12.287      9.896  47.721   1.242  0.22043   
    ## Validity.L                    -7.083     18.746  38.736  -0.378  0.70761   
    ## Validity.Q                    -4.498      3.993  33.654  -1.126  0.26797   
    ## targetContrast.L             -41.707     13.192  38.445  -3.162  0.00306 **
    ## Validity.L:targetContrast.L  -23.893     26.510  38.736  -0.901  0.37302   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldt.L Vldt.Q trgC.L
    ## Validity.L  0.669                      
    ## Validity.Q  0.158  0.184               
    ## trgtCntrs.L 0.914  0.711  0.176        
    ## Vldty.L:C.L 0.669  0.978  0.184  0.711 
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
    ## REML criterion at convergence: 469.9
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
    ##                             Estimate Std. Error      df t value Pr(>|t|)   
    ## (Intercept)                    4.298      7.416  47.006   0.579  0.56503   
    ## Validity.L                    -7.704      9.013  38.620  -0.855  0.39795   
    ## Validity.Q                     2.357      4.789  33.926   0.492  0.62582   
    ## targetContrast.L             -31.140      8.864  37.701  -3.513  0.00117 **
    ## Validity.L:targetContrast.L  -19.266     12.749  38.638  -1.511  0.13886   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldt.L Vldt.Q trgC.L
    ## Validity.L   0.403                     
    ## Validity.Q  -0.135 -0.009              
    ## trgtCntrs.L  0.769  0.469 -0.137       
    ## Vldty.L:C.L  0.400  0.869 -0.021  0.471
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
    ## REML criterion at convergence: 879.2
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
    ##                     Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)          45.9751     2.2544 17.1007  20.393 1.94e-13 ***
    ## Validity.L           -1.6846     3.1442 81.7782  -0.536  0.59358    
    ## Validity.Q            0.8117     3.1783 82.2684   0.255  0.79906    
    ## Target.L             -8.3579     2.5806 81.8592  -3.239  0.00174 ** 
    ## Validity.L:Target.L   6.8555     4.4466 81.7782   1.542  0.12700    
    ## Validity.Q:Target.L  -2.7038     4.4948 82.2684  -0.602  0.54914    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldt.L Vldt.Q Trgt.L V.L:T.
    ## Validity.L   0.021                            
    ## Validity.Q  -0.012  0.019                     
    ## Target.L     0.034  0.026 -0.015              
    ## Vldty.L:T.L  0.021  0.032  0.019  0.026       
    ## Vldty.Q:T.L -0.012  0.019  0.053 -0.015  0.019

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
    ## REML criterion at convergence: 910.8
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
    ##                     Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)           33.865      3.491  17.236   9.700 2.13e-08 ***
    ## Validity.L             7.729      3.457  81.422   2.236 0.028091 *  
    ## Validity.Q            -0.859      3.554  81.933  -0.242 0.809616    
    ## Target.L             -11.080      2.863  81.709  -3.870 0.000218 ***
    ## Validity.L:Target.L   -2.945      4.889  81.422  -0.602 0.548610    
    ## Validity.Q:Target.L    4.873      5.028  82.029   0.969 0.335294    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldt.L Vldt.Q Trgt.L V.L:T.
    ## Validity.L   0.007                            
    ## Validity.Q  -0.022  0.010                     
    ## Target.L     0.013  0.013 -0.009              
    ## Vldty.L:T.L  0.007  0.016  0.010  0.013       
    ## Vldty.Q:T.L -0.005  0.009  0.029 -0.039  0.009

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
    ## REML criterion at convergence: 583.8
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
    ##                     Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)           78.726      2.660 16.786  29.601 6.32e-16 ***
    ## Validity.L            -5.642      3.788 54.863  -1.489   0.1421    
    ## Validity.Q             9.414      3.954 54.623   2.381   0.0208 *  
    ## Target.L               5.738      3.173 56.387   1.808   0.0759 .  
    ## Validity.L:Target.L    7.532      5.374 56.504   1.401   0.1665    
    ## Validity.Q:Target.L   -8.216      5.611 56.288  -1.464   0.1487    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Vldt.L Vldt.Q Trgt.L V.L:T.
    ## Validity.L   0.208                            
    ## Validity.Q  -0.058  0.161                     
    ## Target.L    -0.108 -0.121 -0.083              
    ## Vldty.L:T.L -0.105 -0.202 -0.081  0.239       
    ## Vldty.Q:T.L -0.078 -0.088 -0.060 -0.064  0.163

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
    ## REML criterion at convergence: 2718.6
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
    ##             Estimate Std. Error       df t value Pr(>|t|)    
    ## (Intercept)  48.9390     2.2614  17.2316  21.641  6.2e-14 ***
    ## Validity.L   -0.8974     2.9142 267.3822  -0.308    0.758    
    ## Validity.Q    2.9453     3.0200 268.2929   0.975    0.330    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.059       
    ## Validity.Q -0.039  0.053

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
    ## REML criterion at convergence: 1884.1
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
    ## Validity.L    3.1355     2.6653 188.6783   1.176    0.241    
    ## Validity.Q   -0.1803     2.7147 189.4712  -0.066    0.947    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.012       
    ## Validity.Q -0.016  0.013

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
    ## REML criterion at convergence: 927.7
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
    ## Validity.L    1.6398     3.1074 87.1110   0.528    0.599    
    ## Validity.Q   -0.9569     3.1395 87.4142  -0.305    0.761    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.000       
    ## Validity.Q -0.010  0.000

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
    ## REML criterion at convergence: 917.4
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
    ## Validity.L    4.0490     3.9642 82.0693   1.021    0.310    
    ## Validity.Q    0.8153     4.0828 83.8822   0.200    0.842    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.027       
    ## Validity.Q -0.029  0.028

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
    ## REML criterion at convergence: 719.3
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
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)  73.8169     3.6633 16.2358  20.151 6.45e-13 ***
    ## Validity.L   -0.7833     5.6784 68.7145  -0.138    0.891    
    ## Validity.Q    6.8470     6.0626 64.4601   1.129    0.263    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.215       
    ## Validity.Q -0.094  0.152

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
    ## REML criterion at convergence: 301.2
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
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   71.359      4.956 31.000  14.399 2.82e-15 ***
    ## Validity.L    -5.699      8.753 31.000  -0.651     0.52    
    ## Validity.Q    18.037      8.411 31.000   2.144     0.04 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L 0.326        
    ## Validity.Q 0.057  0.235 
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
    ## REML criterion at convergence: 393.9
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
    ## Validity.L     3.935      7.492 40.000   0.525    0.602    
    ## Validity.Q    -4.823      8.813 40.000  -0.547    0.587    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.159       
    ## Validity.Q -0.211  0.104
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
    ## REML criterion at convergence: 1619.7
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
    ## Validity.L    -5.677      3.291 157.872  -1.725   0.0865 .  
    ## Validity.Q     5.608      3.406 159.379   1.646   0.1017    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.085       
    ## Validity.Q -0.041  0.069

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
    ## REML criterion at convergence: 753.5
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
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   60.275      2.572  18.488  23.439 3.31e-15 ***
    ## Validity.L   -11.490      3.873  70.329  -2.967  0.00411 ** 
    ## Validity.Q     7.523      3.892  70.033   1.933  0.05730 .  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.100       
    ## Validity.Q -0.008  0.080

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
    ## REML criterion at convergence: 838.1
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
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)  58.8622     3.1646 86.0000  18.600   <2e-16 ***
    ## Validity.L   -0.1983     5.3101 86.0000  -0.037    0.970    
    ## Validity.Q    3.1306     5.6473 86.0000   0.554    0.581    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.088       
    ## Validity.Q -0.084  0.060
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
    ## REML criterion at convergence: 1003.8
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
    ## Validity.L     8.754      3.861 91.482   2.267   0.0257 *  
    ## Validity.Q    -1.463      4.010 91.926  -0.365   0.7161    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.031       
    ## Validity.Q -0.038  0.025

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
    ## REML criterion at convergence: 478.6
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
    ## Validity.L    10.939      4.516 35.050   2.422   0.0207 *  
    ## Validity.Q    -3.013      4.582 35.825  -0.658   0.5150    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.013       
    ## Validity.Q -0.014  0.013

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
    ## REML criterion at convergence: 492.6
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
    ## Validity.L    6.2346     5.1838 36.6711   1.203    0.237    
    ## Validity.Q    0.4194     5.5518 37.2592   0.076    0.940    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.046       
    ## Validity.Q -0.065  0.039

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
    ## REML criterion at convergence: 905.6
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
    ## Validity.L   -1.5202     3.3375 84.8680  -0.455    0.650    
    ## Validity.Q    0.6679     3.3708 85.3647   0.198    0.843    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.021       
    ## Validity.Q -0.012  0.017

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
    ## REML criterion at convergence: 437.2
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.5435 -0.8628  0.0212  0.6411  3.1507 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0.0     0.00   
    ##  Residual             255.3    15.98   
    ## Number of obs: 54, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   51.885      2.174 51.000  23.864   <2e-16 ***
    ## Validity.L    -6.532      3.766 51.000  -1.735   0.0889 .  
    ## Validity.Q     2.724      3.766 51.000   0.723   0.4728    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L 0.000        
    ## Validity.Q 0.000  0.000 
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
    ## REML criterion at convergence: 435.4
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
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   40.055      3.405 16.311  11.762  2.2e-09 ***
    ## Validity.L     3.177      5.270 31.108   0.603    0.551    
    ## Validity.Q    -1.052      5.381 32.040  -0.195    0.846    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.045       
    ## Validity.Q -0.026  0.036

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
    ## REML criterion at convergence: 604.9
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
    ## Validity.L    -4.440      3.819 57.636  -1.163   0.2498    
    ## Validity.Q     9.890      4.061 58.437   2.436   0.0179 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.187       
    ## Validity.Q -0.079  0.140

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
    ## REML criterion at convergence: 263.9
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
    ## Validity.L   -13.954      5.719  18.757  -2.440   0.0248 *  
    ## Validity.Q    13.170      5.521  17.194   2.386   0.0288 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L 0.259        
    ## Validity.Q 0.006  0.228

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
    ## REML criterion at convergence: 315.8
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
    ## Validity.L    -0.458      4.575 26.677  -0.100    0.921    
    ## Validity.Q     2.999      5.161 28.619   0.581    0.566    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.132       
    ## Validity.Q -0.159  0.088

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
    ## REML criterion at convergence: 939.9
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
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   34.063      3.556 17.200   9.580  2.6e-08 ***
    ## Validity.L     7.907      3.701 84.393   2.137   0.0355 *  
    ## Validity.Q    -1.037      3.803 84.963  -0.273   0.7857    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.008       
    ## Validity.Q -0.023  0.009

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
d <- data %>% filter(targetContrast==1, nontargetContrast==1, Target==1)
swap_validityTPNA_T1.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTPNA_T1.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 437.2
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.5435 -0.8628  0.0212  0.6411  3.1507 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  SID      (Intercept)   0.0     0.00   
    ##  Residual             255.3    15.98   
    ## Number of obs: 54, groups:  SID, 18
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   51.885      2.174 51.000  23.864   <2e-16 ***
    ## Validity.L    -6.532      3.766 51.000  -1.735   0.0889 .  
    ## Validity.Q     2.724      3.766 51.000   0.723   0.4728    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L 0.000        
    ## Validity.Q 0.000  0.000 
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
aov.swap_validityTPNA_T1 <- Anova(swap_validityTPNA_T1.lmm.lme4)
print(aov.swap_validityTPNA_T1)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)
    ## Validity 3.5319  2      0.171

### T2

``` r
d <- data %>% filter(targetContrast==1, nontargetContrast==1, Target==2)
swap_validityTPNA_T2.lmm.lme4 <- lmer(twoIncorrect ~ Validity + (1|SID), data = d)
summary(swap_validityTPNA_T2.lmm.lme4)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method [
    ## lmerModLmerTest]
    ## Formula: twoIncorrect ~ Validity + (1 | SID)
    ##    Data: d
    ## 
    ## REML criterion at convergence: 435.4
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
    ##             Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)   40.055      3.405 16.311  11.762  2.2e-09 ***
    ## Validity.L     3.177      5.270 31.108   0.603    0.551    
    ## Validity.Q    -1.052      5.381 32.040  -0.195    0.846    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.045       
    ## Validity.Q -0.026  0.036

``` r
aov.swap_validityTPNA_T2 <- Anova(swap_validityTPNA_T2.lmm.lme4)
print(aov.swap_validityTPNA_T2)
```

    ## Analysis of Deviance Table (Type II Wald chisquare tests)
    ## 
    ## Response: twoIncorrect
    ##           Chisq Df Pr(>Chisq)
    ## Validity 0.4107  2     0.8144

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
    ## REML criterion at convergence: 1290.2
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
    ## Validity.L    -3.596      3.514 123.030  -1.023    0.308    
    ## Validity.Q     3.519      3.544 123.604   0.993    0.323    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.061       
    ## Validity.Q -0.011  0.055

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
    ## REML criterion at convergence: 1398
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
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   45.596      2.761 141.000  16.512   <2e-16 ***
    ## Validity.L     2.069      4.629 141.000   0.447    0.656    
    ## Validity.Q     2.364      4.932 141.000   0.479    0.632    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) Vldt.L
    ## Validity.L  0.077       
    ## Validity.Q -0.087  0.053
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
    ## REML criterion at convergence: 2719.1
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
    ## Target.L      -5.404      2.389 268.556  -2.262   0.0245 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L -0.007

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
    ## REML criterion at convergence: 1868.1
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
    ## Target.L      -9.944      2.076 189.898  -4.791 3.34e-06 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L 0.019

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
    ## REML criterion at convergence: 726.3
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
    ## Target.L       1.942      4.672 67.376   0.416    0.679    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L -0.112

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
    ## REML criterion at convergence: 1630
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
    ## Target.L      -1.661      2.766 161.605   -0.60    0.549    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L -0.014

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
    ## REML criterion at convergence: 1001.2
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
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   32.032      3.099  17.219  10.336 8.38e-09 ***
    ## Target.L     -11.282      3.060  92.156  -3.687 0.000383 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L 0.001

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
    ## REML criterion at convergence: 900.3
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
    ## Target.L      -8.441      2.564 85.781  -3.292  0.00145 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L 0.032

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
    ## REML criterion at convergence: 615.9
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
    ## Target.L       4.307      3.316 60.662   1.299    0.199    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L -0.095

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
    ## REML criterion at convergence: 935.9
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
    ##             Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)   33.820      3.506  17.217   9.646 2.33e-08 ***
    ## Target.L     -11.041      2.897  85.677  -3.811  0.00026 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##          (Intr)
    ## Target.L 0.012

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
    ## REML criterion at convergence: 2633.5
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
    ##                  Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)        56.975      2.177  21.806   26.18   <2e-16 ***
    ## targetContrast.L   23.972      2.321 273.956   10.33   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.353

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
    ## REML criterion at convergence: 1264.4
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
    ##                  Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)        59.743      2.763  23.034  21.619  < 2e-16 ***
    ## targetContrast.L   18.215      2.998 128.595   6.075 1.31e-08 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.407

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
    ## REML criterion at convergence: 1340.4
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
    ##                  Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)        54.152      2.495  22.754  21.703  < 2e-16 ***
    ## targetContrast.L   30.141      3.367 132.997   8.951 2.69e-15 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.386

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
    ## REML criterion at convergence: 1534.2
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
    ##                  Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)        63.244      1.974  18.917   32.04   <2e-16 ***
    ## targetContrast.L   24.112      2.116 163.071   11.40   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.152

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
    ## REML criterion at convergence: 740.2
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
    ##                  Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)        64.486      2.420 18.916   26.65  < 2e-16 ***
    ## targetContrast.L   17.820      2.902 73.865    6.14 3.78e-08 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.229

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
    ## REML criterion at convergence: 775.7
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
    ##                  Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)        61.504      2.435 17.021   25.26 6.23e-15 ***
    ## targetContrast.L   30.444      2.932 75.172   10.38 3.56e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.113

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
    ## REML criterion at convergence: 997.8
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
    ##                  Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)        14.160      5.568  71.027   2.543 0.013176 *  
    ## targetContrast.L  -28.032      6.977 103.436  -4.018 0.000112 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.799

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
    ## REML criterion at convergence: 477.3
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
    ##                  Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)        17.187      7.614  52.808   2.257 0.028163 *  
    ## targetContrast.L  -34.664      9.765  42.435  -3.550 0.000957 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.852

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
    ## REML criterion at convergence: 489.9
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
    ##                  Estimate Std. Error      df t value Pr(>|t|)   
    ## (Intercept)         8.671      6.612  44.211   1.311  0.19648   
    ## targetContrast.L  -24.902      7.788  42.202  -3.197  0.00263 **
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.726

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
    ## REML criterion at convergence: 2633.5
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
    ##                  Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)        56.975      2.177  21.806   26.18   <2e-16 ***
    ## targetContrast.L   23.972      2.321 273.956   10.33   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## trgtCntrs.L 0.353

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
    ## REML criterion at convergence: 1268.8
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
    ##                     Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)           50.631      2.606  17.774  19.431 2.03e-13 ***
    ## nontargetContrast.L  -14.865      2.637 123.413  -5.638 1.11e-07 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.155

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
    ## REML criterion at convergence: 1358.2
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
    ##                     Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)           41.440      2.444  19.243  16.958 4.97e-13 ***
    ## nontargetContrast.L  -24.814      3.385 129.273  -7.331 2.21e-11 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.231

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
    ## REML criterion at convergence: 1873.5
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
    ##                     Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)           40.026      2.369  17.376  16.893 3.19e-12 ***
    ## nontargetContrast.L   -8.654      2.105 189.772  -4.111 5.87e-05 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.000

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
    ## REML criterion at convergence: 924.1
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
    ##                     Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)           46.797      2.589 17.069  18.077 1.44e-12 ***
    ## nontargetContrast.L   -7.196      2.421 88.220  -2.972  0.00381 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.007

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
    ## REML criterion at convergence: 914
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
    ##                     Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)           32.755      3.171 17.328  10.330 7.93e-09 ***
    ## nontargetContrast.L   -9.789      3.104 83.193  -3.154  0.00224 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L -0.007

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
    ## REML criterion at convergence: 663.2
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
    ##                     Estimate Std. Error      df t value Pr(>|t|)    
    ## (Intercept)           40.229      4.182  44.662   9.620 1.86e-12 ***
    ## nontargetContrast.L  -56.980      5.800  74.869  -9.825 4.16e-15 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.832

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
    ## REML criterion at convergence: 295.2481
    ## Random effects:
    ##  Groups   Name        Std.Dev.
    ##  SID      (Intercept)  5.943  
    ##  Residual             21.884  
    ## Number of obs: 34, groups:  SID, 17
    ## Fixed Effects:
    ##         (Intercept)  nontargetContrast.L  
    ##               37.65               -55.91

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
    ## REML criterion at convergence: 350.5
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
    ##                     Estimate Std. Error     df t value Pr(>|t|)    
    ## (Intercept)            41.71       4.28  34.45   9.744 1.97e-11 ***
    ## nontargetContrast.L   -58.84       6.00  39.29  -9.807 4.09e-12 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## nntrgtCnt.L 0.808

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
