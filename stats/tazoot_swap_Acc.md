tazoot_swap_Acc
================
Jenny
2024-10-09

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax
for authoring HTML, PDF, and MS Word documents. For more details on
using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that
includes both content as well as the output of any embedded R code
chunks within the document. You can embed an R code chunk like this:

``` r
# swap accuracy 
d <- data 
acc_anova = ezANOVA(
  data = d,
  dv = .(swapAcc),
  wid = .(SID),
  within = .(targetContrast, nontargetContrast, Target, Validity)
)

print(acc_anova)
```

    ## $ANOVA
    ##                                              Effect DFn DFd           F
    ## 2                                    targetContrast   1  14 50.04998417
    ## 3                                 nontargetContrast   1  14 38.72826481
    ## 4                                            Target   1  14 21.54519563
    ## 5                                          Validity   2  28  4.45151045
    ## 6                  targetContrast:nontargetContrast   1  14  0.03824505
    ## 7                             targetContrast:Target   1  14 35.19550590
    ## 8                          nontargetContrast:Target   1  14  0.54470528
    ## 9                           targetContrast:Validity   2  28 13.33527530
    ## 10                       nontargetContrast:Validity   2  28  0.06686730
    ## 11                                  Target:Validity   2  28  0.15657079
    ## 12          targetContrast:nontargetContrast:Target   1  14  6.90472094
    ## 13        targetContrast:nontargetContrast:Validity   2  28  1.49106096
    ## 14                   targetContrast:Target:Validity   2  28  2.28995560
    ## 15                nontargetContrast:Target:Validity   2  28  2.87773373
    ## 16 targetContrast:nontargetContrast:Target:Validity   2  28  0.28762745
    ##               p p<.05          ges
    ## 2  5.554247e-06     * 0.1154301967
    ## 3  2.225141e-05     * 0.3059088206
    ## 4  3.810525e-04     * 0.0505280260
    ## 5  2.095779e-02     * 0.0160436377
    ## 6  8.477619e-01       0.0002909770
    ## 7  3.655946e-05     * 0.0982506156
    ## 8  4.726801e-01       0.0007526722
    ## 9  8.544058e-05     * 0.0302704996
    ## 10 9.354682e-01       0.0002230609
    ## 11 8.558144e-01       0.0004754314
    ## 12 1.987602e-02     * 0.0158339764
    ## 13 2.424690e-01       0.0038577217
    ## 14 1.199262e-01       0.0093066039
    ## 15 7.301207e-02       0.0046711046
    ## 16 7.522304e-01       0.0005567786
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##                                              Effect         W         p p<.05
    ## 5                                          Validity 0.9902893 0.9385418      
    ## 9                           targetContrast:Validity 0.9871554 0.9194030      
    ## 10                       nontargetContrast:Validity 0.8819571 0.4419861      
    ## 11                                  Target:Validity 0.7632315 0.1726895      
    ## 13        targetContrast:nontargetContrast:Validity 0.8234802 0.2829733      
    ## 14                   targetContrast:Target:Validity 0.7598220 0.1677363      
    ## 15                nontargetContrast:Target:Validity 0.9903455 0.9388877      
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.8106965 0.2556106      
    ## 
    ## $`Sphericity Corrections`
    ##                                              Effect       GGe        p[GG]
    ## 5                                          Validity 0.9903827 2.133550e-02
    ## 9                           targetContrast:Validity 0.9873183 9.309966e-05
    ## 10                       nontargetContrast:Validity 0.8944201 9.188979e-01
    ## 11                                  Target:Validity 0.8085587 8.115398e-01
    ## 13        targetContrast:nontargetContrast:Validity 0.8499644 2.446584e-01
    ## 14                   targetContrast:Target:Validity 0.8063358 1.324414e-01
    ## 15                nontargetContrast:Target:Validity 0.9904378 7.362627e-02
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.8408282 7.149306e-01
    ##    p[GG]<.05       HFe        p[HF] p[HF]<.05
    ## 5          * 1.1527973 2.095779e-02         *
    ## 9          * 1.1483873 8.544058e-05         *
    ## 10           1.0167995 9.354682e-01          
    ## 11           0.8986907 8.341467e-01          
    ## 13           0.9552357 2.432293e-01          
    ## 14           0.8956764 1.265700e-01          
    ## 15           1.1528766 7.301207e-02          
    ## 16           0.9426936 7.396428e-01

