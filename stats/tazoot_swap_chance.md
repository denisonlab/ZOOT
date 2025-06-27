tazoot_swap_chance
================
Jenny Motzer
2025-06-10

# V

``` r
d <- data 
dt <- d %>% filter(Validity == 1)
swap_V <-t.test(dt$twoIncorrect, mu=50) 
report(swap_V)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 50.75) and mu = 50 suggests that the effect is positive, statistically not
    ## significant, and very small (difference = 0.75, 95% CI [44.90, 56.60], t(107) =
    ## 0.25, p = 0.801; Cohen's d = 0.02, 95% CI [-0.16, 0.21])

# N

``` r
d <- data 
dt <- d %>% filter(Validity == 3)
swap_N <-t.test(dt$twoIncorrect, mu=50) 
report(swap_N)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 49.96) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -0.04, 95% CI [44.28, 55.64], t(88) =
    ## -0.01, p = 0.989; Cohen's d = -1.40e-03, 95% CI [-0.21, 0.21])

# I

``` r
d <- data 
dt <- d %>% filter(Validity == 2)
swap_I <-t.test(dt$twoIncorrect, mu=50) 
report(swap_I)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 46.90) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -3.10, 95% CI [40.52, 53.29], t(87) =
    ## -0.96, p = 0.338; Cohen's d = -0.10, 95% CI [-0.31, 0.11])

# T1

``` r
d <- data 
dt <- d %>% filter(Target == 1)
swap_T1 <-t.test(dt$twoIncorrect, mu=50) 
report(swap_T1)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 53.09) and mu = 50 suggests that the effect is positive, statistically not
    ## significant, and very small (difference = 3.09, 95% CI [48.94, 57.25], t(140) =
    ## 1.47, p = 0.143; Cohen's d = 0.12, 95% CI [-0.04, 0.29])

## V

``` r
d <- data 
dt <- d %>% filter(Target==1, Validity == 1)
swap_T1V <-t.test(dt$twoIncorrect, mu=50) 
report(swap_T1V)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 56.83) and mu = 50 suggests that the effect is positive, statistically not
    ## significant, and small (difference = 6.83, 95% CI [49.08, 64.58], t(51) = 1.77,
    ## p = 0.083; Cohen's d = 0.25, 95% CI [-0.03, 0.52])

## N

``` r
d <- data 
dt <- d %>% filter(Target==1, Validity == 3)
swap_T1N <-t.test(dt$twoIncorrect, mu=50) 
report(swap_T1N)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 52.03) and mu = 50 suggests that the effect is positive, statistically not
    ## significant, and very small (difference = 2.03, 95% CI [45.57, 58.50], t(42) =
    ## 0.64, p = 0.528; Cohen's d = 0.10, 95% CI [-0.20, 0.40])

## I

``` r
d <- data 
dt <- d %>% filter(Target==1, Validity == 2)
swap_T1I <-t.test(dt$twoIncorrect, mu=50) 
report(swap_T1I)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 49.86) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -0.14, 95% CI [42.46, 57.25], t(45) =
    ## -0.04, p = 0.969; Cohen's d = -5.73e-03, 95% CI [-0.29, 0.28])

# T2

``` r
d <- data 
dt <- d %>% filter(Target == 2)
swap_T2 <-t.test(dt$twoIncorrect, mu=50) 
report(swap_T2)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 45.62) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -4.38, 95% CI [40.23, 51.00], t(143)
    ## = -1.61, p = 0.110; Cohen's d = -0.13, 95% CI [-0.30, 0.03])

## V

``` r
d <- data 
dt <- d %>% filter(Target==2, Validity == 1)
swap_T2V <-t.test(dt$twoIncorrect, mu=50) 
report(swap_T2V)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 45.10) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -4.90, 95% CI [36.45, 53.74], t(55) =
    ## -1.14, p = 0.261; Cohen's d = -0.15, 95% CI [-0.41, 0.11])

## N

``` r
d <- data 
dt <- d %>% filter(Target==2, Validity == 3)
swap_T2N <-t.test(dt$twoIncorrect, mu=50) 
report(swap_T2N)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 48.02) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -1.98, 95% CI [38.62, 57.43], t(45) =
    ## -0.42, p = 0.674; Cohen's d = -0.06, 95% CI [-0.35, 0.23])

## I

