tazoot_AccRT
================
Jenny
2024-07-29

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
    ##                                              Effect DFn DFd           F
    ## 2                                    targetContrast   1  17 103.1500500
    ## 3                                 nontargetContrast   1  17  23.6629468
    ## 4                                            Target   1  17  20.6754644
    ## 5                                          Validity   2  34  12.3404297
    ## 6                  targetContrast:nontargetContrast   1  17  11.5893195
    ## 7                             targetContrast:Target   1  17  58.7210257
    ## 8                          nontargetContrast:Target   1  17   4.3212755
    ## 9                           targetContrast:Validity   2  34  35.2348588
    ## 10                       nontargetContrast:Validity   2  34   0.2503566
    ## 11                                  Target:Validity   2  34   1.1656070
    ## 12          targetContrast:nontargetContrast:Target   1  17   0.6004644
    ## 13        targetContrast:nontargetContrast:Validity   2  34   0.9482975
    ## 14                   targetContrast:Target:Validity   2  34   4.7108092
    ## 15                nontargetContrast:Target:Validity   2  34   0.6125699
    ## 16 targetContrast:nontargetContrast:Target:Validity   2  34   0.4358148
    ##               p p<.05          ges
    ## 2  1.232892e-08     * 0.3197103397
    ## 3  1.456476e-04     * 0.1086070779
    ## 4  2.855646e-04     * 0.0409208348
    ## 5  9.347634e-05     * 0.0303873755
    ## 6  3.376146e-03     * 0.0959094834
    ## 7  6.525488e-07     * 0.0877459643
    ## 8  5.309383e-02       0.0060216494
    ## 9  5.155899e-09     * 0.0487045964
    ## 10 7.799456e-01       0.0007266264
    ## 11 3.238792e-01       0.0028967978
    ## 12 4.490456e-01       0.0009315099
    ## 13 3.974077e-01       0.0019835900
    ## 14 1.563650e-02     * 0.0111721833
    ## 15 5.478293e-01       0.0015013416
    ## 16 6.502995e-01       0.0008719323
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##                                              Effect         W         p p<.05
    ## 5                                          Validity 0.9166705 0.4985471      
    ## 9                           targetContrast:Validity 0.9075499 0.4602184      
    ## 10                       nontargetContrast:Validity 0.9939170 0.9523592      
    ## 11                                  Target:Validity 0.7412984 0.0911894      
    ## 13        targetContrast:nontargetContrast:Validity 0.9060847 0.4543078      
    ## 14                   targetContrast:Target:Validity 0.7536621 0.1040910      
    ## 15                nontargetContrast:Target:Validity 0.7773265 0.1332993      
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.8413658 0.2511186      
    ## 
    ## $`Sphericity Corrections`
    ##                                              Effect       GGe        p[GG]
    ## 5                                          Validity 0.9230802 1.558041e-04
    ## 9                           targetContrast:Validity 0.9153736 2.001043e-08
    ## 10                       nontargetContrast:Validity 0.9939537 7.786482e-01
    ## 11                                  Target:Validity 0.7944695 3.164091e-01
    ## 13        targetContrast:nontargetContrast:Validity 0.9141475 3.910215e-01
    ## 14                   targetContrast:Target:Validity 0.8023506 2.360283e-02
    ## 15                nontargetContrast:Target:Validity 0.8178799 5.175278e-01
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.8630852 6.218792e-01
    ##    p[GG]<.05       HFe        p[HF] p[HF]<.05
    ## 5          * 1.0304612 9.347634e-05         *
    ## 9          * 1.0202694 5.155899e-09         *
    ## 10           1.1251707 7.799456e-01          
    ## 11           0.8630457 3.193333e-01          
    ## 13           1.0186499 3.974077e-01          
    ## 14         * 0.8731439 2.035894e-02         *
    ## 15           0.8931022 5.307519e-01          
    ## 16           0.9516627 6.407303e-01

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
| 2 | nontargetContrast | 1 | 17 | 0.0753495 | 0.7870094 |  | 0.0005960 |
| 3 | Target | 1 | 17 | 69.1163196 | 0.0000002 | \* | 0.2260237 |
| 4 | Validity | 2 | 34 | 28.7381783 | 0.0000000 | \* | 0.1484665 |
| 5 | nontargetContrast:Target | 1 | 17 | 0.8094003 | 0.3808652 |  | 0.0024412 |
| 6 | nontargetContrast:Validity | 2 | 34 | 0.0610879 | 0.9408436 |  | 0.0005150 |
| 7 | Target:Validity | 2 | 34 | 4.3061224 | 0.0215306 | \* | 0.0272036 |
| 8 | nontargetContrast:Target:Validity | 2 | 34 | 0.0192410 | 0.9809536 |  | 0.0000949 |

</td>

<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.8766819 | 0.3489283 |        |
| 6   | nontargetContrast:Validity        | 0.9998042 | 0.9984349 |        |
| 7   | Target:Validity                   | 0.8217360 | 0.2079020 |        |
| 8   | nontargetContrast:Target:Validity | 0.8982876 | 0.4239583 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.8902198 | 0.0000002 | \* | 0.9871478 | 0.0000001 | \* |
| 6 | nontargetContrast:Validity | 0.9998043 | 0.9408177 |  | 1.1330689 | 0.9408436 |  |
| 7 | Target:Validity | 0.8487063 | 0.0283439 | \* | 0.9329607 | 0.0243155 | \* |
| 8 | nontargetContrast:Target:Validity | 0.9076779 | 0.9739865 |  | 1.0101127 | 0.9809536 |  |

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
| 2   | nontargetContrast          |   1 |  17 |  0.0380603 | 0.8476348 |        | 0.0005058 |
| 3   | Validity                   |   2 |  34 | 23.6426500 | 0.0000004 | \*     | 0.2151881 |
| 4   | nontargetContrast:Validity |   2 |  34 |  0.0181475 | 0.9820257 |        | 0.0002833 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9556231 | 0.6954937 |        |
| 4   | nontargetContrast:Validity | 0.9206607 | 0.5161748 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9575087 | 0.0000006 | \* | 1.076246 | 0.0000004 | \* |
| 4 | nontargetContrast:Validity | 0.9264927 | 0.9768702 |  | 1.034981 | 0.9820257 |  |

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
| 2   | nontargetContrast          |   1 |  17 | 1.0123167 | 0.3284557 |        | 0.0071301 |
| 3   | Validity                   |   2 |  34 | 6.0226519 | 0.0057675 | \*     | 0.0784385 |
| 4   | nontargetContrast:Validity |   2 |  34 | 0.1178635 | 0.8891789 |        | 0.0011416 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9380328 | 0.5994378 |        |
| 4   | nontargetContrast:Validity | 0.8617123 | 0.3040172 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9416487 | 0.0068400 | \* | 1.0551028 | 0.0057675 | \* |
| 4 | nontargetContrast:Validity | 0.8785125 | 0.8646587 |  | 0.9718067 | 0.8839712 |  |

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
| 2 | nontargetContrast | 1 | 17 | 21.3065783 | 0.0002466 | \* | 0.2954417 |
| 3 | Target | 1 | 17 | 3.0301711 | 0.0997965 |  | 0.0097843 |
| 4 | Validity | 2 | 34 | 2.3293792 | 0.1127009 |  | 0.0052049 |
| 5 | nontargetContrast:Target | 1 | 17 | 3.7336976 | 0.0701647 |  | 0.0107002 |
| 6 | nontargetContrast:Validity | 2 | 34 | 2.1651505 | 0.1302938 |  | 0.0045458 |
| 7 | Target:Validity | 2 | 34 | 0.7391791 | 0.4850225 |  | 0.0026106 |
| 8 | nontargetContrast:Target:Validity | 2 | 34 | 1.0591028 | 0.3579289 |  | 0.0042788 |

