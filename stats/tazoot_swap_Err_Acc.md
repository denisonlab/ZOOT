tazoot_swap_Err_Acc
================
Jenny
2025-04-11

# this shows stats for swap rate over incorrect trials

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
  dv = .(errSwapAcc),
  wid = .(SID),
  within = .(targetContrast, nontargetContrast, Target, Validity)
)

print(acc_anova)
```

    ## $ANOVA
    ##                                              Effect DFn DFd            F
    ## 2                                    targetContrast   1  14   5.28648556
    ## 3                                 nontargetContrast   1  14 199.66225622
    ## 4                                            Target   1  14   2.90111741
    ## 5                                          Validity   2  28   0.95845744
    ## 6                  targetContrast:nontargetContrast   1  14  59.52055552
    ## 7                             targetContrast:Target   1  14   7.48468859
    ## 8                          nontargetContrast:Target   1  14   0.02406601
    ## 9                           targetContrast:Validity   2  28   2.96902777
    ## 10                       nontargetContrast:Validity   2  28   5.83085435
    ## 11                                  Target:Validity   2  28   0.67741417
    ## 12          targetContrast:nontargetContrast:Target   1  14   0.64119034
    ## 13        targetContrast:nontargetContrast:Validity   2  28   0.19428986
    ## 14                   targetContrast:Target:Validity   2  28   0.40154577
    ## 15                nontargetContrast:Target:Validity   2  28   1.47142337
    ## 16 targetContrast:nontargetContrast:Target:Validity   2  28   0.16604414
    ##               p p<.05          ges
    ## 2  3.740443e-02     * 0.0085321972
    ## 3  1.118818e-09     * 0.4011995143
    ## 4  1.106044e-01       0.0117063025
    ## 5  3.957101e-01       0.0035843135
    ## 6  2.083729e-06     * 0.2689597724
    ## 7  1.608667e-02     * 0.0259006764
    ## 8  8.789315e-01       0.0001315734
    ## 9  6.770100e-02       0.0111945736
    ## 10 7.638579e-03     * 0.0152577810
    ## 11 5.160583e-01       0.0033021803
    ## 12 4.366589e-01       0.0018247883
    ## 13 8.245199e-01       0.0010533196
    ## 14 6.730773e-01       0.0022964287
    ## 15 2.468134e-01       0.0075443820
    ## 16 8.478367e-01       0.0004523972
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##                                              Effect         W         p p<.05
    ## 5                                          Validity 0.8108108 0.2558451      
    ## 9                           targetContrast:Validity 0.8102258 0.2546474      
    ## 10                       nontargetContrast:Validity 0.9833522 0.8966216      
    ## 11                                  Target:Validity 0.9794094 0.8735098      
    ## 13        targetContrast:nontargetContrast:Validity 0.8628276 0.3832711      
    ## 14                   targetContrast:Target:Validity 0.9787197 0.8695191      
    ## 15                nontargetContrast:Target:Validity 0.7884202 0.2132679      
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.9692913 0.8164941      
    ## 
    ## $`Sphericity Corrections`
    ##                                              Effect       GGe       p[GG]
    ## 5                                          Validity 0.8409091 0.383781316
    ## 9                           targetContrast:Validity 0.8404956 0.078544727
    ## 10                       nontargetContrast:Validity 0.9836248 0.007984815
    ## 11                                  Target:Validity 0.9798248 0.513335544
    ## 13        targetContrast:nontargetContrast:Validity 0.8793741 0.797239747
    ## 14                   targetContrast:Target:Validity 0.9791631 0.668900955
    ## 15                nontargetContrast:Target:Validity 0.8253687 0.248841811
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.9702062 0.841740974
    ##    p[GG]<.05       HFe       p[HF] p[HF]<.05
    ## 5            0.9428045 0.391726784          
    ## 9            0.9422376 0.071446721          
    ## 10         * 1.1430780 0.007638579         *
    ## 11           1.1376224 0.516058347          
    ## 13           0.9958632 0.823662002          
    ## 14           1.1366731 0.673077345          
    ## 15           0.9215554 0.247915914          
    ## 16           1.1238439 0.847836732

``` r
# swap accuracy target present 
d <- data %>% filter(targetContrast==1)
accTP_anova = ezANOVA(
  data = d,
  dv = .(errSwapAcc),
  wid = .(SID),
  within = .(nontargetContrast, Target, Validity)
)

