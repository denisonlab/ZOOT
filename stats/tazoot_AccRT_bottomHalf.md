tazoot_AccRT_bottomHalf
================
Jenny Motzer
2025-07-07

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax
for authoring HTML, PDF, and MS Word documents. For more details on
using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that
includes both content as well as the output of any embedded R code
chunks within the document. You can embed an R code chunk like this:

## accuracy

``` r
# accuracy 
d <- data 
acc_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(targetContrast, nontargetContrast, Target, Validity)
)

print(acc_anova)
```

    ## $ANOVA
    ##                                              Effect DFn DFd          F
    ## 2                                    targetContrast   1   8 29.8271119
    ## 3                                 nontargetContrast   1   8 16.1322038
    ## 4                                            Target   1   8  6.0854616
    ## 5                                          Validity   2  16  7.1726770
    ## 6                  targetContrast:nontargetContrast   1   8 11.8592364
    ## 7                             targetContrast:Target   1   8 98.1728643
    ## 8                          nontargetContrast:Target   1   8 11.2342360
    ## 9                           targetContrast:Validity   2  16 22.2476217
    ## 10                       nontargetContrast:Validity   2  16  1.5690689
    ## 11                                  Target:Validity   2  16  4.7209784
    ## 12          targetContrast:nontargetContrast:Target   1   8  0.8033061
    ## 13        targetContrast:nontargetContrast:Validity   2  16  0.8380418
    ## 14                   targetContrast:Target:Validity   2  16  1.3783755
    ## 15                nontargetContrast:Target:Validity   2  16  1.5769529
    ## 16 targetContrast:nontargetContrast:Target:Validity   2  16  2.5849534
    ##               p p<.05         ges
    ## 2  6.005193e-04     * 0.309403327
    ## 3  3.859976e-03     * 0.180489330
    ## 4  3.889965e-02     * 0.037836209
    ## 5  5.973408e-03     * 0.027808628
    ## 6  8.775527e-03     * 0.211652327
    ## 7  9.092683e-06     * 0.129415900
    ## 8  1.005412e-02     * 0.019263547
    ## 9  2.394363e-05     * 0.051568268
    ## 10 2.386506e-01       0.009663593
    ## 11 2.446559e-02     * 0.018357462
    ## 12 3.962747e-01       0.002671579
    ## 13 4.506833e-01       0.003620940
    ## 14 2.803490e-01       0.009806857
    ## 15 2.370834e-01       0.008698136
    ## 16 1.064654e-01       0.011017635
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##                                              Effect         W          p p<.05
    ## 5                                          Validity 0.9285004 0.77132495      
    ## 9                           targetContrast:Validity 0.9461151 0.82376603      
    ## 10                       nontargetContrast:Validity 0.6462548 0.21697682      
    ## 11                                  Target:Validity 0.7448990 0.35673109      
    ## 13        targetContrast:nontargetContrast:Validity 0.9513416 0.83980362      
    ## 14                   targetContrast:Target:Validity 0.6470629 0.21792782      
    ## 15                nontargetContrast:Target:Validity 0.4959230 0.08589146      
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.9346414 0.78932806      
    ## 
    ## $`Sphericity Corrections`
    ##                                              Effect       GGe        p[GG]
    ## 5                                          Validity 0.9332715 7.319497e-03
    ## 9                           targetContrast:Validity 0.9488702 3.641088e-05
    ## 10                       nontargetContrast:Validity 0.7386915 2.447971e-01
    ## 11                                  Target:Validity 0.7967487 3.550209e-02
    ## 13        targetContrast:nontargetContrast:Validity 0.9535994 4.464372e-01
    ## 14                   targetContrast:Target:Validity 0.7391326 2.803593e-01
    ## 15                nontargetContrast:Target:Validity 0.6648596 2.445306e-01
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.9386511 1.108563e-01
    ##    p[GG]<.05       HFe        p[HF] p[HF]<.05
    ## 5          * 1.2064067 5.973408e-03         *
    ## 9          * 1.2355803 2.394363e-05         *
    ## 10           0.8659443 2.421789e-01          
    ## 11         * 0.9631991 2.616278e-02         *
    ## 13           1.2444842 4.506833e-01          
    ## 14           0.8666703 2.808985e-01          
    ## 15           0.7471554 2.432991e-01          
    ## 16           1.2164343 1.064654e-01

