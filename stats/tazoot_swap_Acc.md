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
    ##                                              Effect DFn DFd          F
    ## 2                                    targetContrast   1  14  4.2155909
    ## 3                                 nontargetContrast   1  14 23.7347619
    ## 4                                            Target   1  14  9.8679932
    ## 5                                          Validity   2  28  3.5012964
    ## 6                  targetContrast:nontargetContrast   1  14  9.3424780
    ## 7                             targetContrast:Target   1  14 25.6825404
    ## 8                          nontargetContrast:Target   1  14  2.7412031
    ## 9                           targetContrast:Validity   2  28 15.9708089
    ## 10                       nontargetContrast:Validity   2  28  0.8238744
    ## 11                                  Target:Validity   2  28  0.1720913
    ## 12          targetContrast:nontargetContrast:Target   1  14  0.7182936
    ## 13        targetContrast:nontargetContrast:Validity   2  28  0.2152599
    ## 14                   targetContrast:Target:Validity   2  28  3.2045296
    ## 15                nontargetContrast:Target:Validity   2  28  4.4717860
    ## 16 targetContrast:nontargetContrast:Target:Validity   2  28  0.2819136
    ##               p p<.05          ges
    ## 2  5.923118e-02       0.0152064536
    ## 3  2.469594e-04     * 0.1888815510
    ## 4  7.214816e-03     * 0.0272252646
    ## 5  4.393488e-02     * 0.0090302701
    ## 6  8.538146e-03     * 0.0947962576
    ## 7  1.715859e-04     * 0.0751086550
    ## 8  1.200254e-01       0.0053482766
    ## 9  2.355125e-05     * 0.0229679449
    ## 10 4.490848e-01       0.0017844633
    ## 11 8.427860e-01       0.0004301473
    ## 12 4.109596e-01       0.0019629051
    ## 13 8.076538e-01       0.0003993247
    ## 14 5.582044e-02       0.0111297021
    ## 15 2.063802e-02     * 0.0078975114
    ## 16 7.564546e-01       0.0004871641
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##                                              Effect         W         p p<.05
    ## 5                                          Validity 0.9787272 0.8695623      
    ## 9                           targetContrast:Validity 0.9461123 0.6976339      
    ## 10                       nontargetContrast:Validity 0.8032463 0.2407225      
    ## 11                                  Target:Validity 0.7085405 0.1065051      
    ## 13        targetContrast:nontargetContrast:Validity 0.7902134 0.2164404      
    ## 14                   targetContrast:Target:Validity 0.7940034 0.2232777      
    ## 15                nontargetContrast:Target:Validity 0.9664210 0.8009056      
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.7617244 0.1704850      
    ## 
    ## $`Sphericity Corrections`
    ##                                              Effect       GGe        p[GG]
    ## 5                                          Validity 0.9791703 4.510651e-02
    ## 9                           targetContrast:Validity 0.9488677 3.542766e-05
    ## 10                       nontargetContrast:Validity 0.8355938 4.314483e-01
    ## 11                                  Target:Validity 0.7743178 7.881006e-01
    ## 13        targetContrast:nontargetContrast:Validity 0.8265920 7.664032e-01
    ## 14                   targetContrast:Target:Validity 0.8291897 6.711405e-02
    ## 15                nontargetContrast:Target:Validity 0.9675119 2.193131e-02
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.8075747 7.102501e-01
    ##    p[GG]<.05       HFe        p[HF] p[HF]<.05
    ## 5          * 1.1366834 4.393488e-02         *
    ## 9          * 1.0934331 2.355125e-05         *
    ## 10           0.9355246 4.425716e-01          
    ## 11           0.8524982 8.093461e-01          
    ## 13           0.9232243 7.906442e-01          
    ## 14           0.9267702 6.040882e-02          
    ## 15         * 1.1199922 2.063802e-02         *
    ## 16           0.8973560 7.332238e-01

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
    ## 2                 nontargetContrast   1  14  3.5509430 8.044503e-02      
    ## 3                            Target   1  14 33.8667457 4.449064e-05     *
    ## 4                          Validity   2  28 13.4051287 8.244165e-05     *
    ## 5          nontargetContrast:Target   1  14  0.2439516 6.290253e-01      
    ## 6        nontargetContrast:Validity   2  28  0.1303013 8.783601e-01      
    ## 7                   Target:Validity   2  28  1.8081234 1.825862e-01      
    ## 8 nontargetContrast:Target:Validity   2  28  3.6621525 3.865286e-02     *
    ##            ges
    ## 2 0.0405429320
    ## 3 0.2548963452
    ## 4 0.0931977197
    ## 5 0.0014026546
    ## 6 0.0009767362
    ## 7 0.0189827129
    ## 8 0.0084486291
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##                              Effect         W         p p<.05
    ## 4                          Validity 0.9306893 0.6269470      
    ## 6        nontargetContrast:Validity 0.7548918 0.1607869      
    ## 7                   Target:Validity 0.7692735 0.1817712      
    ## 8 nontargetContrast:Target:Validity 0.9259280 0.6063898      
    ## 
    ## $`Sphericity Corrections`
    ##                              Effect       GGe        p[GG] p[GG]<.05       HFe
    ## 4                          Validity 0.9351819 0.0001281839         * 1.0740412
    ## 6        nontargetContrast:Validity 0.8031430 0.8345065706           0.8913507
    ## 7                   Target:Validity 0.8125282 0.1906322797           0.9040787
    ## 8 nontargetContrast:Target:Validity 0.9310363 0.0424685311         * 1.0681844
    ##          p[HF] p[HF]<.05
    ## 4 8.244165e-05         *
    ## 6 8.560972e-01          
    ## 7 1.867893e-01          
    ## 8 3.865286e-02         *

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
