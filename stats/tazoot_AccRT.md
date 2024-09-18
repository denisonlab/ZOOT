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
    ##                                              Effect DFn DFd          F
    ## 2                                    targetContrast   1  14 84.0993198
    ## 3                                 nontargetContrast   1  14 24.6223633
    ## 4                                            Target   1  14 16.9886381
    ## 5                                          Validity   2  28  7.1977481
    ## 6                  targetContrast:nontargetContrast   1  14  9.4765237
    ## 7                             targetContrast:Target   1  14 39.4914848
    ## 8                          nontargetContrast:Target   1  14  1.5882658
    ## 9                           targetContrast:Validity   2  28 25.1079984
    ## 10                       nontargetContrast:Validity   2  28  0.2409744
    ## 11                                  Target:Validity   2  28  0.3368698
    ## 12          targetContrast:nontargetContrast:Target   1  14  0.6535164
    ## 13        targetContrast:nontargetContrast:Validity   2  28  0.5600703
    ## 14                   targetContrast:Target:Validity   2  28  2.7031508
    ## 15                nontargetContrast:Target:Validity   2  28  1.2378910
    ## 16 targetContrast:nontargetContrast:Target:Validity   2  28  0.4153952
    ##               p p<.05          ges
    ## 2  2.700087e-07     * 0.2678419460
    ## 3  2.087003e-04     * 0.1286611387
    ## 4  1.037197e-03     * 0.0439189982
    ## 5  3.004252e-03     * 0.0191556706
    ## 6  8.175734e-03     * 0.1009108357
    ## 7  2.007824e-05     * 0.0782281068
    ## 8  2.281758e-01       0.0026276139
    ## 9  5.676417e-07     * 0.0396919687
    ## 10 7.874747e-01       0.0009346363
    ## 11 7.168557e-01       0.0008846922
    ## 12 4.323814e-01       0.0013496029
    ## 13 5.774360e-01       0.0013771911
    ## 14 8.445296e-02       0.0081193152
    ## 15 3.053827e-01       0.0028685213
    ## 16 6.640806e-01       0.0010714765
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##                                              Effect         W          p p<.05
    ## 5                                          Validity 0.9373216 0.65656232      
    ## 9                           targetContrast:Validity 0.8856777 0.45424700      
    ## 10                       nontargetContrast:Validity 0.9938929 0.96096451      
    ## 11                                  Target:Validity 0.5722632 0.02656885     *
    ## 13        targetContrast:nontargetContrast:Validity 0.9540476 0.73655509      
    ## 14                   targetContrast:Target:Validity 0.6464697 0.05868988      
    ## 15                nontargetContrast:Target:Validity 0.9275264 0.61322623      
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.8239355 0.28399175      
    ## 
    ## $`Sphericity Corrections`
    ##                                              Effect       GGe        p[GG]
    ## 5                                          Validity 0.9410184 3.698449e-03
    ## 9                           targetContrast:Validity 0.8974064 1.857081e-06
    ## 10                       nontargetContrast:Validity 0.9939300 7.861817e-01
    ## 11                                  Target:Validity 0.7004092 6.419080e-01
    ## 13        targetContrast:nontargetContrast:Validity 0.9560664 5.701130e-01
    ## 14                   targetContrast:Target:Validity 0.7388087 1.030717e-01
    ## 15                nontargetContrast:Target:Validity 0.9324239 3.041985e-01
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.8502935 6.323384e-01
    ##    p[GG]<.05       HFe        p[HF] p[HF]<.05
    ## 5          * 1.0823004 3.004252e-03         *
    ## 9          * 1.0209672 5.676417e-07         *
    ## 10           1.1579077 7.874747e-01          
    ## 11           0.7545044 6.576495e-01          
    ## 13           1.1036684 5.774360e-01          
    ## 14           0.8051288 9.803630e-02          
    ## 15           1.0701438 3.053827e-01          
    ## 16           0.9556880 6.552082e-01

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

|     | Effect                            | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:----------------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | nontargetContrast                 |   1 |  14 |  0.2743252 | 0.6086371 |        | 0.0027427 |
| 3   | Target                            |   1 |  14 | 49.5733989 | 0.0000059 | \*     | 0.2247685 |
| 4   | Validity                          |   2 |  28 | 20.5307439 | 0.0000032 | \*     | 0.1157675 |
| 5   | nontargetContrast:Target          |   1 |  14 |  0.0640563 | 0.8038746 |        | 0.0002405 |
| 6   | nontargetContrast:Validity        |   2 |  28 |  0.0124125 | 0.9876697 |        | 0.0001386 |
| 7   | Target:Validity                   |   2 |  28 |  2.1785949 | 0.1320144 |        | 0.0160306 |
| 8   | nontargetContrast:Target:Validity |   2 |  28 |  0.6260032 | 0.5420423 |        | 0.0031814 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.9180790 | 0.5737469 |        |
| 6   | nontargetContrast:Validity        | 0.9981764 | 0.9882057 |        |
| 7   | Target:Validity                   | 0.6471944 | 0.0591188 |        |
| 8   | nontargetContrast:Target:Validity | 0.9223425 | 0.5912883 |        |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.9242819 | 0.0000068 | \*           | 1.0586591 | 0.0000032 | \*           |
| 6   | nontargetContrast:Validity        | 0.9981797 | 0.9875844 |              | 1.1640381 | 0.9876697 |              |
| 7   | Target:Validity                   | 0.7392045 | 0.1481030 |              | 0.8056538 | 0.1439592 |              |
| 8   | nontargetContrast:Target:Validity | 0.9279386 | 0.5310939 |              | 1.0638132 | 0.5420423 |              |

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
| 2   | nontargetContrast          |   1 |  14 |  0.0647189 | 0.8028858 |        | 0.0011052 |
| 3   | Validity                   |   2 |  28 | 16.2278142 | 0.0000209 | \*     | 0.1617305 |
| 4   | nontargetContrast:Validity |   2 |  28 |  0.1038888 | 0.9016713 |        | 0.0019541 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9135303 | 0.5555193 |        |
| 4   | nontargetContrast:Validity | 0.9336522 | 0.6400346 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity                   | 0.9204122 | 0.0000398 | \*           | 1.053211 | 0.0000209 | \*           |
| 4   | nontargetContrast:Validity | 0.9377804 | 0.8903953 |              | 1.077716 | 0.9016713 |              |

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
| 2   | nontargetContrast          |   1 |  14 | 0.7117048 | 0.4130613 |        | 0.0059824 |
| 3   | Validity                   |   2 |  28 | 4.3354429 | 0.0228935 | \*     | 0.0686953 |
| 4   | nontargetContrast:Validity |   2 |  28 | 0.4570067 | 0.6378156 |        | 0.0055044 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9570389 | 0.7516961 |        |
| 4   | nontargetContrast:Validity | 0.8366499 | 0.3137145 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity                   | 0.9588085 | 0.0246413 | \*           | 1.107573 | 0.0228935 | \*           |
| 4   | nontargetContrast:Validity | 0.8595865 | 0.6095384 |              | 0.968485 | 0.6318211 |              |

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