``` r
# swap accuracy target present 
d <- data %>% filter(targetContrast==1)
accTP_anova = ezANOVA(
  data = d,
  dv = .(swapAcc),
  wid = .(SID),
  within = .(nontargetContrast, Target, Validity)
)

print(accTP_anova)
```

    ## $ANOVA
    ##                              Effect DFn DFd          F            p p<.05
    ## 2                 nontargetContrast   1  14 32.0261856 5.895362e-05     *
    ## 3                            Target   1  14 45.6957237 9.171928e-06     *
    ## 4                          Validity   2  28  9.7567689 6.092132e-04     *
    ## 5          nontargetContrast:Target   1  14  7.4947535 1.602873e-02     *
    ## 6        nontargetContrast:Validity   2  28  0.5885457 5.618553e-01      
    ## 7                   Target:Validity   2  28  1.1026736 3.459703e-01      
    ## 8 nontargetContrast:Target:Validity   2  28  0.6667842 5.213194e-01      
    ##           ges
    ## 2 0.295030776
    ## 3 0.239290990
    ## 4 0.084556078
    ## 5 0.023257914
    ## 6 0.005459540
    ## 7 0.011196771
    ## 8 0.002077221
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##                              Effect         W         p p<.05
    ## 4                          Validity 0.9809756 0.8826292      
    ## 6        nontargetContrast:Validity 0.8576841 0.3686615      
    ## 7                   Target:Validity 0.7630583 0.1724349      
    ## 8 nontargetContrast:Target:Validity 0.9547441 0.7400573      
    ## 
    ## $`Sphericity Corrections`
    ##                              Effect       GGe        p[GG] p[GG]<.05       HFe
    ## 4                          Validity 0.9813308 0.0006682626         * 1.1397836
    ## 6        nontargetContrast:Validity 0.8754146 0.5411606289           0.9903706
    ## 7                   Target:Validity 0.8084455 0.3370522633           0.8985371
    ## 8 nontargetContrast:Target:Validity 0.9567035 0.5152903505           1.1045754
    ##          p[HF] p[HF]<.05
    ## 4 0.0006092132         *
    ## 6 0.5603451576          
    ## 7 0.3416740476          
    ## 8 0.5213193796

``` r
# swap accuracy target absent 
d <- data %>% filter(targetContrast==0)
accTA_anova = ezANOVA(
  data = d,
  dv = .(swapAcc),
  wid = .(SID),
  within = .(nontargetContrast, Target, Validity)
)

print(accTA_anova)
```

    ## $ANOVA
    ##                              Effect DFn DFd         F            p p<.05
    ## 2                 nontargetContrast   1  14 18.608284 0.0007143191     *
    ## 3                            Target   1  14  2.324745 0.1495992622      
    ## 4                          Validity   2  28  1.063045 0.3589333367      
    ## 5          nontargetContrast:Target   1  14  2.324745 0.1495992622      
    ## 6        nontargetContrast:Validity   2  28  1.063045 0.3589333367      
    ## 7                   Target:Validity   2  28  2.097231 0.1416693345      
    ## 8 nontargetContrast:Target:Validity   2  28  2.097231 0.1416693345      
    ##           ges
    ## 2 0.481076045
    ## 3 0.019370429
    ## 4 0.005376732
    ## 5 0.019370429
    ## 6 0.005376732
    ## 7 0.016554765
    ## 8 0.016554765
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##                              Effect         W         p p<.05
    ## 4                          Validity 0.8276041 0.2923124      
    ## 6        nontargetContrast:Validity 0.8276041 0.2923124      
    ## 7                   Target:Validity 0.7693367 0.1818683      
    ## 8 nontargetContrast:Target:Validity 0.7693367 0.1818683      
    ## 
    ## $`Sphericity Corrections`
    ##                              Effect       GGe     p[GG] p[GG]<.05       HFe
    ## 4                          Validity 0.8529542 0.3512635           0.9593481
    ## 6        nontargetContrast:Validity 0.8529542 0.3512635           0.9593481
    ## 7                   Target:Validity 0.8125700 0.1526360           0.9041354
    ## 8 nontargetContrast:Target:Validity 0.8125700 0.1526360           0.9041354
    ##       p[HF] p[HF]<.05
    ## 4 0.3570066          
    ## 6 0.3570066          
    ## 7 0.1472522          
    ## 8 0.1472522

