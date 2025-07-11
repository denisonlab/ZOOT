tazoot_AccRT_topHalf
================
Jenny Motzer
2025-07-11

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
    ##                                              Effect DFn DFd            F
    ## 2                                    targetContrast   1   8 135.25031276
    ## 3                                 nontargetContrast   1   8  15.84764832
    ## 4                                            Target   1   8  22.74740872
    ## 5                                          Validity   2  16   6.55667568
    ## 6                  targetContrast:nontargetContrast   1   8   3.38042768
    ## 7                             targetContrast:Target   1   8  14.36318588
    ## 8                          nontargetContrast:Target   1   8   0.04312507
    ## 9                           targetContrast:Validity   2  16  14.90012854
    ## 10                       nontargetContrast:Validity   2  16   0.53885156
    ## 11                                  Target:Validity   2  16   6.33822308
    ## 12          targetContrast:nontargetContrast:Target   1   8   0.02063996
    ## 13        targetContrast:nontargetContrast:Validity   2  16   0.17544454
    ## 14                   targetContrast:Target:Validity   2  16   5.62801463
    ## 15                nontargetContrast:Target:Validity   2  16   1.77362239
    ## 16 targetContrast:nontargetContrast:Target:Validity   2  16   2.90154686
    ##               p p<.05          ges
    ## 2  2.721293e-06     * 0.5201749472
    ## 3  4.056528e-03     * 0.0972269267
    ## 4  1.409651e-03     * 0.0923792311
    ## 5  8.321895e-03     * 0.0818382141
    ## 6  1.032678e-01       0.0314116505
    ## 7  5.312742e-03     * 0.1041527395
    ## 8  8.406789e-01       0.0003015750
    ## 9  2.218281e-04     * 0.1002291743
    ## 10 5.936414e-01       0.0054320725
    ## 11 9.391982e-03     * 0.0368615230
    ## 12 8.893171e-01       0.0001412032
    ## 13 8.406765e-01       0.0017284527
    ## 14 1.410130e-02     * 0.0305320259
    ## 15 2.015002e-01       0.0125228574
    ## 16 8.410366e-02       0.0131482593
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##                                              Effect         W         p p<.05
    ## 5                                          Validity 0.7867014 0.4318518      
    ## 9                           targetContrast:Validity 0.8158639 0.4905259      
    ## 10                       nontargetContrast:Validity 0.5640615 0.1347853      
    ## 11                                  Target:Validity 0.6648308 0.2396012      
    ## 13        targetContrast:nontargetContrast:Validity 0.6531552 0.2251943      
    ## 14                   targetContrast:Target:Validity 0.9705914 0.9007981      
    ## 15                nontargetContrast:Target:Validity 0.8113272 0.4810454      
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.5493811 0.1229018      
    ## 
    ## $`Sphericity Corrections`
    ##                                              Effect       GGe       p[GG]
    ## 5                                          Validity 0.8241994 0.013523551
    ## 9                           targetContrast:Validity 0.8444975 0.000571909
    ## 10                       nontargetContrast:Validity 0.6964086 0.535632857
    ## 11                                  Target:Validity 0.7489687 0.018322101
    ## 13        targetContrast:nontargetContrast:Validity 0.7424761 0.777763403
    ## 14                   targetContrast:Target:Validity 0.9714315 0.015054763
    ## 15                nontargetContrast:Target:Validity 0.8412744 0.208456139
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.6893610 0.108916966
    ##    p[GG]<.05       HFe        p[HF] p[HF]<.05
    ## 5          * 1.0104216 0.0083218953         *
    ## 9          * 1.0458679 0.0002218281         *
    ## 10           0.7972653 0.5571483793          
    ## 11         * 0.8829073 0.0128095701         *
    ## 13           0.8721785 0.8126620760          
    ## 14         * 1.2783075 0.0141013004         *
    ## 15           1.0402089 0.2015001848          
    ## 16           0.7859885 0.1005345959

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
| 2 | nontargetContrast | 1 | 8 | 0.9871361 | 0.3495404 |  | 0.0159818 |
| 3 | Target | 1 | 8 | 25.5331113 | 0.0009855 | \* | 0.2439148 |
| 4 | Validity | 2 | 16 | 13.2778461 | 0.0003993 | \* | 0.2273258 |
| 5 | nontargetContrast:Target | 1 | 8 | 0.0015072 | 0.9699835 |  | 0.0000223 |
| 6 | nontargetContrast:Validity | 2 | 16 | 0.4579195 | 0.6406363 |  | 0.0096639 |
| 7 | Target:Validity | 2 | 16 | 5.8862548 | 0.0121350 | \* | 0.0587227 |
| 8 | nontargetContrast:Target:Validity | 2 | 16 | 0.1881838 | 0.8302698 |  | 0.0019123 |

</td>

<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.5815206 | 0.1499609 |        |
| 6   | nontargetContrast:Validity        | 0.4658778 | 0.0690164 |        |
| 7   | Target:Validity                   | 0.8237115 | 0.5072394 |        |
| 8   | nontargetContrast:Target:Validity | 0.2563012 | 0.0085237 | \*     |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.7049803 | 0.0020581 | \* | 0.8110456 | 0.0011378 | \* |
| 6 | nontargetContrast:Validity | 0.6518386 | 0.5640087 |  | 0.7267492 | 0.5833045 |  |
| 7 | Target:Validity | 0.8501316 | 0.0174643 | \* | 1.0557877 | 0.0121350 | \* |
| 8 | nontargetContrast:Target:Validity | 0.5734935 | 0.7079764 |  | 0.6072427 | 0.7212323 |  |

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
| 2   | nontargetContrast          |   1 |   8 |  0.2732417 | 0.6153289 |        | 0.0107172 |
| 3   | Validity                   |   2 |  16 | 13.9564002 | 0.0003106 | \*     | 0.2857797 |
| 4   | nontargetContrast:Validity |   2 |  16 |  0.2188648 | 0.8057961 |        | 0.0085166 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.8200430 | 0.4993767 |        |
| 4   | nontargetContrast:Validity | 0.2994912 | 0.0147009 | \*     |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8474885 | 0.0007492 | \* | 1.0511297 | 0.0003106 | \* |
| 4 | nontargetContrast:Validity | 0.5880593 | 0.6894524 |  | 0.6290458 | 0.7047536 |  |

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