|     | Effect                            | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:----------------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | nontargetContrast                 |   1 |  14 | 19.2756457 | 0.0006161 | \*     | 0.3163311 |
| 3   | Target                            |   1 |  14 |  1.3032776 | 0.2727664 |        | 0.0052734 |
| 4   | Validity                          |   2 |  28 |  2.0254446 | 0.1508173 |        | 0.0055760 |
| 5   | nontargetContrast:Target          |   1 |  14 |  1.8738154 | 0.1926023 |        | 0.0068920 |
| 6   | nontargetContrast:Validity        |   2 |  28 |  1.5846886 | 0.2228531 |        | 0.0040146 |
| 7   | Target:Validity                   |   2 |  28 |  0.8001049 | 0.4592883 |        | 0.0033654 |
| 8   | nontargetContrast:Target:Validity |   2 |  28 |  0.9563677 | 0.3964849 |        | 0.0045265 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.9353734 | 0.6477427 |        |
| 6   | nontargetContrast:Validity        | 0.8834669 | 0.4469273 |        |
| 7   | Target:Validity                   | 0.7183207 | 0.1164313 |        |
| 8   | nontargetContrast:Target:Validity | 0.7721397 | 0.1862186 |        |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.9392964 | 0.1541794 |              | 1.0798620 | 0.1508173 |              |
| 6   | nontargetContrast:Validity        | 0.8956295 | 0.2255210 |              | 1.0184869 | 0.2228531 |              |
| 7   | Target:Validity                   | 0.7802264 | 0.4335012 |              | 0.8604329 | 0.4437158 |              |
| 8   | nontargetContrast:Target:Validity | 0.8144249 | 0.3821954 |              | 0.9066556 | 0.3897741 |              |

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
| 2   | nontargetContrast          |   1 |  14 | 14.073759 | 0.0021470 | \*     | 0.2875439 |
| 3   | Validity                   |   2 |  28 |  3.209828 | 0.0555803 |        | 0.0174801 |
| 4   | nontargetContrast:Validity |   2 |  28 |  2.082650 | 0.1434783 |        | 0.0131173 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9683118 | 0.8111459 |        |
| 4   | nontargetContrast:Validity | 0.9122187 | 0.5503557 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity                   | 0.9692851 | 0.0574581 |              | 1.122527 | 0.0555803 |              |
| 4   | nontargetContrast:Validity | 0.9193025 | 0.1481304 |              | 1.051651 | 0.1434783 |              |

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
| 2   | nontargetContrast          |   1 |  14 | 19.3686223 | 0.0006037 | \*     | 0.3428936 |
| 3   | Validity                   |   2 |  28 |  0.2489445 | 0.7813305 |        | 0.0020202 |
| 4   | nontargetContrast:Validity |   2 |  28 |  0.6049383 | 0.5530907 |        | 0.0048293 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.7558716 | 0.1621482 |        |
| 4   | nontargetContrast:Validity | 0.7206036 | 0.1188575 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.8037756 | 0.7337162 |              | 0.8922073 | 0.7567437 |              |
| 4   | nontargetContrast:Validity | 0.7816186 | 0.5158885 |              | 0.8623046 | 0.5306639 |              |

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

|     | Effect                         | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:-------------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | targetContrast                 |   1 |  14 |  2.9916569 | 0.1056692 |        | 0.0455057 |
| 3   | Target                         |   1 |  14 |  4.8555549 | 0.0448026 | \*     | 0.0171016 |
| 4   | Validity                       |   2 |  28 |  1.5136867 | 0.2375649 |        | 0.0104572 |
| 5   | targetContrast:Target          |   1 |  14 | 18.4110953 | 0.0007467 | \*     | 0.0658466 |
| 6   | targetContrast:Validity        |   2 |  28 | 10.4222899 | 0.0004138 | \*     | 0.0353797 |
| 7   | Target:Validity                |   2 |  28 |  0.0949318 | 0.9097264 |        | 0.0004768 |
| 8   | targetContrast:Target:Validity |   2 |  28 |  1.4011097 | 0.2630657 |        | 0.0077362 |

</td>
<td>

|     | Effect                         |         W |         p | p\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------|
| 4   | Validity                       | 0.9700940 | 0.8208993 |        |
| 6   | targetContrast:Validity        | 0.6974853 | 0.0961563 |        |
| 7   | Target:Validity                | 0.7841763 | 0.2059156 |        |
| 8   | targetContrast:Target:Validity | 0.7414455 | 0.1430590 |        |

</td>
<td>

|     | Effect                         |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                       | 0.9709624 | 0.2381377 |              | 1.1249255 | 0.2375649 |              |
| 6   | targetContrast:Validity        | 0.7677456 | 0.0014284 | \*           | 0.8436903 | 0.0009512 | \*           |
| 7   | Target:Validity                | 0.8224877 | 0.8746337 |              | 0.9176279 | 0.8950247 |              |
| 8   | targetContrast:Target:Validity | 0.7945623 | 0.2634162 |              | 0.8797474 | 0.2635924 |              |

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

|     | Effect                  | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | targetContrast          |   1 |  14 | 11.0990124 | 0.0049424 | \*     | 0.2006125 |
| 3   | Validity                |   2 |  28 |  0.6689473 | 0.5202442 |        | 0.0081231 |
| 4   | targetContrast:Validity |   2 |  28 |  8.9584860 | 0.0009831 | \*     | 0.0718232 |

</td>
<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.9644660 | 0.7904330 |        |
| 4   | targetContrast:Validity | 0.8409792 | 0.3244175 |        |

</td>
<td>

|     | Effect                  |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                | 0.9656854 | 0.5155062 |              | 1.1173829 | 0.5202442 |              |
| 4   | targetContrast:Validity | 0.8627973 | 0.0018310 | \*           | 0.9729155 | 0.0011111 | \*           |

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
| 2   | targetContrast          |   1 |  14 | 0.1205765 | 0.7335747 |        | 0.0020788 |
| 3   | Validity                |   2 |  28 | 1.1475508 | 0.3318934 |        | 0.0133596 |
| 4   | targetContrast:Validity |   2 |  28 | 1.6581900 | 0.2086463 |        | 0.0154658 |