</td>

<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.9361027 | 0.5896415 |        |
| 6   | nontargetContrast:Validity        | 0.8651886 | 0.3139688 |        |
| 7   | Target:Validity                   | 0.6839491 | 0.0478840 | \*     |
| 8   | nontargetContrast:Target:Validity | 0.7486873 | 0.0987197 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.9399404 | 0.1164746 |  | 1.0528307 | 0.1127009 |  |
| 6 | nontargetContrast:Validity | 0.8812037 | 0.1373848 |  | 0.9753291 | 0.1317499 |  |
| 7 | Target:Validity | 0.7598490 | 0.4521959 |  | 0.8189299 | 0.4611561 |  |
| 8 | nontargetContrast:Target:Validity | 0.7991608 | 0.3465215 |  | 0.8690542 | 0.3509673 |  |

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
| 2   | nontargetContrast          |   1 |  17 | 13.841543 | 0.0017007 | \*     | 0.2454280 |
| 3   | Validity                   |   2 |  34 |  2.608155 | 0.0883502 |        | 0.0114852 |
| 4   | nontargetContrast:Validity |   2 |  34 |  1.744722 | 0.1899716 |        | 0.0086587 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9597881 | 0.7201168 |        |
| 4   | nontargetContrast:Validity | 0.9313495 | 0.5661106 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9613426 | 0.0908478 |  | 1.081371 | 0.0883502 |  |
| 4 | nontargetContrast:Validity | 0.9357596 | 0.1924800 |  | 1.047275 | 0.1899716 |  |

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

|     | Effect                     | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |  17 | 23.7229269 | 0.0001438 | \*     | 0.3409900 |
| 3   | Validity                   |   2 |  34 |  0.6834806 | 0.5116582 |        | 0.0046911 |
| 4   | nontargetContrast:Validity |   2 |  34 |  1.2579023 | 0.2971438 |        | 0.0088917 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.7186402 | 0.0711364 |        |
| 4   | nontargetContrast:Validity | 0.6687909 | 0.0400242 | \*     |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.7804209 | 0.4786795 |  | 0.8450964 | 0.4892489 |  |
| 4 | nontargetContrast:Validity | 0.7511968 | 0.2915812 |  | 0.8079662 | 0.2933416 |  |

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
| 2 | targetContrast | 1 | 17 | 6.4204715 | 0.0214084 | \* | 0.0793120 |
| 3 | Target | 1 | 17 | 3.6801103 | 0.0720187 |  | 0.0109042 |
| 4 | Validity | 2 | 34 | 3.4951884 | 0.0416437 | \* | 0.0194947 |
| 5 | targetContrast:Target | 1 | 17 | 26.5330534 | 0.0000800 | \* | 0.0716802 |
| 6 | targetContrast:Validity | 2 | 34 | 15.5647465 | 0.0000159 | \* | 0.0437653 |
| 7 | Target:Validity | 2 | 34 | 0.1286571 | 0.8797015 |  | 0.0006783 |
| 8 | targetContrast:Target:Validity | 2 | 34 | 2.7395360 | 0.0788685 |  | 0.0115647 |

</td>

<td>

|     | Effect                         |         W |         p | p\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------|
| 4   | Validity                       | 0.9537035 | 0.6843952 |        |
| 6   | targetContrast:Validity        | 0.6999431 | 0.0576106 |        |
| 7   | Target:Validity                | 0.7362804 | 0.0863666 |        |
| 8   | targetContrast:Target:Validity | 0.7603621 | 0.1117284 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.9557520 | 0.0440835 | \* | 1.0739000 | 0.0416437 | \* |
| 6 | targetContrast:Validity | 0.7691971 | 0.0001085 | \* | 0.8308030 | 0.0000648 | \* |
| 7 | Target:Validity | 0.7913148 | 0.8326128 |  | 0.8590094 | 0.8499066 |  |
| 8 | targetContrast:Target:Validity | 0.8066872 | 0.0920576 |  | 0.8787092 | 0.0869256 |  |

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

|     | Effect                  | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | targetContrast          |   1 |  17 | 19.016415 | 0.0004256 | \*     | 0.2529104 |
| 3   | Validity                |   2 |  34 |  2.240427 | 0.1218938 |        | 0.0246905 |
| 4   | targetContrast:Validity |   2 |  34 | 14.509554 | 0.0000278 | \*     | 0.0910822 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.9981428 | 0.9852387 |        |
| 4   | targetContrast:Validity | 0.8670509 | 0.3194162 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9981463 | 0.1220061 |  | 1.130829 | 0.1218938 |  |
| 4 | targetContrast:Validity | 0.8826522 | 0.0000693 | \* | 0.977226 | 0.0000332 | \* |

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

|     | Effect                  | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | targetContrast          |   1 |  17 | 0.0157697 | 0.9015395 |        | 0.0002358 |
| 3   | Validity                |   2 |  34 | 1.5146049 | 0.2343614 |        | 0.0158773 |
| 4   | targetContrast:Validity |   2 |  34 | 2.3570076 | 0.1099973 |        | 0.0173596 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.9350239 | 0.5842269 |        |
| 4   | targetContrast:Validity | 0.7644832 | 0.1166658 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9389882 | 0.2354951 |  | 1.0515648 | 0.2343614 |  |
| 4 | targetContrast:Validity | 0.8093779 | 0.1223781 |  | 0.8821655 | 0.1175431 |  |

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

|  | Effect | DFn | DFd | F | p | p\<.05 | ges |
|:---|:---|---:|---:|---:|---:|:---|---:|
| 2 | targetContrast | 1 | 17 | 140.996755 | 0.0000000 | \* | 0.6729669 |
| 3 | Target | 1 | 17 | 33.304318 | 0.0000226 | \* | 0.1399724 |
| 4 | Validity | 2 | 34 | 14.648701 | 0.0000258 | \* | 0.0644764 |
| 5 | targetContrast:Target | 1 | 17 | 38.944055 | 0.0000090 | \* | 0.1359327 |
| 6 | targetContrast:Validity | 2 | 34 | 14.031746 | 0.0000361 | \* | 0.0703036 |
| 7 | Target:Validity | 2 | 34 | 3.969343 | 0.0282286 | \* | 0.0154483 |
| 8 | targetContrast:Target:Validity | 2 | 34 | 2.835941 | 0.0725995 |  | 0.0134135 |

</td>

<td>