|     | Effect                     | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |   8 | 2.375758 | 0.1618013 |        | 0.0278462 |
| 3   | Validity                   |   2 |  16 | 6.116557 | 0.0106387 | \*     | 0.2046699 |
| 4   | nontargetContrast:Validity |   2 |  16 | 1.354497 | 0.2861253 |        | 0.0183627 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.7319648 | 0.3355179 |        |
| 4   | nontargetContrast:Validity | 0.7731586 | 0.4063873 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.7886216 | 0.0182347 | \* | 0.9493734 | 0.0120961 | \* |
| 4 | nontargetContrast:Validity | 0.8151013 | 0.2860018 |  | 0.9946803 | 0.2861472 |  |

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
| 2 | nontargetContrast | 1 | 8 | 24.4569620 | 0.0011274 | \* | 0.2844880 |
| 3 | Target | 1 | 8 | 0.0595903 | 0.8132886 |  | 0.0007403 |
| 4 | Validity | 2 | 16 | 0.3101538 | 0.7376450 |  | 0.0058002 |
| 5 | nontargetContrast:Target | 1 | 8 | 0.1109185 | 0.7476610 |  | 0.0013153 |
| 6 | nontargetContrast:Validity | 2 | 16 | 0.1076980 | 0.8985441 |  | 0.0018589 |
| 7 | Target:Validity | 2 | 16 | 6.1729639 | 0.0103047 | \* | 0.0784286 |
| 8 | nontargetContrast:Target:Validity | 2 | 16 | 5.0763025 | 0.0196264 | \* | 0.0706916 |

</td>

<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.9731503 | 0.9091378 |        |
| 6   | nontargetContrast:Validity        | 0.8278074 | 0.5161221 |        |
| 7   | Target:Validity                   | 0.6945775 | 0.2792689 |        |
| 8   | nontargetContrast:Target:Validity | 0.8565017 | 0.5814988 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.9738524 | 0.7321998 |  | 1.2829300 | 0.7376450 |  |
| 6 | nontargetContrast:Validity | 0.8531021 | 0.8696621 |  | 1.0610320 | 0.8985441 |  |
| 7 | Target:Validity | 0.7660355 | 0.0188402 | \* | 0.9113148 | 0.0129389 | \* |
| 8 | nontargetContrast:Target:Validity | 0.8745094 | 0.0252695 | \* | 1.0991210 | 0.0196264 | \* |

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
| 2   | nontargetContrast          |   1 |   8 | 15.625768 | 0.0042186 | \*     | 0.2662560 |
| 3   | Validity                   |   2 |  16 |  2.257802 | 0.1368628 |        | 0.0733600 |
| 4   | nontargetContrast:Validity |   2 |  16 |  1.590795 | 0.2343597 |        | 0.0539329 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.8916507 | 0.6693936 |        |
| 4   | nontargetContrast:Validity | 0.6070341 | 0.1742793 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9022426 | 0.1434104 |  | 1.1492481 | 0.1368628 |  |
| 4 | nontargetContrast:Validity | 0.7178927 | 0.2414933 |  | 0.8319402 | 0.2390433 |  |

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
| 2   | nontargetContrast          |   1 |   8 | 13.210454 | 0.0066405 | \*     | 0.3022026 |
| 3   | Validity                   |   2 |  16 |  3.374069 | 0.0598954 |        | 0.0926350 |
| 4   | nontargetContrast:Validity |   2 |  16 |  3.382215 | 0.0595533 |        | 0.0890569 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.7286698 | 0.3302612 |        |
| 4   | nontargetContrast:Validity | 0.6097459 | 0.1770195 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.7865777 | 0.0757147 |  | 0.9459073 | 0.0635514 |  |
| 4 | nontargetContrast:Validity | 0.7192930 | 0.0811720 |  | 0.8342160 | 0.0714909 |  |

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

|     | Effect                         | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:-------------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | targetContrast                 |   1 |   8 | 27.380172 | 0.0007904 | \*     | 0.3450388 |
| 3   | Target                         |   1 |   8 |  8.736462 | 0.0182644 | \*     | 0.0607255 |
| 4   | Validity                       |   2 |  16 |  3.237430 | 0.0659757 |        | 0.0809442 |
| 5   | targetContrast:Target          |   1 |   8 |  6.436390 | 0.0348730 | \*     | 0.0812671 |
| 6   | targetContrast:Validity        |   2 |  16 |  5.038724 | 0.0200835 | \*     | 0.0863838 |
| 7   | Target:Validity                |   2 |  16 |  3.616099 | 0.0506101 |        | 0.0475518 |
| 8   | targetContrast:Target:Validity |   2 |  16 |  5.045296 | 0.0200027 | \*     | 0.0427888 |

</td>

<td>

|     | Effect                         |         W |         p | p\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------|
| 4   | Validity                       | 0.6974519 | 0.2833348 |        |
| 6   | targetContrast:Validity        | 0.5561780 | 0.1283064 |        |
| 7   | Target:Validity                | 0.7948132 | 0.4476388 |        |
| 8   | targetContrast:Target:Validity | 0.8954588 | 0.6794534 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.7677260 | 0.0836531 |  | 0.9141449 | 0.0720167 |  |
| 6 | targetContrast:Validity | 0.6926062 | 0.0372040 | \* | 0.7911751 | 0.0304917 | \* |
| 7 | Target:Validity | 0.8297469 | 0.0624171 |  | 1.0200639 | 0.0506101 |  |
| 8 | targetContrast:Target:Validity | 0.9053533 | 0.0241615 | \* | 1.1549266 | 0.0200027 | \* |

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
| 2   | targetContrast          |   1 |   8 | 41.818837 | 0.0001948 | \*     | 0.4691581 |
| 3   | Validity                |   2 |  16 |  1.481856 | 0.2567871 |        | 0.0638343 |
| 4   | targetContrast:Validity |   2 |  16 |  7.249817 | 0.0057359 | \*     | 0.1794352 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.5471881 | 0.1211932 |        |
| 4   | targetContrast:Validity | 0.7148569 | 0.3088638 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.6883203 | 0.2604781 |  | 0.7843275 | 0.2599940 |  |
| 4 | targetContrast:Validity | 0.7781235 | 0.0114028 | \* | 0.9316172 | 0.0070815 | \* |

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
| 2   | targetContrast          |   1 |   8 | 4.4838710 | 0.0670841 |        | 0.1837348 |
| 3   | Validity                |   2 |  16 | 7.0960725 | 0.0062203 | \*     | 0.1931797 |
| 4   | targetContrast:Validity |   2 |  16 | 0.9967149 | 0.3908843 |        | 0.0233034 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.7970525 | 0.4520685 |        |
| 4   | targetContrast:Validity | 0.6400157 | 0.2097332 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8312915 | 0.0103520 | \* | 1.0227547 | 0.0062203 | \* |
| 4 | targetContrast:Validity | 0.7353026 | 0.3729152 |  | 0.8603743 | 0.3823704 |  |

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
| 2 | targetContrast | 1 | 8 | 183.329499 | 0.0000009 | \* | 0.7157173 |
| 3 | Target | 1 | 8 | 9.036701 | 0.0169135 | \* | 0.1603820 |
| 4 | Validity | 2 | 16 | 7.114028 | 0.0061614 | \* | 0.0991705 |
| 5 | targetContrast:Target | 1 | 8 | 10.285714 | 0.0124779 | \* | 0.1545507 |
| 6 | targetContrast:Validity | 2 | 16 | 11.255729 | 0.0008876 | \* | 0.1358867 |
| 7 | Target:Validity | 2 | 16 | 4.556024 | 0.0271583 | \* | 0.0506899 |
| 8 | targetContrast:Target:Validity | 2 | 16 | 3.379638 | 0.0596612 |  | 0.0431459 |