</td>
<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.9739326 | 0.8422442 |        |
| 4   | targetContrast:Validity | 0.7563068 | 0.1627560 |        |

</td>
<td>

|     | Effect                  |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                | 0.9745949 | 0.3311011 |              | 1.1301251 | 0.3318934 |              |
| 4   | targetContrast:Validity | 0.8040568 | 0.2146679 |              | 0.8925883 | 0.2121138 |              |

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

|     | Effect                         | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:-------------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | targetContrast                 |   1 |  14 | 109.697636 | 0.0000001 | \*     | 0.6512775 |
| 3   | Target                         |   1 |  14 |  21.691305 | 0.0003699 | \*     | 0.1298389 |
| 4   | Validity                       |   2 |  28 |   9.799201 | 0.0005942 | \*     | 0.0498095 |
| 5   | targetContrast:Target          |   1 |  14 |  25.043110 | 0.0001930 | \*     | 0.1204972 |
| 6   | targetContrast:Validity        |   2 |  28 |  10.345766 | 0.0004324 | \*     | 0.0585522 |
| 7   | Target:Validity                |   2 |  28 |   3.044678 | 0.0636135 |        | 0.0141655 |
| 8   | targetContrast:Target:Validity |   2 |  28 |   2.427364 | 0.1066209 |        | 0.0137857 |

</td>
<td>

|     | Effect                         |         W |         p | p\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------|
| 4   | Validity                       | 0.9395606 | 0.6668238 |        |
| 6   | targetContrast:Validity        | 0.9125942 | 0.5518297 |        |
| 7   | Target:Validity                | 0.7123835 | 0.1103164 |        |
| 8   | targetContrast:Target:Validity | 0.7546600 | 0.1604663 |        |

</td>
<td>

|     | Effect                         |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                       | 0.9430053 | 0.0007893 | \*           | 1.0851156 | 0.0005942 | \*           |
| 6   | targetContrast:Validity        | 0.9196199 | 0.0006607 | \*           | 1.0520969 | 0.0004324 | \*           |
| 7   | Target:Validity                | 0.7766287 | 0.0791396 |              | 0.8555999 | 0.0732711 |              |
| 8   | targetContrast:Target:Validity | 0.8029936 | 0.1198977 |              | 0.8911483 | 0.1138082 |              |

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
| 2   | targetContrast          |   1 |  14 | 101.995931 | 0.0000001 | \*     | 0.6870744 |
| 3   | Validity                |   2 |  28 |   7.967601 | 0.0018232 | \*     | 0.0810834 |
| 4   | targetContrast:Validity |   2 |  28 |   7.680672 | 0.0021917 | \*     | 0.0888011 |

</td>
<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.9081959 | 0.5347700 |        |
| 4   | targetContrast:Validity | 0.9421680 | 0.6789444 |        |

</td>
<td>

|     | Effect                  |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity                | 0.9159152 | 0.0025460 | \*           | 1.046890 | 0.0018232 | \*           |
| 4   | targetContrast:Validity | 0.9453297 | 0.0026983 | \*           | 1.088412 | 0.0021917 | \*           |

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
| 2   | targetContrast          |   1 |  14 | 64.396728 | 0.0000013 | \*     | 0.6132359 |
| 3   | Validity                |   2 |  28 |  2.510447 | 0.0993502 |        | 0.0193565 |
| 4   | targetContrast:Validity |   2 |  28 |  3.022167 | 0.0648014 |        | 0.0286399 |

</td>
<td>

|     | Effect                  |         W |        p | p\<.05 |
|:----|:------------------------|----------:|---------:|:-------|
| 3   | Validity                | 0.9702288 | 0.821641 |        |
| 4   | targetContrast:Validity | 0.8485302 | 0.343825 |        |

</td>
<td>

|     | Effect                  |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity                | 0.9710895 | 0.1012397 |              | 1.125107 | 0.0993502 |              |
| 4   | targetContrast:Validity | 0.8684552 | 0.0735711 |              | 0.980734 | 0.0660177 |              |

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
| 2   | Target          |   1 |  14 | 45.0614887 | 0.0000099 | \*     | 0.2215927 |
| 3   | Validity        |   2 |  28 |  5.9248748 | 0.0071491 | \*     | 0.1267274 |
| 4   | Target:Validity |   2 |  28 |  0.6361237 | 0.5368185 |        | 0.0097583 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9347826 | 0.6450879 |        |
| 4   | Target:Validity | 0.7926486 | 0.2208129 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.9387755 | 0.0084690 | \*           | 1.0791245 | 0.0071491 | \*           |
| 4   | Target:Validity | 0.8282593 | 0.5097861 |              | 0.9254998 | 0.5256827 |              |

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
| 2   | Target          |   1 |  14 | 23.354093 | 0.0002658 | \*     | 0.2279569 |
| 3   | Validity        |   2 |  28 | 10.622214 | 0.0003692 | \*     | 0.1056034 |
| 4   | Target:Validity |   2 |  28 |  2.872154 | 0.0733508 |        | 0.0275998 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9279388 | 0.6150010 |        |
| 4   | Target:Validity | 0.7419137 | 0.1436472 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.9327826 | 0.0005314 | \*           | 1.0706505 | 0.0003692 | \*           |
| 4   | Target:Validity | 0.7948580 | 0.0876848 |              | 0.8801467 | 0.0814293 |              |

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
| 2   | Target          |   1 |  14 | 1.5766478 | 0.2297969 |        | 0.0121977 |
| 3   | Validity        |   2 |  28 | 1.8862957 | 0.1704023 |        | 0.0095830 |
| 4   | Target:Validity |   2 |  28 | 0.8804704 | 0.4257545 |        | 0.0076083 |

</td>
<td>

|     | Effect          |        W |         p | p\<.05 |
|:----|:----------------|---------:|----------:|:-------|
| 3   | Validity        | 0.915025 | 0.5614539 |        |
| 4   | Target:Validity | 0.763101 | 0.1724977 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity        | 0.9216802 | 0.1742148 |              | 1.054996 | 0.1704023 |              |
| 4   | Target:Validity | 0.8084735 | 0.4075316 |              | 0.898575 | 0.4166663 |              |

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
| 2   | Target          |   1 |  14 | 1.3061224 | 0.2722661 |        | 0.0041721 |
| 3   | Validity        |   2 |  28 | 0.3580915 | 0.7021639 |        | 0.0067620 |
| 4   | Target:Validity |   2 |  28 | 0.9372385 | 0.4036529 |        | 0.0265103 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8098846 | 0.2539512 |        |
| 4   | Target:Validity | 0.4041421 | 0.0027699 | \*     |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8402546 | 0.6662543 |              | 0.9419074 | 0.6898510 |              |
| 4   | Target:Validity | 0.6266222 | 0.3680835 |              | 0.6589389 | 0.3721134 |              |

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
| 2   | Validity |   2 |  28 | 4.830018 | 0.0157718 | \*     | 0.1670662 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8835621 | 0.4472405 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.8957059 | 0.0196279 | \*           | 1.018593 | 0.0157718 | \*           |

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
| 2   | Validity |   2 |  28 | 8.330715 | 0.0014493 | \*     | 0.1602032 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9627879 | 0.7815359 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9641229 | 0.0016833 | \*           | 1.115152 | 0.0014493 | \*           |

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
| 2   | Validity |   2 |  28 | 2.805584 | 0.077525 |        | 0.0302481 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9614639 | 0.7745766 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |  p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|---------:|:-------------|
| 2   | Validity | 0.9628938 | 0.0799544 |              | 1.113398 | 0.077525 |              |

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