``` r
# swap accuracy target present nontarget present
d <- data %>% filter(targetContrast==1, nontargetContrast==1)
accTPNP_anova = ezANOVA(
  data = d,
  dv = .(swapAcc),
  wid = .(SID),
  within = .(Target, Validity)
)

print(accTPNP_anova)
```

    ## $ANOVA
    ##            Effect DFn DFd          F            p p<.05         ges
    ## 2          Target   1  14 58.2307362 2.362813e-06     * 0.250689514
    ## 3        Validity   2  28  4.3489681 2.265841e-02     * 0.085476479
    ## 4 Target:Validity   2  28  0.1931209 8.254711e-01       0.002631246
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##            Effect         W         p p<.05
    ## 3        Validity 0.9839218 0.9000025      
    ## 4 Target:Validity 0.8243408 0.2849012      
    ## 
    ## $`Sphericity Corrections`
    ##            Effect       GGe      p[GG] p[GG]<.05       HFe      p[HF] p[HF]<.05
    ## 3        Validity 0.9841762 0.02331068         * 1.1438702 0.02265841         *
    ## 4 Target:Validity 0.8505866 0.79094164           0.9560912 0.81610748

``` r
# swap accuracy target present nontarget absent
d <- data %>% filter(targetContrast==1, nontargetContrast==0)
accTPNA_anova = ezANOVA(
  data = d,
  dv = .(swapAcc),
  wid = .(SID),
  within = .(Target, Validity)
)

print(accTPNA_anova)
```

    ## $ANOVA
    ##            Effect DFn DFd         F            p p<.05        ges
    ## 2          Target   1  14 14.577055 0.0018827431     * 0.25967072
    ## 3        Validity   2  28 11.161483 0.0002725745     * 0.10079903
    ## 4 Target:Validity   2  28  3.862095 0.0330171111     * 0.04610722
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##            Effect         W         p p<.05
    ## 3        Validity 0.9334651 0.6392010      
    ## 4 Target:Validity 0.9009344 0.5075815      
    ## 
    ## $`Sphericity Corrections`
    ##            Effect       GGe        p[GG] p[GG]<.05      HFe        p[HF]
    ## 3        Validity 0.9376158 0.0003889242         * 1.077483 0.0002725745
    ## 4 Target:Validity 0.9098638 0.0377665594         * 1.038397 0.0330171111
    ##   p[HF]<.05
    ## 3         *
    ## 4         *

``` r
# swap accuracy target absent nontarget present
d <- data %>% filter(targetContrast==0, nontargetContrast==1)
accTANP_anova = ezANOVA(
  data = d,
  dv = .(swapAcc),
  wid = .(SID),
  within = .(Target, Validity)
)

print(accTANP_anova)
```

    ## $ANOVA
    ##            Effect DFn DFd        F         p p<.05         ges
    ## 2          Target   1  14 2.324745 0.1495993       0.019370429
    ## 3        Validity   2  28 1.063045 0.3589333       0.005376732
    ## 4 Target:Validity   2  28 2.097231 0.1416693       0.016554765
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##            Effect         W         p p<.05
    ## 3        Validity 0.8276041 0.2923124      
    ## 4 Target:Validity 0.7693367 0.1818683      
    ## 
    ## $`Sphericity Corrections`
    ##            Effect       GGe     p[GG] p[GG]<.05       HFe     p[HF] p[HF]<.05
    ## 3        Validity 0.8529542 0.3512635           0.9593481 0.3570066          
    ## 4 Target:Validity 0.8125700 0.1526360           0.9041354 0.1472522

``` r
# swap accuracy target absent nontarget absent
d <- data %>% filter(targetContrast==0, nontargetContrast==0)
accTANA_anova = ezANOVA(
  data = d,
  dv = .(swapAcc),
  wid = .(SID),
  within = .(Target, Validity)
)

print(accTANA_anova)
```

    ## $ANOVA
    ##            Effect DFn DFd   F   p p<.05 ges
    ## 2          Target   1  14 NaN NaN    NA NaN
    ## 3        Validity   2  28 NaN NaN    NA NaN
    ## 4 Target:Validity   2  28 NaN NaN    NA NaN

