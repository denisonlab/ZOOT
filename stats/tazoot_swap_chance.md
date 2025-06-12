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
    ## 50.22) and mu = 50 suggests that the effect is positive, statistically not
    ## significant, and very small (difference = 0.22, 95% CI [43.91, 56.52], t(91) =
    ## 0.07, p = 0.946; Cohen's d = 7.07e-03, 95% CI [-0.20, 0.21])

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
    ## 49.03) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -0.97, 95% CI [42.51, 55.56], t(73) =
    ## -0.29, p = 0.769; Cohen's d = -0.03, 95% CI [-0.26, 0.19])

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
    ## 46.58) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -3.42, 95% CI [39.36, 53.80], t(74) =
    ## -0.94, p = 0.348; Cohen's d = -0.11, 95% CI [-0.34, 0.12])

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
    ## 38.88) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and small (difference = -11.12, 95% CI [35.28, 42.48], t(172) =
    ## -6.10, p < .001; Cohen's d = -0.46, 95% CI [-0.62, -0.31])

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
    ## 46.13) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -3.87, 95% CI [41.82, 50.45], t(88) =
    ## -1.78, p = 0.078; Cohen's d = -0.19, 95% CI [-0.40, 0.02])

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
    ## 31.19) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and medium (difference = -18.81, 95% CI [25.73, 36.64], t(83) =
    ## -6.86, p < .001; Cohen's d = -0.75, 95% CI [-0.99, -0.50])

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
    ## 37.31) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and medium (difference = -12.69, 95% CI [31.84, 42.78], t(59) =
    ## -4.64, p < .001; Cohen's d = -0.60, 95% CI [-0.87, -0.32])

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
    ## 40.63) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and small (difference = -9.37, 95% CI [34.54, 46.72], t(56) =
    ## -3.08, p = 0.003; Cohen's d = -0.41, 95% CI [-0.68, -0.14])

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
    ## 38.76) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and small (difference = -11.24, 95% CI [31.30, 46.23], t(55) =
    ## -3.02, p = 0.004; Cohen's d = -0.40, 95% CI [-0.67, -0.13])

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
    ## 44.00) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and small (difference = -6.00, 95% CI [36.60, 51.41], t(29) =
    ## -1.66, p = 0.108; Cohen's d = -0.30, 95% CI [-0.67, 0.07])

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
    ## 48.06) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -1.94, 95% CI [40.77, 55.35], t(29) =
    ## -0.55, p = 0.590; Cohen's d = -0.10, 95% CI [-0.46, 0.26])

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
    ## 46.35) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -3.65, 95% CI [37.77, 54.92], t(28) =
    ## -0.87, p = 0.390; Cohen's d = -0.16, 95% CI [-0.53, 0.21])

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
    ## 30.63) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and large (difference = -19.37, 95% CI [22.91, 38.34], t(29) =
    ## -5.14, p < .001; Cohen's d = -0.94, 95% CI [-1.36, -0.50])

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
    ## 32.38) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and medium (difference = -17.62, 95% CI [22.89, 41.88], t(26) =
    ## -3.81, p < .001; Cohen's d = -0.73, 95% CI [-1.15, -0.30])

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
    ## 30.62) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and medium (difference = -19.38, 95% CI [18.35, 42.89], t(26) =
    ## -3.25, p = 0.003; Cohen's d = -0.62, 95% CI [-1.03, -0.21])

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
    ## 73.77) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 23.77, 95% CI [66.69, 80.85], t(67) =
    ## 6.70, p < .001; Cohen's d = 0.81, 95% CI [0.54, 1.08])

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
    ## 71.56) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and medium (difference = 21.56, 95% CI [60.96, 82.15], t(31) =
    ## 4.15, p < .001; Cohen's d = 0.73, 95% CI [0.34, 1.12])

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
    ## 75.73) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 25.73, 95% CI [65.79, 85.68], t(35) =
    ## 5.25, p < .001; Cohen's d = 0.88, 95% CI [0.49, 1.26])

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
    ## 74.41) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and medium (difference = 24.41, 95% CI [63.34, 85.47], t(31) =
    ## 4.50, p < .001; Cohen's d = 0.80, 95% CI [0.39, 1.19])

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
    ## 77.21) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 27.21, 95% CI [63.78, 90.64], t(16) =
    ## 4.30, p < .001; Cohen's d = 1.04, 95% CI [0.44, 1.63])

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
    ## 69.61) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and medium (difference = 19.61, 95% CI [54.95, 84.27], t(18) =
    ## 2.81, p = 0.012; Cohen's d = 0.64, 95% CI [0.14, 1.13])

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
    ## 82.94) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 32.94, 95% CI [68.73, 97.14], t(14) =
    ## 4.97, p < .001; Cohen's d = 1.28, 95% CI [0.58, 1.96])

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
    ## 70.48) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 20.48, 95% CI [51.62, 89.33], t(5) = 2.79,
    ## p = 0.038; Cohen's d = 1.14, 95% CI [0.06, 2.16])

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
    ## 66.88) and mu = 50 suggests that the effect is positive, statistically not
    ## significant, and medium (difference = 16.88, 95% CI [49.68, 84.09], t(16) =
    ## 2.08, p = 0.054; Cohen's d = 0.50, 95% CI [-8.46e-03, 1.00])

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
    ## 80.88) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 30.88, 95% CI [60.86, 100.91], t(10) =
    ## 3.44, p = 0.006; Cohen's d = 1.04, 95% CI [0.28, 1.76])

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
    ## 87.46) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 37.46, 95% CI [79.07, 95.85], t(7) =
    ## 10.55, p < .001; Cohen's d = 3.73, 95% CI [1.69, 5.75])

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
    ## 45.06) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and small (difference = -4.94, 95% CI [40.67, 49.45], t(85) =
    ## -2.24, p = 0.028; Cohen's d = -0.24, 95% CI [-0.46, -0.03])

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
    ## 51.51) and mu = 50 suggests that the effect is positive, statistically not
    ## significant, and very small (difference = 1.51, 95% CI [46.65, 56.38], t(44) =
    ## 0.63, p = 0.534; Cohen's d = 0.09, 95% CI [-0.20, 0.39])

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
    ## 37.97) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and medium (difference = -12.03, 95% CI [30.89, 45.06], t(40) =
    ## -3.43, p = 0.001; Cohen's d = -0.54, 95% CI [-0.86, -0.21])

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
    ## 45.72) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and small (difference = -4.28, 95% CI [38.12, 53.32], t(29) =
    ## -1.15, p = 0.259; Cohen's d = -0.21, 95% CI [-0.57, 0.15])

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
    ## 43.91) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and small (difference = -6.09, 95% CI [37.52, 50.31], t(27) =
    ## -1.95, p = 0.061; Cohen's d = -0.37, 95% CI [-0.75, 0.02])

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
    ## 45.50) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -4.50, 95% CI [35.99, 55.00], t(27) =
    ## -0.97, p = 0.340; Cohen's d = -0.18, 95% CI [-0.56, 0.19])

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
    ## 54.81) and mu = 50 suggests that the effect is positive, statistically not
    ## significant, and small (difference = 4.81, 95% CI [46.30, 63.31], t(14) = 1.21,
    ## p = 0.246; Cohen's d = 0.31, 95% CI [-0.21, 0.83])

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
    ## 48.81) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -1.19, 95% CI [41.06, 56.56], t(14) =
    ## -0.33, p = 0.747; Cohen's d = -0.08, 95% CI [-0.59, 0.42])

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
    ## 50.93) and mu = 50 suggests that the effect is positive, statistically not
    ## significant, and very small (difference = 0.93, 95% CI [40.22, 61.63], t(14) =
    ## 0.19, p = 0.855; Cohen's d = 0.05, 95% CI [-0.46, 0.55])

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
    ## 36.63) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and medium (difference = -13.37, 95% CI [24.94, 48.33], t(14) =
    ## -2.45, p = 0.028; Cohen's d = -0.63, 95% CI [-1.18, -0.07])

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
    ## 38.26) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and medium (difference = -11.74, 95% CI [27.48, 49.05], t(12) =
    ## -2.37, p = 0.035; Cohen's d = -0.66, 95% CI [-1.25, -0.04])

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
    ## 39.23) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and small (difference = -10.77, 95% CI [21.74, 56.72], t(12) =
    ## -1.34, p = 0.204; Cohen's d = -0.37, 95% CI [-0.93, 0.20])