|     | Effect   | DFn | DFd |         F |         p | p\<.05 |      ges |
|:----|:---------|----:|----:|----------:|----------:|:-------|---------:|
| 2   | Validity |   2 |  28 | 0.5062062 | 0.6081892 |        | 0.025169 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.5271261 | 0.0155756 | \*     |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.6789448 | 0.5406434 |              | 0.7264745 | 0.5523381 |              |

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
| 2   | Validity |   2 |  28 | 2.658169 | 0.0877023 |        | 0.0921265 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9553703 | 0.7432179 |        |

</td>
<td>

|     | Effect   |      GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|---------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.957277 | 0.0905238 |              | 1.105392 | 0.0877023 |              |

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
| 2   | Validity |   2 |  28 | 2.921587 | 0.0704073 |        | 0.0468466 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9877228 | 0.9228435 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9878717 | 0.0711826 |              | 1.149183 | 0.0704073 |              |

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
| 2   | Validity |   2 |  28 | 0.4097049 | 0.6677614 |        | 0.0064957 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7335283 | 0.1334166 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7895952 | 0.6212678 |              | 0.8730452 | 0.6410311 |              |

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

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |      ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|---------:|
| 2   | Validity |   2 |  28 | 1.230125 | 0.3075698 |        | 0.048951 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.4198981 | 0.0035517 | \*     |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.6328706 | 0.2955445 |              | 0.6669457 | 0.2973607 |              |

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

|     | Effect                                    | DFn | DFd |           F |         p | p\<.05 |       ges |
|:----|:------------------------------------------|----:|----:|------------:|----------:|:-------|----------:|
| 2   | targetContrast                            |   1 |  14 | 145.8818947 | 0.0000000 | \*     | 0.4364153 |
| 3   | nontargetContrast                         |   1 |  14 |  18.9362452 | 0.0006640 | \*     | 0.0965600 |
| 4   | Validity                                  |   2 |  28 |   6.6140699 | 0.0044412 | \*     | 0.0268540 |
| 5   | targetContrast:nontargetContrast          |   1 |  14 |   5.0564519 | 0.0411581 | \*     | 0.0789975 |
| 6   | targetContrast:Validity                   |   2 |  28 |  17.4565901 | 0.0000120 | \*     | 0.0757746 |
| 7   | nontargetContrast:Validity                |   2 |  28 |   0.7358914 | 0.4881156 |        | 0.0056377 |
| 8   | targetContrast:nontargetContrast:Validity |   2 |  28 |   0.3228564 | 0.7267375 |        | 0.0016792 |

</td>
<td>

|     | Effect                                    |         W |         p | p\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------|
| 4   | Validity                                  | 0.7895330 | 0.2152320 |        |
| 6   | targetContrast:Validity                   | 0.9354970 | 0.6482995 |        |
| 7   | nontargetContrast:Validity                | 0.9961834 | 0.9754508 |        |
| 8   | targetContrast:nontargetContrast:Validity | 0.6208867 | 0.0451419 | \*     |

</td>
<td>

|     | Effect                                    |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                                  | 0.8261275 | 0.0077334 | \*           | 0.9225905 | 0.0056817 | \*           |
| 6   | targetContrast:Validity                   | 0.9394056 | 0.0000202 | \*           | 1.0800164 | 0.0000120 | \*           |
| 7   | nontargetContrast:Validity                | 0.9961979 | 0.4876626 |              | 1.1611782 | 0.4881156 |              |
| 8   | targetContrast:nontargetContrast:Validity | 0.7251036 | 0.6584271 |              | 0.7869894 | 0.6759583 |              |

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

|     | Effect                                    | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:------------------------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | targetContrast                            |   1 |  14 | 13.1182740 | 0.0027752 | \*     | 0.0926250 |
| 3   | nontargetContrast                         |   1 |  14 | 20.0619731 | 0.0005196 | \*     | 0.1646153 |
| 4   | Validity                                  |   2 |  28 |  1.9210284 | 0.1652711 |        | 0.0125233 |
| 5   | targetContrast:nontargetContrast          |   1 |  14 | 13.5105474 | 0.0024947 | \*     | 0.1255278 |
| 6   | targetContrast:Validity                   |   2 |  28 |  3.1279910 | 0.0594159 |        | 0.0143382 |
| 7   | nontargetContrast:Validity                |   2 |  28 |  0.3945164 | 0.6776936 |        | 0.0018084 |
| 8   | targetContrast:nontargetContrast:Validity |   2 |  28 |  0.6741570 | 0.5176643 |        | 0.0032700 |

</td>
<td>

|     | Effect                                    |         W |         p | p\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------|
| 4   | Validity                                  | 0.9726956 | 0.8353150 |        |
| 6   | targetContrast:Validity                   | 0.6759702 | 0.0784385 |        |
| 7   | nontargetContrast:Validity                | 0.9813008 | 0.8845331 |        |
| 8   | targetContrast:nontargetContrast:Validity | 0.8787413 | 0.4316153 |        |

</td>
<td>