``` r
## accuracy filtered target present
d <- data %>% filter(targetContrast==1)

accTP_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(nontargetContrast, Target, Validity)
)
knitr::kable(accTP_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|  | Effect | DFn | DFd | F | p | p\<.05 | ges |
|:---|:---|---:|---:|---:|---:|:---|---:|
| 2 | nontargetContrast | 1 | 8 | 0.1273141 | 0.7304618 |  | 0.0027915 |
| 3 | Target | 1 | 8 | 49.3883390 | 0.0001096 | \* | 0.2856709 |
| 4 | Validity | 2 | 16 | 13.9856018 | 0.0003073 | \* | 0.1415844 |
| 5 | nontargetContrast:Target | 1 | 8 | 3.0593220 | 0.1183963 |  | 0.0090829 |
| 6 | nontargetContrast:Validity | 2 | 16 | 0.0961159 | 0.9088792 |  | 0.0020809 |
| 7 | Target:Validity | 2 | 16 | 2.0495683 | 0.1612652 |  | 0.0364800 |
| 8 | nontargetContrast:Target:Validity | 2 | 16 | 0.0172696 | 0.9828969 |  | 0.0002507 |

</td>

<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.9947248 | 0.9816584 |        |
| 6   | nontargetContrast:Validity        | 0.7976011 | 0.4531585 |        |
| 7   | Target:Validity                   | 0.7111281 | 0.3032616 |        |
| 8   | nontargetContrast:Target:Validity | 0.7206279 | 0.3176792 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.9947525 | 0.0003168 | \* | 1.3231477 | 0.0003073 | \* |
| 6 | nontargetContrast:Validity | 0.8316708 | 0.8763385 |  | 1.0234159 | 0.9088792 |  |
| 7 | Target:Validity | 0.7758723 | 0.1747524 |  | 0.9278247 | 0.1655785 |  |
| 8 | nontargetContrast:Target:Validity | 0.7816335 | 0.9634457 |  | 0.9375410 | 0.9787893 |  |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered target present T1
d <- data %>% filter(targetContrast==1, Target == 1)

accTP_T1_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(nontargetContrast,Validity)
)
knitr::kable(accTP_T1_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect                     | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |   8 |  0.6962348 | 0.4282629 |        | 0.0199946 |
| 3   | Validity                   |   2 |  16 | 10.1283215 | 0.0014383 | \*     | 0.2427634 |
| 4   | nontargetContrast:Validity |   2 |  16 |  0.0699716 | 0.9327040 |        | 0.0030269 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9762025 | 0.9191572 |        |
| 4   | nontargetContrast:Validity | 0.7516775 | 0.3682227 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9767557 | 0.0015906 | \* | 1.2884836 | 0.0014383 | \* |
| 4 | nontargetContrast:Validity | 0.8010751 | 0.8974617 |  | 0.9705879 | 0.9284487 |  |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered target present T2
d <- data %>% filter(targetContrast==1, Target == 2)

accTP_T2_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(nontargetContrast,Validity)
)
knitr::kable(accTP_T2_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect                     | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |   8 | 0.1006267 | 0.7591995 |        | 0.0019966 |
| 3   | Validity                   |   2 |  16 | 2.2241567 | 0.1405076 |        | 0.0598618 |
| 4   | nontargetContrast:Validity |   2 |  16 | 0.0544048 | 0.9472231 |        | 0.0015068 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.4693728 | 0.0708456 |        |
| 4   | nontargetContrast:Validity | 0.7018730 | 0.2896709 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.6533270 | 0.1640553 |  | 0.7290737 | 0.1588186 |  |
| 4 | nontargetContrast:Validity | 0.7703407 | 0.9091905 |  | 0.9185281 | 0.9361757 |  |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered target absent
d <- data %>% filter(targetContrast==0)

accTA_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(nontargetContrast, Target, Validity)
)
knitr::kable(accTA_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|  | Effect | DFn | DFd | F | p | p\<.05 | ges |
|:---|:---|---:|---:|---:|---:|:---|---:|
| 2 | nontargetContrast | 1 | 8 | 18.110464 | 0.0027778 | \* | 0.4593567 |
| 3 | Target | 1 | 8 | 3.874444 | 0.0845578 |  | 0.0296486 |
| 4 | Validity | 2 | 16 | 9.021174 | 0.0023812 | \* | 0.0216192 |
| 5 | nontargetContrast:Target | 1 | 8 | 4.838065 | 0.0590344 |  | 0.0310938 |
| 6 | nontargetContrast:Validity | 2 | 16 | 9.553488 | 0.0018613 | \* | 0.0213258 |
| 7 | Target:Validity | 2 | 16 | 3.809071 | 0.0443602 | \* | 0.0212671 |
| 8 | nontargetContrast:Target:Validity | 2 | 16 | 5.374071 | 0.0163912 | \* | 0.0333691 |

</td>

<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.6791121 | 0.2581043 |        |
| 6   | nontargetContrast:Validity        | 0.9556355 | 0.8531452 |        |
| 7   | Target:Validity                   | 0.6515187 | 0.2232257 |        |
| 8   | nontargetContrast:Target:Validity | 0.7245024 | 0.3236976 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.7570665 | 0.0061323 | \* | 0.8963488 | 0.0035591 | \* |
| 6 | nontargetContrast:Validity | 0.9575201 | 0.0022150 | \* | 1.2518868 | 0.0018613 | \* |
| 7 | Target:Validity | 0.7415750 | 0.0627219 |  | 0.8706929 | 0.0527293 |  |
| 8 | nontargetContrast:Target:Validity | 0.7840078 | 0.0262148 | \* | 0.9415554 | 0.0186001 | \* |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered target absent T1
d <- data %>% filter(targetContrast==0, Target == 1)

accTA_T1_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(nontargetContrast,Validity)
)
knitr::kable(accTA_T1_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect                     | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |   8 | 8.7989167 | 0.0179725 | \*     | 0.3250300 |
| 3   | Validity                   |   2 |  16 | 0.9382716 | 0.4118049 |        | 0.0056006 |
| 4   | nontargetContrast:Validity |   2 |  16 | 1.5442359 | 0.2436635 |        | 0.0105587 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.7882087 | 0.4347548 |        |
| 4   | nontargetContrast:Validity | 0.7696598 | 0.3999870 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8252246 | 0.3986136 |  | 1.0122010 | 0.4118049 |  |
| 4 | nontargetContrast:Validity | 0.8127833 | 0.2479040 |  | 0.9906841 | 0.2439041 |  |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered target absent T2
d <- data %>% filter(targetContrast==0, Target == 2)

accTA_T2_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(nontargetContrast,Validity)
)
knitr::kable(accTA_T2_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect                     | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |   8 | 27.285407 | 0.0007991 | \*     | 0.5864240 |
| 3   | Validity                   |   2 |  16 |  8.607772 | 0.0028989 | \*     | 0.0867581 |
| 4   | nontargetContrast:Validity |   2 |  16 | 10.574302 | 0.0011842 | \*     | 0.1051151 |

</td>

<td>

|     | Effect                     |         W |        p | p\<.05 |
|:----|:---------------------------|----------:|---------:|:-------|
| 3   | Validity                   | 0.9658346 | 0.885441 |        |
| 4   | nontargetContrast:Validity | 0.9399519 | 0.805137 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9669633 | 0.0032748 | \* | 1.269795 | 0.0028989 | \* |
| 4 | nontargetContrast:Validity | 0.9433535 | 0.0015291 | \* | 1.225229 | 0.0011842 | \* |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered nontarget present
d <- data %>% filter(nontargetContrast==1)

accNP_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(targetContrast, Target, Validity)
)
knitr::kable(accNP_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|  | Effect | DFn | DFd | F | p | p\<.05 | ges |
|:---|:---|---:|---:|---:|---:|:---|---:|
| 2 | targetContrast | 1 | 8 | 0.3805963 | 0.5544315 |  | 0.0147460 |
| 3 | Target | 1 | 8 | 0.2658726 | 0.6200573 |  | 0.0022091 |
| 4 | Validity | 2 | 16 | 2.5188216 | 0.1119395 |  | 0.0239455 |
| 5 | targetContrast:Target | 1 | 8 | 27.8052906 | 0.0007525 | \* | 0.1112713 |
| 6 | targetContrast:Validity | 2 | 16 | 12.9389329 | 0.0004540 | \* | 0.0507632 |
| 7 | Target:Validity | 2 | 16 | 3.3255609 | 0.0619787 |  | 0.0307286 |
| 8 | targetContrast:Target:Validity | 2 | 16 | 1.8314973 | 0.1922041 |  | 0.0206915 |

</td>

<td>

|     | Effect                         |         W |         p | p\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------|
| 4   | Validity                       | 0.6966818 | 0.2822413 |        |
| 6   | targetContrast:Validity        | 0.7855480 | 0.4296398 |        |
| 7   | Target:Validity                | 0.4528881 | 0.0625127 |        |
| 8   | targetContrast:Target:Validity | 0.6773889 | 0.2558193 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.7672723 | 0.1292763 |  | 0.9133851 | 0.1181351 |  |
| 6 | targetContrast:Validity | 0.8234167 | 0.0011822 | \* | 1.0090637 | 0.0004540 | \* |
| 7 | Target:Validity | 0.6463656 | 0.0905255 |  | 0.7182194 | 0.0838250 |  |
| 8 | targetContrast:Target:Validity | 0.7560802 | 0.2037046 |  | 0.8947079 | 0.1972837 |  |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered nontarget present T1
d <- data %>% filter(nontargetContrast==1, Target == 1)

accNP_T1_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(targetContrast, Validity)
)
knitr::kable(accNP_T1_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect                  | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:------------------------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | targetContrast          |   1 |   8 | 3.976888 | 0.0812412 |        | 0.1728697 |
| 3   | Validity                |   2 |  16 | 1.032972 | 0.3785074 |        | 0.0202938 |
| 4   | targetContrast:Validity |   2 |  16 | 7.024836 | 0.0064601 | \*     | 0.0743732 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.6394869 | 0.2091273 |        |
| 4   | targetContrast:Validity | 0.7260736 | 0.3261612 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.7350168 | 0.3625688 |  | 0.8599051 | 0.3710053 |  |
| 4 | targetContrast:Validity | 0.7849747 | 0.0122876 | \* | 0.9431920 | 0.0076496 | \* |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered nontarget present T2
d <- data %>% filter(nontargetContrast==1, Target == 2)

accNP_T2_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(targetContrast, Validity)
)
knitr::kable(accNP_T2_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect                  | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:------------------------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | targetContrast          |   1 |   8 | 1.749220 | 0.2225316 |        | 0.0553258 |
| 3   | Validity                |   2 |  16 | 5.360198 | 0.0165279 | \*     | 0.0895429 |
| 4   | targetContrast:Validity |   2 |  16 | 3.277474 | 0.0641247 |        | 0.0634938 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.8084136 | 0.4750263 |        |
| 4   | targetContrast:Validity | 0.7622299 | 0.3866348 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8392174 | 0.0234022 | \* | 1.0366034 | 0.0165279 | \* |
| 4 | targetContrast:Validity | 0.8079045 | 0.0783667 |  | 0.9822921 | 0.0653181 |  |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered nontarget absent
d <- data %>% filter(nontargetContrast==0)

accNA_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(targetContrast, Target, Validity)
)
knitr::kable(accNA_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect                         | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:-------------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | targetContrast                 |   1 |   8 | 92.455964 | 0.0000114 | \*     | 0.7490086 |
| 3   | Target                         |   1 |   8 | 30.950658 | 0.0005326 | \*     | 0.1951171 |
| 4   | Validity                       |   2 |  16 |  7.089610 | 0.0062416 | \*     | 0.0766937 |
| 5   | targetContrast:Target          |   1 |   8 | 39.514992 | 0.0002363 | \*     | 0.1908063 |
| 6   | targetContrast:Validity        |   2 |  16 |  4.736317 | 0.0242309 | \*     | 0.0677242 |
| 7   | Target:Validity                |   2 |  16 |  1.453559 | 0.2630008 |        | 0.0136216 |
| 8   | targetContrast:Target:Validity |   2 |  16 |  1.828283 | 0.1927075 |        | 0.0203491 |

</td>

<td>

|     | Effect                         |         W |         p | p\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------|
| 4   | Validity                       | 0.9330493 | 0.7846320 |        |
| 6   | targetContrast:Validity        | 0.9634458 | 0.8777999 |        |
| 7   | Target:Validity                | 0.6589872 | 0.2323108 |        |
| 8   | targetContrast:Target:Validity | 0.8721298 | 0.6194895 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.9372504 | 0.0075374 | \* | 1.2138200 | 0.0062416 | \* |
| 6 | targetContrast:Validity | 0.9647349 | 0.0258466 | \* | 1.2655590 | 0.0242309 | \* |
| 7 | Target:Validity | 0.7457050 | 0.2656067 |  | 0.8775089 | 0.2646980 |  |
| 8 | targetContrast:Target:Validity | 0.8866269 | 0.1981483 |  | 1.1209131 | 0.1927075 |  |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered nontarget absent T1
d <- data %>% filter(nontargetContrast==0, Target == 1)

accNA_T1_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(targetContrast, Validity)
)
knitr::kable(accNA_T1_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect                  | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | targetContrast          |   1 |   8 | 118.884303 | 0.0000044 | \*     | 0.7995289 |
| 3   | Validity                |   2 |  16 |   4.853864 | 0.0225139 | \*     | 0.1174641 |
| 4   | targetContrast:Validity |   2 |  16 |   4.158283 | 0.0351352 | \*     | 0.1151047 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.8335114 | 0.5286770 |        |
| 4   | targetContrast:Validity | 0.9113824 | 0.7226904 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8572737 | 0.0295212 | \* | 1.068414 | 0.0225139 | \* |
| 4 | targetContrast:Validity | 0.9185962 | 0.0397779 | \* | 1.179230 | 0.0351352 | \* |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered nontarget present T2
d <- data %>% filter(nontargetContrast==0, Target == 2)

accNA_T2_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(targetContrast, Validity)
)
knitr::kable(accNA_T2_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect                  | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | targetContrast          |   1 |   8 | 43.701817 | 0.0001675 | \*     | 0.6664308 |
| 3   | Validity                |   2 |  16 |  3.458823 | 0.0564416 |        | 0.0377665 |
| 4   | targetContrast:Validity |   2 |  16 |  1.808177 | 0.1958905 |        | 0.0339056 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.9453633 | 0.8214774 |        |
| 4   | targetContrast:Validity | 0.4970922 | 0.0866023 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9481938 | 0.0598816 |  | 1.2343092 | 0.0564416 |  |
| 4 | targetContrast:Validity | 0.6653768 | 0.2106286 |  | 0.7479693 | 0.2073193 |  |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered target present/nontarget present
d <- data %>% filter(targetContrast==1, nontargetContrast==1)

accTPNP_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(Target, Validity)
)
knitr::kable(accTPNP_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect          | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |   8 | 40.3280000 | 0.0002205 | \*     | 0.2344251 |
| 3   | Validity        |   2 |  16 |  4.2117618 | 0.0339229 | \*     | 0.1467272 |
| 4   | Target:Validity |   2 |  16 |  0.8727727 | 0.4367622 |        | 0.0406744 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8486270 | 0.5630008 |        |
| 4   | Target:Validity | 0.5210972 | 0.1021447 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8685283 | 0.0416215 | \* | 1.0884267 | 0.0339229 | \* |
| 4 | Target:Validity | 0.6761770 | 0.4040449 |  | 0.7650216 | 0.4145701 |  |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered target present/nontarget absent
d <- data %>% filter(targetContrast==1, nontargetContrast==0)

accTPNA_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(Target, Validity)
)
knitr::kable(accTPNA_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect          | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |   8 | 35.237211 | 0.0003474 | \*     | 0.3335117 |
| 3   | Validity        |   2 |  16 |  6.029764 | 0.0111768 | \*     | 0.1398889 |
| 4   | Target:Validity |   2 |  16 |  1.791054 | 0.1986480 |        | 0.0331684 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9502392 | 0.8364023 |        |
| 4   | Target:Validity | 0.8254689 | 0.5110372 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9525979 | 0.0125786 | \* | 1.242596 | 0.0111768 | \* |
| 4 | Target:Validity | 0.8514036 | 0.2053629 |  | 1.058032 | 0.1986480 |  |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered target absent/nontarget present
d <- data %>% filter(targetContrast==0, nontargetContrast==1)

accTANP_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(Target, Validity)
)
knitr::kable(accTANP_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect          | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |   8 |  4.342227 | 0.0706962 |        | 0.0599761 |
| 3   | Validity        |   2 |  16 | 10.411328 | 0.0012707 | \*     | 0.0426814 |
| 4   | Target:Validity |   2 |  16 |  5.012187 | 0.0204135 | \*     | 0.0535173 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8211568 | 0.5017547 |        |
| 4   | Target:Validity | 0.6738390 | 0.2511577 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8482893 | 0.0024993 | \* | 1.0525400 | 0.0012707 | \* |
| 4 | Target:Validity | 0.7540563 | 0.0332855 | \* | 0.8913442 | 0.0253118 | \* |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered target absent/nontarget absent
d <- data %>% filter(targetContrast==0, nontargetContrast==0)

accTANA_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(Target, Validity)
)
knitr::kable(accTANA_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect          | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |   8 | 0.1000000 | 0.7599230 |        | 0.0005157 |
| 3   | Validity        |   2 |  16 | 0.2239642 | 0.8018077 |        | 0.0064086 |
| 4   | Target:Validity |   2 |  16 | 0.7028539 | 0.5098311 |        | 0.0389288 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8577915 | 0.5845695 |        |
| 4   | Target:Validity | 0.3767473 | 0.0328228 | \*     |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8754969 | 0.7738428 |  | 1.1008906 | 0.8018077 |  |
| 4 | Target:Validity | 0.6160470 | 0.4512525 |  | 0.6714666 | 0.4616317 |  |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered target present/nontarget present T1
d <- data %>% filter(targetContrast==1, nontargetContrast==1, Target == 1)

accTPNP_T1_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(accTPNP_T1_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  16 | 3.920564 | 0.0411477 | \*     | 0.2853492 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7943698 | 0.4467655 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.8294418 | 0.0522359 |              | 1.019533 | 0.0411477 | \*           |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered target present/nontarget absent T1
d <- data %>% filter(targetContrast==1, nontargetContrast==0, Target == 1)

accTPNA_T1_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(accTPNA_T1_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  16 | 4.777863 | 0.0236077 | \*     | 0.2145816 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9312136 | 0.7792423 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9356406 | 0.0265996 | \*           | 1.210818 | 0.0236077 | \*           |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered target absent/nontarget present T1
d <- data %>% filter(targetContrast==0, nontargetContrast==1, Target == 1)

accTANP_T1_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(accTANP_T1_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  16 | 1.375626 | 0.2810074 |        | 0.0153388 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.6011271 | 0.1684155 |        |

</td>

<td>

|     | Effect   |       GGe |  p\[GG\] | p\[GG\]\<.05 |     HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|---------:|:-------------|--------:|----------:|:-------------|
| 2   | Validity | 0.7148612 | 0.280643 |              | 0.82702 | 0.2814586 |              |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered target absent/nontarget absent T1
d <- data %>% filter(targetContrast==0, nontargetContrast==0, Target == 1)

accTANA_T1_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(accTANA_T1_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect   | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  16 | 0.5714286 | 0.5758299 |        | 0.0492958 |

</td>

<td>

|     | Effect   |         W |        p | p\<.05 |
|:----|:---------|----------:|---------:|:-------|
| 2   | Validity | 0.1986672 | 0.003495 | \*     |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.5551445 | 0.4867958 |              | 0.5800389 | 0.4933052 |              |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered target present/nontarget present T2
d <- data %>% filter(targetContrast==1, nontargetContrast==1, Target==2)

accTPNP_T2_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(accTPNP_T2_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  16 | 0.717053 | 0.5032252 |        | 0.0534767 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.6880552 | 0.2701975 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7622272 | 0.4712371 |              | 0.9049499 | 0.4914416 |              |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered target present/nontarget absent T2
d <- data %>% filter(targetContrast==1, nontargetContrast==0, Target == 2)

accTPNA_T2_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(accTPNA_T2_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect   | DFn | DFd |        F |        p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|---------:|:-------|----------:|
| 2   | Validity |   2 |  16 | 2.656547 | 0.100876 |        | 0.0705808 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7499424 | 0.3652563 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.7999631 | 0.1159619 |              | 0.968687 | 0.1031066 |              |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered target absent/nontarget present T1
d <- data %>% filter(targetContrast==0, nontargetContrast==1, Target == 2)

accTANP_T2_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(accTANP_T2_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  16 | 10.14503 | 0.0014278 | \*     | 0.1771435 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9690784 | 0.8958931 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9700059 | 0.0016261 | \*           | 1.275589 | 0.0014278 | \*           |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered target absent/nontarget absent T2
d <- data %>% filter(targetContrast==0, nontargetContrast==0, Target == 2)

accTANA_T2_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(accTANA_T2_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect   | DFn | DFd |        F |        p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|---------:|:-------|----------:|
| 2   | Validity |   2 |  16 | 0.489083 | 0.622062 |        | 0.0372836 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.2316889 | 0.0059864 | \*     |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.5655114 | 0.5246323 |              | 0.5953728 | 0.5332584 |              |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered target 1
d <- data %>% filter(Target==1)

accT1_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(targetContrast, nontargetContrast, Validity)
)
knitr::kable(accT1_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|  | Effect | DFn | DFd | F | p | p\<.05 | ges |
|:---|:---|---:|---:|---:|---:|:---|---:|
| 2 | targetContrast | 1 | 8 | 62.0141721 | 0.0000489 | \* | 0.4986764 |
| 3 | nontargetContrast | 1 | 8 | 7.6530339 | 0.0244317 | \* | 0.0882908 |
| 4 | Validity | 2 | 16 | 6.3646106 | 0.0092548 | \* | 0.0455782 |
| 5 | targetContrast:nontargetContrast | 1 | 8 | 6.1561226 | 0.0380432 | \* | 0.1627842 |
| 6 | targetContrast:Validity | 2 | 16 | 9.6699171 | 0.0017654 | \* | 0.0807399 |
| 7 | nontargetContrast:Validity | 2 | 16 | 0.1456613 | 0.8655838 |  | 0.0021019 |
| 8 | targetContrast:nontargetContrast:Validity | 2 | 16 | 0.7218215 | 0.5010284 |  | 0.0053855 |

</td>

<td>

|     | Effect                                    |         W |         p | p\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------|
| 4   | Validity                                  | 0.9752402 | 0.9159896 |        |
| 6   | targetContrast:Validity                   | 0.9022946 | 0.6977811 |        |
| 7   | nontargetContrast:Validity                | 0.4796255 | 0.0764113 |        |
| 8   | targetContrast:nontargetContrast:Validity | 0.7902726 | 0.4387521 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.9758384 | 0.0098681 | \* | 1.2867278 | 0.0092548 | \* |
| 6 | targetContrast:Validity | 0.9109912 | 0.0025540 | \* | 1.1652477 | 0.0017654 | \* |
| 7 | nontargetContrast:Validity | 0.6577327 | 0.7772978 |  | 0.7359666 | 0.8025191 |  |
| 8 | targetContrast:nontargetContrast:Validity | 0.8266325 | 0.4788002 |  | 1.0146465 | 0.5010284 |  |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered target 2
d <- data %>% filter(Target==2)
accT2_anova = ezANOVA(
  data = d,
  dv = .(Acc),
  wid = .(SID),
  within = .(targetContrast, nontargetContrast, Validity)
)
knitr::kable(accT2_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|  | Effect | DFn | DFd | F | p | p\<.05 | ges |
|:---|:---|---:|---:|---:|---:|:---|---:|
| 2 | targetContrast | 1 | 8 | 5.324628 | 0.0498822 | \* | 0.0837337 |
| 3 | nontargetContrast | 1 | 8 | 22.314635 | 0.0014948 | \* | 0.2965004 |
| 4 | Validity | 2 | 16 | 5.488238 | 0.0153136 | \* | 0.0446471 |
| 5 | targetContrast:nontargetContrast | 1 | 8 | 19.550923 | 0.0022216 | \* | 0.2692972 |
| 6 | targetContrast:Validity | 2 | 16 | 3.329963 | 0.0617863 |  | 0.0332317 |
| 7 | nontargetContrast:Validity | 2 | 16 | 4.697547 | 0.0248291 | \* | 0.0378918 |
| 8 | targetContrast:nontargetContrast:Validity | 2 | 16 | 2.639410 | 0.1021832 |  | 0.0259641 |

</td>

<td>

|     | Effect                                    |         W |         p | p\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------|
| 4   | Validity                                  | 0.6509767 | 0.2225764 |        |
| 6   | targetContrast:Validity                   | 0.6017142 | 0.1689919 |        |
| 7   | nontargetContrast:Validity                | 0.8927427 | 0.6722675 |        |
| 8   | targetContrast:nontargetContrast:Validity | 0.7310519 | 0.3340556 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.7412770 | 0.0273083 | \* | 0.8702018 | 0.0204449 | \* |
| 6 | targetContrast:Validity | 0.7151614 | 0.0838982 |  | 0.8275068 | 0.0743500 |  |
| 7 | nontargetContrast:Validity | 0.9031325 | 0.0295974 | \* | 1.1508713 | 0.0248291 | \* |
| 8 | targetContrast:nontargetContrast:Validity | 0.7880543 | 0.1181962 |  | 0.9484109 | 0.1058802 |  |

</td>

</tr>

</tbody>

</table>

## RT

``` r
# RT 
d <- data