</td>

<td>

|     | Effect                         |         W |         p | p\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------|
| 4   | Validity                       | 0.9962825 | 0.9870492 |        |
| 6   | targetContrast:Validity        | 0.9261164 | 0.7644154 |        |
| 7   | Target:Validity                | 0.5449626 | 0.1194767 |        |
| 8   | targetContrast:Target:Validity | 0.6293286 | 0.1977294 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.9962963 | 0.0062305 | \* | 1.3261406 | 0.0061614 | \* |
| 6 | targetContrast:Validity | 0.9311996 | 0.0012333 | \* | 1.2025540 | 0.0008876 | \* |
| 7 | Target:Validity | 0.6872675 | 0.0469347 | \* | 0.7826482 | 0.0396822 | \* |
| 8 | targetContrast:Target:Validity | 0.7295695 | 0.0803699 |  | 0.8509774 | 0.0702918 |  |

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
| 2   | targetContrast          |   1 |   8 | 93.730970 | 0.0000108 | \*     | 0.7405747 |
| 3   | Validity                |   2 |  16 |  7.696372 | 0.0045533 | \*     | 0.1675347 |
| 4   | targetContrast:Validity |   2 |  16 |  8.829289 | 0.0026073 | \*     | 0.1962221 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.8510545 | 0.5686575 |        |
| 4   | targetContrast:Validity | 0.8546762 | 0.5771725 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8703633 | 0.0069789 | \* | 1.091703 | 0.0045533 | \* |
| 4 | targetContrast:Validity | 0.8731155 | 0.0042214 | \* | 1.096625 | 0.0026073 | \* |

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
| 2   | targetContrast          |   1 |   8 | 68.118993 | 0.0000349 | \*     | 0.6989434 |
| 3   | Validity                |   2 |  16 |  2.376679 | 0.1248110 |        | 0.0660645 |
| 4   | targetContrast:Validity |   2 |  16 |  3.765918 | 0.0456787 | \*     | 0.0907028 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.9257966 | 0.7634920 |        |
| 4   | targetContrast:Validity | 0.7936741 | 0.4453975 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9309224 | 0.1295896 |  | 1.202039 | 0.1248110 |  |
| 4 | targetContrast:Validity | 0.8289634 | 0.0571914 |  | 1.018700 | 0.0456787 | \* |

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
| 2   | Target          |   1 |   8 | 15.142250 | 0.0046007 | \*     | 0.2182317 |
| 3   | Validity        |   2 |  16 |  6.061983 | 0.0109736 | \*     | 0.2482217 |
| 4   | Target:Validity |   2 |  16 |  2.135792 | 0.1506116 |        | 0.0359968 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.2719513 | 0.0104886 | \*     |
| 4   | Target:Validity | 0.6316563 | 0.2003009 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.5786874 | 0.0319915 | \* | 0.6149959 | 0.0291397 | \* |
| 4 | Target:Validity | 0.7308106 | 0.1678740 |  | 0.8530088 | 0.1599568 |  |

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

|     | Effect          | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Target          |   1 |   8 | 9.680427 | 0.0144163 | \*     | 0.2752809 |
| 3   | Validity        |   2 |  16 | 9.295095 | 0.0020957 | \*     | 0.2122636 |
| 4   | Target:Validity |   2 |  16 | 3.972609 | 0.0397383 | \*     | 0.0907347 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9718332 | 0.9048386 |        |
| 4   | Target:Validity | 0.5819645 | 0.1503619 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9726049 | 0.0023375 | \* | 1.2805470 | 0.0020957 | \* |
| 4 | Target:Validity | 0.7052010 | 0.0605987 |  | 0.8114013 | 0.0520205 |  |

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
| 2   | Target          |   1 |   8 | 0.0839131 | 0.7794288 |        | 0.0020423 |
| 3   | Validity        |   2 |  16 | 0.1616456 | 0.8521146 |        | 0.0057513 |
| 4   | Target:Validity |   2 |  16 | 5.6541625 | 0.0138867 | \*     | 0.1403644 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9145968 | 0.7316509 |        |
| 4   | Target:Validity | 0.7820933 | 0.4230629 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9213166 | 0.8358030 |  | 1.184248 | 0.8521146 |  |
| 4 | Target:Validity | 0.8210809 | 0.0210109 | \* | 1.005016 | 0.0138867 | \* |

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
| 2   | Target          |   1 |   8 | 0.1509434 | 0.7077706 |        | 0.0028169 |
| 3   | Validity        |   2 |  16 | 2.3803681 | 0.1244566 |        | 0.1204969 |
| 4   | Target:Validity |   2 |  16 | 0.8524590 | 0.4448448 |        | 0.0180305 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.5030298 | 0.0902772 |        |
| 4   | Target:Validity | 0.9795754 | 0.9303203 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.6680160 | 0.1487034 |  | 0.752126 | 0.1423032 |  |
| 4 | Target:Validity | 0.9799842 | 0.4431066 |  | 1.294672 | 0.4448448 |  |

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
| 2   | Validity |   2 |  16 | 4.712329 | 0.0245991 | \*     | 0.2722426 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.4175039 | 0.0470232 | \*     |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.6319131 | 0.0483477 | \*           | 0.6958279 | 0.0429546 | \*           |

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

|     | Effect   | DFn | DFd |        F |        p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|---------:|:-------|----------:|
| 2   | Validity |   2 |  16 | 8.491803 | 0.003066 | \*     | 0.3116727 |

</td>

<td>

|     | Effect   |        W |         p | p\<.05 |
|:----|:---------|---------:|----------:|:-------|
| 2   | Validity | 0.854273 | 0.5762202 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |  p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|---------:|:-------------|
| 2   | Validity | 0.8728083 | 0.0048777 | \*           | 1.096075 | 0.003066 | \*           |

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
| 2   | Validity |   2 |  16 | 1.952746 | 0.1742515 |        | 0.1213207 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7631071 | 0.3881943 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.8084774 | 0.1848249 |              | 0.9832763 | 0.1751748 |              |

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
| 2   | Validity |   2 |  16 | 0.8085106 | 0.4629137 |        | 0.0595611 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7700317 | 0.4006638 |        |

</td>