print(accTP_anova)
```

    ## $ANOVA
    ##                              Effect DFn DFd           F           p p<.05
    ## 2                 nontargetContrast   1  14  4.82600120 0.045370199     *
    ## 3                            Target   1  14 11.27816050 0.004685966     *
    ## 4                          Validity   2  28  1.16595139 0.326300142      
    ## 5          nontargetContrast:Target   1  14  0.12354634 0.730453440      
    ## 6        nontargetContrast:Validity   2  28  1.44868242 0.251948783      
    ## 7                   Target:Validity   2  28  0.01808846 0.982085619      
    ## 8 nontargetContrast:Target:Validity   2  28  0.85891542 0.434483162      
    ##            ges
    ## 2 0.0448530636
    ## 3 0.0717171637
    ## 4 0.0075237457
    ## 5 0.0010218090
    ## 6 0.0108684094
    ## 7 0.0002151097
    ## 8 0.0052858277
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##                              Effect         W         p p<.05
    ## 4                          Validity 0.9937002 0.9597538      
    ## 6        nontargetContrast:Validity 0.9968754 0.9798636      
    ## 7                   Target:Validity 0.7825642 0.2031795      
    ## 8 nontargetContrast:Target:Validity 0.9192163 0.5783824      
    ## 
    ## $`Sphericity Corrections`
    ##                              Effect       GGe     p[GG] p[GG]<.05       HFe
    ## 4                          Validity 0.9937396 0.3261290           1.1576333
    ## 6        nontargetContrast:Validity 0.9968851 0.2519894           1.1621697
    ## 7                   Target:Validity 0.8213986 0.9668303           0.9161441
    ## 8 nontargetContrast:Target:Validity 0.9252545 0.4275175           1.0600294
    ##       p[HF] p[HF]<.05
    ## 4 0.3263001          
    ## 6 0.2519488          
    ## 7 0.9761158          
    ## 8 0.4344832

``` r
# swap accuracy target absent 
d <- data %>% filter(targetContrast==0)
accTA_anova = ezANOVA(
  data = d,
  dv = .(errSwapAcc),
  wid = .(SID),
  within = .(nontargetContrast, Target, Validity)
)

print(accTA_anova)
```

    ## $ANOVA
    ##                              Effect DFn DFd           F            p p<.05
    ## 2                 nontargetContrast   1  14 208.0230378 8.542210e-10     *
    ## 3                            Target   1  14   0.3373934 5.705707e-01      
    ## 4                          Validity   2  28   2.5342962 9.736268e-02      
    ## 5          nontargetContrast:Target   1  14   0.3373934 5.705707e-01      
    ## 6        nontargetContrast:Validity   2  28   2.5342962 9.736268e-02      
    ## 7                   Target:Validity   2  28   1.1175829 3.412239e-01      
    ## 8 nontargetContrast:Target:Validity   2  28   1.1175829 3.412239e-01      
    ##           ges
    ## 2 0.795666971
    ## 3 0.005606694
    ## 4 0.041502669
    ## 5 0.005606694
    ## 6 0.041502669
    ## 7 0.020699060
    ## 8 0.020699060
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##                              Effect         W         p p<.05
    ## 4                          Validity 0.7185570 0.1166805      
    ## 6        nontargetContrast:Validity 0.7185570 0.1166805      
    ## 7                   Target:Validity 0.8512563 0.3510688      
    ## 8 nontargetContrast:Target:Validity 0.8512563 0.3510688      
    ## 
    ## $`Sphericity Corrections`
    ##                              Effect       GGe     p[GG] p[GG]<.05       HFe
    ## 4                          Validity 0.7803703 0.1125535           0.8606263
    ## 6        nontargetContrast:Validity 0.7803703 0.1125535           0.8606263
    ## 7                   Target:Validity 0.8705162 0.3359465           0.9835855
    ## 8 nontargetContrast:Target:Validity 0.8705162 0.3359465           0.9835855
    ##       p[HF] p[HF]<.05
    ## 4 0.1067924          
    ## 6 0.1067924          
    ## 7 0.3406295          
    ## 8 0.3406295

``` r
# swap accuracy target present nontarget present
d <- data %>% filter(targetContrast==1, nontargetContrast==1)
accTPNP_anova = ezANOVA(
  data = d,
  dv = .(errSwapAcc),
  wid = .(SID),
  within = .(Target, Validity)
)