|     | Effect                                    |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                                  | 0.9734213 | 0.1666169 |              | 1.1284446 | 0.1652711 |              |
| 6   | targetContrast:Validity                   | 0.7552700 | 0.0764435 |              | 0.8270214 | 0.0710118 |              |
| 7   | nontargetContrast:Validity                | 0.9816441 | 0.6739958 |              | 1.1402334 | 0.6776936 |              |
| 8   | targetContrast:nontargetContrast:Validity | 0.8918549 | 0.5023059 |              | 1.0132227 | 0.5176643 |              |

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
    ## 2                                    targetContrast   1  14 32.2961993
    ## 3                                 nontargetContrast   1  14 15.3299731
    ## 4                                            Target   1  14 23.6535521
    ## 5                                          Validity   2  28 13.1039020
    ## 6                  targetContrast:nontargetContrast   1  14 26.1658448
    ## 7                             targetContrast:Target   1  14  3.0190782
    ## 8                          nontargetContrast:Target   1  14  0.5079462
    ## 9                           targetContrast:Validity   2  28  8.3244765
    ## 10                       nontargetContrast:Validity   2  28  3.4753539
    ## 11                                  Target:Validity   2  28  1.3754316
    ## 12          targetContrast:nontargetContrast:Target   1  14  4.4524021
    ## 13        targetContrast:nontargetContrast:Validity   2  28  2.4436785
    ## 14                   targetContrast:Target:Validity   2  28  2.6223719
    ## 15                nontargetContrast:Target:Validity   2  28  0.4416536
    ## 16 targetContrast:nontargetContrast:Target:Validity   2  28  0.1548652
    ##               p p<.05          ges
    ## 2  5.652807e-05     * 1.475819e-01
    ## 3  1.554096e-03     * 2.920069e-02
    ## 4  2.508441e-04     * 3.865391e-02
    ## 5  9.623810e-05     * 3.773657e-02
    ## 6  1.572170e-04     * 1.789351e-02
    ## 7  1.042276e-01       3.039669e-03
    ## 8  4.877388e-01       2.549961e-04
    ## 9  1.454972e-03     * 1.586218e-02
    ## 10 4.485685e-02     * 2.930031e-03
    ## 11 2.692837e-01       1.422802e-03
    ## 12 5.332944e-02       4.292042e-03
    ## 13 1.051494e-01       1.932117e-03
    ## 14 9.038379e-02       1.931946e-03
    ## 15 6.473745e-01       3.554888e-04
    ## 16 8.572592e-01       5.458958e-05
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##                                              Effect         W          p p<.05
    ## 5                                          Validity 0.5422781 0.01872594     *
    ## 9                           targetContrast:Validity 0.6665149 0.07157547      
    ## 10                       nontargetContrast:Validity 0.8490388 0.34516684      
    ## 11                                  Target:Validity 0.9582709 0.75800833      
    ## 13        targetContrast:nontargetContrast:Validity 0.8351873 0.31016666      
    ## 14                   targetContrast:Target:Validity 0.9560656 0.74674091      
    ## 15                nontargetContrast:Target:Validity 0.8342631 0.30794267      
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.9646263 0.79128717      
    ## 
    ## $`Sphericity Corrections`
    ##                                              Effect       GGe        p[GG]
    ## 5                                          Validity 0.6860019 0.0007888631
    ## 9                           targetContrast:Validity 0.7499147 0.0041494792
    ## 10                       nontargetContrast:Validity 0.8688390 0.0528396810
    ## 11                                  Target:Validity 0.9599425 0.2694110307
    ## 13        targetContrast:nontargetContrast:Validity 0.8585071 0.1145960606
    ## 14                   targetContrast:Target:Validity 0.9579146 0.0931618838
    ## 15                nontargetContrast:Target:Validity 0.8578265 0.6181998688
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.9658348 0.8503671343
    ##    p[GG]<.05       HFe        p[HF] p[HF]<.05
    ## 5          * 0.7356693 0.0005644309         *
    ## 9          * 0.8198864 0.0030908299         *
    ## 10           0.9812649 0.0459173788         *
    ## 11           1.1091895 0.2692837206          
    ## 13           0.9669967 0.1072923734          
    ## 14           1.1063000 0.0903837924          
    ## 15           0.9660585 0.6407977177          
    ## 16           1.1175964 0.8572592261

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

|     | Effect                            | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:----------------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | nontargetContrast                 |   1 |  14 |  0.6361023 | 0.4384445 |        | 0.0011421 |
| 3   | Target                            |   1 |  14 | 15.3329746 | 0.0015529 | \*     | 0.0481400 |
| 4   | Validity                          |   2 |  28 | 12.5795215 | 0.0001265 | \*     | 0.0755057 |
| 5   | nontargetContrast:Target          |   1 |  14 |  1.6828620 | 0.2155155 |        | 0.0019053 |
| 6   | nontargetContrast:Validity        |   2 |  28 |  0.4511360 | 0.6414528 |        | 0.0006867 |
| 7   | Target:Validity                   |   2 |  28 |  2.1320399 | 0.1374493 |        | 0.0042161 |
| 8   | nontargetContrast:Target:Validity |   2 |  28 |  0.3951855 | 0.6772528 |        | 0.0004785 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.6007169 | 0.0364212 | \*     |
| 6   | nontargetContrast:Validity        | 0.8473298 | 0.3406758 |        |
| 7   | Target:Validity                   | 0.9498130 | 0.7155625 |        |
| 8   | nontargetContrast:Target:Validity | 0.9338166 | 0.6407675 |        |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.7146517 | 0.0007947 | \*           | 0.7732090 | 0.0005440 | \*           |
| 6   | nontargetContrast:Validity        | 0.8675509 | 0.6147115 |              | 0.9794833 | 0.6375455 |              |
| 7   | Target:Validity                   | 0.9522113 | 0.1402746 |              | 1.0981840 | 0.1374493 |              |
| 8   | nontargetContrast:Target:Validity | 0.9379250 | 0.6644626 |              | 1.0779209 | 0.6772528 |              |

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
| 2   | nontargetContrast          |   1 |  14 |  0.0338669 | 0.8566292 |        | 0.0000834 |
| 3   | Validity                   |   2 |  28 | 10.9706467 | 0.0003032 | \*     | 0.0897948 |
| 4   | nontargetContrast:Validity |   2 |  28 |  0.7653353 | 0.4746638 |        | 0.0018146 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9278990 | 0.6148293 |        |
| 4   | nontargetContrast:Validity | 0.9381653 | 0.6604135 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity                   | 0.9327479 | 0.0004419 | \*           | 1.070601 | 0.0003032 | \*           |
| 4   | nontargetContrast:Validity | 0.9417662 | 0.4679613 |              | 1.083360 | 0.4746638 |              |

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
| 2   | nontargetContrast          |   1 |  14 | 2.0132619 | 0.1778082 |        | 0.0071853 |
| 3   | Validity                   |   2 |  28 | 8.7621529 | 0.0011087 | \*     | 0.0636164 |
| 4   | nontargetContrast:Validity |   2 |  28 | 0.0761764 | 0.9268441 |        | 0.0002468 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.4011525 | 0.0026394 | \*     |
| 4   | nontargetContrast:Validity | 0.7815806 | 0.2015252 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.6254505 | 0.0058716 | \*           | 0.6574392 | 0.0050860 | \*           |
| 4   | nontargetContrast:Validity | 0.8207354 | 0.8942378 |              | 0.9152409 | 0.9130523 |              |

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