<td>

|     | Effect   |       GGe |  p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|---------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.8130291 | 0.442911 |              | 0.9911075 | 0.4620555 |              |

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
| 2   | Validity |   2 |  16 | 6.332177 | 0.0094237 | \*     | 0.2610366 |

</td>

<td>

|     | Effect   |        W |         p | p\<.05 |
|:----|:---------|---------:|----------:|:-------|
| 2   | Validity | 0.208817 | 0.0041608 | \*     |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.5582903 | 0.0307328 | \*           | 0.5846821 | 0.0286092 | \*           |

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
| 2   | Validity |   2 |  16 | 2.968059 | 0.0801091 |        | 0.1425681 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8787074 | 0.6359969 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.8918279 | 0.0880255 |              | 1.130319 | 0.0801091 |              |

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
| 2   | Validity |   2 |  16 | 3.349693 | 0.0609322 |        | 0.1651543 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.6637341 | 0.2382206 |        |

</td>

<td>

|     | Effect   |      GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|---------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.748354 | 0.0800602 |              | 0.8818897 | 0.0692482 |              |

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

|     | Effect   | DFn | DFd |   F |         p | p\<.05 | ges |
|:----|:---------|----:|----:|----:|----------:|:-------|----:|
| 2   | Validity |   2 |  16 |   8 | 0.0039062 | \*     | 0.4 |

</td>

<td>

|     | Effect   |   W |   p | p\<.05 |
|:----|:---------|----:|----:|:-------|
| 2   | Validity |   0 |   0 | \*     |

</td>

<td>

|     | Effect   | GGe |   p\[GG\] | p\[GG\]\<.05 | HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----:|----------:|:-------------|----:|----------:|:-------------|
| 2   | Validity | 0.5 | 0.0222039 | \*           | 0.5 | 0.0222039 | \*           |

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
| 2 | targetContrast | 1 | 8 | 274.9090909 | 0.0000002 | \* | 0.6035737 |
| 3 | nontargetContrast | 1 | 8 | 4.5865736 | 0.0646123 |  | 0.0714844 |
| 4 | Validity | 2 | 16 | 6.6152748 | 0.0080587 | \* | 0.0999928 |
| 5 | targetContrast:nontargetContrast | 1 | 8 | 1.2042399 | 0.3044049 |  | 0.0220504 |
| 6 | targetContrast:Validity | 2 | 16 | 15.4346667 | 0.0001844 | \* | 0.1722915 |
| 7 | nontargetContrast:Validity | 2 | 16 | 0.0767732 | 0.9264390 |  | 0.0017286 |
| 8 | targetContrast:nontargetContrast:Validity | 2 | 16 | 1.2036679 | 0.3258610 |  | 0.0187014 |

</td>

<td>

|     | Effect                                    |         W |         p | p\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------|
| 4   | Validity                                  | 0.8288176 | 0.5183300 |        |
| 6   | targetContrast:Validity                   | 0.9429049 | 0.8140247 |        |
| 7   | nontargetContrast:Validity                | 0.4420463 | 0.0574298 |        |
| 8   | targetContrast:nontargetContrast:Validity | 0.3612924 | 0.0283469 | \*     |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.8538380 | 0.0121119 | \* | 1.0623327 | 0.0080587 | \* |
| 6 | targetContrast:Validity | 0.9459887 | 0.0002585 | \* | 1.2301687 | 0.0001844 | \* |
| 7 | nontargetContrast:Validity | 0.6418676 | 0.8457598 |  | 0.7112299 | 0.8670381 |  |
| 8 | targetContrast:nontargetContrast:Validity | 0.6102370 | 0.3124505 |  | 0.6626028 | 0.3153238 |  |

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
| 2 | targetContrast | 1 | 8 | 19.4026653 | 0.0022720 | \* | 0.3968332 |
| 3 | nontargetContrast | 1 | 8 | 18.3114187 | 0.0026905 | \* | 0.1380890 |
| 4 | Validity | 2 | 16 | 6.3437758 | 0.0093629 | \* | 0.1340888 |
| 5 | targetContrast:nontargetContrast | 1 | 8 | 3.9294306 | 0.0827563 |  | 0.0471184 |
| 6 | targetContrast:Validity | 2 | 16 | 2.6669083 | 0.1000948 |  | 0.0319471 |
| 7 | nontargetContrast:Validity | 2 | 16 | 5.4388489 | 0.0157697 | \* | 0.0437714 |
| 8 | targetContrast:nontargetContrast:Validity | 2 | 16 | 0.6843854 | 0.5185698 |  | 0.0082468 |

</td>

<td>

