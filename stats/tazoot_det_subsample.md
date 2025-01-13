tazoot_det_subsample
================
Jenny
2025-01-07

    ## R Markdown

    This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

    When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:
      

## anovas

\#dprime

``` r
## det dprime sub
d = data 
detdPrime_anova = ezANOVA(
  data = d,
  dv = .(det_dPrime_sub),
  wid = .(SID),
  within = .(Target, nontargetContrast, Validity)
)
knitr::kable(detdPrime_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect                            | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:----------------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | Target                            |   1 |  14 |  6.8416646 | 0.0203474 | \*     | 0.0327805 |
| 3   | nontargetContrast                 |   1 |  14 | 10.7222970 | 0.0055363 | \*     | 0.0906097 |
| 4   | Validity                          |   2 |  28 |  0.2264695 | 0.7987899 |        | 0.0011747 |
| 5   | Target:nontargetContrast          |   1 |  14 |  8.2368190 | 0.0123530 | \*     | 0.0620105 |
| 6   | Target:Validity                   |   2 |  28 |  1.3222797 | 0.2826605 |        | 0.0061309 |
| 7   | nontargetContrast:Validity        |   2 |  28 |  7.3240178 | 0.0027646 | \*     | 0.0238396 |
| 8   | Target:nontargetContrast:Validity |   2 |  28 |  1.5362195 | 0.2327864 |        | 0.0112662 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.9500135 | 0.7165451 |        |
| 6   | Target:Validity                   | 0.6993036 | 0.0977974 |        |
| 7   | nontargetContrast:Validity        | 0.3535619 | 0.0011615 | \*     |
| 8   | Target:nontargetContrast:Validity | 0.8238327 | 0.2837615 |        |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.9523932 | 0.7884088 |              | 1.0984426 | 0.7987899 |              |
| 6   | Target:Validity                   | 0.7688189 | 0.2802301 |              | 0.8451274 | 0.2814819 |              |
| 7   | nontargetContrast:Validity        | 0.6073717 | 0.0114913 | \*           | 0.6343694 | 0.0104095 | \*           |
| 8   | Target:nontargetContrast:Validity | 0.8502191 | 0.2357273 |              | 0.9555859 | 0.2337545 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det dprime filtered nontarget present
d = data %>% filter(nontargetContrast==1)

detdPrimeNP_anova = ezANOVA(
  data = d,
  dv = .(det_dPrime_sub),
  wid = .(SID),
  within = .(Target, Validity)
)
knitr::kable(detdPrimeNP_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect          | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |  14 | 0.3973723 | 0.5386035 |        | 0.0040252 |
| 3   | Validity        |   2 |  28 | 1.7990749 | 0.1840557 |        | 0.0125432 |
| 4   | Target:Validity |   2 |  28 | 0.5142673 | 0.6034772 |        | 0.0065871 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8944021 | 0.4841315 |        |
| 4   | Target:Validity | 0.8945608 | 0.4846902 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity        | 0.9044880 | 0.1881837 |              | 1.030867 | 0.1840557 |              |
| 4   | Target:Validity | 0.9046179 | 0.5860483 |              | 1.031048 | 0.6034772 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det dprime filtered nontarget present T1
d = data %>% filter(nontargetContrast==1, Target == 1)

detdPrimeNP_T1_anova = ezANOVA(
  data = d,
  dv = .(det_dPrime_sub),
  wid = .(SID),
  within = .( Validity)
)
knitr::kable(detdPrimeNP_T1_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 2.529854 | 0.0977297 |        | 0.0445597 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8651009 | 0.3898827 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.8811356 | 0.1057206 |              | 0.9983089 | 0.0978394 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det dprime filtered nontarget present T2
d = data %>% filter(nontargetContrast==1, Target == 2)

detdPrimeNP_T2_anova = ezANOVA(
  data = d,
  dv = .(det_dPrime_sub),
  wid = .(SID),
  within = .( Validity)
)
knitr::kable(detdPrimeNP_T2_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 0.0444149 | 0.9566243 |        | 0.0009309 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9198104 | 0.5808168 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9257634 | 0.9475828 |              | 1.060747 | 0.9566243 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det dprime filtered nontarget absent
d = data %>% filter(nontargetContrast==2)

detdPrimeNA_anova = ezANOVA(
  data = d,
  dv = .(det_dPrime_sub),
  wid = .(SID),
  within = .(Target, Validity)
)
knitr::kable(detdPrimeNA_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect          | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |  14 | 15.522884 | 0.0014808 | \*     | 0.2224108 |
| 3   | Validity        |   2 |  28 |  4.449427 | 0.0209910 | \*     | 0.0481596 |
| 4   | Target:Validity |   2 |  28 |  3.687570 | 0.0378825 | \*     | 0.0373106 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.6745345 | 0.0773619 |        |
| 4   | Target:Validity | 0.8241816 | 0.2845437 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.7544519 | 0.0331822 | \*           | 0.8259307 | 0.0290289 | \*           |
| 4   | Target:Validity | 0.8504715 | 0.0465818 | \*           | 0.9559328 | 0.0402586 | \*           |

</td>
</tr>
</tbody>
</table>

``` r
## det dprime filtered nontarget absent T1
d = data %>% filter(nontargetContrast==2, Target == 1)
    