|     | Effect                            | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:----------------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | nontargetContrast                 |   1 |  14 | 31.7880386 | 0.0000612 | \*     | 0.1186080 |
| 3   | Target                            |   1 |  14 | 18.2932475 | 0.0007669 | \*     | 0.0290031 |
| 4   | Validity                          |   2 |  28 |  3.4561302 | 0.0455534 | \*     | 0.0070979 |
| 5   | nontargetContrast:Target          |   1 |  14 |  4.5210391 | 0.0517508 |        | 0.0093380 |
| 6   | nontargetContrast:Validity        |   2 |  28 |  6.7854994 | 0.0039550 | \*     | 0.0123801 |
| 7   | Target:Validity                   |   2 |  28 |  1.2712029 | 0.2961877 |        | 0.0017595 |
| 8   | nontargetContrast:Target:Validity |   2 |  28 |  0.2688519 | 0.7662069 |        | 0.0002847 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.7754116 | 0.1914079 |        |
| 6   | nontargetContrast:Validity        | 0.9429983 | 0.6828429 |        |
| 7   | Target:Validity                   | 0.8487954 | 0.3445242 |        |
| 8   | nontargetContrast:Target:Validity | 0.6338412 | 0.0516265 |        |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.8166009 | 0.0571537 |              | 0.9096141 | 0.0509388 |              |
| 6   | nontargetContrast:Validity        | 0.9460722 | 0.0047207 | \*           | 1.0894649 | 0.0039550 | \*           |
| 7   | Target:Validity                   | 0.8686554 | 0.2942840 |              | 0.9810108 | 0.2959814 |              |
| 8   | nontargetContrast:Target:Validity | 0.7319793 | 0.6979913 |              | 0.7960798 | 0.7166433 |              |

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

|     | Effect                     | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |  14 | 21.9056547 | 0.0003541 | \*     | 0.1489080 |
| 3   | Validity                   |   2 |  28 |  0.7789085 | 0.4685970 |        | 0.0028396 |
| 4   | nontargetContrast:Validity |   2 |  28 |  2.8528921 | 0.0745333 |        | 0.0082325 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.8425449 | 0.3283634 |        |
| 4   | nontargetContrast:Validity | 0.7179918 | 0.1160851 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.8639644 | 0.4527186 |              | 0.9745271 | 0.4658010 |              |
| 4   | nontargetContrast:Validity | 0.7800262 | 0.0900093 |              | 0.8601638 | 0.0840519 |              |

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
| 2   | nontargetContrast          |   1 |  14 | 25.882013 | 0.0001655 | \*     | 0.0863539 |
| 3   | Validity                   |   2 |  28 |  5.935536 | 0.0070958 | \*     | 0.0182603 |
| 4   | nontargetContrast:Validity |   2 |  28 |  6.905484 | 0.0036488 | \*     | 0.0196474 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.7060485 | 0.1040937 |        |
| 4   | nontargetContrast:Validity | 0.6187481 | 0.0441408 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity                   | 0.7728265 | 0.0133593 | \*           | 0.850498 | 0.0107519 | \*           |
| 4   | nontargetContrast:Validity | 0.7239809 | 0.0092534 | \*           | 0.785507 | 0.0075114 | \*           |

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

|     | Effect                         | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:-------------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | targetContrast                 |   1 |  14 | 20.1729614 | 0.0005074 | \*     | 0.0700422 |
| 3   | Target                         |   1 |  14 | 28.1212044 | 0.0001116 | \*     | 0.0427594 |
| 4   | Validity                       |   2 |  28 | 11.6987622 | 0.0002028 | \*     | 0.0547261 |
| 5   | targetContrast:Target          |   1 |  14 |  0.0604257 | 0.8093915 |        | 0.0001038 |
| 6   | targetContrast:Validity        |   2 |  28 |  3.1551130 | 0.0581142 |        | 0.0065383 |
| 7   | Target:Validity                |   2 |  28 |  1.3077869 | 0.2864302 |        | 0.0022924 |
| 8   | targetContrast:Target:Validity |   2 |  28 |  2.1923542 | 0.1304525 |        | 0.0020765 |

</td>
<td>

|     | Effect                         |         W |         p | p\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------|
| 4   | Validity                       | 0.4733259 | 0.0077365 | \*     |
| 6   | targetContrast:Validity        | 0.5841752 | 0.0303760 | \*     |
| 7   | Target:Validity                | 0.6448387 | 0.0577341 |        |
| 8   | targetContrast:Target:Validity | 0.9886914 | 0.9287419 |        |

</td>
<td>

|     | Effect                         |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                       | 0.6550186 | 0.0016120 | \*           | 0.6954536 | 0.0012620 | \*           |
| 6   | targetContrast:Validity        | 0.7063021 | 0.0790050 |              | 0.7622332 | 0.0745392 |              |
| 7   | Target:Validity                | 0.7379195 | 0.2827415 |              | 0.8039495 | 0.2842157 |              |
| 8   | targetContrast:Target:Validity | 0.9888179 | 0.1311289 |              | 1.1505448 | 0.1304525 |              |

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
| 2   | targetContrast          |   1 |  14 | 10.302342 | 0.0062975 | \*     | 0.0572463 |
| 3   | Validity                |   2 |  28 |  9.314356 | 0.0007926 | \*     | 0.0532609 |
| 4   | targetContrast:Validity |   2 |  28 |  5.735588 | 0.0081713 | \*     | 0.0133683 |

</td>
<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.6919141 | 0.0912723 |        |
| 4   | targetContrast:Validity | 0.8827565 | 0.4445965 |        |

</td>
<td>

|     | Effect                  |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                | 0.7644758 | 0.0024203 | \*           | 0.8393149 | 0.0016952 | \*           |
| 4   | targetContrast:Validity | 0.8950600 | 0.0107969 | \*           | 1.0176923 | 0.0081713 | \*           |

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

|     | Effect                  | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | targetContrast          |   1 |  14 | 19.6353712 | 0.0005696 | \*     | 0.0870137 |
| 3   | Validity                |   2 |  28 |  8.6131677 | 0.0012154 | \*     | 0.0614869 |
| 4   | targetContrast:Validity |   2 |  28 |  0.5197562 | 0.6002912 |        | 0.0020463 |

</td>
<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.1213832 | 0.0000011 | \*     |
| 4   | targetContrast:Validity | 0.6725532 | 0.0758968 |        |

</td>
<td>

|     | Effect                  |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                | 0.5323065 | 0.0094172 | \*           | 0.5399605 | 0.0091033 | \*           |
| 4   | targetContrast:Validity | 0.7533259 | 0.5516547 |              | 0.8244298 | 0.5670585 |              |

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