|     | Effect                                    |         W |         p | p\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------|
| 4   | Validity                                  | 0.8848975 | 0.6518165 |        |
| 6   | targetContrast:Validity                   | 0.7685448 | 0.3979624 |        |
| 7   | nontargetContrast:Validity                | 0.9097355 | 0.7181299 |        |
| 8   | targetContrast:nontargetContrast:Validity | 0.5079414 | 0.0934002 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.8967785 | 0.0123110 | \* | 1.1393010 | 0.0093629 | \* |
| 6 | targetContrast:Validity | 0.8120474 | 0.1142283 |  | 0.9894166 | 0.1008436 |  |
| 7 | nontargetContrast:Validity | 0.9172086 | 0.0189170 | \* | 1.1766735 | 0.0157697 | \* |
| 8 | targetContrast:nontargetContrast:Validity | 0.6702150 | 0.4684224 |  | 0.7555945 | 0.4833847 |  |

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
    ## 2                                    targetContrast   1   8 2.383230e+01
    ## 3                                 nontargetContrast   1   8 5.217258e+00
    ## 4                                            Target   1   8 1.013380e+01
    ## 5                                          Validity   2  16 6.390411e+00
    ## 6                  targetContrast:nontargetContrast   1   8 6.138840e+00
    ## 7                             targetContrast:Target   1   8 6.273564e+00
    ## 8                          nontargetContrast:Target   1   8 1.094866e-04
    ## 9                           targetContrast:Validity   2  16 5.611541e+00
    ## 10                       nontargetContrast:Validity   2  16 4.636813e+00
    ## 11                                  Target:Validity   2  16 8.489020e-01
    ## 12          targetContrast:nontargetContrast:Target   1   8 7.532719e-01
    ## 13        targetContrast:nontargetContrast:Validity   2  16 1.112512e+00
    ## 14                   targetContrast:Target:Validity   2  16 1.077453e+00
    ## 15                nontargetContrast:Target:Validity   2  16 1.884546e+00
    ## 16 targetContrast:nontargetContrast:Target:Validity   2  16 1.523681e+00
    ##              p p<.05          ges
    ## 2  0.001221518     * 1.901256e-01
    ## 3  0.051736579       1.468788e-02
    ## 4  0.012931864     * 2.072979e-02
    ## 5  0.009122928     * 3.748666e-02
    ## 6  0.038250436     * 1.159237e-02
    ## 7  0.036672012     * 6.972414e-03
    ## 8  0.991907649       3.395593e-08
    ## 9  0.014238408     * 2.170647e-02
    ## 10 0.025799984     * 7.134925e-03
    ## 11 0.446277316       1.460527e-03
    ## 12 0.410720177       1.290608e-03
    ## 13 0.352870326       8.011641e-04
    ## 14 0.363921678       1.403876e-03
    ## 15 0.184105185       3.115818e-03
    ## 16 0.247902578       9.571959e-04
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##                                              Effect         W          p p<.05
    ## 5                                          Validity 0.5416835 0.11697945      
    ## 9                           targetContrast:Validity 0.4512023 0.06170203      
    ## 10                       nontargetContrast:Validity 0.9099721 0.71878378      
    ## 11                                  Target:Validity 0.8438576 0.55200389      
    ## 13        targetContrast:nontargetContrast:Validity 0.6321185 0.20081434      
    ## 14                   targetContrast:Target:Validity 0.6823891 0.26248977      
    ## 15                nontargetContrast:Target:Validity 0.6624495 0.23661093      
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.8911916 0.66818830      
    ## 
    ## $`Sphericity Corrections`
    ##                                              Effect       GGe      p[GG]
    ## 5                                          Validity 0.6857222 0.02126929
    ## 9                           targetContrast:Validity 0.6456621 0.03223452
    ## 10                       nontargetContrast:Validity 0.9174077 0.02988739
    ## 11                                  Target:Validity 0.8649454 0.43360253
    ## 13        targetContrast:nontargetContrast:Validity 0.7310575 0.34094194
    ## 14                   targetContrast:Target:Validity 0.7589494 0.35193914
    ## 15                nontargetContrast:Target:Validity 0.7476353 0.19690121
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.9018691 0.25008782
    ##    p[GG]<.05       HFe      p[HF] p[HF]<.05
    ## 5          * 0.7801850 0.01646042         *
    ## 9          * 0.7171250 0.02729606         *
    ## 10         * 1.1770401 0.02579998         *
    ## 11           1.0820399 0.44627732          
    ## 13           0.8534132 0.34723421          
    ## 14           0.8994838 0.35958959          
    ## 15           0.8807005 0.19024824          
    ## 16           1.1485670 0.24790258

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
| 2 | nontargetContrast | 1 | 8 | 0.0436866 | 0.8396617 |  | 0.0001462 |
| 3 | Target | 1 | 8 | 10.0103772 | 0.0133161 | \* | 0.0388174 |
| 4 | Validity | 2 | 16 | 6.7704071 | 0.0074059 | \* | 0.0840007 |
| 5 | nontargetContrast:Target | 1 | 8 | 0.6839503 | 0.4322036 |  | 0.0010019 |
| 6 | nontargetContrast:Validity | 2 | 16 | 1.9000071 | 0.1818176 |  | 0.0034004 |
| 7 | Target:Validity | 2 | 16 | 1.0102214 | 0.3862213 |  | 0.0033539 |
| 8 | nontargetContrast:Target:Validity | 2 | 16 | 2.4534357 | 0.1176651 |  | 0.0057247 |

</td>

<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.4768202 | 0.0748585 |        |
| 6   | nontargetContrast:Validity        | 0.8734454 | 0.6227664 |        |
| 7   | Target:Validity                   | 0.5136723 | 0.0971408 |        |
| 8   | nontargetContrast:Target:Validity | 0.8640832 | 0.5997143 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.6565213 | 0.0199237 | \* | 0.7340696 | 0.0159021 | \* |
| 6 | nontargetContrast:Validity | 0.8876623 | 0.1877063 |  | 1.1227831 | 0.1818176 |  |
| 7 | Target:Validity | 0.6727991 | 0.3636300 |  | 0.7596764 | 0.3709585 |  |
| 8 | nontargetContrast:Target:Validity | 0.8803461 | 0.1262000 |  | 1.1095967 | 0.1176651 |  |

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

|     | Effect                     | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |   8 | 0.110239 | 0.7484039 |        | 0.0003214 |
| 3   | Validity                   |   2 |  16 | 4.776510 | 0.0236277 | \*     | 0.0873357 |
| 4   | nontargetContrast:Validity |   2 |  16 | 0.947023 | 0.4085935 |        | 0.0032414 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.6066797 | 0.1739234 |        |
| 4   | nontargetContrast:Validity | 0.7024937 | 0.2905684 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.7177101 | 0.0400078 | \* | 0.8316435 | 0.0323121 | \* |
| 4 | nontargetContrast:Validity | 0.7707091 | 0.3910028 |  | 0.9191464 | 0.4030389 |  |

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
| 2   | nontargetContrast          |   1 |   8 | 0.3113943 | 0.5920950 |        | 0.0023651 |
| 3   | Validity                   |   2 |  16 | 7.7077990 | 0.0045269 | \*     | 0.0860468 |
| 4   | nontargetContrast:Validity |   2 |  16 | 3.4506827 | 0.0567635 |        | 0.0175889 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.4682724 | 0.0702660 |        |
| 4   | nontargetContrast:Validity | 0.3959845 | 0.0390727 | \*     |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.6528576 | 0.0143481 | \* | 0.7283405 | 0.011139 | \* |
| 4 | nontargetContrast:Validity | 0.6234354 | 0.0872506 |  | 0.6827825 | 0.081539 |  |

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
| 2 | nontargetContrast | 1 | 8 | 10.2497182 | 0.0125836 | \* | 0.0706520 |
| 3 | Target | 1 | 8 | 3.2695540 | 0.1081896 |  | 0.0054229 |
| 4 | Validity | 2 | 16 | 1.1726271 | 0.3347881 |  | 0.0041221 |
| 5 | nontargetContrast:Target | 1 | 8 | 0.5969874 | 0.4619444 |  | 0.0018286 |
| 6 | nontargetContrast:Validity | 2 | 16 | 5.2349485 | 0.0178214 | \* | 0.0162514 |
| 7 | Target:Validity | 2 | 16 | 0.7889134 | 0.4712359 |  | 0.0019387 |
| 8 | nontargetContrast:Target:Validity | 2 | 16 | 0.4422641 | 0.6502022 |  | 0.0009617 |

</td>