\#TPNA

``` r
d <- data 
dt <- d %>% filter(targetContrast == 1, nontargetContrast == 0)
swap_TPNA <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TPNA)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 32.76) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and medium (difference = -17.24, 95% CI [27.29, 38.24], t(86) =
    ## -6.25, p < .001; Cohen's d = -0.67, 95% CI [-0.90, -0.44])

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
    ## 40.63) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and small (difference = -9.37, 95% CI [33.64, 47.62], t(43) =
    ## -2.70, p = 0.010; Cohen's d = -0.41, 95% CI [-0.71, -0.10])

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
    ## 24.72) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and large (difference = -25.28, 95% CI [16.69, 32.74], t(42) =
    ## -6.36, p < .001; Cohen's d = -0.97, 95% CI [-1.33, -0.60])

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
    ## 28.91) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and large (difference = -21.09, 95% CI [21.90, 35.91], t(29) =
    ## -6.16, p < .001; Cohen's d = -1.12, 95% CI [-1.58, -0.66])

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
    ## 37.46) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and small (difference = -12.54, 95% CI [26.90, 48.02], t(28) =
    ## -2.43, p = 0.022; Cohen's d = -0.45, 95% CI [-0.83, -0.07])

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
    ## 32.03) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and medium (difference = -17.97, 95% CI [20.48, 43.57], t(27) =
    ## -3.19, p = 0.004; Cohen's d = -0.60, 95% CI [-1.00, -0.20])

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
    ## 33.20) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and large (difference = -16.80, 95% CI [23.16, 43.23], t(14) =
    ## -3.59, p = 0.003; Cohen's d = -0.93, 95% CI [-1.53, -0.31])

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
    ## 47.30) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and very small (difference = -2.70, 95% CI [33.82, 60.78], t(14) =
    ## -0.43, p = 0.674; Cohen's d = -0.11, 95% CI [-0.62, 0.40])

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
    ## 41.44) and mu = 50 suggests that the effect is negative, statistically not
    ## significant, and small (difference = -8.56, 95% CI [26.82, 56.06], t(13) =
    ## -1.26, p = 0.228; Cohen's d = -0.34, 95% CI [-0.87, 0.21])

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
    ## 24.62) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and large (difference = -25.38, 95% CI [14.10, 35.13], t(14) =
    ## -5.18, p < .001; Cohen's d = -1.34, 95% CI [-2.03, -0.62])

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
    ## 26.92) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and large (difference = -23.08, 95% CI [10.68, 43.16], t(13) =
    ## -3.07, p = 0.009; Cohen's d = -0.82, 95% CI [-1.42, -0.20])

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
    ## 22.62) and mu = 50 suggests that the effect is negative, statistically
    ## significant, and large (difference = -27.38, 95% CI [4.28, 40.96], t(13) =
    ## -3.23, p = 0.007; Cohen's d = -0.86, 95% CI [-1.47, -0.23])

\#TANP

``` r
d <- data 
dt <- d %>% filter(targetContrast == 0, nontargetContrast == 1)
swap_TANP <-t.test(dt$twoIncorrect, mu=50) 
report(swap_TANP)
```

    ## Effect sizes were labelled following Cohen's (1988) recommendations.
    ## 
    ## The One Sample t-test testing the difference between dt$twoIncorrect (mean =
    ## 80.91) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 30.91, 95% CI [76.14, 85.67], t(61) =
    ## 12.97, p < .001; Cohen's d = 1.65, 95% CI [1.26, 2.03])

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
    ## 76.33) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 26.33, 95% CI [67.60, 85.06], t(29) =
    ## 6.17, p < .001; Cohen's d = 1.13, 95% CI [0.66, 1.58])

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
    ## 85.20) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 35.20, 95% CI [80.89, 89.51], t(31) =
    ## 16.67, p < .001; Cohen's d = 2.95, 95% CI [2.13, 3.75])

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
    ## 85.04) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 35.04, 95% CI [80.39, 89.68], t(27) =
    ## 15.47, p < .001; Cohen's d = 2.92, 95% CI [2.06, 3.78])

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
    ## 82.04) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 32.04, 95% CI [72.72, 91.35], t(15) =
    ## 7.33, p < .001; Cohen's d = 1.83, 95% CI [1.01, 2.64])

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
    ## 73.48) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 23.48, 95% CI [60.52, 86.43], t(17) =
    ## 3.82, p = 0.001; Cohen's d = 0.90, 95% CI [0.34, 1.44])

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
    ## 88.86) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 38.86, 95% CI [81.98, 95.74], t(13) =
    ## 12.21, p < .001; Cohen's d = 3.26, 95% CI [1.91, 4.60])

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
    ## 70.48) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 20.48, 95% CI [51.62, 89.33], t(5) = 2.79,
    ## p = 0.038; Cohen's d = 1.14, 95% CI [0.06, 2.16])

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
    ## 81.21) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 31.21, 95% CI [74.76, 87.67], t(13) =
    ## 10.45, p < .001; Cohen's d = 2.79, 95% CI [1.60, 3.96])

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
    ## 88.97) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 38.97, 95% CI [79.18, 98.76], t(9) = 9.00,
    ## p < .001; Cohen's d = 2.85, 95% CI [1.40, 4.27])

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
    ## 87.46) and mu = 50 suggests that the effect is positive, statistically
    ## significant, and large (difference = 37.46, 95% CI [79.07, 95.85], t(7) =
    ## 10.55, p < .001; Cohen's d = 3.73, 95% CI [1.69, 5.75])