|     | Effect                         |         W |         p | p\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------|
| 4   | Validity                       | 0.9688940 | 0.7766228 |        |
| 6   | targetContrast:Validity        | 0.9597477 | 0.7198741 |        |
| 7   | Target:Validity                | 0.7222764 | 0.0740675 |        |
| 8   | targetContrast:Target:Validity | 0.7773061 | 0.1332713 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.9698324 | 0.0000327 | \* | 1.0927368 | 0.0000258 | \* |
| 6 | targetContrast:Validity | 0.9613052 | 0.0000482 | \* | 1.0813207 | 0.0000361 | \* |
| 7 | Target:Validity | 0.7826419 | 0.0399540 | \* | 0.8479297 | 0.0359888 | \* |
| 8 | targetContrast:Target:Validity | 0.8178662 | 0.0849369 |  | 0.8930847 | 0.0796202 |  |

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

|     | Effect                  | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | targetContrast          |   1 |  17 | 139.95854 | 0.0000000 | \*     | 0.7131765 |
| 3   | Validity                |   2 |  34 |  11.33096 | 0.0001695 | \*     | 0.0982334 |
| 4   | targetContrast:Validity |   2 |  34 |  10.37969 | 0.0003029 | \*     | 0.1021003 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.9258806 | 0.5400576 |        |
| 4   | targetContrast:Validity | 0.8933741 | 0.4057579 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9309952 | 0.0002580 | \* | 1.040950 | 0.0001695 | \* |
| 4 | targetContrast:Validity | 0.9036478 | 0.0005176 | \* | 1.004802 | 0.0003029 | \* |

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
| 2   | targetContrast          |   1 |  17 | 80.923902 | 0.0000001 | \*     | 0.6231291 |
| 3   | Validity                |   2 |  34 |  5.129974 | 0.0112968 | \*     | 0.0331275 |
| 4   | targetContrast:Validity |   2 |  34 |  4.485739 | 0.0186671 | \*     | 0.0370860 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.9806247 | 0.8551116 |        |
| 4   | targetContrast:Validity | 0.7382346 | 0.0882175 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9809930 | 0.0118122 | \* | 1.1077177 | 0.0112968 | \* |
| 4 | targetContrast:Validity | 0.7925403 | 0.0278965 | \* | 0.8605771 | 0.0244450 | \* |

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

|     | Effect          | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |  17 | 49.277296 | 0.0000021 | \*     | 0.2034519 |
| 3   | Validity        |   2 |  34 | 10.404896 | 0.0002982 | \*     | 0.1695722 |
| 4   | Target:Validity |   2 |  34 |  1.784437 | 0.1832579 |        | 0.0259027 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9193348 | 0.5102579 |        |
| 4   | Target:Validity | 0.7519856 | 0.1022531 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9253560 | 0.0004520 | \* | 1.0334749 | 0.0002982 | \* |
| 4 | Target:Validity | 0.8012728 | 0.1912731 |  | 0.8717617 | 0.1885433 |  |

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
| 2   | Target          |   1 |  17 | 36.220330 | 0.0000138 | \*     | 0.2477610 |
| 3   | Validity        |   2 |  34 | 14.980358 | 0.0000216 | \*     | 0.1294263 |
| 4   | Target:Validity |   2 |  34 |  3.529756 | 0.0404676 | \*     | 0.0285321 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9622780 | 0.7351980 |        |
| 4   | Target:Validity | 0.7493311 | 0.0994009 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9636492 | 0.0000289 | \* | 1.0844562 | 0.0000216 | \* |
| 4 | Target:Validity | 0.7995722 | 0.0526225 |  | 0.8695815 | 0.0480078 | \* |

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
| 2   | Target          |   1 |  17 | 3.3821226 | 0.0834405 |        | 0.0205275 |
| 3   | Validity        |   2 |  34 | 2.3530921 | 0.1103762 |        | 0.0097943 |
| 4   | Target:Validity |   2 |  34 | 0.9009104 | 0.4156757 |        | 0.0066147 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9065224 | 0.4560668 |        |
| 4   | Target:Validity | 0.7290941 | 0.0798488 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9145135 | 0.1158082 |  | 1.0191333 | 0.1103762 |  |
| 4 | Target:Validity | 0.7868403 | 0.3958653 |  | 0.8532901 | 0.4026690 |  |

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
| 2   | Target          |   1 |  17 | 0.2556391 | 0.6196247 |        | 0.0008153 |
| 3   | Validity        |   2 |  34 | 0.1728814 | 0.8419723 |        | 0.0027464 |
| 4   | Target:Validity |   2 |  34 | 1.1292639 | 0.3350956 |        | 0.0257379 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8925711 | 0.4028493 |        |
| 4   | Target:Validity | 0.4668121 | 0.0022550 | \*     |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9029925 | 0.8207468 |  | 1.0039391 | 0.8419723 |  |
| 4 | Target:Validity | 0.6522358 | 0.3171295 |  | 0.6842869 | 0.3194670 |  |

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
| 2   | Validity |   2 |  34 | 9.109017 | 0.0006795 | \*     | 0.2519941 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9610258 | 0.7275795 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9624878 | 0.0008141 | \*           | 1.082902 | 0.0006795 | \*           |

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
| 2   | Validity |   2 |  34 | 11.42181 | 0.0001605 | \*     | 0.1858981 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9365571 | 0.5919353 |        |

</td>

<td>

|     | Effect   |      GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|---------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.940342 | 0.0002315 | \*           | 1.053365 | 0.0001605 | \*           |

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

|     | Effect   | DFn | DFd |        F |        p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|---------:|:-------|----------:|
| 2   | Validity |   2 |  34 | 2.295779 | 0.116084 |        | 0.0199377 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9622289 | 0.7348982 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |  p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|---------:|:-------------|
| 2   | Validity | 0.9636036 | 0.1183396 |              | 1.084395 | 0.116084 |              |

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
| 2   | Validity |   2 |  34 | 0.5091641 | 0.6055077 |        | 0.0204362 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.5252197 | 0.0057907 | \*     |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |  p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|---------:|:-------------|
| 2   | Validity | 0.6780671 | 0.5374146 |              | 0.7162685 | 0.546931 |              |

</td>

</tr>

</tbody>

</table>