<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.7039334 | 0.2926581 |        |
| 6   | nontargetContrast:Validity        | 0.8415916 | 0.5468331 |        |
| 7   | Target:Validity                   | 0.5851229 | 0.1532375 |        |
| 8   | nontargetContrast:Target:Validity | 0.4816342 | 0.0775373 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.7715653 | 0.3276675 |  | 0.9205835 | 0.3327868 |  |
| 6 | nontargetContrast:Validity | 0.8632534 | 0.0237395 | \* | 1.0790289 | 0.0178214 | \* |
| 7 | Target:Validity | 0.7067752 | 0.4360428 |  | 0.8139403 | 0.4504258 |  |
| 8 | nontargetContrast:Target:Validity | 0.6586028 | 0.5739095 |  | 0.7373301 | 0.5943720 |  |

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
| 2   | nontargetContrast          |   1 |   8 | 6.3211745 | 0.0361340 | \*     | 0.0789826 |
| 3   | Validity                   |   2 |  16 | 0.0615433 | 0.9405337 |        | 0.0004003 |
| 4   | nontargetContrast:Validity |   2 |  16 | 2.7709127 | 0.0926189 |        | 0.0151627 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.8275853 | 0.5156376 |        |
| 4   | nontargetContrast:Validity | 0.5873287 | 0.1552688 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8529405 | 0.9174789 |  | 1.0607464 | 0.9405337 |  |
| 4 | nontargetContrast:Validity | 0.7078787 | 0.1156046 |  | 0.8157216 | 0.1065617 |  |

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
| 2   | nontargetContrast          |   1 |   8 | 11.024740 | 0.0105345 | \*     | 0.0622768 |
| 3   | Validity                   |   2 |  16 |  2.727755 | 0.0956421 |        | 0.0141078 |
| 4   | nontargetContrast:Validity |   2 |  16 |  4.094569 | 0.0366435 | \*     | 0.0200920 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.1239218 | 0.0006699 | \*     |
| 4   | nontargetContrast:Validity | 0.4523147 | 0.0622361 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.5330268 | 0.1341805 |  | 0.5476306 | 0.1328386 |  |
| 4 | nontargetContrast:Validity | 0.6461262 | 0.0623040 |  | 0.7178469 | 0.0559166 |  |

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

|     | Effect                         | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:-------------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | targetContrast                 |   1 |   8 | 20.349664 | 0.0019730 | \*     | 0.1211332 |
| 3   | Target                         |   1 |   8 | 12.539565 | 0.0076074 | \*     | 0.0201467 |
| 4   | Validity                       |   2 |  16 |  6.787753 | 0.0073367 | \*     | 0.0709412 |
| 5   | targetContrast:Target          |   1 |   8 |  1.152812 | 0.3142766 |        | 0.0022241 |
| 6   | targetContrast:Validity        |   2 |  16 |  4.931395 | 0.0214564 | \*     | 0.0167961 |
| 7   | Target:Validity                |   2 |  16 |  2.383831 | 0.1241249 |        | 0.0079191 |
| 8   | targetContrast:Target:Validity |   2 |  16 |  1.768244 | 0.2023895 |        | 0.0018939 |

</td>

<td>

|     | Effect                         |         W |         p | p\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------|
| 4   | Validity                       | 0.4753609 | 0.0740597 |        |
| 6   | targetContrast:Validity        | 0.5538356 | 0.1264250 |        |
| 7   | Target:Validity                | 0.7415466 | 0.3511434 |        |
| 8   | targetContrast:Target:Validity | 0.8672384 | 0.6074138 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.6558929 | 0.0198307 | \* | 0.7330860 | 0.0158337 | \* |
| 6 | targetContrast:Validity | 0.6914843 | 0.0391487 | \* | 0.7893810 | 0.0323087 | \* |
| 7 | Target:Validity | 0.7946262 | 0.1388034 |  | 0.9595816 | 0.1269065 |  |
| 8 | targetContrast:Target:Validity | 0.8827983 | 0.2075229 |  | 1.1140094 | 0.2023895 |  |

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
| 2   | targetContrast          |   1 |   8 | 18.219365 | 0.0027300 | \*     | 0.1351494 |
| 3   | Validity                |   2 |  16 |  4.862929 | 0.0223873 | \*     | 0.0605892 |
| 4   | targetContrast:Validity |   2 |  16 |  4.131203 | 0.0357675 | \*     | 0.0189650 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.8468955 | 0.5589904 |        |
| 4   | targetContrast:Validity | 0.6580451 | 0.2311505 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8672241 | 0.0288217 | \* | 1.086100 | 0.0223873 | \* |
| 4 | targetContrast:Validity | 0.7451815 | 0.0526456 |  | 0.876644 | 0.0431001 | \* |

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
| 2   | targetContrast          |   1 |   8 | 13.458519 | 0.0063224 | \*     | 0.1066649 |
| 3   | Validity                |   2 |  16 |  6.725969 | 0.0075866 | \*     | 0.0987955 |
| 4   | targetContrast:Validity |   2 |  16 |  4.254563 | 0.0329866 | \*     | 0.0181960 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.2103351 | 0.0042677 | \*     |
| 4   | targetContrast:Validity | 0.5867132 | 0.1547001 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.5587638 | 0.0269088 | \* | 0.5853819 | 0.0249031 | \* |
| 4 | targetContrast:Validity | 0.7075705 | 0.0524439 |  | 0.8152238 | 0.0441791 | \* |

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

|  | Effect | DFn | DFd | F | p | p\<.05 | ges |
|:---|:---|---:|---:|---:|---:|:---|---:|
| 2 | targetContrast | 1 | 8 | 21.2135456 | 0.0017422 | \* | 0.2653354 |
| 3 | Target | 1 | 8 | 6.8146192 | 0.0311070 | \* | 0.0213445 |
| 4 | Validity | 2 | 16 | 3.7069546 | 0.0475520 | \* | 0.0140336 |
| 5 | targetContrast:Target | 1 | 8 | 3.8922467 | 0.0839690 |  | 0.0145212 |
| 6 | targetContrast:Validity | 2 | 16 | 4.9096309 | 0.0217475 | \* | 0.0283942 |
| 7 | Target:Validity | 2 | 16 | 0.2945099 | 0.7488487 |  | 0.0010051 |
| 8 | targetContrast:Target:Validity | 2 | 16 | 1.0050974 | 0.3879829 |  | 0.0028481 |

</td>

<td>