print(accTPNP_anova)
```

    ## $ANOVA
    ##            Effect DFn DFd          F           p p<.05         ges
    ## 2          Target   1  14 11.1465887 0.004872765     * 0.110032811
    ## 3        Validity   2  28  0.2452983 0.784134997       0.004057087
    ## 4 Target:Validity   2  28  0.3739873 0.691370564       0.009397581
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##            Effect         W         p p<.05
    ## 3        Validity 0.7498483 0.1539314      
    ## 4 Target:Validity 0.7759809 0.1923232      
    ## 
    ## $`Sphericity Corrections`
    ##            Effect       GGe     p[GG] p[GG]<.05       HFe     p[HF] p[HF]<.05
    ## 3        Validity 0.7999029 0.7354293           0.8869654 0.7582631          
    ## 4 Target:Validity 0.8169807 0.6501989           0.9101306 0.6722194

``` r
# swap accuracy target present nontarget absent
d <- data %>% filter(targetContrast==1, nontargetContrast==0)
accTPNA_anova = ezANOVA(
  data = d,
  dv = .(errSwapAcc),
  wid = .(SID),
  within = .(Target, Validity)
)

print(accTPNA_anova)
```

    ## $ANOVA
    ##            Effect DFn DFd         F         p p<.05         ges
    ## 2          Target   1  14 2.7957233 0.1167074       0.047136176
    ## 3        Validity   2  28 2.2247161 0.1268566       0.027025965
    ## 4 Target:Validity   2  28 0.2240997 0.8006551       0.003005878
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##            Effect        W         p p<.05
    ## 3        Validity 0.828952 0.2954207      
    ## 4 Target:Validity 0.720911 0.1191875      
    ## 
    ## $`Sphericity Corrections`
    ##            Effect       GGe     p[GG] p[GG]<.05       HFe     p[HF] p[HF]<.05
    ## 3        Validity 0.8539360 0.1359899           0.9606993 0.1292752          
    ## 4 Target:Validity 0.7818064 0.7468451           0.8625573 0.7687462

``` r
# swap accuracy target absent nontarget present
d <- data %>% filter(targetContrast==0, nontargetContrast==1)
accTANP_anova = ezANOVA(
  data = d,
  dv = .(errSwapAcc),
  wid = .(SID),
  within = .(Target, Validity)
)

print(accTANP_anova)
```

    ## $ANOVA
    ##            Effect DFn DFd         F          p p<.05         ges
    ## 2          Target   1  14 0.3373934 0.57057070       0.005606694
    ## 3        Validity   2  28 2.5342962 0.09736268       0.041502669
    ## 4 Target:Validity   2  28 1.1175829 0.34122394       0.020699060
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##            Effect         W         p p<.05
    ## 3        Validity 0.7185570 0.1166805      
    ## 4 Target:Validity 0.8512563 0.3510688      
    ## 
    ## $`Sphericity Corrections`
    ##            Effect       GGe     p[GG] p[GG]<.05       HFe     p[HF] p[HF]<.05
    ## 3        Validity 0.7803703 0.1125535           0.8606263 0.1067924          
    ## 4 Target:Validity 0.8705162 0.3359465           0.9835855 0.3406295

``` r
# swap accuracy target absent nontarget absent
d <- data %>% filter(targetContrast==0, nontargetContrast==0)
accTANA_anova = ezANOVA(
  data = d,
  dv = .(errSwapAcc),
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
  dv = .(errSwapAcc),
  wid = .(SID),
  within = .(Validity)
)