``` r
## accuracy filtered target present/nontarget present T2
d <- data %>% filter(targetContrast==1, nontargetContrast==1, Target == 2)

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
| 2   | Validity |   2 |  34 | 3.076318 | 0.0591565 |        | 0.0881418 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9453946 | 0.6381238 |        |

</td>

<td>

|     | Effect   |      GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|---------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.948222 | 0.0623556 |              | 1.063855 | 0.0591565 |              |

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

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  34 | 5.037037 | 0.0121346 | \*     | 0.0685854 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9183464 | 0.5058853 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9245104 | 0.0144245 | \*           | 1.032355 | 0.0121346 | \*           |

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

|     | Effect   | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  34 | 0.9697774 | 0.3894089 |        | 0.0132488 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.6883586 | 0.0504102 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7624035 | 0.3707777 |              | 0.8221716 | 0.3761286 |              |

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

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  34 | 1.242308 | 0.3014918 |        | 0.0430229 |

</td>

<td>

|     | Effect   |         W |        p | p\<.05 |
|:----|:---------|----------:|---------:|:-------|
| 2   | Validity | 0.3882249 | 0.000516 | \*     |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.6204339 | 0.2891804 |              | 0.6452012 | 0.2905513 |              |

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
| 2 | targetContrast | 1 | 17 | 175.2232393 | 0.0000000 | \* | 0.4833102 |
| 3 | nontargetContrast | 1 | 17 | 12.4136749 | 0.0026088 | \* | 0.0649030 |
| 4 | Validity | 2 | 34 | 11.8092549 | 0.0001275 | \* | 0.0478605 |
| 5 | targetContrast:nontargetContrast | 1 | 17 | 6.6017959 | 0.0198987 | \* | 0.0759618 |
| 6 | targetContrast:Validity | 2 | 34 | 25.3274035 | 0.0000002 | \* | 0.0923511 |
| 7 | nontargetContrast:Validity | 2 | 34 | 0.2281879 | 0.7971838 |  | 0.0014833 |
| 8 | targetContrast:nontargetContrast:Validity | 2 | 34 | 0.6548571 | 0.5259448 |  | 0.0027228 |

</td>

<td>

|     | Effect                                    |         W |         p | p\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------|
| 4   | Validity                                  | 0.9253177 | 0.5374361 |        |
| 6   | targetContrast:Validity                   | 0.9917630 | 0.9359727 |        |
| 7   | nontargetContrast:Validity                | 0.9635718 | 0.7431436 |        |
| 8   | targetContrast:nontargetContrast:Validity | 0.6309918 | 0.0251299 | \*     |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.9305075 | 0.0001983 | \* | 1.0403033 | 0.0001275 | \* |
| 6 | targetContrast:Validity | 0.9918303 | 0.0000002 | \* | 1.1223071 | 0.0000002 | \* |
| 7 | nontargetContrast:Validity | 0.9648522 | 0.7895381 |  | 1.0860663 | 0.7971838 |  |
| 8 | targetContrast:nontargetContrast:Validity | 0.7304558 | 0.4820015 |  | 0.7817836 | 0.4914620 |  |

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
| 2 | targetContrast | 1 | 17 | 20.9383054 | 0.0002685 | \* | 0.1303549 |
| 3 | nontargetContrast | 1 | 17 | 25.3950716 | 0.0001009 | \* | 0.1623623 |
| 4 | Validity | 2 | 34 | 2.7401363 | 0.0788278 |  | 0.0159263 |
| 5 | targetContrast:nontargetContrast | 1 | 17 | 15.4473459 | 0.0010784 | \* | 0.1189307 |
| 6 | targetContrast:Validity | 2 | 34 | 4.9799493 | 0.0126817 | \* | 0.0179220 |
| 7 | nontargetContrast:Validity | 2 | 34 | 0.7560771 | 0.4772350 |  | 0.0030615 |
| 8 | targetContrast:nontargetContrast:Validity | 2 | 34 | 0.7482391 | 0.4808306 |  | 0.0029978 |

</td>

<td>

|     | Effect                                    |         W |         p | p\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------|
| 4   | Validity                                  | 0.9437112 | 0.6290902 |        |
| 6   | targetContrast:Validity                   | 0.7299912 | 0.0806382 |        |
| 7   | nontargetContrast:Validity                | 0.9375174 | 0.5968079 |        |
| 8   | targetContrast:nontargetContrast:Validity | 0.8578714 | 0.2933441 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.9467108 | 0.0822769 |  | 1.0618417 | 0.0788278 |  |
| 6 | targetContrast:Validity | 0.7873961 | 0.0205022 | \* | 0.8540001 | 0.0176298 | \* |
| 7 | nontargetContrast:Validity | 0.9411919 | 0.4702496 |  | 1.0544952 | 0.4772350 |  |
| 8 | targetContrast:nontargetContrast:Validity | 0.8755581 | 0.4652509 |  | 0.9679427 | 0.4770129 |  |

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
    ##                                              Effect DFn DFd            F
    ## 2                                    targetContrast   1  17 18.310083212
    ## 3                                 nontargetContrast   1  17 23.581661517
    ## 4                                            Target   1  17 33.898082007
    ## 5                                          Validity   2  34 17.187701688
    ## 6                  targetContrast:nontargetContrast   1  17 21.622465747
    ## 7                             targetContrast:Target   1  17  6.875329398
    ## 8                          nontargetContrast:Target   1  17  1.057745787
    ## 9                           targetContrast:Validity   2  34 13.856491266
    ## 10                       nontargetContrast:Validity   2  34  4.440971690
    ## 11                                  Target:Validity   2  34  3.601473117
    ## 12          targetContrast:nontargetContrast:Target   1  17  5.339524848
    ## 13        targetContrast:nontargetContrast:Validity   2  34  3.035983372
    ## 14                   targetContrast:Target:Validity   2  34  4.787234338
    ## 15                nontargetContrast:Target:Validity   2  34  1.757022228
    ## 16 targetContrast:nontargetContrast:Target:Validity   2  34  0.008653583
    ##               p p<.05          ges
    ## 2  5.073757e-04     * 1.467797e-01
    ## 3  1.482361e-04     * 1.962651e-02
    ## 4  2.039832e-05     * 2.321816e-02
    ## 5  6.947735e-06     * 4.471420e-02
    ## 6  2.293123e-04     * 1.476326e-02
    ## 7  1.784512e-02     * 4.079334e-03
    ## 8  3.181417e-01       2.657946e-04
    ## 9  3.969543e-05     * 1.735173e-02
    ## 10 1.934086e-02     * 2.561787e-03
    ## 11 3.813827e-02     * 1.890668e-03
    ## 12 3.365702e-02     * 2.722975e-03
    ## 13 6.121395e-02       1.412487e-03
    ## 14 1.472977e-02     * 2.037463e-03
    ## 15 1.878648e-01       7.746460e-04
    ## 16 9.913859e-01       2.222385e-06
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##                                              Effect         W          p p<.05
    ## 5                                          Validity 0.6610205 0.03645183     *
    ## 9                           targetContrast:Validity 0.6614387 0.03663673     *
    ## 10                       nontargetContrast:Validity 0.9817482 0.86298047      
    ## 11                                  Target:Validity 0.9565043 0.70064082      
    ## 13        targetContrast:nontargetContrast:Validity 0.8313084 0.22808543      
    ## 14                   targetContrast:Target:Validity 0.9430994 0.62583482      
    ## 15                nontargetContrast:Target:Validity 0.8772123 0.35062090      
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.8741698 0.34100944      
    ## 
    ## $`Sphericity Corrections`
    ##                                              Effect       GGe        p[GG]
    ## 5                                          Validity 0.7468374 6.974092e-05
    ## 9                           targetContrast:Validity 0.7470707 2.622861e-04
    ## 10                       nontargetContrast:Validity 0.9820754 2.001102e-02
    ## 11                                  Target:Validity 0.9583173 4.035520e-02
    ## 13        targetContrast:nontargetContrast:Validity 0.8556578 7.062411e-02
    ## 14                   targetContrast:Target:Validity 0.9461628 1.651675e-02
    ## 15                nontargetContrast:Target:Validity 0.8906403 1.921807e-01
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.8882334 9.862696e-01
    ##    p[GG]<.05       HFe        p[HF] p[HF]<.05
    ## 5          * 0.8024515 4.194481e-05         *
    ## 9          * 0.8027465 1.728086e-04         *
    ## 10         * 1.1091729 1.934086e-02         *
    ## 11         * 1.0773267 3.813827e-02         *
    ## 13           0.9419934 6.483727e-02          
    ## 14         * 1.0611117 1.472977e-02         *
    ## 15           0.9876998 1.883613e-01          
    ## 16           0.9845416 9.908148e-01

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
| 2 | nontargetContrast | 1 | 17 | 0.3212098 | 0.5782885 |  | 0.0002331 |
| 3 | Target | 1 | 17 | 24.5297112 | 0.0001210 | \* | 0.0295881 |
| 4 | Validity | 2 | 34 | 18.2027958 | 0.0000042 | \* | 0.0724221 |
| 5 | nontargetContrast:Target | 1 | 17 | 1.7534531 | 0.2029722 |  | 0.0008271 |
| 6 | nontargetContrast:Validity | 2 | 34 | 0.1430929 | 0.8671927 |  | 0.0001244 |
| 7 | Target:Validity | 2 | 34 | 5.1492225 | 0.0111311 | \* | 0.0045344 |
| 8 | nontargetContrast:Target:Validity | 2 | 34 | 1.0089712 | 0.3752497 |  | 0.0005489 |

</td>

<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.5134740 | 0.0048322 | \*     |
| 6   | nontargetContrast:Validity        | 0.9951766 | 0.9620578 |        |
| 7   | Target:Validity                   | 0.8992480 | 0.4275983 |        |
| 8   | nontargetContrast:Target:Validity | 0.9064703 | 0.4558569 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.6727094 | 0.0000977 | \* | 0.7096178 | 0.0000684 | \* |
| 6 | nontargetContrast:Validity | 0.9951997 | 0.8662649 |  | 1.1268518 | 0.8671927 |  |
| 7 | Target:Validity | 0.9084699 | 0.0138193 | \* | 1.0111570 | 0.0111311 | \* |
| 8 | nontargetContrast:Target:Validity | 0.9144699 | 0.3700091 |  | 1.0190756 | 0.3752497 |  |

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
| 2   | nontargetContrast          |   1 |  17 |  0.1575977 | 0.6963175 |        | 0.0001661 |
| 3   | Validity                   |   2 |  34 | 16.4820955 | 0.0000099 | \*     | 0.0911284 |
| 4   | nontargetContrast:Validity |   2 |  34 |  0.2223491 | 0.8017908 |        | 0.0002730 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.8240084 | 0.2125461 |        |
| 4   | nontargetContrast:Validity | 0.9840623 | 0.8793881 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8503462 | 0.0000367 | \* | 0.9350902 | 0.0000175 | \* |
| 4 | nontargetContrast:Validity | 0.9843123 | 0.7984312 |  | 1.1121817 | 0.8017908 |  |

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

|     | Effect                     | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |  17 |  1.5650147 | 0.2278761 |        | 0.0021434 |
| 3   | Validity                   |   2 |  34 | 15.0424462 | 0.0000209 | \*     | 0.0576770 |
| 4   | nontargetContrast:Validity |   2 |  34 |  0.7079166 | 0.4997867 |        | 0.0011589 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.3168863 | 0.0001017 | \*     |
| 4   | nontargetContrast:Validity | 0.9116234 | 0.4770057 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.5941369 | 0.0005584 | \* | 0.6131187 | 0.0004782 | \* |
| 4 | nontargetContrast:Validity | 0.9187996 | 0.4890161 |  | 1.0247976 | 0.4997867 |  |

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
| 2 | nontargetContrast | 1 | 17 | 35.702681 | 0.0000151 | \* | 0.1369682 |
| 3 | Target | 1 | 17 | 12.444378 | 0.0025843 | \* | 0.0181932 |
| 4 | Validity | 2 | 34 | 5.418904 | 0.0090612 | \* | 0.0157877 |
| 5 | nontargetContrast:Target | 1 | 17 | 5.961506 | 0.0258500 | \* | 0.0105976 |
| 6 | nontargetContrast:Validity | 2 | 34 | 10.624024 | 0.0002605 | \* | 0.0174017 |
| 7 | Target:Validity | 2 | 34 | 1.451732 | 0.2483134 |  | 0.0017300 |
| 8 | nontargetContrast:Target:Validity | 2 | 34 | 1.276830 | 0.2919556 |  | 0.0015869 |

</td>

<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.9995039 | 0.9960382 |        |
| 6   | nontargetContrast:Validity        | 0.8904776 | 0.3953521 |        |
| 7   | Target:Validity                   | 0.9386487 | 0.6025939 |        |
| 8   | nontargetContrast:Target:Validity | 0.5692651 | 0.0110285 | \*     |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.9995042 | 0.0090726 | \* | 1.1326634 | 0.0090612 | \* |
| 6 | nontargetContrast:Validity | 0.9012887 | 0.0004571 | \* | 1.0016959 | 0.0002605 | \* |
| 7 | Target:Validity | 0.9421951 | 0.2489826 |  | 1.0558299 | 0.2483134 |  |
| 8 | nontargetContrast:Target:Validity | 0.6989415 | 0.2853777 |  | 0.7422677 | 0.2868844 |  |

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
| 2   | nontargetContrast          |   1 |  17 | 25.811473 | 0.0000926 | \*     | 0.1779127 |
| 3   | Validity                   |   2 |  34 |  2.818950 | 0.0736649 |        | 0.0091877 |
| 4   | nontargetContrast:Validity |   2 |  34 |  4.860451 | 0.0139132 | \*     | 0.0122515 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9163188 | 0.4970189 |        |
| 4   | nontargetContrast:Validity | 0.7916300 | 0.1542332 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9227806 | 0.0786809 |  | 1.0300646 | 0.0736649 |  |
| 4 | nontargetContrast:Validity | 0.8275611 | 0.0202616 | \* | 0.9055855 | 0.0170869 | \* |

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
| 2   | nontargetContrast          |   1 |  17 | 31.904805 | 0.0000289 | \*     | 0.0942008 |
| 3   | Validity                   |   2 |  34 |  5.526598 | 0.0083523 | \*     | 0.0287556 |
| 4   | nontargetContrast:Validity |   2 |  34 |  8.467569 | 0.0010372 | \*     | 0.0280865 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9216286 | 0.5205323 |        |
| 4   | nontargetContrast:Validity | 0.6149096 | 0.0204404 | \*     |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9273243 | 0.0100938 | \* | 1.0360828 | 0.0083523 | \* |
| 4 | nontargetContrast:Validity | 0.7219745 | 0.0035831 | \* | 0.7711174 | 0.0028746 | \* |

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
| 2 | targetContrast | 1 | 17 | 11.9907582 | 0.0029747 | \* | 0.0777986 |
| 3 | Target | 1 | 17 | 37.9978065 | 0.0000104 | \* | 0.0278866 |
| 4 | Validity | 2 | 34 | 17.1460412 | 0.0000071 | \* | 0.0657241 |
| 5 | targetContrast:Target | 1 | 17 | 0.1583017 | 0.6956768 |  | 0.0001362 |
| 6 | targetContrast:Validity | 2 | 34 | 7.3309902 | 0.0022538 | \* | 0.0089355 |
| 7 | Target:Validity | 2 | 34 | 4.1144338 | 0.0251062 | \* | 0.0039839 |
| 8 | targetContrast:Target:Validity | 2 | 34 | 3.8457615 | 0.0312126 | \* | 0.0020457 |

</td>

<td>

|     | Effect                         |         W |         p | p\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------|
| 4   | Validity                       | 0.4373902 | 0.0013395 | \*     |
| 6   | targetContrast:Validity        | 0.4795983 | 0.0027991 | \*     |
| 7   | Target:Validity                | 0.8208528 | 0.2061211 |        |
| 8   | targetContrast:Target:Validity | 0.9696202 | 0.7812915 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.6399550 | 0.0001885 | \* | 0.6691559 | 0.0001442 | \* |
| 6 | targetContrast:Validity | 0.6577209 | 0.0081888 | \* | 0.6910604 | 0.0072152 | \* |
| 7 | Target:Validity | 0.8480706 | 0.0324653 | \* | 0.9321355 | 0.0281566 | \* |
| 8 | targetContrast:Target:Validity | 0.9705159 | 0.0326372 | \* | 1.0936530 | 0.0312126 | \* |

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
| 2   | targetContrast          |   1 |  17 |  9.507162 | 0.0067404 | \*     | 0.0749898 |
| 3   | Validity                |   2 |  34 | 15.084503 | 0.0000204 | \*     | 0.0653709 |
| 4   | targetContrast:Validity |   2 |  34 | 10.485911 | 0.0002836 | \*     | 0.0160585 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.8373366 | 0.2416578 |        |
| 4   | targetContrast:Validity | 0.8288634 | 0.2227735 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8600942 | 0.0000633 | \* | 0.9477666 | 3.11e-05 | \* |
| 4 | targetContrast:Validity | 0.8538713 | 0.0006453 | \* | 0.9396706 | 3.98e-04 | \* |

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
| 2   | targetContrast          |   1 |  17 | 12.553458 | 0.0024993 | \*     | 0.0816545 |
| 3   | Validity                |   2 |  34 | 14.189365 | 0.0000331 | \*     | 0.0740919 |
| 4   | targetContrast:Validity |   2 |  34 |  2.118124 | 0.1358507 |        | 0.0042789 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.2786449 | 0.0000363 | \*     |
| 4   | targetContrast:Validity | 0.7190375 | 0.0714516 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.5809376 | 0.0008209 | \* | 0.5970958 | 0.0007245 | \* |
| 4 | targetContrast:Validity | 0.7806630 | 0.1486695 |  | 0.8454051 | 0.1448668 |  |

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

|     | Effect                         | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:-------------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | targetContrast                 |   1 |  17 | 22.113954 | 0.0002051 | \*     | 0.2262474 |
| 3   | Target                         |   1 |  17 | 16.669922 | 0.0007749 | \*     | 0.0188974 |
| 4   | Validity                       |   2 |  34 | 11.231929 | 0.0001799 | \*     | 0.0270902 |
| 5   | targetContrast:Target          |   1 |  17 | 10.066741 | 0.0055635 | \*     | 0.0135099 |
| 6   | targetContrast:Validity        |   2 |  34 | 12.983022 | 0.0000647 | \*     | 0.0285576 |
| 7   | Target:Validity                |   2 |  34 |  1.355087 | 0.2715015 |        | 0.0013021 |
| 8   | targetContrast:Target:Validity |   2 |  34 |  2.432824 | 0.1029250 |        | 0.0020335 |

</td>

<td>

|     | Effect                         |         W |         p | p\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------|
| 4   | Validity                       | 0.8929245 | 0.4041270 |        |
| 6   | targetContrast:Validity        | 0.9752588 | 0.8183873 |        |
| 7   | Target:Validity                | 0.9812864 | 0.8597386 |        |
| 8   | targetContrast:Target:Validity | 0.9595949 | 0.7189578 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.9032807 | 0.0003226 | \* | 1.004319 | 0.0001799 | \* |
| 6 | targetContrast:Validity | 0.9758561 | 0.0000765 | \* | 1.100817 | 0.0000647 | \* |
| 7 | Target:Validity | 0.9816302 | 0.2715082 |  | 1.108574 | 0.2715015 |  |
| 8 | targetContrast:Target:Validity | 0.9611641 | 0.1054025 |  | 1.081132 | 0.1029250 |  |

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
| 2   | targetContrast          |   1 |  17 | 26.317574 | 0.0000835 | \*     | 0.2828237 |
| 3   | Validity                |   2 |  34 |  9.169028 | 0.0006535 | \*     | 0.0355597 |
| 4   | targetContrast:Validity |   2 |  34 | 10.996134 | 0.0002075 | \*     | 0.0398525 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.8719357 | 0.3340993 |        |
| 4   | targetContrast:Validity | 0.9558073 | 0.6965667 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8864743 | 0.0011346 | \* | 0.9822346 | 0.0007123 | \* |
| 4 | targetContrast:Validity | 0.9576776 | 0.0002663 | \* | 1.0764720 | 0.0002075 | \* |

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

|     | Effect                  | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | targetContrast          |   1 |  17 | 14.107844 | 0.0015741 | \*     | 0.1658669 |
| 3   | Validity                |   2 |  34 |  7.222998 | 0.0024308 | \*     | 0.0193813 |
| 4   | targetContrast:Validity |   2 |  34 |  8.403655 | 0.0010824 | \*     | 0.0188344 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.9913075 | 0.9325397 |        |
| 4   | targetContrast:Validity | 0.8308425 | 0.2270647 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9913825 | 0.0025090 | \* | 1.1217034 | 0.0024308 | \* |
| 4 | targetContrast:Validity | 0.8553168 | 0.0020479 | \* | 0.9415499 | 0.0013997 | \* |

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
| 2   | Target          |   1 |  17 | 20.00852 | 0.0003345 | \*     | 0.0217560 |
| 3   | Validity        |   2 |  34 | 15.38194 | 0.0000175 | \*     | 0.0808090 |
| 4   | Target:Validity |   2 |  34 |  4.62210 | 0.0167636 | \*     | 0.0062722 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.2553216 | 0.0000181 | \*     |
| 4   | Target:Validity | 0.9358422 | 0.5883300 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.5731715 | 0.0005955 | \* | 0.5876933 | 0.0005276 | \* |
| 4 | Target:Validity | 0.9397103 | 0.0189345 | \* | 1.0525248 | 0.0167636 | \* |

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
| 2   | Target          |   1 |  17 | 17.475590 | 0.0006276 | \*     | 0.0381266 |
| 3   | Validity        |   2 |  34 | 14.909338 | 0.0000224 | \*     | 0.0648088 |
| 4   | Target:Validity |   2 |  34 |  2.688319 | 0.0824299 |        | 0.0039818 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8958703 | 0.4149167 |        |
| 4   | Target:Validity | 0.9232017 | 0.5276826 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9056907 | 0.0000476 | \* | 1.007493 | 0.0000224 | \* |
| 4 | Target:Validity | 0.9286790 | 0.0870877 |  | 1.037878 | 0.0824299 |  |

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
| 2   | Target          |   1 |  17 | 15.615763 | 0.0010296 | \*     | 0.0451258 |
| 3   | Validity        |   2 |  34 | 13.006215 | 0.0000638 | \*     | 0.0525105 |
| 4   | Target:Validity |   2 |  34 |  2.803482 | 0.0746492 |        | 0.0052877 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9232903 | 0.5280879 |        |
| 4   | Target:Validity | 0.6548639 | 0.0338227 | \*     |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9287555 | 0.0001051 | \* | 1.0379798 | 0.0000638 | \* |
| 4 | Target:Validity | 0.7434192 | 0.0925640 |  | 0.7981317 | 0.0884511 |  |

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
| 2   | Target          |   1 |  17 | 0.3678633 | 0.5521855 |        | 0.0013546 |
| 3   | Validity        |   2 |  34 | 0.0409106 | 0.9599621 |        | 0.0002124 |
| 4   | Target:Validity |   2 |  34 | 0.0723999 | 0.9303018 |        | 0.0002373 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8038110 | 0.1742736 |        |
| 4   | Target:Validity | 0.7291957 | 0.0799379 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8359883 | 0.9381309 |  | 0.9164776 | 0.9500956 |  |
| 4 | Target:Validity | 0.7869032 | 0.8905702 |  | 0.8533705 | 0.9051267 |  |

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

|     | Effect   | DFn | DFd |        F |       p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|--------:|:-------|----------:|
| 2   | Validity |   2 |  34 | 16.82754 | 8.3e-06 | \*     | 0.0956603 |

</td>

<td>

|     | Effect   |         W |       p | p\<.05 |
|:----|:---------|----------:|--------:|:-------|
| 2   | Validity | 0.7423807 | 0.09226 |        |

</td>

<td>

|     | Effect   |       GGe |  p\[GG\] | p\[GG\]\<.05 |      HFe | p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|---------:|:-------------|---------:|--------:|:-------------|
| 2   | Validity | 0.7951532 | 5.18e-05 | \*           | 0.863921 | 2.8e-05 | \*           |

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
| 2   | Validity |   2 |  34 | 11.57017 | 0.0001469 | \*     | 0.0873015 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8742539 | 0.3412721 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.8882998 | 0.0002946 | \*           | 0.9846287 | 0.0001617 | \*           |

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
| 2   | Validity |   2 |  34 | 5.876612 | 0.0064265 | \*     | 0.0337791 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9770354 | 0.8303908 |        |

</td>

<td>

|     | Effect   |      GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|---------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.977551 | 0.0068475 | \*           | 1.103093 | 0.0064265 | \*           |

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

|     | Effect   | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  34 | 0.0729186 | 0.9298215 |        | 0.0004132 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9481306 | 0.6530481 |        |

</td>

<td>

|     | Effect   |       GGe |  p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|---------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9506883 | 0.922249 |              | 1.067143 | 0.9298215 |              |

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
| 2   | Validity |   2 |  34 | 9.906292 | 0.0004075 | \*     | 0.0739924 |

</td>

<td>

|     | Effect   |         W |       p | p\<.05 |
|:----|:---------|----------:|--------:|:-------|
| 2   | Validity | 0.3094146 | 8.4e-05 | \*     |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.5915111 | 0.0035878 | \*           | 0.6099268 | 0.0032496 | \*           |

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

|     | Effect   | DFn | DFd |        F |        p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|---------:|:-------|----------:|
| 2   | Validity |   2 |  34 | 12.98247 | 6.47e-05 | \*     | 0.0445506 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8859325 | 0.3794942 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |  p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|---------:|:-------------|
| 2   | Validity | 0.8976117 | 0.0001323 | \*           | 0.9968585 | 6.61e-05 | \*           |

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

|     | Effect   | DFn | DFd |        F |        p | p\<.05 |      ges |
|:----|:---------|----:|----:|---------:|---------:|:-------|---------:|
| 2   | Validity |   2 |  34 | 15.14262 | 1.98e-05 | \*     | 0.089059 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7150573 | 0.0683482 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |  p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|---------:|:-------------|
| 2   | Validity | 0.7782448 | 0.0001198 | \*           | 0.8423219 | 7.12e-05 | \*           |

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

|     | Effect   | DFn | DFd |        F |        p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|---------:|:-------|----------:|
| 2   | Validity |   2 |  34 | 0.040869 | 0.960002 |        | 0.0004979 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.6076268 | 0.0185821 | \*     |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7181982 | 0.9148533 |              | 0.7663757 | 0.9253708 |              |

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
| 2 | targetContrast | 1 | 17 | 20.249922 | 0.0003158 | \* | 0.1709387 |
| 3 | nontargetContrast | 1 | 17 | 17.941326 | 0.0005570 | \* | 0.0219067 |
| 4 | Validity | 2 | 34 | 14.752842 | 0.0000244 | \* | 0.0494894 |
| 5 | targetContrast:nontargetContrast | 1 | 17 | 18.421509 | 0.0004934 | \* | 0.0267091 |
| 6 | targetContrast:Validity | 2 | 34 | 14.274836 | 0.0000316 | \* | 0.0265726 |
| 7 | nontargetContrast:Validity | 2 | 34 | 2.194134 | 0.1269892 |  | 0.0017693 |
| 8 | targetContrast:nontargetContrast:Validity | 2 | 34 | 1.776929 | 0.1845075 |  | 0.0012854 |

</td>

<td>

|     | Effect                                    |         W |         p | p\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------|
| 4   | Validity                                  | 0.8787112 | 0.3554426 |        |
| 6   | targetContrast:Validity                   | 0.7628861 | 0.1147301 |        |
| 7   | nontargetContrast:Validity                | 0.9904470 | 0.9260833 |        |
| 8   | targetContrast:nontargetContrast:Validity | 0.8088449 | 0.1831985 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.8918309 | 0.0000573 | \* | 0.9892628 | 0.0000266 | \* |
| 6 | targetContrast:Validity | 0.8083330 | 0.0001374 | \* | 0.8808230 | 0.0000787 | \* |
| 7 | nontargetContrast:Validity | 0.9905374 | 0.1275533 |  | 1.1205645 | 0.1269892 |  |
| 8 | targetContrast:nontargetContrast:Validity | 0.8395212 | 0.1909752 |  | 0.9210509 | 0.1877587 |  |

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
| 2 | targetContrast | 1 | 17 | 14.202628 | 0.0015317 | \* | 0.1216584 |
| 3 | nontargetContrast | 1 | 17 | 19.281468 | 0.0003988 | \* | 0.0173362 |
| 4 | Validity | 2 | 34 | 15.347480 | 0.0000178 | \* | 0.0425953 |
| 5 | targetContrast:nontargetContrast | 1 | 17 | 6.539822 | 0.0204006 | \* | 0.0055106 |
| 6 | targetContrast:Validity | 2 | 34 | 7.095616 | 0.0026588 | \* | 0.0100876 |
| 7 | nontargetContrast:Validity | 2 | 34 | 4.133627 | 0.0247214 | \* | 0.0052819 |
| 8 | targetContrast:nontargetContrast:Validity | 2 | 34 | 2.190760 | 0.1273692 |  | 0.0015765 |

</td>

<td>

|     | Effect                                    |         W |         p | p\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------|
| 4   | Validity                                  | 0.5784128 | 0.0125286 | \*     |
| 6   | targetContrast:Validity                   | 0.8732743 | 0.3382248 |        |
| 7   | nontargetContrast:Validity                | 0.8255836 | 0.2158183 |        |
| 8   | targetContrast:nontargetContrast:Validity | 0.8341379 | 0.2343705 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.7034391 | 0.0002041 | \* | 0.7478877 | 0.0001414 | \* |
| 6 | targetContrast:Validity | 0.8875275 | 0.0039872 | \* | 0.9836157 | 0.0028201 | \* |
| 7 | nontargetContrast:Validity | 0.8514867 | 0.0318423 | \* | 0.9365716 | 0.0275395 | \* |
| 8 | targetContrast:nontargetContrast:Validity | 0.8577344 | 0.1359889 |  | 0.9446949 | 0.1306840 |  |

</td>

</tr>

</tbody>

</table>

# paired t-tests

## full acc

<img src="tazoot_AccRT_files/figure-gfm/vi_acc-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_acc-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/ni_acc-1.png" width="90%" />

## accuracy by target (T1, T2)

### T1

<img src="tazoot_AccRT_files/figure-gfm/vi_acc T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_acc T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/ni_acc T1-1.png" width="90%" />

### T2

<img src="tazoot_AccRT_files/figure-gfm/vi_acc T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_acc T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/ni_acc T2-1.png" width="90%" />

## accuracy by target and nontarget contrast

### PresentPresent

<img src="tazoot_AccRT_files/figure-gfm/vi_accPP T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accPP T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/ni_accPP T1-1.png" width="90%" />
\#### T2
<img src="tazoot_AccRT_files/figure-gfm/vi_accPP T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accPP T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/ni_accPP T2-1.png" width="90%" />
\### PresentAbsent
<img src="tazoot_AccRT_files/figure-gfm/vi_accPA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accPA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_accPA T1-1.png" width="90%" />
\##### T2
<img src="tazoot_AccRT_files/figure-gfm/vi_accPA T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accPA T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_accPA T2-1.png" width="90%" />

\#AbsentPresent
<img src="tazoot_AccRT_files/figure-gfm/vi_accAP T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accAP T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_accAP T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_files/figure-gfm/vi_accAP T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accAP T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_accAP T2-1.png" width="90%" />

\#AbsentAbsent
<img src="tazoot_AccRT_files/figure-gfm/vi_accAA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accAA T1 -1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_accAA T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_files/figure-gfm/vi_accAA T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accAA T2 -1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_accAA T2-1.png" width="90%" />
\## accuracy by target \#target present
<img src="tazoot_AccRT_files/figure-gfm/vi_accTP T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accTP T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_accTP T1-1.png" width="90%" />
\# T2
<img src="tazoot_AccRT_files/figure-gfm/vi_accTP T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accTP T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_accTP T2-1.png" width="90%" />
\#target absent
<img src="tazoot_AccRT_files/figure-gfm/vi_accTA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accTA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_accTA T1 -1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_files/figure-gfm/vi_accTA T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accTA T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_accTA T2-1.png" width="90%" />

## accuracy by nontarget

\#nontarget present
<img src="tazoot_AccRT_files/figure-gfm/vi_accNP T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accNP T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_accNP T1-1.png" width="90%" />
\# T2
<img src="tazoot_AccRT_files/figure-gfm/vi_accNP T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accNP T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_accNP T2-1.png" width="90%" />
\#nontarget absent
<img src="tazoot_AccRT_files/figure-gfm/vi_accNA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accNA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_accNA T1 -1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_files/figure-gfm/vi_accNA T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accNA T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_accNA T2-1.png" width="90%" />

## RT by target and nontarget

# PresentPresent

<img src="tazoot_AccRT_files/figure-gfm/vi_RT PP T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_RTPP T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/ni_RTPP T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_files/figure-gfm/vi_RTPP T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_RTPP T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/ni_RTPP T2-1.png" width="90%" />

# PresentAbsent

<img src="tazoot_AccRT_files/figure-gfm/vi_RTPA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_RTPA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_RTPA T1-1.png" width="90%" />
\# T2
<img src="tazoot_AccRT_files/figure-gfm/vi_RTPA T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_RTPA T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_RTPA T2-1.png" width="90%" />

\#AbsentPresent
<img src="tazoot_AccRT_files/figure-gfm/vi_RTAP T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_RTAP T1 -1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_RTAP T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_files/figure-gfm/vi_RTAP T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_RTAP T2 -1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_RTAP T2-1.png" width="90%" />

\#AbsentAbsent
<img src="tazoot_AccRT_files/figure-gfm/vi_aRTAA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_RTAA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_RTAA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vi_aRTAA T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_RTAA T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_RTAA T2-1.png" width="90%" />
\## accuracy by target \#target present
<img src="tazoot_AccRT_files/figure-gfm/vi_RTTP T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_RTTP T1 -1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_RTTP T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_files/figure-gfm/vi_RTTP T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_RTTP T2 -1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_RTTP T2-1.png" width="90%" />
\#target absent
<img src="tazoot_AccRT_files/figure-gfm/vi_RTTA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_RTTA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_RTTA T1-1.png" width="90%" />

\#T2
<img src="tazoot_AccRT_files/figure-gfm/vi_RTTA T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_RTTA T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_RTTA T2-1.png" width="90%" />

## accuracy by nontarget

\#nontarget present
<img src="tazoot_AccRT_files/figure-gfm/vi_RTNP T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_RTNP T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_RTNP T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_files/figure-gfm/vi_RTNP T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_RTNP T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_RTNP T2-1.png" width="90%" />
\#nontarget absent
<img src="tazoot_AccRT_files/figure-gfm/vi_RTNA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_RTNA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_RTNA T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_files/figure-gfm/vi_RTNA T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_RTNA T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_RTNA T2-1.png" width="90%" />

# Look up how to make a bar plot with ggplot

ggplot(data=d, aes(x=targetContrast,y=Acc)) + geom_bar(position=“dodge”,
stat=“summary”, fun.y=“mean”)

# Facet grid

\`\`\`

Null hypothesis: There is no effect of target contrast on accuracy.

There was a main effect of target contrast on accuracy (F(1,14)=84.1,
p\<0.001, GES=0.27).

## Including Plots

You can also embed plots, for example:

![](tazoot_AccRT_files/figure-gfm/pressure-1.png)<!-- -->

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.