``` r
d <- data 
dt <- d %>% filter(Target==2, Validity == 2)
swap_T2I <-t.test(dt$twoIncorrect, mu=50) 
report(swap_T2I)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 43.67) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -6.33, 95% CI [32.76, 54.57], t(41) =
    ## -1.17, p = 0.248; Cohen's d = -0.18, 95% CI [-0.48, 0.13])

# TP

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1)
swap_TP <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TP)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 40.08) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and small (difference = -9.92, 95% CI [36.86, 43.30], t(207) =
    ## -6.07, p < .001; Cohen's d = -0.42, 95% CI [-0.56, -0.28])

## T1

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, Target==1)
swap_TPT1 <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPT1)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 46.88) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -3.12, 95% CI [43.04, 50.72], t(106)
    ## = -1.61, p = 0.110; Cohen's d = -0.16, 95% CI [-0.35, 0.04])

## T2

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, Target==2)
swap_TPT2 <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPT2)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 32.87) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and medium (difference = -17.13, 95% CI [27.95, 37.79], t(100) =
    ## -6.90, p < .001; Cohen's d = -0.69, 95% CI [-0.90, -0.47])

## V

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, Validity==1)
swap_TPV <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPV)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 37.77) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and medium (difference = -12.23, 95% CI [32.69, 42.85], t(71) =
    ## -4.80, p < .001; Cohen's d = -0.57, 95% CI [-0.81, -0.31])

## N

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, Validity==3)
swap_TPN <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPN)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 42.28) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and small (difference = -7.72, 95% CI [36.94, 47.62], t(68) =
    ## -2.89, p = 0.005; Cohen's d = -0.35, 95% CI [-0.59, -0.10])

## I

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, Validity==2)
swap_TPI <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPI)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 40.28) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and small (difference = -9.72, 95% CI [33.75, 46.82], t(66) =
    ## -2.97, p = 0.004; Cohen's d = -0.36, 95% CI [-0.61, -0.11])

## T1 V

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, Validity==1, Target==1)
swap_TPT1V <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPT1V)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 45.31) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and small (difference = -4.69, 95% CI [38.35, 52.27], t(35) =
    ## -1.37, p = 0.180; Cohen's d = -0.23, 95% CI [-0.56, 0.10])

## T1 N

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, Validity==3, Target==1)
swap_TPT1N <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPT1N)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 47.63) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -2.37, 95% CI [41.40, 53.86], t(35) =
    ## -0.77, p = 0.445; Cohen's d = -0.13, 95% CI [-0.46, 0.20])

## T1 I

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, Validity==2, Target==1)
swap_TPT1I <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPT1I)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 47.73) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -2.27, 95% CI [40.34, 55.11], t(34) =
    ## -0.63, p = 0.536; Cohen's d = -0.11, 95% CI [-0.44, 0.23])

## T2 V

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, Validity==1, Target==2)
swap_TPT2V <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPT2V)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 30.24) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and large (difference = -19.76, 95% CI [23.39, 37.08], t(35) =
    ## -5.86, p < .001; Cohen's d = -0.98, 95% CI [-1.37, -0.57])

## T2 N

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, Validity==3, Target==2)
swap_TPT2N <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPT2N)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 36.45) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and medium (difference = -13.55, 95% CI [27.68, 45.21], t(32) =
    ## -3.15, p = 0.004; Cohen's d = -0.55, 95% CI [-0.91, -0.18])

## T2 I

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, Validity==2, Target==2)
swap_TPT2I <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPT2I)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 32.14) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and medium (difference = -17.86, 95% CI [21.39, 42.90], t(31) =
    ## -3.39, p = 0.002; Cohen's d = -0.60, 95% CI [-0.97, -0.22])

# TA

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0)
swap_TA <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TA)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 74.27) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 24.27, 95% CI [67.70, 80.84], t(76) =
    ## 7.35, p < .001; Cohen's d = 0.84, 95% CI [0.58, 1.10])

## T1

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, Target==1)
swap_TAT1 <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TAT1)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 72.64) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and medium (difference = 22.64, 95% CI [62.55, 82.74], t(33) =
    ## 4.56, p < .001; Cohen's d = 0.78, 95% CI [0.39, 1.16])

## T2

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, Target==2)
swap_TAT2 <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TAT2)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 75.55) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 25.55, 95% CI [66.55, 84.56], t(42) =
    ## 5.73, p < .001; Cohen's d = 0.87, 95% CI [0.52, 1.22])

## V

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, Validity==1)
swap_TAV <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TAV)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 76.70) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 26.70, 95% CI [66.63, 86.76], t(35) =
    ## 5.38, p < .001; Cohen's d = 0.90, 95% CI [0.50, 1.28])

## N

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, Validity==3)
swap_TAN <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TAN)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 76.46) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 26.46, 95% CI [64.57, 88.36], t(19) =
    ## 4.66, p < .001; Cohen's d = 1.04, 95% CI [0.48, 1.58])

## I

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, Validity==2)
swap_TAI <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TAI)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 68.02) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and medium (difference = 18.02, 95% CI [53.87, 82.16], t(20) =
    ## 2.66, p = 0.015; Cohen's d = 0.58, 95% CI [0.11, 1.04])

## T1 V

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, Validity==1, Target==1)
swap_TAT1V <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TAT1V)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 82.75) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 32.75, 95% CI [69.54, 95.97], t(15) =
    ## 5.28, p < .001; Cohen's d = 1.32, 95% CI [0.63, 1.99])

## T1 N

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, Validity==3, Target==1)
swap_TAT1N <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TAT1N)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 74.69) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 24.69, 95% CI [56.35, 93.04], t(6) = 3.29,
    ## p = 0.017; Cohen's d = 1.24, 95% CI [0.21, 2.23])

## T1 I

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, Validity==2, Target==1)
swap_TAT1I <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TAT1I)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 56.63) and mu = 50 suggests that the effect is positive, statistically not
    ## significant, and very small (difference = 6.63, 95% CI [33.81, 79.46], t(10) =
    ## 0.65, p = 0.532; Cohen's d = 0.20, 95% CI [-0.41, 0.79])

## T2 V

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, Validity==1, Target==2)
swap_TAT2V <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TAT2V)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 71.85) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and medium (difference = 21.85, 95% CI [56.40, 87.30], t(19) =
    ## 2.96, p = 0.008; Cohen's d = 0.66, 95% CI [0.17, 1.14])

## T2 N

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, Validity==3, Target==2)
swap_TAT2N <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TAT2N)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 77.41) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 27.41, 95% CI [60.07, 94.76], t(12) =
    ## 3.44, p = 0.005; Cohen's d = 0.96, 95% CI [0.28, 1.60])

## T2 I

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, Validity==2, Target==2)
swap_TAT2I <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TAT2I)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 80.54) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 30.54, 95% CI [64.05, 97.03], t(9) = 4.19,
    ## p = 0.002; Cohen's d = 1.33, 95% CI [0.44, 2.17])

\#TPNP

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 1)
swap_TPNP <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNP)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 46.22) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -3.78, 95% CI [42.31, 50.13], t(103)
    ## = -1.92, p = 0.058; Cohen's d = -0.19, 95% CI [-0.38, 6.17e-03])

## T1

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 1, Target==1)
swap_TPNPT1 <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNPT1)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 51.89) and mu = 50 suggests that the effect is positive, statistically not
    ## significant, and very small (difference = 1.89, 95% CI [47.46, 56.31], t(53) =
    ## 0.85, p = 0.397; Cohen's d = 0.12, 95% CI [-0.15, 0.38])

## T2

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 1, Target==2)
swap_TPNPT2 <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNPT2)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 40.10) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and small (difference = -9.90, 95% CI [33.80, 46.40], t(49) =
    ## -3.16, p = 0.003; Cohen's d = -0.45, 95% CI [-0.74, -0.15])

## V

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 1, Validity==1)
swap_TPNPV <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNPV)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 47.50) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -2.50, 95% CI [40.59, 54.41], t(35) =
    ## -0.74, p = 0.467; Cohen's d = -0.12, 95% CI [-0.45, 0.21])

## N

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 1, Validity==3)
swap_TPNPN <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNPN)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 45.42) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and small (difference = -4.58, 95% CI [39.64, 51.21], t(33) =
    ## -1.61, p = 0.117; Cohen's d = -0.28, 95% CI [-0.62, 0.07])

## I

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 1, Validity==2)
swap_TPNPI <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNPI)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 45.66) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -4.34, 95% CI [37.55, 53.77], t(33) =
    ## -1.09, p = 0.284; Cohen's d = -0.19, 95% CI [-0.52, 0.15])

## T1 V

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 1, Validity==1, Target==1)
swap_TPNPT1V <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNPT1V)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 57.62) and mu = 50 suggests that the effect is positive, statistically not
    ## significant, and small (difference = 7.62, 95% CI [49.94, 65.30], t(17) = 2.09,
    ## p = 0.052; Cohen's d = 0.49, 95% CI [-3.60e-03, 0.98])

## T1 N

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 1, Validity==3, Target==1)
swap_TPNPT1N <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNPT1N)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 48.38) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -1.62, 95% CI [41.22, 55.54], t(17) =
    ## -0.48, p = 0.639; Cohen's d = -0.11, 95% CI [-0.57, 0.35])

## T1 I

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 1, Validity==2, Target==1)
swap_TPNPT1I <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNPT1I)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 49.66) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -0.34, 95% CI [40.77, 58.56], t(17) =
    ## -0.08, p = 0.937; Cohen's d = -0.02, 95% CI [-0.48, 0.44])

## T2 V

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 1, Validity==1, Target==2)
swap_TPNPT2V <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNPT2V)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 37.38) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and medium (difference = -12.62, 95% CI [27.40, 47.36], t(17) =
    ## -2.67, p = 0.016; Cohen's d = -0.63, 95% CI [-1.13, -0.11])

## T2 N

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 1, Validity==3, Target==2)
swap_TPNPT2N <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNPT2N)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 42.10) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and small (difference = -7.90, 95% CI [32.16, 52.04], t(15) =
    ## -1.69, p = 0.111; Cohen's d = -0.42, 95% CI [-0.93, 0.10])

## T2 I

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 1, Validity==2, Target==2)
swap_TPNPT2I <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNPT2I)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 41.16) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and small (difference = -8.84, 95% CI [26.24, 56.08], t(15) =
    ## -1.26, p = 0.226; Cohen's d = -0.32, 95% CI [-0.81, 0.19])

# TPNA

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 0)
swap_TPNA <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNA)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 33.94) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and medium (difference = -16.06, 95% CI [29.03, 38.84], t(103) =
    ## -6.50, p < .001; Cohen's d = -0.64, 95% CI [-0.85, -0.43])

## T1

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 0, Target==1)
swap_TPNAT1 <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNAT1)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 41.78) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and small (difference = -8.22, 95% CI [35.64, 47.93], t(52) =
    ## -2.68, p = 0.010; Cohen's d = -0.37, 95% CI [-0.65, -0.09])

## T2

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 0, Target==2)
swap_TPNAT2 <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNAT2)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 25.78) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and large (difference = -24.22, 95% CI [18.56, 33.00], t(50) =
    ## -6.74, p < .001; Cohen's d = -0.94, 95% CI [-1.27, -0.61])

## V

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 0, Validity==1)
swap_TPNAV <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNAV)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 28.05) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and large (difference = -21.95, 95% CI [21.84, 34.26], t(35) =
    ## -7.17, p < .001; Cohen's d = -1.20, 95% CI [-1.62, -0.76])

## N

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 0, Validity==3)
swap_TPNAN <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNAN)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 39.23) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and small (difference = -10.77, 95% CI [30.13, 48.32], t(34) =
    ## -2.41, p = 0.022; Cohen's d = -0.41, 95% CI [-0.75, -0.06])

## I

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 0, Validity==2)
swap_TPNAI <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNAI)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 34.75) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and medium (difference = -15.25, 95% CI [24.34, 45.15], t(32) =
    ## -2.99, p = 0.005; Cohen's d = -0.52, 95% CI [-0.88, -0.15])

## T1 V

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 0, Validity==1, Target==1)
swap_TPNAT1V <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNAT1V)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 33.00) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and large (difference = -17.00, 95% CI [24.23, 41.78], t(17) =
    ## -4.09, p < .001; Cohen's d = -0.96, 95% CI [-1.52, -0.39])

## T1 N

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 0, Validity==3, Target==1)
swap_TPNAT1N <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNAT1N)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 46.88) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -3.12, 95% CI [35.88, 57.88], t(17) =
    ## -0.60, p = 0.557; Cohen's d = -0.14, 95% CI [-0.60, 0.33])

## T1 I

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 0, Validity==2, Target==1)
swap_TPNAT1I <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNAT1I)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 45.68) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -4.32, 95% CI [32.74, 58.62], t(16) =
    ## -0.71, p = 0.489; Cohen's d = -0.17, 95% CI [-0.65, 0.31])

## T2 V

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 0, Validity==1, Target==2)
swap_TPNAT2V <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNAT2V)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 23.09) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and large (difference = -26.91, 95% CI [14.05, 32.14], t(17) =
    ## -6.28, p < .001; Cohen's d = -1.48, 95% CI [-2.14, -0.79])

## T2 N

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 0, Validity==3, Target==2)
swap_TPNAT2N <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNAT2N)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 31.13) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and medium (difference = -18.87, 95% CI [16.27, 45.98], t(16) =
    ## -2.69, p = 0.016; Cohen's d = -0.65, 95% CI [-1.17, -0.12])

## T2 I

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 0, Validity==2, Target==2)
swap_TPNAT2I <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNAT2I)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 23.12) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and large (difference = -26.88, 95% CI [7.30, 38.95], t(15) =
    ## -3.62, p = 0.003; Cohen's d = -0.90, 95% CI [-1.48, -0.31])

# TANP

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, nontargetContrast == 1)
swap_TANP <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TANP)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 80.54) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 30.54, 95% CI [75.82, 85.26], t(70) =
    ## 12.91, p < .001; Cohen's d = 1.53, 95% CI [1.19, 1.87])

## T1

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, nontargetContrast == 1, Target==1)
swap_TANPT1 <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TANPT1)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 77.18) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 27.18, 95% CI [68.89, 85.48], t(31) =
    ## 6.69, p < .001; Cohen's d = 1.18, 95% CI [0.72, 1.63])

## T2

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, nontargetContrast == 1, Target==2)
swap_TANPT2 <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TANPT2)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 83.30) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 33.30, 95% CI [77.84, 88.76], t(38) =
    ## 12.35, p < .001; Cohen's d = 1.98, 95% CI [1.43, 2.52])

## V

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, nontargetContrast == 1, Validity==1)
swap_TANPV <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TANPV)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 86.28) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 36.28, 95% CI [81.93, 90.64], t(31) =
    ## 16.99, p < .001; Cohen's d = 3.00, 95% CI [2.18, 3.82])

## N

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, nontargetContrast == 1, Validity==3)
swap_TANPN <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TANPN)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 80.49) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 30.49, 95% CI [71.60, 89.38], t(18) =
    ## 7.21, p < .001; Cohen's d = 1.65, 95% CI [0.94, 2.34])

## I

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, nontargetContrast == 1, Validity==2)
swap_TANPI <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TANPI)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 71.42) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and medium (difference = 21.42, 95% CI [58.50, 84.33], t(19) =
    ## 3.47, p = 0.003; Cohen's d = 0.78, 95% CI [0.27, 1.27])

## T1 V

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, nontargetContrast == 1, Validity==1, Target==1)
swap_TANPT1V <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TANPT1V)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 88.27) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 38.27, 95% CI [81.79, 94.75], t(14) =
    ## 12.66, p < .001; Cohen's d = 3.27, 95% CI [1.96, 4.56])

## T1 N

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, nontargetContrast == 1, Validity==3, Target==1)
swap_TANPT1N <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TANPT1N)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 74.69) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 24.69, 95% CI [56.35, 93.04], t(6) = 3.29,
    ## p = 0.017; Cohen's d = 1.24, 95% CI [0.21, 2.23])

## T1 I

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, nontargetContrast == 1, Validity==2, Target==1)
swap_TANPT1I <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TANPT1I)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 62.29) and mu = 50 suggests that the effect is positive, statistically not
    ## significant, and small (difference = 12.29, 95% CI [40.94, 83.65], t(9) = 1.30,
    ## p = 0.225; Cohen's d = 0.41, 95% CI [-0.25, 1.05])

## T2 V

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, nontargetContrast == 1, Validity==1, Target==2)
swap_TANPT2V <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TANPT2V)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 84.53) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 34.53, 95% CI [78.11, 90.95], t(16) =
    ## 11.40, p < .001; Cohen's d = 2.76, 95% CI [1.69, 3.82])

## T2 N

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, nontargetContrast == 1, Validity==3, Target==2)
swap_TANPT2N <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TANPT2N)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 83.87) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 33.87, 95% CI [72.71, 95.02], t(11) =
    ## 6.68, p < .001; Cohen's d = 1.93, 95% CI [0.94, 2.89])

## T2 I

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, nontargetContrast == 1, Validity==2, Target==2)
swap_TANPT2I <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TANPT2I)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 80.54) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 30.54, 95% CI [64.05, 97.03], t(9) = 4.19,
    ## p = 0.002; Cohen's d = 1.33, 95% CI [0.44, 2.17])