|     | Effect                         |         W |         p | p\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------|
| 4   | Validity                       | 0.9091880 | 0.7166183 |        |
| 6   | targetContrast:Validity        | 0.7548466 | 0.3736848 |        |
| 7   | Target:Validity                | 0.4667906 | 0.0694908 |        |
| 8   | targetContrast:Target:Validity | 0.7088454 | 0.2998681 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.9167482 | 0.0528953 |  | 1.1758258 | 0.0475520 | \* |
| 6 | targetContrast:Validity | 0.8031139 | 0.0318077 | \* | 0.9740768 | 0.0228578 | \* |
| 7 | Target:Validity | 0.6522266 | 0.6587075 |  | 0.7273551 | 0.6819393 |  |
| 8 | targetContrast:Target:Validity | 0.7745006 | 0.3736079 |  | 0.9255164 | 0.3837941 |  |

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
| 2   | targetContrast          |   1 |   8 | 16.089602 | 0.0038886 | \*     | 0.2926408 |
| 3   | Validity                |   2 |  16 |  1.917903 | 0.1792094 |        | 0.0177269 |
| 4   | targetContrast:Validity |   2 |  16 |  3.381984 | 0.0595629 |        | 0.0376363 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.5683363 | 0.1383946 |        |
| 4   | targetContrast:Validity | 0.6446183 | 0.2150597 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.6984881 | 0.1950101 |  | 0.8006018 | 0.1898105 |  |
| 4 | targetContrast:Validity | 0.7377995 | 0.0795394 |  | 0.8644772 | 0.0691512 |  |

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
| 2   | targetContrast          |   1 |   8 | 25.024390 | 0.0010496 | \*     | 0.2374255 |
| 3   | Validity                |   2 |  16 |  2.918868 | 0.0830422 |        | 0.0103384 |
| 4   | targetContrast:Validity |   2 |  16 |  4.939319 | 0.0213515 | \*     | 0.0196855 |

</td>

<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.4946569 | 0.0851264 |        |
| 4   | targetContrast:Validity | 0.7619961 | 0.3862200 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.6643004 | 0.1101467 |  | 0.7462757 | 0.1028498 |  |
| 4 | targetContrast:Validity | 0.8077519 | 0.0310414 | \* | 0.9820301 | 0.0221073 | \* |

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

|     | Effect          | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |   8 | 14.691006 | 0.0049974 | \*     | 0.0289090 |
| 3   | Validity        |   2 |  16 |  7.249663 | 0.0057364 | \*     | 0.1192681 |
| 4   | Target:Validity |   2 |  16 |  3.556230 | 0.0527461 |        | 0.0132129 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.2662311 | 0.0097366 | \*     |
| 4   | Target:Validity | 0.8696577 | 0.6133654 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.5767781 | 0.0214676 | \* | 0.6121431 | 0.0191972 | \* |
| 4 | Target:Validity | 0.8846878 | 0.0605546 |  | 1.1174145 | 0.0527461 |  |

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
| 2   | Target          |   1 |   8 | 5.9793896 | 0.0402319 | \*     | 0.0495843 |
| 3   | Validity        |   2 |  16 | 4.7141395 | 0.0245711 | \*     | 0.0545608 |
| 4   | Target:Validity |   2 |  16 | 0.6926651 | 0.5146314 |        | 0.0051360 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.7862753 | 0.4310336 |        |
| 4   | Target:Validity | 0.4546561 | 0.0633710 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8239100 | 0.0338939 | \* | 1.0099195 | 0.0245711 | \* |
| 4 | Target:Validity | 0.6471051 | 0.4609518 |  | 0.7193703 | 0.4739548 |  |

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
| 2   | Target          |   1 |   8 | 1.9791866 | 0.1971158 |        | 0.0117256 |
| 3   | Validity        |   2 |  16 | 3.2603584 | 0.0649086 |        | 0.0269832 |
| 4   | Target:Validity |   2 |  16 | 0.8047918 | 0.4644802 |        | 0.0043663 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8137294 | 0.4860491 |        |
| 4   | Target:Validity | 0.4708551 | 0.0716317 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8429780 | 0.0763533 |  | 1.0431987 | 0.0649086 |  |
| 4 | Target:Validity | 0.6539602 | 0.4227979 |  | 0.7300634 | 0.4337106 |  |

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
| 2   | Target          |   1 |   8 | 0.3708137 | 0.5594517 |        | 0.0011279 |
| 3   | Validity        |   2 |  16 | 2.6311013 | 0.1028238 |        | 0.0110317 |
| 4   | Target:Validity |   2 |  16 | 0.2579748 | 0.7757673 |        | 0.0009149 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9156779 | 0.7346822 |        |
| 4   | Target:Validity | 0.7626366 | 0.3873573 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9222352 | 0.1084426 |  | 1.1859445 | 0.1028238 |  |
| 4 | Target:Validity | 0.8081700 | 0.7306098 |  | 0.9827482 | 0.7721472 |  |

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
| 2   | Validity |   2 |  16 | 6.554819 | 0.0083304 | \*     | 0.1163147 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.6609972 | 0.2348003 |        |

</td>

<td>

|     | Effect   |       GGe |  p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|---------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7468244 | 0.016789 | \*           | 0.8793592 | 0.0116163 | \*           |

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
| 2   | Validity |   2 |  16 | 2.839796 | 0.0880138 |        | 0.0688928 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.5644042 | 0.1350721 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.6965749 | 0.1121099 |              | 0.7975319 | 0.1034754 |              |

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
| 2   | Validity |   2 |  16 | 1.120586 | 0.3503789 |        | 0.0164673 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8300575 | 0.5210491 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.8547429 | 0.3450185 |              | 1.063933 | 0.3503789 |              |

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
| 2   | Validity |   2 |  16 | 1.789966 | 0.1988247 |        | 0.0142849 |

</td>

<td>

|     | Effect   |         W |        p | p\<.05 |
|:----|:---------|----------:|---------:|:-------|
| 2   | Validity | 0.9747761 | 0.914465 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9753967 | 0.1999536 |              | 1.285883 | 0.1988247 |              |

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
| 2   | Validity |   2 |  16 | 6.699465 | 0.0076968 | \*     | 0.1443318 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.2937481 | 0.0137377 | \*     |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.5860799 | 0.0250795 | \*           | 0.626072 | 0.0223416 | \*           |

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
| 2   | Validity |   2 |  16 | 5.397172 | 0.0161665 | \*     | 0.0403696 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7038839 | 0.2925861 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7715358 | 0.0266436 | \*           | 0.9205341 | 0.0192188 | \*           |

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
| 2   | Validity |   2 |  16 | 4.403403 | 0.0299497 | \*     | 0.0521207 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.3009471 | 0.0149526 | \*     |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.5885632 | 0.0595507 |              | 0.6298034 | 0.0555593 |              |

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

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  16 | 1.180209 | 0.3325825 |        | 0.0086122 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.2292661 | 0.0057702 | \*     |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.5647376 | 0.3143239 |              | 0.5942251 | 0.3164217 |              |

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
| 2 | targetContrast | 1 | 8 | 20.6957015 | 0.0018762 | \* | 0.2136081 |
| 3 | nontargetContrast | 1 | 8 | 5.3876040 | 0.0488339 | \* | 0.0123447 |
| 4 | Validity | 2 | 16 | 3.9559557 | 0.0401833 | \* | 0.0329991 |
| 5 | targetContrast:nontargetContrast | 1 | 8 | 4.0736874 | 0.0782601 |  | 0.0171979 |
| 6 | targetContrast:Validity | 2 | 16 | 4.2430289 | 0.0332360 | \* | 0.0276792 |
| 7 | nontargetContrast:Validity | 2 | 16 | 2.4167196 | 0.1210242 |  | 0.0063589 |
| 8 | targetContrast:nontargetContrast:Validity | 2 | 16 | 0.7030217 | 0.5097525 |  | 0.0010696 |