|     | Effect                         | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:-------------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | targetContrast                 |   1 |  14 | 37.0484795 | 0.0000281 | \*     | 0.2420806 |
| 3   | Target                         |   1 |  14 | 12.4418828 | 0.0033485 | \*     | 0.0345826 |
| 4   | Validity                       |   2 |  28 |  9.4862499 | 0.0007152 | \*     | 0.0241868 |
| 5   | targetContrast:Target          |   1 |  14 |  6.7854335 | 0.0207787 | \*     | 0.0151338 |
| 6   | targetContrast:Validity        |   2 |  28 |  8.9352572 | 0.0009971 | \*     | 0.0297986 |
| 7   | Target:Validity                |   2 |  28 |  0.6254785 | 0.5423146 |        | 0.0012082 |
| 8   | targetContrast:Target:Validity |   2 |  28 |  1.5161070 | 0.2370466 |        | 0.0018868 |

</td>
<td>

|     | Effect                         |         W |         p | p\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------|
| 4   | Validity                       | 0.7912458 | 0.2182852 |        |
| 6   | targetContrast:Validity        | 0.8896962 | 0.4678120 |        |
| 7   | Target:Validity                | 0.9663030 | 0.8002701 |        |
| 8   | targetContrast:Target:Validity | 0.8781580 | 0.4297564 |        |

</td>
<td>

|     | Effect                         |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                       | 0.8272981 | 0.0016458 | \*           | 0.9241878 | 0.0010303 | \*           |
| 6   | targetContrast:Validity        | 0.9006544 | 0.0015617 | \*           | 1.0255048 | 0.0009971 | \*           |
| 7   | Target:Validity                | 0.9674015 | 0.5374535 |              | 1.1198343 | 0.5423146 |              |
| 8   | targetContrast:Target:Validity | 0.8913911 | 0.2390440 |              | 1.0125765 | 0.2370466 |              |

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
| 2   | targetContrast          |   1 |  14 | 29.898381 | 0.0000829 | \*     | 0.2774377 |
| 3   | Validity                |   2 |  28 |  5.105877 | 0.0128663 | \*     | 0.0265357 |
| 4   | targetContrast:Validity |   2 |  28 |  6.996513 | 0.0034335 | \*     | 0.0371916 |

</td>
<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.9962422 | 0.9758255 |        |
| 4   | targetContrast:Validity | 0.9759264 | 0.8535146 |        |

</td>
<td>

|     | Effect                  |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity                | 0.9962563 | 0.0129758 | \*           | 1.161263 | 0.0128663 | \*           |
| 4   | targetContrast:Validity | 0.9764923 | 0.0037195 | \*           | 1.132844 | 0.0034335 | \*           |

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
| 2   | targetContrast          |   1 |  14 | 33.057354 | 0.0000503 | \*     | 0.2032160 |
| 3   | Validity                |   2 |  28 |  7.338104 | 0.0027391 | \*     | 0.0233889 |
| 4   | targetContrast:Validity |   2 |  28 |  6.863480 | 0.0037530 | \*     | 0.0223321 |

</td>
<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.3728062 | 0.0016392 | \*     |
| 4   | targetContrast:Validity | 0.6990076 | 0.0975286 |        |

</td>
<td>

|     | Effect                  |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                | 0.6145549 | 0.0111251 | \*           | 0.6435201 | 0.0100034 | \*           |
| 4   | targetContrast:Validity | 0.7686440 | 0.0081330 | \*           | 0.8448931 | 0.0062968 | \*           |

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
| 2   | Target          |   1 |  14 | 11.903389 | 0.0039036 | \*     | 0.0323150 |
| 3   | Validity        |   2 |  28 |  9.426538 | 0.0007411 | \*     | 0.0786361 |
| 4   | Target:Validity |   2 |  28 |  1.879073 | 0.1714906 |        | 0.0052842 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.3315156 | 0.0007643 | \*     |
| 4   | Target:Validity | 0.9115086 | 0.5475769 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.5993463 | 0.0051141 | \*           | 0.6241702 | 0.0045319 | \*           |
| 4   | Target:Validity | 0.9187027 | 0.1754139 |              | 1.0508071 | 0.1714906 |              |

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
| 2   | Target          |   1 |  14 | 11.811353 | 0.0040088 | \*     | 0.0662423 |
| 3   | Validity        |   2 |  28 | 11.333916 | 0.0002477 | \*     | 0.0736199 |
| 4   | Target:Validity |   2 |  28 |  1.162475 | 0.3273491 |        | 0.0041159 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8303554 | 0.2986869 |        |
| 4   | Target:Validity | 0.8666133 | 0.3943344 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8549606 | 0.0005742 | \*           | 0.9621101 | 0.0003084 | \*           |
| 4   | Target:Validity | 0.8823114 | 0.3235758 |              | 0.9999423 | 0.3273475 |              |

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
| 2   | Target          |   1 |  14 | 15.270562 | 0.0015775 | \*     | 0.0586171 |
| 3   | Validity        |   2 |  28 |  8.240643 | 0.0015337 | \*     | 0.0313725 |
| 4   | Target:Validity |   2 |  28 |  1.167870 | 0.3257228 |        | 0.0029344 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9085721 | 0.5362114 |        |
| 4   | Target:Validity | 0.5825293 | 0.0298240 | \*     |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.9162309 | 0.0021669 | \*           | 1.0473330 | 0.0015337 | \*           |
| 4   | Target:Validity | 0.7054820 | 0.3140282 |              | 0.7611567 | 0.3169681 |              |

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
| 2   | Target          |   1 |  14 | 2.1528685 | 0.1644072 |        | 0.0068643 |
| 3   | Validity        |   2 |  28 | 0.4553190 | 0.6388589 |        | 0.0017704 |
| 4   | Target:Validity |   2 |  28 | 0.3351905 | 0.7180322 |        | 0.0007843 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9124000 | 0.5510669 |        |
| 4   | Target:Validity | 0.9757874 | 0.8527246 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity        | 0.9194557 | 0.6231185 |              | 1.051866 | 0.6388589 |              |
| 4   | Target:Validity | 0.9763598 | 0.7130432 |              | 1.132654 | 0.7180322 |              |

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
| 2   | Validity |   2 |  28 | 10.89991 | 0.0003155 | \*     | 0.0970449 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.6901815 | 0.0897969 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7634645 | 0.0011823 | \*           | 0.8379627 | 0.0007787 | \*           |

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

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |    ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|-------:|
| 2   | Validity |   2 |  28 | 7.458404 | 0.0025318 | \*     | 0.0863 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9755559 | 0.8514107 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9761392 | 0.0027637 | \*           | 1.132338 | 0.0025318 | \*           |

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
| 2   | Validity |   2 |  28 | 2.795039 | 0.0782093 |        | 0.0175516 |