print(accTPNP_T1_anova)
```

    ## $ANOVA
    ##     Effect DFn DFd        F         p p<.05        ges
    ## 2 Validity   2  28 0.550416 0.5828231       0.02400574
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##     Effect         W         p p<.05
    ## 2 Validity 0.7859892 0.2090295      
    ## 
    ## $`Sphericity Corrections`
    ##     Effect       GGe     p[GG] p[GG]<.05       HFe     p[HF] p[HF]<.05
    ## 2 Validity 0.8237159 0.5508869           0.9193018 0.5689239

``` r
# swap accuracy target present nontarget absent T1
d <- data %>% filter(targetContrast==1, nontargetContrast==0, Target == 1)
accTPNA_T1_anova = ezANOVA(
  data = d,
  dv = .(errSwapAcc),
  wid = .(SID),
  within = .(Validity)
)

print(accTPNA_T1_anova)
```

    ## $ANOVA
    ##     Effect DFn DFd        F          p p<.05        ges
    ## 2 Validity   2  28 2.798459 0.07798665       0.06227982
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##     Effect         W          p p<.05
    ## 2 Validity 0.6459563 0.05838756      
    ## 
    ## $`Sphericity Corrections`
    ##     Effect       GGe      p[GG] p[GG]<.05       HFe      p[HF] p[HF]<.05
    ## 2 Validity 0.7385286 0.09669203           0.8047572 0.09160713

``` r
# swap accuracy target absent nontarget present T1
d <- data %>% filter(targetContrast==0, nontargetContrast==1, Target==1)
accTANP_T1_anova = ezANOVA(
  data = d,
  dv = .(errSwapAcc),
  wid = .(SID),
  within = .(Validity)
)

print(accTANP_T1_anova)
```

    ## $ANOVA
    ##     Effect DFn DFd        F          p p<.05       ges
    ## 2 Validity   2  28 2.720069 0.08326444       0.1041603
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##     Effect         W         p p<.05
    ## 2 Validity 0.7154744 0.1134649      
    ## 
    ## $`Sphericity Corrections`
    ##     Effect       GGe      p[GG] p[GG]<.05       HFe      p[HF] p[HF]<.05
    ## 2 Validity 0.7784975 0.09885634           0.8581097 0.09297302

``` r
# swap accuracy target absent nontarget absent T1
d <- data %>% filter(targetContrast==0, nontargetContrast==0, Target==1)
accTANA_T1_anova = ezANOVA(
  data = d,
  dv = .(errSwapAcc),
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
  dv = .(errSwapAcc),
  wid = .(SID),
  within = .(Validity)
)

print(accTPNP_T2_anova)
```

    ## $ANOVA
    ##     Effect DFn DFd         F         p p<.05         ges
    ## 2 Validity   2  28 0.2230925 0.8014493       0.009037949
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##     Effect        W        p p<.05
    ## 2 Validity 0.890894 0.471921      
    ## 
    ## $`Sphericity Corrections`
    ##     Effect       GGe     p[GG] p[GG]<.05      HFe     p[HF] p[HF]<.05
    ## 2 Validity 0.9016271 0.7792501           1.026865 0.8014493

``` r
# swap accuracy target present nontarget absent T2
d <- data %>% filter(targetContrast==1, nontargetContrast==0, Target == 2)
accTPNA_T2_anova = ezANOVA(
  data = d,
  dv = .(errSwapAcc),
  wid = .(SID),
  within = .(Validity)
)