</td>

<td>

|     | Effect                                    |         W |         p | p\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------|
| 4   | Validity                                  | 0.8242473 | 0.5083951 |        |
| 6   | targetContrast:Validity                   | 0.3686744 | 0.0304264 | \*     |
| 7   | nontargetContrast:Validity                | 0.9895486 | 0.9638953 |        |
| 8   | targetContrast:nontargetContrast:Validity | 0.8671036 | 0.6070835 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.8505190 | 0.0496673 | \* | 1.0564710 | 0.0401833 | \* |
| 6 | targetContrast:Validity | 0.6129984 | 0.0613112 |  | 0.6668119 | 0.0562769 |  |
| 7 | nontargetContrast:Validity | 0.9896567 | 0.1217357 |  | 1.3132904 | 0.1210242 |  |
| 8 | targetContrast:nontargetContrast:Validity | 0.8826932 | 0.4946108 |  | 1.1138203 | 0.5097525 |  |

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
| 2 | targetContrast | 1 | 8 | 25.355521 | 0.0010073 | \* | 0.1652855 |
| 3 | nontargetContrast | 1 | 8 | 4.180963 | 0.0751191 |  | 0.0181035 |
| 4 | Validity | 2 | 16 | 7.482650 | 0.0050811 | \* | 0.0472771 |
| 5 | targetContrast:nontargetContrast | 1 | 8 | 2.440833 | 0.1568391 |  | 0.0064132 |
| 6 | targetContrast:Validity | 2 | 16 | 5.251402 | 0.0176451 | \* | 0.0161826 |
| 7 | nontargetContrast:Validity | 2 | 16 | 3.982260 | 0.0394830 | \* | 0.0157944 |
| 8 | targetContrast:nontargetContrast:Validity | 2 | 16 | 2.529905 | 0.1110003 |  | 0.0027627 |

</td>

<td>

|     | Effect                                    |         W |         p | p\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------|
| 4   | Validity                                  | 0.3070159 | 0.0160348 | \*     |
| 6   | targetContrast:Validity                   | 0.6242008 | 0.1921476 |        |
| 7   | nontargetContrast:Validity                | 0.2059986 | 0.0039676 | \*     |
| 8   | targetContrast:nontargetContrast:Validity | 0.2683136 | 0.0100057 | \*     |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.5906730 | 0.0190302 | \* | 0.6329779 | 0.0165732 | \* |
| 6 | targetContrast:Validity | 0.7268502 | 0.0314390 | \* | 0.8465320 | 0.0243794 | \* |
| 7 | nontargetContrast:Validity | 0.5574132 | 0.0746519 |  | 0.5833867 | 0.0719078 |  |
| 8 | targetContrast:nontargetContrast:Validity | 0.5774718 | 0.1439289 |  | 0.6131792 | 0.1409494 |  |

</td>

</tr>

</tbody>

</table>

# paired t-tests

## full acc

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_acc-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_acc-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/ni_acc-1.png" width="90%" />

## accuracy by target (T1, T2)

### T1

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_acc T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_acc T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/ni_acc T1-1.png" width="90%" />

### T2

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_acc T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_acc T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/ni_acc T2-1.png" width="90%" />

## accuracy by target and nontarget contrast

### PresentPresent

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_accPP T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_accPP T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/ni_accPP T1-1.png" width="90%" />
\#### T2
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_accPP T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_accPP T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/ni_accPP T2-1.png" width="90%" />
\### PresentAbsent
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_accPA T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_accPA T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_accPA T1-1.png" width="90%" />
\##### T2
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_accPA T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_accPA T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_accPA T2-1.png" width="90%" />

\#AbsentPresent
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_accAP T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_accAP T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_accAP T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_accAP T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_accAP T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_accAP T2-1.png" width="90%" />

\#AbsentAbsent
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_accAA T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_accAA T1 -1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_accAA T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_accAA T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_accAA T2 -1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_accAA T2-1.png" width="90%" />
\## accuracy by target \#target present
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_accTP T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_accTP T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_accTP T1-1.png" width="90%" />
\# T2
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_accTP T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_accTP T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_accTP T2-1.png" width="90%" />
\#target absent
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_accTA T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_accTA T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_accTA T1 -1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_accTA T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_accTA T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_accTA T2-1.png" width="90%" />

## accuracy by nontarget

\#nontarget present
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_accNP T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_accNP T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_accNP T1-1.png" width="90%" />
\# T2
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_accNP T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_accNP T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_accNP T2-1.png" width="90%" />
\#nontarget absent
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_accNA T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_accNA T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_accNA T1 -1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_accNA T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_accNA T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_accNA T2-1.png" width="90%" />

## RT by target and nontarget

# PresentPresent

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_RT PP T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_RTPP T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/ni_RTPP T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_RTPP T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_RTPP T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/ni_RTPP T2-1.png" width="90%" />

# PresentAbsent

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_RTPA T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_RTPA T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_RTPA T1-1.png" width="90%" />
\# T2
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_RTPA T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_RTPA T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_RTPA T2-1.png" width="90%" />

\#AbsentPresent
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_RTAP T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_RTAP T1 -1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_RTAP T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_RTAP T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_RTAP T2 -1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_RTAP T2-1.png" width="90%" />

\#AbsentAbsent
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_aRTAA T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_RTAA T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_RTAA T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_aRTAA T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_RTAA T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_RTAA T2-1.png" width="90%" />
\## accuracy by target \#target present
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_RTTP T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_RTTP T1 -1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_RTTP T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_RTTP T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_RTTP T2 -1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_RTTP T2-1.png" width="90%" />
\#target absent
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_RTTA T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_RTTA T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_RTTA T1-1.png" width="90%" />

\#T2
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_RTTA T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_RTTA T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_RTTA T2-1.png" width="90%" />

## accuracy by nontarget

\#nontarget present
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_RTNP T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_RTNP T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_RTNP T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_RTNP T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_RTNP T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_RTNP T2-1.png" width="90%" />
\#nontarget absent
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_RTNA T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_RTNA T1-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_RTNA T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_topHalf_files/figure-gfm/vi_RTNA T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/vn_RTNA T2-1.png" width="90%" />

<img src="tazoot_AccRT_topHalf_files/figure-gfm/in_RTNA T2-1.png" width="90%" />