</td>
<td>

|     | Effect   |         W |        p | p\<.05 |
|:----|:---------|----------:|---------:|:-------|
| 2   | Validity | 0.8931912 | 0.479887 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9034984 | 0.0846854 |              | 1.029482 | 0.0782093 |              |

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
| 2   | Validity |   2 |  28 | 0.2564762 | 0.7755714 |        | 0.0017433 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9092143 | 0.5386799 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9167704 | 0.7568974 |              | 1.048091 | 0.7755714 |              |

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
| 2   | Validity |   2 |  28 | 4.884575 | 0.0151458 | \*     | 0.0655095 |

</td>
<td>

|     | Effect   |         W |        p | p\<.05 |
|:----|:---------|----------:|---------:|:-------|
| 2   | Validity | 0.1825145 | 1.58e-05 | \*     |

</td>
<td>

|     | Effect   |       GGe |  p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|---------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.5502107 | 0.039732 | \*           | 0.5622789 | 0.0387142 | \*           |

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
| 2   | Validity |   2 |  28 | 9.212185 | 0.0008429 | \*     | 0.0619122 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.4522305 | 0.0057523 | \*     |

</td>
<td>

|     | Effect   |      GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|---------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.646091 | 0.0044444 | \*           | 0.6839385 | 0.0037151 | \*           |

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
| 2   | Validity |   2 |  28 | 9.632694 | 0.0006556 | \*     | 0.0592925 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.6255915 | 0.0474123 | \*     |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7275857 | 0.0025025 | \*           | 0.7902688 | 0.0018358 | \*           |

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

|     | Effect   | DFn | DFd |         F |         p | p\<.05 |      ges |
|:----|:---------|----:|----:|----------:|----------:|:-------|---------:|
| 2   | Validity |   2 |  28 | 0.7284786 | 0.4915662 |        | 0.003855 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7555651 | 0.1617213 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.8035776 | 0.4651631 |              | 0.8919392 | 0.4777584 |              |

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

|     | Effect                                    | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:------------------------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | targetContrast                            |   1 |  14 | 25.473731 | 0.0001783 | \*     | 0.1571654 |
| 3   | nontargetContrast                         |   1 |  14 | 12.168294 | 0.0036183 | \*     | 0.0292343 |
| 4   | Validity                                  |   2 |  28 |  9.470796 | 0.0007218 | \*     | 0.0379401 |
| 5   | targetContrast:nontargetContrast          |   1 |  14 | 16.868132 | 0.0010673 | \*     | 0.0326873 |
| 6   | targetContrast:Validity                   |   2 |  28 |  8.418130 | 0.0013721 | \*     | 0.0236777 |
| 7   | nontargetContrast:Validity                |   2 |  28 |  1.639593 | 0.2121468 |        | 0.0025020 |
| 8   | targetContrast:nontargetContrast:Validity |   2 |  28 |  1.610436 | 0.2177619 |        | 0.0016728 |

</td>
<td>

|     | Effect                                    |         W |         p | p\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------|
| 4   | Validity                                  | 0.8464192 | 0.3383030 |        |
| 6   | targetContrast:Validity                   | 0.8975439 | 0.4952927 |        |
| 7   | nontargetContrast:Validity                | 0.9975739 | 0.9843354 |        |
| 8   | targetContrast:nontargetContrast:Validity | 0.9481214 | 0.7073194 |        |

</td>
<td>

|     | Effect                                    |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                                  | 0.8668660 | 0.0013699 | \*           | 0.9785365 | 0.0008001 | \*           |
| 6   | targetContrast:Validity                   | 0.9070656 | 0.0020324 | \*           | 1.0344756 | 0.0013721 | \*           |
| 7   | nontargetContrast:Validity                | 0.9975798 | 0.2122244 |              | 1.1631722 | 0.2121468 |              |
| 8   | targetContrast:nontargetContrast:Validity | 0.9506800 | 0.2191876 |              | 1.0960075 | 0.2177619 |              |

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

|     | Effect                                    | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:------------------------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | targetContrast                            |   1 |  14 | 32.385519 | 0.0000558 | \*     | 0.1386925 |
| 3   | nontargetContrast                         |   1 |  14 | 12.520144 | 0.0032756 | \*     | 0.0297453 |
| 4   | Validity                                  |   2 |  28 | 11.076754 | 0.0002858 | \*     | 0.0406901 |
| 5   | targetContrast:nontargetContrast          |   1 |  14 |  5.099199 | 0.0404283 | \*     | 0.0059073 |
| 6   | targetContrast:Validity                   |   2 |  28 |  3.765201 | 0.0356296 | \*     | 0.0088449 |
| 7   | nontargetContrast:Validity                |   2 |  28 |  2.434228 | 0.1059991 |        | 0.0044322 |
| 8   | targetContrast:nontargetContrast:Validity |   2 |  28 |  1.890396 | 0.1697878 |        | 0.0024482 |

</td>
<td>

|     | Effect                                    |         W |         p | p\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------|
| 4   | Validity                                  | 0.3176385 | 0.0005788 | \*     |
| 6   | targetContrast:Validity                   | 0.6456920 | 0.0582324 |        |
| 7   | nontargetContrast:Validity                | 0.4348954 | 0.0044617 | \*     |
| 8   | targetContrast:nontargetContrast:Validity | 0.7829863 | 0.2038929 |        |

</td>
<td>

|     | Effect                                    |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                                  | 0.5944026 | 0.0028843 | \*           | 0.6179001 | 0.0025194 | \*           |
| 6   | targetContrast:Validity                   | 0.7383845 | 0.0518315 |              | 0.8045661 | 0.0471368 | \*           |
| 7   | nontargetContrast:Validity                | 0.6389349 | 0.1311051 |              | 0.6747316 | 0.1285009 |              |
| 8   | targetContrast:nontargetContrast:Validity | 0.8216835 | 0.1784106 |              | 0.9165322 | 0.1738683 |              |

</td>
</tr>
</tbody>
</table>

### paired t-tests

## accuracy by target and nontarget

# PresentPresent

<img src="tazoot_AccRT_files/figure-gfm/vi_accPP T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accPP T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/ni_accPP T1-1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_files/figure-gfm/vi_accPP T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accPP T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/ni_accPP T2-1.png" width="90%" />
\# PresentAbsent
<img src="tazoot_AccRT_files/figure-gfm/vi_accPA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accPA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_accPA T1-1.png" width="90%" />
\#T2
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