print(accTPNA_T2_anova)
```

    ## $ANOVA
    ##     Effect DFn DFd         F         p p<.05         ges
    ## 2 Validity   2  28 0.3652374 0.6972896       0.009847432
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##     Effect         W         p p<.05
    ## 2 Validity 0.7497152 0.1537539      
    ## 
    ## $`Sphericity Corrections`
    ##     Effect       GGe     p[GG] p[GG]<.05       HFe     p[HF] p[HF]<.05
    ## 2 Validity 0.7998178 0.6514374           0.8868503 0.6726822

``` r
# swap accuracy target absent nontarget present T2
d <- data %>% filter(targetContrast==0, nontargetContrast==1, Target==2)
accTANP_T2_anova = ezANOVA(
  data = d,
  dv = .(errSwapAcc),
  wid = .(SID),
  within = .(Validity)
)

print(accTANP_T2_anova)
```

    ## $ANOVA
    ##     Effect DFn DFd         F         p p<.05        ges
    ## 2 Validity   2  28 0.4066071 0.6697744       0.01171518
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##     Effect        W         p p<.05
    ## 2 Validity 0.898989 0.5004994      
    ## 
    ## $`Sphericity Corrections`
    ##     Effect       GGe     p[GG] p[GG]<.05      HFe     p[HF] p[HF]<.05
    ## 2 Validity 0.9082562 0.6507712           1.036144 0.6697744

``` r
# swap accuracy target absent nontarget absent T2
d <- data %>% filter(targetContrast==0, nontargetContrast==0, Target==2)
accTANA_T2_anova = ezANOVA(
  data = d,
  dv = .(errSwapAcc),
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

<img src="tazoot_swap_Err_Acc_files/figure-gfm/vi_accPPT1-1.png" width="90%" />

<img src="tazoot_swap_Err_Acc_files/figure-gfm/vn_accPPT1-1.png" width="90%" />

<img src="tazoot_swap_Err_Acc_files/figure-gfm/in_accPPT1-1.png" width="90%" />

<img src="tazoot_swap_Err_Acc_files/figure-gfm/vi_accAPT1-1.png" width="90%" />

<img src="tazoot_swap_Err_Acc_files/figure-gfm/vn_accAPT1-1.png" width="90%" />

<img src="tazoot_swap_Err_Acc_files/figure-gfm/in_accAPT1-1.png" width="90%" />

<img src="tazoot_swap_Err_Acc_files/figure-gfm/vi_accPAT1-1.png" width="90%" />

<img src="tazoot_swap_Err_Acc_files/figure-gfm/vn_accPAT1-1.png" width="90%" />

<img src="tazoot_swap_Err_Acc_files/figure-gfm/in_accPAT1-1.png" width="90%" />

\#T2

<img src="tazoot_swap_Err_Acc_files/figure-gfm/vi_accPPT2-1.png" width="90%" />

<img src="tazoot_swap_Err_Acc_files/figure-gfm/vn_accPPT2-1.png" width="90%" />

<img src="tazoot_swap_Err_Acc_files/figure-gfm/in_accPPT2-1.png" width="90%" />

<img src="tazoot_swap_Err_Acc_files/figure-gfm/vi_accAPT2-1.png" width="90%" />

<img src="tazoot_swap_Err_Acc_files/figure-gfm/vn_accAPT2-1.png" width="90%" />

<img src="tazoot_swap_Err_Acc_files/figure-gfm/in_accAPT2-1.png" width="90%" />

<img src="tazoot_swap_Err_Acc_files/figure-gfm/vi_accPAT2-1.png" width="90%" />

<img src="tazoot_swap_Err_Acc_files/figure-gfm/vn_accPAT2-1.png" width="90%" />

<img src="tazoot_swap_Err_Acc_files/figure-gfm/in_accPAT2-1.png" width="90%" />