RT_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(targetContrast, nontargetContrast, Target, Validity)
)

print(RT_anova)
```

    ## $ANOVA
    ##                                              Effect DFn DFd          F
    ## 2                                    targetContrast   1   8  5.5898947
    ## 3                                 nontargetContrast   1   8 26.5949608
    ## 4                                            Target   1   8 28.0342458
    ## 5                                          Validity   2  16 11.0480204
    ## 6                  targetContrast:nontargetContrast   1   8 17.6382016
    ## 7                             targetContrast:Target   1   8  1.9716333
    ## 8                          nontargetContrast:Target   1   8  1.3579271
    ## 9                           targetContrast:Validity   2  16  7.8120937
    ## 10                       nontargetContrast:Validity   2  16  1.0954158
    ## 11                                  Target:Validity   2  16  3.6460241
    ## 12          targetContrast:nontargetContrast:Target   1   8  6.3585864
    ## 13        targetContrast:nontargetContrast:Validity   2  16  3.0508399
    ## 14                   targetContrast:Target:Validity   2  16  4.0406483
    ## 15                nontargetContrast:Target:Validity   2  16  0.1409162
    ## 16 targetContrast:nontargetContrast:Target:Validity   2  16  1.0035552
    ##               p p<.05          ges
    ## 2  0.0456510783     * 1.267768e-01
    ## 3  0.0008668112     * 2.539650e-02
    ## 4  0.0007330317     * 2.707905e-02
    ## 5  0.0009681020     * 5.441276e-02
    ## 6  0.0029973904     * 1.861292e-02
    ## 7  0.1978856540       2.719584e-03
    ## 8  0.2774639301       8.391491e-04
    ## 9  0.0042934348     * 1.604688e-02
    ## 10 0.3582114321       1.085700e-03
    ## 11 0.0495790754     * 2.770996e-03
    ## 12 0.0357183321     * 4.372663e-03
    ## 13 0.0754323438       3.062501e-03
    ## 14 0.0379770231     * 2.765202e-03
    ## 15 0.8696282337       7.377375e-05
    ## 16 0.3885148601       4.079586e-04
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##                                              Effect         W          p p<.05
    ## 5                                          Validity 0.7550010 0.37395248      
    ## 9                           targetContrast:Validity 0.7651072 0.39176722      
    ## 10                       nontargetContrast:Validity 0.9985329 0.99487447      
    ## 11                                  Target:Validity 0.5672187 0.13744438      
    ## 13        targetContrast:nontargetContrast:Validity 0.8561520 0.58066833      
    ## 14                   targetContrast:Target:Validity 0.6950715 0.27996467      
    ## 15                nontargetContrast:Target:Validity 0.4766029 0.07473918      
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.8860822 0.65487595      
    ## 
    ## $`Sphericity Corrections`
    ##                                              Effect       GGe       p[GG]
    ## 5                                          Validity 0.8032135 0.002449072
    ## 9                           targetContrast:Validity 0.8097869 0.008124785
    ## 10                       nontargetContrast:Validity 0.9985350 0.358158606
    ## 11                                  Target:Validity 0.6979432 0.072339468
    ## 13        targetContrast:nontargetContrast:Validity 0.8742421 0.084656113
    ## 14                   targetContrast:Target:Validity 0.7663255 0.053502310
    ## 15                nontargetContrast:Target:Validity 0.6564277 0.781350163
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.8977323 0.382604847
    ##    p[GG]<.05       HFe       p[HF] p[HF]<.05
    ## 5          * 0.9742474 0.001092517         *
    ## 9          * 0.9855270 0.004505778         *
    ## 10           1.3304862 0.358211432          
    ## 11           0.7997272 0.063667989          
    ## 13           1.0986421 0.075432344          
    ## 14           0.9118001 0.043200990         *
    ## 15           0.7339229 0.806354075          
    ## 16           1.1410348 0.388514860

``` r
## RT filtered target present
d <- data %>% filter(targetContrast==1)