detdPrimeNA_T1_anova = ezANOVA(
  data = d,
  dv = .(det_dPrime_sub),
  wid = .(SID),
  within = .( Validity)
)
knitr::kable(detdPrimeNA_T1_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 4.542403 | 0.0195645 | \*     | 0.1020858 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.5069029 | 0.0120784 | \*     |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.6697488 | 0.0369561 | \*           | 0.7145239 | 0.0338912 | \*           |

</td>
</tr>
</tbody>
</table>

``` r
## det dprime filtered nontarget absent T2
d = data %>% filter(nontargetContrast==2, Target == 2)

detdPrimeNA_T2_anova = ezANOVA(
  data = d,
  dv = .(det_dPrime_sub),
  wid = .(SID),
  within = .( Validity)
)
knitr::kable(detdPrimeNA_T2_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |      F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|-------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 2.7368 | 0.0821067 |        | 0.0419092 |

</td>
<td>

|     | Effect   |        W |        p | p\<.05 |
|:----|:---------|---------:|---------:|:-------|
| 2   | Validity | 0.835175 | 0.310137 |        |

</td>
<td>

|     | Effect   |      GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|---------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.858498 | 0.0917868 |              | 0.9669842 | 0.0842747 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det dprime filtered T1
d = data %>% filter(Target==1)

detdPrimeT1_anova = ezANOVA(
  data = d,
  dv = .(det_dPrime_sub),
  wid = .(SID),
  within = .(nontargetContrast, Validity)
)
knitr::kable(detdPrimeT1_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect                     | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |  14 | 0.3148069 | 0.5836149 |        | 0.0035021 |
| 3   | Validity                   |   2 |  28 | 1.3236195 | 0.2823147 |        | 0.0106778 |
| 4   | nontargetContrast:Validity |   2 |  28 | 4.9965995 | 0.0139422 | \*     | 0.0622359 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.7663108 | 0.1772688 |        |
| 4   | nontargetContrast:Validity | 0.6038133 | 0.0376589 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.8105769 | 0.2806733 |              | 0.9014293 | 0.2817665 |              |
| 4   | nontargetContrast:Validity | 0.7162366 | 0.0260982 | \*           | 0.7752957 | 0.0228916 | \*           |

</td>
</tr>
</tbody>
</table>

``` r
## det dprime filtered T2
d = data %>% filter(Target==2)

detdPrimeT2_anova = ezANOVA(
  data = d,
  dv = .(det_dPrime_sub),
  wid = .(SID),
  within = .(nontargetContrast, Validity)
)
knitr::kable(detdPrimeT2_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect                     | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |  14 | 13.8115804 | 0.0023014 | \*     | 0.2424596 |
| 3   | Validity                   |   2 |  28 |  0.3541052 | 0.7048988 |        | 0.0040484 |
| 4   | nontargetContrast:Validity |   2 |  28 |  0.8098278 | 0.4550849 |        | 0.0067125 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9569467 | 0.7512255 |        |
| 4   | nontargetContrast:Validity | 0.8192233 | 0.2735993 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity                   | 0.9587238 | 0.6962069 |              | 1.107453 | 0.7048988 |              |
| 4   | nontargetContrast:Validity | 0.8469002 | 0.4382382 |              | 0.951025 | 0.4500140 |              |

</td>
</tr>
</tbody>
</table>

\#criterion

``` r
## det crit sub
d = data 
detcrit_anova = ezANOVA(
  data = d,
  dv = .(det_crit_sub),
  wid = .(SID),
  within = .(Target, nontargetContrast, Validity)
)
knitr::kable(detcrit_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect                            | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:----------------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | Target                            |   1 |  14 |  9.7051217 | 0.0075979 | \*     | 0.0652055 |
| 3   | nontargetContrast                 |   1 |  14 | 58.2516058 | 0.0000024 | \*     | 0.6092377 |
| 4   | Validity                          |   2 |  28 |  8.9208563 | 0.0010059 | \*     | 0.0329584 |
| 5   | Target:nontargetContrast          |   1 |  14 |  5.0939346 | 0.0405173 | \*     | 0.0199590 |
| 6   | Target:Validity                   |   2 |  28 |  2.9358927 | 0.0695792 |        | 0.0161019 |
| 7   | nontargetContrast:Validity        |   2 |  28 |  0.7822625 | 0.4671107 |        | 0.0050628 |
| 8   | Target:nontargetContrast:Validity |   2 |  28 |  0.3752641 | 0.6905114 |        | 0.0024029 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.9699882 | 0.8203176 |        |
| 6   | Target:Validity                   | 0.8608206 | 0.3775133 |        |
| 7   | nontargetContrast:Validity        | 0.9126795 | 0.5521650 |        |
| 8   | Target:nontargetContrast:Validity | 0.7051752 | 0.1032597 |        |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.9708627 | 0.0011469 | \*           | 1.1247828 | 0.0010059 | \*           |
| 6   | Target:Validity                   | 0.8778249 | 0.0777735 |              | 0.9937133 | 0.0699792 |              |
| 7   | nontargetContrast:Validity        | 0.9196920 | 0.4580979 |              | 1.0521984 | 0.4671107 |              |
| 8   | Target:nontargetContrast:Validity | 0.7723053 | 0.6379235 |              | 0.8497991 | 0.6574128 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det crit filtered nontarget present
d = data %>% filter(nontargetContrast==1)

detcritNP_anova = ezANOVA(
  data = d,
  dv = .(det_crit_sub),
  wid = .(SID),
  within = .(Target, Validity)
)
knitr::kable(detcritNP_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect          | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Target          |   1 |  14 | 1.311294 | 0.2713598 |        | 0.0099349 |
| 3   | Validity        |   2 |  28 | 1.051044 | 0.3629609 |        | 0.0094974 |
| 4   | Target:Validity |   2 |  28 | 2.161005 | 0.1340402 |        | 0.0196796 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.7796792 | 0.1983597 |        |
| 4   | Target:Validity | 0.5945497 | 0.0340583 | \*     |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8194566 | 0.3527956 |              | 0.9134997 | 0.3584872 |              |
| 4   | Target:Validity | 0.7115157 | 0.1516562 |              | 0.7690832 | 0.1481246 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det crit filtered nontarget present T1
d = data %>% filter(nontargetContrast==1, Target == 1)

detcritNP_T1_anova = ezANOVA(
  data = d,
  dv = .(det_crit_sub),
  wid = .(SID),
  within = .( Validity)
)
knitr::kable(detcritNP_T1_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 2.682305 | 0.0859424 |        | 0.0583449 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.6251539 | 0.0471971 | \*     |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7273542 | 0.1054204 |              | 0.7899627 | 0.1006457 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det crit filtered nontarget present T2
d = data %>% filter(nontargetContrast==1, Target == 2)

detcritNP_T2_anova = ezANOVA(
  data = d,
  dv = .(det_crit_sub),
  wid = .(SID),
  within = .( Validity)
)
knitr::kable(detcritNP_T2_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 0.1296941 | 0.8788887 |        | 0.0018613 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7766794 | 0.1934513 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.8174472 | 0.8388319 |              | 0.9107652 | 0.8609527 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det crit filtered nontarget absent
d = data %>% filter(nontargetContrast==2)

detcritNA_anova = ezANOVA(
  data = d,
  dv = .(det_crit_sub),
  wid = .(SID),
  within = .(Target, Validity)
)
knitr::kable(detcritNA_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect          | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |  14 | 14.8683273 | 0.0017469 | \*     | 0.2375359 |
| 3   | Validity        |   2 |  28 |  8.8610754 | 0.0010434 | \*     | 0.1079057 |
| 4   | Target:Validity |   2 |  28 |  0.7796851 | 0.4682524 |        | 0.0149510 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9512396 | 0.7225776 |        |
| 4   | Target:Validity | 0.8730236 | 0.4136841 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity        | 0.9535066 | 0.0012844 | \*           | 1.100026 | 0.0010434 | \*           |
| 4   | Target:Validity | 0.8873300 | 0.4553005 |              | 1.006921 | 0.4682524 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det crit filtered nontarget absent T1
d = data %>% filter(nontargetContrast==2, Target == 1)

detcritNA_T1_anova = ezANOVA(
  data = d,
  dv = .(det_crit_sub),
  wid = .(SID),
  within = .( Validity)
)
knitr::kable(detcritNA_T1_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |       F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|--------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 5.62462 | 0.0088425 | \*     | 0.1442058 |

</td>
<td>

|     | Effect   |         W |        p | p\<.05 |
|:----|:---------|----------:|---------:|:-------|
| 2   | Validity | 0.8815233 | 0.440575 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.8940732 | 0.0116307 | \*           | 1.016316 | 0.0088425 | \*           |

</td>
</tr>
</tbody>
</table>

``` r
## det crit filtered nontarget absent T2
d = data %>% filter(nontargetContrast==2, Target == 2)

detcritNA_T2_anova = ezANOVA(
  data = d,
  dv = .(det_crit_sub),
  wid = .(SID),
  within = .( Validity)
)
knitr::kable(detcritNA_T2_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 1.890861 | 0.1697182 |        | 0.0689635 |

</td>
<td>

|     | Effect   |         W |        p | p\<.05 |
|:----|:---------|----------:|---------:|:-------|
| 2   | Validity | 0.9018713 | 0.511022 |        |

</td>
<td>

|     | Effect   |     GGe |  p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|--------:|---------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.91064 | 0.174087 |              | 1.039485 | 0.1697182 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det crit filtered T1
d = data %>% filter(Target==1)

detcritT1_anova = ezANOVA(
  data = d,
  dv = .(det_crit_sub),
  wid = .(SID),
  within = .(nontargetContrast, Validity)
)
knitr::kable(detcritT1_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect                     | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |  14 | 54.618592 | 0.0000034 | \*     | 0.6530319 |
| 3   | Validity                   |   2 |  28 |  9.233543 | 0.0008321 | \*     | 0.0864816 |
| 4   | nontargetContrast:Validity |   2 |  28 |  0.227876 | 0.7976851 |        | 0.0034461 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9779131 | 0.8648715 |        |
| 4   | nontargetContrast:Validity | 0.7024133 | 0.1006590 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.9783903 | 0.0009205 | \*           | 1.1355647 | 0.0008321 | \*           |
| 4   | nontargetContrast:Validity | 0.7706614 | 0.7406199 |              | 0.8475957 | 0.7618864 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det crit filtered T2
d = data %>% filter(Target==2)

detcritT2_anova = ezANOVA(
  data = d,
  dv = .(det_crit_sub),
  wid = .(SID),
  within = .(nontargetContrast, Validity)
)
knitr::kable(detcritT2_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect                     | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |  14 | 46.8922921 | 0.0000080 | \*     | 0.5573326 |
| 3   | Validity                   |   2 |  28 |  0.4272688 | 0.6564698 |        | 0.0036128 |
| 4   | nontargetContrast:Validity |   2 |  28 |  1.1171109 | 0.3413731 |        | 0.0116369 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.7139451 | 0.1118978 |        |
| 4   | nontargetContrast:Validity | 0.8125554 | 0.2594444 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.7775718 | 0.6078891 |              | 0.8568662 | 0.6266109 |              |
| 4   | nontargetContrast:Validity | 0.8421445 | 0.3347212 |              | 0.9444983 | 0.3392768 |              |

</td>
</tr>
</tbody>
</table>

#### t-tests

\###dprime \## nontarget present \#T1
<img src="tazoot_det_subsample_files/figure-gfm/vi_detdNTP T1-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/vn_detdNTP T1-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/in_detdNTP T1-1.png" width="90%" />

\#T2
<img src="tazoot_det_subsample_files/figure-gfm/vi_detdNTP T2-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/vn_detdNTP T2-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/in_detdNTP T2-1.png" width="90%" />
\## nontarget absent \#T1
<img src="tazoot_det_subsample_files/figure-gfm/vi_detdNTA T1-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/vn_detdNTA T1-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/in_detdNTA T1-1.png" width="90%" />

\#T2
<img src="tazoot_det_subsample_files/figure-gfm/vi_detdNTA T2-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/in_detdNTA T2-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/vn_detdNTA T2-1.png" width="90%" />

\###criterion \## nontarget present \#T1
<img src="tazoot_det_subsample_files/figure-gfm/vi_detcritNTP T1-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/vn_detcritNTP T1-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/in_detcritNTP T1-1.png" width="90%" />

\#T2
<img src="tazoot_det_subsample_files/figure-gfm/vi_detcritNTP T2-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/vn_detcritNTP T2-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/in_detcritNTP T2-1.png" width="90%" />
\## nontarget absent \#T1
<img src="tazoot_det_subsample_files/figure-gfm/vi_detcritNTA T1-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/vn_detcritNTA T1-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/in_detcritNTA T1-1.png" width="90%" />

\#T2
<img src="tazoot_det_subsample_files/figure-gfm/vi_detcritNTA T2-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/vn_detcritNTA T2-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/in_detcritNTA T2-1.png" width="90%" />

## Including Plots

You can also embed plots, for example:

![](tazoot_det_subsample_files/figure-gfm/pressure-1.png)<!-- -->

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.