``` r
# swap accuracy target present nontarget present T1
d <- data %>% filter(targetContrast==1, nontargetContrast==1, Target == 1)
accTPNP_T1_anova = ezANOVA(
  data = d,
  dv = .(swapAcc),
  wid = .(SID),
  within = .(Validity)
)

print(accTPNP_T1_anova)
```

    ## $ANOVA
    ##     Effect DFn DFd        F          p p<.05       ges
    ## 2 Validity   2  28 3.373509 0.04868184     * 0.1056228
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##     Effect         W         p p<.05
    ## 2 Validity 0.9755958 0.8516368      
    ## 
    ## $`Sphericity Corrections`
    ##     Effect       GGe     p[GG] p[GG]<.05      HFe      p[HF] p[HF]<.05
    ## 2 Validity 0.9761772 0.0500742           1.132392 0.04868184         *

``` r
# swap accuracy target present nontarget absent T1
d <- data %>% filter(targetContrast==1, nontargetContrast==0, Target == 1)
accTPNA_T1_anova = ezANOVA(
  data = d,
  dv = .(swapAcc),
  wid = .(SID),
  within = .(Validity)
)

print(accTPNA_T1_anova)
```

    ## $ANOVA
    ##     Effect DFn DFd        F          p p<.05      ges
    ## 2 Validity   2  28 7.833841 0.00198596     * 0.147993
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##     Effect         W         p p<.05
    ## 2 Validity 0.9030176 0.5152586      
    ## 
    ## $`Sphericity Corrections`
    ##     Effect       GGe       p[GG] p[GG]<.05     HFe      p[HF] p[HF]<.05
    ## 2 Validity 0.9115916 0.002802371         * 1.04082 0.00198596         *

``` r
# swap accuracy target absent nontarget present T1
d <- data %>% filter(targetContrast==0, nontargetContrast==1, Target==1)
accTANP_T1_anova = ezANOVA(
  data = d,
  dv = .(swapAcc),
  wid = .(SID),
  within = .(Validity)
)

print(accTANP_T1_anova)
```

    ## $ANOVA
    ##     Effect DFn DFd        F          p p<.05        ges
    ## 2 Validity   2  28 4.488106 0.02038443     * 0.03709545
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##     Effect         W         p p<.05
    ## 2 Validity 0.9522191 0.7274274      
    ## 
    ## $`Sphericity Corrections`
    ##     Effect      GGe      p[GG] p[GG]<.05      HFe      p[HF] p[HF]<.05
    ## 2 Validity 0.954398 0.02221071         * 1.101294 0.02038443         *

``` r
# swap accuracy target absent nontarget absent T1
d <- data %>% filter(targetContrast==0, nontargetContrast==0, Target==1)
accTANA_T1_anova = ezANOVA(
  data = d,
  dv = .(swapAcc),
  wid = .(SID),
  within = .(Validity)
)

print(accTANA_T1_anova)
```

    ## $ANOVA
    ##     Effect DFn DFd   F   p p<.05 ges
    ## 2 Validity   2  28 NaN NaN    NA NaN

``` r
# swap accuracy target present nontarget present T2
d <- data %>% filter(targetContrast==1, nontargetContrast==1, Target == 2)
accTPNP_T2_anova = ezANOVA(
  data = d,
  dv = .(swapAcc),
  wid = .(SID),
  within = .(Validity)
)

print(accTPNP_T2_anova)
```

    ## $ANOVA
    ##     Effect DFn DFd        F         p p<.05        ges
    ## 2 Validity   2  28 1.990279 0.1555277       0.06568421
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##     Effect         W         p p<.05
    ## 2 Validity 0.9333961 0.6388941      
    ## 
    ## $`Sphericity Corrections`
    ##     Effect       GGe     p[GG] p[GG]<.05      HFe     p[HF] p[HF]<.05
    ## 2 Validity 0.9375552 0.1588931           1.077398 0.1555277