RTTP_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(nontargetContrast, Target, Validity)
)
knitr::kable(RTTP_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|  | Effect | DFn | DFd | F | p | p\<.05 | ges |
|:---|:---|---:|---:|---:|---:|:---|---:|
| 2 | nontargetContrast | 1 | 8 | 0.3883043 | 0.5505395 |  | 0.0003277 |
| 3 | Target | 1 | 8 | 13.7110763 | 0.0060179 | \* | 0.0272173 |
| 4 | Validity | 2 | 16 | 11.0768041 | 0.0009565 | \* | 0.0724926 |
| 5 | nontargetContrast:Target | 1 | 8 | 0.9714551 | 0.3531847 |  | 0.0008102 |
| 6 | nontargetContrast:Validity | 2 | 16 | 0.2189559 | 0.8057247 |  | 0.0003748 |
| 7 | Target:Validity | 2 | 16 | 5.1146345 | 0.0191721 | \* | 0.0061382 |
| 8 | nontargetContrast:Target:Validity | 2 | 16 | 0.1778951 | 0.8386632 |  | 0.0000891 |

</td>

<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.5657133 | 0.1361718 |        |
| 6   | nontargetContrast:Validity        | 0.9047046 | 0.7043261 |        |
| 7   | Target:Validity                   | 0.7656847 | 0.3928031 |        |
| 8   | nontargetContrast:Target:Validity | 0.7257858 | 0.3257089 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.6972107 | 0.0040212 | \* | 0.7985517 | 0.0024794 | \* |
| 6 | nontargetContrast:Validity | 0.9129957 | 0.7867207 |  | 1.1689263 | 0.8057247 |  |
| 7 | Target:Validity | 0.8101658 | 0.0282285 | \* | 0.9861785 | 0.0197168 | \* |
| 8 | nontargetContrast:Target:Validity | 0.7847974 | 0.7878789 |  | 0.9428919 | 0.8267918 |  |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered target present T1
d <- data %>% filter(targetContrast==1, Target == 1)

RTTP_T1_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(nontargetContrast, Validity)
)
knitr::kable(RTTP_T1_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect                     | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |   8 |  0.0511665 | 0.8267180 |        | 0.0001022 |
| 3   | Validity                   |   2 |  16 | 12.5507673 | 0.0005273 | \*     | 0.1018879 |
| 4   | nontargetContrast:Validity |   2 |  16 |  0.0905642 | 0.9138805 |        | 0.0001947 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9458075 | 0.8228290 |        |
| 4   | nontargetContrast:Validity | 0.6857975 | 0.2671072 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9485933 | 0.0006912 | \* | 1.2350599 | 0.0005273 | \* |
| 4 | nontargetContrast:Validity | 0.7609177 | 0.8648782 |  | 0.9027649 | 0.8968528 |  |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered target present T2
d <- data %>% filter(targetContrast==1, Target == 2)

RTTP_T2_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(nontargetContrast, Validity)
)
knitr::kable(RTTP_T2_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect                     | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |   8 | 1.7283688 | 0.2250551 |        | 0.0022850 |
| 3   | Validity                   |   2 |  16 | 7.0235154 | 0.0064647 | \*     | 0.0494188 |
| 4   | nontargetContrast:Validity |   2 |  16 | 0.3343271 | 0.7207017 |        | 0.0007626 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.1761317 | 0.0022931 | \*     |
| 4   | nontargetContrast:Validity | 0.8846568 | 0.6511963 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.5482852 | 0.0252229 | \* | 0.5699438 | 0.0236060 | \* |
| 4 | nontargetContrast:Validity | 0.8965850 | 0.6984881 |  | 1.1389494 | 0.7207017 |  |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered target absent
d <- data %>% filter(targetContrast==0)

RTTA_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(nontargetContrast, Target, Validity)
)
knitr::kable(RTTA_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|  | Effect | DFn | DFd | F | p | p\<.05 | ges |
|:---|:---|---:|---:|---:|---:|:---|---:|
| 2 | nontargetContrast | 1 | 8 | 33.6088905 | 0.0004064 | \* | 0.2389623 |
| 3 | Target | 1 | 8 | 10.4898922 | 0.0118988 | \* | 0.0440603 |
| 4 | Validity | 2 | 16 | 5.4845639 | 0.0153470 | \* | 0.0457467 |
| 5 | nontargetContrast:Target | 1 | 8 | 7.6442233 | 0.0244918 | \* | 0.0308531 |
| 6 | nontargetContrast:Validity | 2 | 16 | 7.2301970 | 0.0057953 | \* | 0.0262228 |
| 7 | Target:Validity | 2 | 16 | 0.6189288 | 0.5509264 |  | 0.0017902 |
| 8 | nontargetContrast:Target:Validity | 2 | 16 | 0.8096879 | 0.4624191 |  | 0.0028377 |

</td>

<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.8835322 | 0.6483033 |        |
| 6   | nontargetContrast:Validity        | 0.8653529 | 0.6028045 |        |
| 7   | Target:Validity                   | 0.3038633 | 0.0154659 | \*     |
| 8   | nontargetContrast:Target:Validity | 0.1040173 | 0.0003630 | \*     |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.8956819 | 0.0193520 | \* | 1.1373088 | 0.0153470 | \* |
| 6 | nontargetContrast:Validity | 0.8813313 | 0.0083498 | \* | 1.1113688 | 0.0057953 | \* |
| 7 | Target:Validity | 0.5895751 | 0.4767813 |  | 0.6313254 | 0.4862571 |  |
| 8 | nontargetContrast:Target:Validity | 0.5274310 | 0.3998396 |  | 0.5394967 | 0.4020994 |  |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered target absent T1
d <- data %>% filter(targetContrast==0, Target == 1)

RTTA_T1_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(nontargetContrast, Validity)
)
knitr::kable(RTTA_T1_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect                     | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |   8 | 26.889910 | 0.0008371 | \*     | 0.3345829 |
| 3   | Validity                   |   2 |  16 |  5.801481 | 0.0127443 | \*     | 0.0380849 |
| 4   | nontargetContrast:Validity |   2 |  16 |  2.570837 | 0.1076081 |        | 0.0142469 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.8813454 | 0.6427048 |        |
| 4   | nontargetContrast:Validity | 0.8517636 | 0.5703175 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8939310 | 0.0164098 | \* | 1.134131 | 0.0127443 | \* |
| 4 | nontargetContrast:Validity | 0.8709008 | 0.1170300 |  | 1.092664 | 0.1076081 |  |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered target absent T2
d <- data %>% filter(targetContrast==0, Target == 2)

RTTA_T2_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(nontargetContrast, Validity)
)
knitr::kable(RTTA_T2_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect                     | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |   8 | 21.715709 | 0.0016234 | \*     | 0.1375605 |
| 3   | Validity                   |   2 |  16 |  3.559738 | 0.0526182 |        | 0.0581754 |
| 4   | nontargetContrast:Validity |   2 |  16 |  5.236549 | 0.0178042 | \*     | 0.0457656 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.5593715 | 0.1309034 |        |
| 4   | nontargetContrast:Validity | 0.4109374 | 0.0444851 | \*     |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.6941415 | 0.0760142 |  | 0.7936324 | 0.0674211 |  |
| 4 | nontargetContrast:Validity | 0.6293018 | 0.0389692 | \* | 0.6918027 | 0.0341058 | \* |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered nontarget present
d <- data %>% filter(nontargetContrast==1)

RTNP_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(targetContrast, Target, Validity)
)
knitr::kable(RTNP_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|  | Effect | DFn | DFd | F | p | p\<.05 | ges |
|:---|:---|---:|---:|---:|---:|:---|---:|
| 2 | targetContrast | 1 | 8 | 2.9661720 | 0.1233225 |  | 0.0560459 |
| 3 | Target | 1 | 8 | 33.5005040 | 0.0004108 | \* | 0.0370303 |
| 4 | Validity | 2 | 16 | 9.6868163 | 0.0017520 | \* | 0.0673995 |
| 5 | targetContrast:Target | 1 | 8 | 0.1163364 | 0.7418275 |  | 0.0001980 |
| 6 | targetContrast:Validity | 2 | 16 | 2.3784310 | 0.1246425 |  | 0.0052722 |
| 7 | Target:Validity | 2 | 16 | 2.5223324 | 0.1116410 |  | 0.0032633 |
| 8 | targetContrast:Target:Validity | 2 | 16 | 3.7121121 | 0.0473847 | \* | 0.0037720 |

</td>

<td>

|     | Effect                         |         W |         p | p\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------|
| 4   | Validity                       | 0.4136288 | 0.0455133 | \*     |
| 6   | targetContrast:Validity        | 0.4122341 | 0.0449784 | \*     |
| 7   | Target:Validity                | 0.6805265 | 0.2599906 |        |
| 8   | targetContrast:Target:Validity | 0.9860139 | 0.9518985 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.6303695 | 0.0082515 | \* | 0.6934478 | 0.0063168 | \* |
| 6 | targetContrast:Validity | 0.6298158 | 0.1517976 |  | 0.6925945 | 0.1469932 |  |
| 7 | Target:Validity | 0.7578781 | 0.1297352 |  | 0.8976995 | 0.1189960 |  |
| 8 | targetContrast:Target:Validity | 0.9862068 | 0.0482285 | \* | 1.3066360 | 0.0473847 | \* |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered nontarget present T1
d <- data %>% filter(nontargetContrast==1, Target == 1)

RTNP_T1_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(targetContrast, Validity)
)
knitr::kable(RTNP_T1_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect                  | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | targetContrast          |   1 |   8 |  1.967067 | 0.1983530 |        | 0.0454221 |
| 3   | Validity                |   2 |  16 | 10.586516 | 0.0011780 | \*     | 0.0768794 |
| 4   | targetContrast:Validity |   2 |  16 |  5.993032 | 0.0114137 | \*     | 0.0159271 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.8689795 | 0.6116928 |        |
| 4   | targetContrast:Validity | 0.5920178 | 0.1596510 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8841573 | 0.0019895 | \* | 1.1164581 | 0.001178 | \* |
| 4 | targetContrast:Validity | 0.7102362 | 0.0235120 | \* | 0.8195309 | 0.017873 | \* |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered nontarget present T2
d <- data %>% filter(nontargetContrast==1, Target == 2)

RTNP_T2_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(targetContrast, Validity)
)
knitr::kable(RTNP_T2_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect                  | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | targetContrast          |   1 |   8 | 3.9923119 | 0.0807564 |        | 0.0692977 |
| 3   | Validity                |   2 |  16 | 6.6830908 | 0.0077657 | \*     | 0.0618578 |
| 4   | targetContrast:Validity |   2 |  16 | 0.0692807 | 0.9333431 |        | 0.0002721 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.3203851 | 0.0186146 | \*     |
| 4   | targetContrast:Validity | 0.5243266 | 0.1043774 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.5953746 | 0.0245535 | \* | 0.6400662 | 0.0215880 | \* |
| 4 | targetContrast:Validity | 0.6776567 | 0.8664846 |  | 0.7673666 | 0.8904982 |  |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered nontarget absent
d <- data %>% filter(nontargetContrast==0)

RTNA_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(targetContrast, Target, Validity)
)
knitr::kable(RTNA_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect                         | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:-------------------------------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | targetContrast                 |   1 |   8 | 7.882918 | 0.0229258 | \*     | 0.2115519 |
| 3   | Target                         |   1 |   8 | 9.144559 | 0.0164590 | \*     | 0.0185954 |
| 4   | Validity                       |   2 |  16 | 9.108644 | 0.0022856 | \*     | 0.0431266 |
| 5   | targetContrast:Target          |   1 |   8 | 5.729124 | 0.0436129 | \*     | 0.0138062 |
| 6   | targetContrast:Validity        |   2 |  16 | 8.438497 | 0.0031465 | \*     | 0.0323008 |
| 7   | Target:Validity                |   2 |  16 | 1.910902 | 0.1802248 |        | 0.0024275 |
| 8   | targetContrast:Target:Validity |   2 |  16 | 2.213090 | 0.1417303 |        | 0.0025726 |

</td>

<td>

|     | Effect                         |         W |         p | p\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------|
| 4   | Validity                       | 0.9207959 | 0.7491554 |        |
| 6   | targetContrast:Validity        | 0.9663093 | 0.8869652 |        |
| 7   | Target:Validity                | 0.2998966 | 0.0147707 | \*     |
| 8   | targetContrast:Target:Validity | 0.5463096 | 0.1205136 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.9266088 | 0.0030455 | \* | 1.1940360 | 0.0022856 | \* |
| 6 | targetContrast:Validity | 0.9674074 | 0.0035401 | \* | 1.2706399 | 0.0031465 | \* |
| 7 | Target:Validity | 0.5881995 | 0.2009294 |  | 0.6292566 | 0.1991415 |  |
| 8 | targetContrast:Target:Validity | 0.6879044 | 0.1627607 |  | 0.7836639 | 0.1561861 |  |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered nontarget absent T1
d <- data %>% filter(nontargetContrast==0, Target == 1)

RTNA_T1_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(targetContrast, Validity)
)
knitr::kable(RTNA_T1_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect                  | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | targetContrast          |   1 |   8 | 11.171969 | 0.0101940 | \*     | 0.2867553 |
| 3   | Validity                |   2 |  16 | 10.040379 | 0.0014954 | \*     | 0.0608524 |
| 4   | targetContrast:Validity |   2 |  16 |  7.945524 | 0.0040143 | \*     | 0.0440638 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.9864439 | 0.9533521 |        |
| 4   | targetContrast:Validity | 0.9033357 | 0.7006033 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9866252 | 0.0015838 | \* | 1.307442 | 0.0014954 | \* |
| 4 | targetContrast:Validity | 0.9118561 | 0.0054185 | \* | 1.166834 | 0.0040143 | \* |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered nontarget absent T2
d <- data %>% filter(nontargetContrast==0, Target == 2)

RTNA_T2_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(targetContrast, Validity)
)
knitr::kable(RTNA_T2_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect                  | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:------------------------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | targetContrast          |   1 |   8 | 4.350095 | 0.0704891 |        | 0.1385818 |
| 3   | Validity                |   2 |  16 | 5.005692 | 0.0204952 | \*     | 0.0290937 |
| 4   | targetContrast:Validity |   2 |  16 | 5.794919 | 0.0127928 | \*     | 0.0250340 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.8987916 | 0.6883454 |        |
| 4   | targetContrast:Validity | 0.9049138 | 0.7048963 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9080933 | 0.0245744 | \* | 1.159938 | 0.0204952 | \* |
| 4 | targetContrast:Validity | 0.9131701 | 0.0157276 | \* | 1.169247 | 0.0127928 | \* |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered present/present
d <- data %>% filter(targetContrast == 1, nontargetContrast==1)

RTTPNP_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(Target, Validity)
)
knitr::kable(RTTPNP_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect          | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Target          |   1 |   8 | 8.122934 | 0.0214765 | \*     | 0.0197555 |
| 3   | Validity        |   2 |  16 | 7.332484 | 0.0054931 | \*     | 0.0662568 |
| 4   | Target:Validity |   2 |  16 | 3.206269 | 0.0674577 |        | 0.0069484 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.2411200 | 0.0068836 | \*     |
| 4   | Target:Validity | 0.9350094 | 0.7904162 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.5685436 | 0.0214586 | \* | 0.5998754 | 0.0194098 | \* |
| 4 | Target:Validity | 0.9389754 | 0.0717148 |  | 1.2170399 | 0.0674577 |  |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered present/absent
d <- data %>% filter(targetContrast == 1, nontargetContrast==0)

RTTPNA_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(Target, Validity)
)
knitr::kable(RTTPNA_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect          | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |   8 | 11.339219 | 0.0098237 | \*     | 0.0353963 |
| 3   | Validity        |   2 |  16 | 10.768928 | 0.0010894 | \*     | 0.0787382 |
| 4   | Target:Validity |   2 |  16 |  4.390382 | 0.0302025 | \*     | 0.0055641 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9512286 | 0.8394544 |        |
| 4   | Target:Validity | 0.3796485 | 0.0337160 | \*     |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9534966 | 0.0013485 | \* | 1.2442904 | 0.0010894 | \* |
| 4 | Target:Validity | 0.6171500 | 0.0570785 |  | 0.6731529 | 0.0519698 |  |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered absent/present
d <- data %>% filter(targetContrast == 0, nontargetContrast==1)

RTTANP_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(Target, Validity)
)
knitr::kable(RTTANP_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect          | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |   8 | 27.257337 | 0.0008017 | \*     | 0.1103963 |
| 3   | Validity        |   2 |  16 | 11.095235 | 0.0009491 | \*     | 0.0975646 |
| 4   | Target:Validity |   2 |  16 |  2.496827 | 0.1138297 |        | 0.0072986 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.7857877 | 0.4300989 |        |
| 4   | Target:Validity | 0.3847145 | 0.0353171 | \*     |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8235792 | 0.0021872 | \* | 1.0093456 | 0.0009491 | \* |
| 4 | Target:Validity | 0.6190856 | 0.1430066 |  | 0.6761145 | 0.1383585 |  |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered absent/absent
d <- data %>% filter(targetContrast == 0, nontargetContrast==0)

RTTANA_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(Target, Validity)
)
knitr::kable(RTTANA_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect          | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |   8 | 0.1148796 | 0.7433808 |        | 0.0017395 |
| 3   | Validity        |   2 |  16 | 1.1803328 | 0.3325466 |        | 0.0196208 |
| 4   | Target:Validity |   2 |  16 | 0.0133810 | 0.9867192 |        | 0.0001623 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.3923494 | 0.0378317 | \*     |
| 4   | Target:Validity | 0.0874333 | 0.0001976 | \*     |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.6220257 | 0.3182041 |  | 0.6806197 | 0.3215533 |  |
| 4 | Target:Validity | 0.5228576 | 0.9185122 |  | 0.5328683 | 0.9216790 |  |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered target present/nontarget present T1
d <- data %>% filter(targetContrast==1, nontargetContrast==1, Target == 1)

RTTPNP_T1_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(RTTPNP_T1_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  16 | 10.03992 | 0.0014957 | \*     | 0.0942616 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7121084 | 0.3047273 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7764629 | 0.0039268 | \*           | 0.9288191 | 0.0020311 | \*           |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered target present/nontarget absent T1
d <- data %>% filter(targetContrast==1, nontargetContrast==0, Target == 1)

RTTPNA_T1_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(RTTPNA_T1_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  16 | 10.25863 | 0.0013582 | \*     | 0.1098866 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9809486 | 0.9348929 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9813048 | 0.0014742 | \*           | 1.297207 | 0.0013582 | \*           |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered target absent/nontarget present T1
d <- data %>% filter(targetContrast==0, nontargetContrast==1, Target == 1)

RTTANP_T1_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(RTTANP_T1_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  16 | 6.711502 | 0.0076465 | \*     | 0.0718456 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8594083 | 0.5884348 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.8767379 | 0.0108408 | \*           | 1.103116 | 0.0076465 | \*           |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered target absent/nontarget absent T1
d <- data %>% filter(targetContrast==0, nontargetContrast==0, Target == 1)

RTTANA_T1_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(RTTANA_T1_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  16 | 1.183859 | 0.3315264 |        | 0.0162062 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.2297486 | 0.0058128 | \*     |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.5648915 | 0.3135818 |              | 0.5944534 | 0.3156595 |              |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered target present/nontarget present T2
d <- data %>% filter(targetContrast==1, nontargetContrast==1, Target == 2)

RTTPNP_T2_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(RTTPNP_T2_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  16 | 3.278807 | 0.0640641 |        | 0.0431127 |

</td>

<td>

|     | Effect   |         W |        p | p\<.05 |
|:----|:---------|----------:|---------:|:-------|
| 2   | Validity | 0.2626107 | 0.009281 | \*     |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.5755762 | 0.0997571 |              | 0.6103488 | 0.0962352 |              |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered target present/nontarget absent T2
d <- data %>% filter(targetContrast==1, nontargetContrast==0, Target == 2)

RTTPNA_T2_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(RTTPNA_T2_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  16 | 9.194006 | 0.0021964 | \*     | 0.0556763 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8115911 | 0.4815934 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.8414612 | 0.0041132 | \*           | 1.040537 | 0.0021964 | \*           |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered target absent/nontarget present T1
d <- data %>% filter(targetContrast==0, nontargetContrast==1, Target == 2)

RTTANP_T2_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(RTTANP_T2_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  16 | 11.38106 | 0.0008428 | \*     | 0.1376997 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9541287 | 0.8484464 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |     HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|--------:|----------:|:-------------|
| 2   | Validity | 0.9561406 | 0.0010414 | \*           | 1.24928 | 0.0008428 | \*           |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered target absent/nontarget absent T2
d <- data %>% filter(targetContrast==0, nontargetContrast==0, Target == 2)

RTTANA_T2_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(RTTANA_T2_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|     | Effect   | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  16 | 0.5179126 | 0.6054168 |        | 0.0241307 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.1782857 | 0.0023928 | \*     |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.5489335 | 0.5071047 |              | 0.5708962 | 0.5133971 |              |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered target 1
d <- data %>% filter(Target==1)

RTT1_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(targetContrast, nontargetContrast, Validity)
)
knitr::kable(RTT1_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|  | Effect | DFn | DFd | F | p | p\<.05 | ges |
|:---|:---|---:|---:|---:|---:|:---|---:|
| 2 | targetContrast | 1 | 8 | 6.3962602 | 0.0353058 | \* | 0.1507652 |
| 3 | nontargetContrast | 1 | 8 | 14.4604749 | 0.0052166 | \* | 0.0331526 |
| 4 | Validity | 2 | 16 | 12.0075451 | 0.0006534 | \* | 0.0686999 |
| 5 | targetContrast:nontargetContrast | 1 | 8 | 19.0197065 | 0.0024089 | \* | 0.0378655 |
| 6 | targetContrast:Validity | 2 | 16 | 11.2282158 | 0.0008979 | \* | 0.0280645 |
| 7 | nontargetContrast:Validity | 2 | 16 | 0.6528641 | 0.5338766 |  | 0.0006839 |
| 8 | targetContrast:nontargetContrast:Validity | 2 | 16 | 0.9914131 | 0.3927320 |  | 0.0015937 |

</td>

<td>

|     | Effect                                    |         W |         p | p\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------|
| 4   | Validity                                  | 0.9496357 | 0.8345447 |        |
| 6   | targetContrast:Validity                   | 0.9265393 | 0.7656379 |        |
| 7   | nontargetContrast:Validity                | 0.9279718 | 0.7697892 |        |
| 8   | targetContrast:nontargetContrast:Validity | 0.7317311 | 0.3351431 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.9520506 | 0.0008329 | \* | 1.2415652 | 0.0006534 | \* |
| 6 | targetContrast:Validity | 0.9315665 | 0.0012444 | \* | 1.2032358 | 0.0008979 | \* |
| 7 | nontargetContrast:Validity | 0.9328113 | 0.5245698 |  | 1.2055505 | 0.5338766 |  |
| 8 | targetContrast:nontargetContrast:Validity | 0.7884763 | 0.3787957 |  | 0.9491269 | 0.3897805 |  |

</td>

</tr>

</tbody>

</table>

``` r
## RT filtered target 2
d <- data %>% filter(Target==2)

RTT2_anova = ezANOVA(
  data = d,
  dv = .(RT),
  wid = .(SID),
  within = .(targetContrast, nontargetContrast, Validity)
)
knitr::kable(RTT2_anova)
```

<table class="kable_wrapper">

<tbody>

<tr>

<td>

|  | Effect | DFn | DFd | F | p | p\<.05 | ges |
|:---|:---|---:|---:|---:|---:|:---|---:|
| 2 | targetContrast | 1 | 8 | 4.2623676 | 0.0728433 |  | 0.1028871 |
| 3 | nontargetContrast | 1 | 8 | 25.4427014 | 0.0009966 | \* | 0.0182683 |
| 4 | Validity | 2 | 16 | 7.8317618 | 0.0042509 | \* | 0.0432844 |
| 5 | targetContrast:nontargetContrast | 1 | 8 | 3.7975292 | 0.0871637 |  | 0.0053856 |
| 6 | targetContrast:Validity | 2 | 16 | 2.6985266 | 0.0977526 |  | 0.0080323 |
| 7 | nontargetContrast:Validity | 2 | 16 | 0.8307613 | 0.4536644 |  | 0.0016920 |
| 8 | targetContrast:nontargetContrast:Validity | 2 | 16 | 4.6870657 | 0.0249937 | \* | 0.0055618 |

</td>

<td>

|     | Effect                                    |         W |         p | p\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------|
| 4   | Validity                                  | 0.6686617 | 0.2444683 |        |
| 6   | targetContrast:Validity                   | 0.9151355 | 0.7331603 |        |
| 7   | nontargetContrast:Validity                | 0.9432971 | 0.8152103 |        |
| 8   | targetContrast:nontargetContrast:Validity | 0.9905256 | 0.9672305 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.7511239 | 0.0098308 | \* | 0.8864781 | 0.0062209 | \* |
| 6 | targetContrast:Validity | 0.9217741 | 0.1034284 |  | 1.1850928 | 0.0977526 |  |
| 7 | nontargetContrast:Validity | 0.9463397 | 0.4486418 |  | 1.2308274 | 0.4536644 |  |
| 8 | targetContrast:nontargetContrast:Validity | 0.9906145 | 0.0254203 | \* | 1.3151408 | 0.0249937 | \* |

</td>

</tr>

</tbody>

</table>

# paired t-tests

## full acc

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_acc-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_acc-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/ni_acc-1.png" width="90%" />

## accuracy by target (T1, T2)

### T1

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_acc T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_acc T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/ni_acc T1-1.png" width="90%" />

### T2

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_acc T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_acc T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/ni_acc T2-1.png" width="90%" />

## accuracy by target and nontarget contrast

### PresentPresent

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_accPP T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_accPP T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/ni_accPP T1-1.png" width="90%" />
\#### T2
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_accPP T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_accPP T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/ni_accPP T2-1.png" width="90%" />
\### PresentAbsent
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_accPA T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_accPA T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_accPA T1-1.png" width="90%" />
\##### T2
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_accPA T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_accPA T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_accPA T2-1.png" width="90%" />

\#AbsentPresent
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_accAP T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_accAP T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_accAP T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_accAP T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_accAP T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_accAP T2-1.png" width="90%" />

\#AbsentAbsent
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_accAA T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_accAA T1 -1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_accAA T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_accAA T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_accAA T2 -1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_accAA T2-1.png" width="90%" />
\## accuracy by target \#target present
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_accTP T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_accTP T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_accTP T1-1.png" width="90%" />
\# T2
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_accTP T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_accTP T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_accTP T2-1.png" width="90%" />
\#target absent
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_accTA T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_accTA T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_accTA T1 -1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_accTA T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_accTA T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_accTA T2-1.png" width="90%" />

## accuracy by nontarget

\#nontarget present
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_accNP T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_accNP T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_accNP T1-1.png" width="90%" />
\# T2
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_accNP T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_accNP T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_accNP T2-1.png" width="90%" />
\#nontarget absent
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_accNA T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_accNA T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_accNA T1 -1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_accNA T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_accNA T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_accNA T2-1.png" width="90%" />

## RT by target and nontarget

# PresentPresent

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_RT PP T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_RTPP T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/ni_RTPP T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_RTPP T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_RTPP T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/ni_RTPP T2-1.png" width="90%" />

# PresentAbsent

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_RTPA T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_RTPA T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_RTPA T1-1.png" width="90%" />
\# T2
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_RTPA T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_RTPA T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_RTPA T2-1.png" width="90%" />

\#AbsentPresent
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_RTAP T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_RTAP T1 -1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_RTAP T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_RTAP T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_RTAP T2 -1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_RTAP T2-1.png" width="90%" />

\#AbsentAbsent
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_aRTAA T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_RTAA T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_RTAA T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_aRTAA T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_RTAA T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_RTAA T2-1.png" width="90%" />
\## accuracy by target \#target present
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_RTTP T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_RTTP T1 -1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_RTTP T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_RTTP T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_RTTP T2 -1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_RTTP T2-1.png" width="90%" />
\#target absent
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_RTTA T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_RTTA T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_RTTA T1-1.png" width="90%" />

\#T2
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_RTTA T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_RTTA T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_RTTA T2-1.png" width="90%" />

## accuracy by nontarget

\#nontarget present
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_RTNP T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_RTNP T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_RTNP T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_RTNP T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_RTNP T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_RTNP T2-1.png" width="90%" />
\#nontarget absent
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_RTNA T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_RTNA T1-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_RTNA T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vi_RTNA T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/vn_RTNA T2-1.png" width="90%" />

<img src="tazoot_AccRT_bottomHalf_files/figure-gfm/in_RTNA T2-1.png" width="90%" />