``` r
# swap accuracy target present nontarget absent T2
d <- data %>% filter(targetContrast==1, nontargetContrast==0, Target == 2)
accTPNA_T2_anova = ezANOVA(
  data = d,
  dv = .(swapAcc),
  wid = .(SID),
  within = .(Validity)
)

print(accTPNA_T2_anova)
```

    ## $ANOVA
    ##     Effect DFn DFd        F          p p<.05        ges
    ## 2 Validity   2  28 2.841244 0.07525826       0.06668459
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##     Effect         W         p p<.05
    ## 2 Validity 0.9582002 0.7576447      
    ## 
    ## $`Sphericity Corrections`
    ##     Effect       GGe      p[GG] p[GG]<.05      HFe      p[HF] p[HF]<.05
    ## 2 Validity 0.9598773 0.07787996           1.109097 0.07525826

``` r
# swap accuracy target absent nontarget present T2
d <- data %>% filter(targetContrast==0, nontargetContrast==1, Target==2)
accTANP_T2_anova = ezANOVA(
  data = d,
  dv = .(swapAcc),
  wid = .(SID),
  within = .(Validity)
)

print(accTANP_T2_anova)
```

    ## $ANOVA
    ##     Effect DFn DFd         F       p p<.05         ges
    ## 2 Validity   2  28 0.5931846 0.55936       0.009729539
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##     Effect         W          p p<.05
    ## 2 Validity 0.6769445 0.07917628      
    ## 
    ## $`Sphericity Corrections`
    ##     Effect       GGe     p[GG] p[GG]<.05       HFe     p[HF] p[HF]<.05
    ## 2 Validity 0.7558262 0.5163166           0.8277631 0.5302234

``` r
# swap accuracy target absent nontarget absent T2
d <- data %>% filter(targetContrast==0, nontargetContrast==0, Target==2)
accTANA_T2_anova = ezANOVA(
  data = d,
  dv = .(swapAcc),
  wid = .(SID),
  within = .(Validity)
)

print(accTANA_T2_anova)
```

    ## $ANOVA
    ##     Effect DFn DFd   F   p p<.05 ges
    ## 2 Validity   2  28 NaN NaN    NA NaN

### t-tests

## target/nontarget presence

# T1

<img src="tazoot_swap_Acc_files/figure-gfm/vi_accPPT1-1.png" width="90%" />

<img src="tazoot_swap_Acc_files/figure-gfm/vn_accPPT1-1.png" width="90%" />

<img src="tazoot_swap_Acc_files/figure-gfm/in_accPPT1-1.png" width="90%" />

<img src="tazoot_swap_Acc_files/figure-gfm/vi_accAPT1-1.png" width="90%" />

<img src="tazoot_swap_Acc_files/figure-gfm/vn_accAPT1-1.png" width="90%" />

<img src="tazoot_swap_Acc_files/figure-gfm/in_accAPT1-1.png" width="90%" />

<img src="tazoot_swap_Acc_files/figure-gfm/vi_accPAT1-1.png" width="90%" />

<img src="tazoot_swap_Acc_files/figure-gfm/vn_accPAT1-1.png" width="90%" />

<img src="tazoot_swap_Acc_files/figure-gfm/in_accPAT1-1.png" width="90%" />

\#T2

<img src="tazoot_swap_Acc_files/figure-gfm/vi_accPPT2-1.png" width="90%" />

<img src="tazoot_swap_Acc_files/figure-gfm/vn_accPPT2-1.png" width="90%" />

<img src="tazoot_swap_Acc_files/figure-gfm/in_accPPT2-1.png" width="90%" />

<img src="tazoot_swap_Acc_files/figure-gfm/vi_accAPT2-1.png" width="90%" />

<img src="tazoot_swap_Acc_files/figure-gfm/vn_accAPT2-1.png" width="90%" />

<img src="tazoot_swap_Acc_files/figure-gfm/in_accAPT2-1.png" width="90%" />

<img src="tazoot_swap_Acc_files/figure-gfm/vi_accPAT2-1.png" width="90%" />

<img src="tazoot_swap_Acc_files/figure-gfm/vn_accPAT2-1.png" width="90%" />

<img src="tazoot_swap_Acc_files/figure-gfm/in_accPAT2-1.png" width="90%" />

## Including Plots

You can also embed plots, for example:

![](tazoot_swap_Acc_files/figure-gfm/pressure-1.png)<!-- -->

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.
