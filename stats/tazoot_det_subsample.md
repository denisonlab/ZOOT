tazoot_det_subsample
================
Jenny
2025-01-07

    ## R Markdown

    This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

    When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:
      

### detection sub

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
| 2   | Target                            |   1 |  14 |  5.9040756 | 0.0291524 | \*     | 0.0274867 |
| 3   | nontargetContrast                 |   1 |  14 | 11.0944999 | 0.0049491 | \*     | 0.0959149 |
| 4   | Validity                          |   2 |  28 |  0.5047331 | 0.6090544 |        | 0.0023754 |
| 5   | Target:nontargetContrast          |   1 |  14 |  9.6492163 | 0.0077347 | \*     | 0.0689937 |
| 6   | Target:Validity                   |   2 |  28 |  1.2529269 | 0.3011951 |        | 0.0053235 |
| 7   | nontargetContrast:Validity        |   2 |  28 |  7.8409423 | 0.0019769 | \*     | 0.0270165 |
| 8   | Target:nontargetContrast:Validity |   2 |  28 |  1.8926509 | 0.1694508 |        | 0.0119548 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.9702860 | 0.8219556 |        |
| 6   | Target:Validity                   | 0.7114743 | 0.1094044 |        |
| 7   | nontargetContrast:Validity        | 0.5114282 | 0.0127968 | \*     |
| 8   | Target:nontargetContrast:Validity | 0.8579855 | 0.3695045 |        |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.9711434 | 0.6038887 |              | 1.1251844 | 0.6090544 |              |
| 6   | Target:Validity                   | 0.7760808 | 0.2964614 |              | 0.8548642 | 0.2985988 |              |
| 7   | nontargetContrast:Validity        | 0.6717849 | 0.0071641 | \*           | 0.7171669 | 0.0059879 | \*           |
| 8   | Target:nontargetContrast:Validity | 0.8756457 | 0.1755233 |              | 0.9906909 | 0.1699088 |              |

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
| 2   | Target          |   1 |  14 | 0.7899316 | 0.3891368 |        | 0.0076231 |
| 3   | Validity        |   2 |  28 | 1.6863897 | 0.2034560 |        | 0.0119708 |
| 4   | Target:Validity |   2 |  28 | 0.7295009 | 0.4910889 |        | 0.0080797 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9129583 | 0.5532624 |        |
| 4   | Target:Validity | 0.8833035 | 0.4463902 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity        | 0.9199279 | 0.2062611 |              | 1.052530 | 0.2034560 |              |
| 4   | Target:Validity | 0.8954985 | 0.4777894 |              | 1.018304 | 0.4910889 |              |

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
| 2   | Validity |   2 |  28 | 2.912284 | 0.0709514 |        | 0.0455534 |

</td>
<td>

|     | Effect   |        W |        p | p\<.05 |
|:----|:---------|---------:|---------:|:-------|
| 2   | Validity | 0.837577 | 0.315981 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.8602721 | 0.0804185 |              | 0.9694306 | 0.0729245 |              |

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
| 2   | Validity |   2 |  28 | 0.0171716 | 0.9829853 |        | 0.0003394 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9011881 | 0.5085111 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9100739 | 0.9767286 |              | 1.038691 | 0.9829853 |              |

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
| 2   | Target          |   1 |  14 | 17.291427 | 0.0009658 | \*     | 0.2476522 |
| 3   | Validity        |   2 |  28 |  6.770523 | 0.0039951 | \*     | 0.0683278 |
| 4   | Target:Validity |   2 |  28 |  4.199519 | 0.0254070 | \*     | 0.0382223 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8006943 | 0.2357945 |        |
| 4   | Target:Validity | 0.8771654 | 0.4266086 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8338157 | 0.0068931 | \*           | 0.9330921 | 0.0049735 | \*           |
| 4   | Target:Validity | 0.8906031 | 0.0306115 | \*           | 1.0114784 | 0.0254070 | \*           |

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
| 2   | Validity |   2 |  28 | 6.229805 | 0.0057797 | \*     | 0.1168661 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.6700046 | 0.0740467 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7518823 | 0.0120618 | \*           | 0.8225064 | 0.0097738 | \*           |

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

|     | Effect   | DFn | DFd |       F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|--------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 3.62388 | 0.0398448 | \*     | 0.0610157 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9698617 | 0.8196224 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9707435 | 0.0414382 | \*           | 1.124612 | 0.0398448 | \*           |

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
| 2   | nontargetContrast          |   1 |  14 | 0.2449138 | 0.6283554 |        | 0.0028142 |
| 3   | Validity                   |   2 |  28 | 1.6639507 | 0.2075746 |        | 0.0111656 |
| 4   | nontargetContrast:Validity |   2 |  28 | 6.1588228 | 0.0060713 | \*     | 0.0667651 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.8929136 | 0.4789181 |        |
| 4   | nontargetContrast:Validity | 0.6483608 | 0.0598148 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.9032718 | 0.2107605 |              | 1.0291649 | 0.2075746 |              |
| 4   | nontargetContrast:Validity | 0.7398424 | 0.0129878 | \*           | 0.8065001 | 0.0106785 | \*           |

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
| 2   | nontargetContrast          |   1 |  14 | 15.6795757 | 0.0014242 | \*     | 0.2660831 |
| 3   | Validity                   |   2 |  28 |  0.3620502 | 0.6994591 |        | 0.0040580 |
| 4   | nontargetContrast:Validity |   2 |  28 |  0.8898927 | 0.4219981 |        | 0.0072485 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9294953 | 0.6217371 |        |
| 4   | nontargetContrast:Validity | 0.8197805 | 0.2748111 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.9341388 | 0.6854800 |              | 1.0725668 | 0.6994591 |              |
| 4   | nontargetContrast:Validity | 0.8473000 | 0.4081926 |              | 0.9515741 | 0.4179045 |              |

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
| 2   | Target                            |   1 |  14 | 11.0441552 | 0.0050241 | \*     | 0.0716265 |
| 3   | nontargetContrast                 |   1 |  14 | 48.4813916 | 0.0000066 | \*     | 0.5769667 |
| 4   | Validity                          |   2 |  28 |  8.8895768 | 0.0010253 | \*     | 0.0333126 |
| 5   | Target:nontargetContrast          |   1 |  14 |  4.6027921 | 0.0499418 | \*     | 0.0192532 |
| 6   | Target:Validity                   |   2 |  28 |  3.4286001 | 0.0465712 | \*     | 0.0178954 |
| 7   | nontargetContrast:Validity        |   2 |  28 |  0.8214203 | 0.4501269 |        | 0.0046846 |
| 8   | Target:nontargetContrast:Validity |   2 |  28 |  0.4052610 | 0.6706511 |        | 0.0022277 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.9752741 | 0.8498134 |        |
| 6   | Target:Validity                   | 0.8669600 | 0.3953612 |        |
| 7   | nontargetContrast:Validity        | 0.9189412 | 0.5772583 |        |
| 8   | Target:nontargetContrast:Validity | 0.6813247 | 0.0825661 |        |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.9758707 | 0.0011425 | \*           | 1.1319529 | 0.0010253 | \*           |
| 6   | Target:Validity                   | 0.8825814 | 0.0537394 |              | 1.0003174 | 0.0465712 | \*           |
| 7   | nontargetContrast:Validity        | 0.9250191 | 0.4424618 |              | 1.0596976 | 0.4501269 |              |
| 8   | Target:nontargetContrast:Validity | 0.7583368 | 0.6159710 |              | 0.8311128 | 0.6340695 |              |

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
| 2   | Target          |   1 |  14 | 1.582992 | 0.2289099 |        | 0.0123587 |
| 3   | Validity        |   2 |  28 | 1.104517 | 0.3453797 |        | 0.0096458 |
| 4   | Target:Validity |   2 |  28 | 2.330292 | 0.1158450 |        | 0.0191606 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8372465 | 0.3151713 |        |
| 4   | Target:Validity | 0.6557720 | 0.0644012 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8600275 | 0.3392622 |              | 0.9690933 | 0.3441698 |              |
| 4   | Target:Validity | 0.7439214 | 0.1327916 |              | 0.8119161 | 0.1281621 |              |

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
| 2   | Validity |   2 |  28 | 3.136412 | 0.0590084 |        | 0.0585845 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7331202 | 0.1329348 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7893409 | 0.0733927 |              | 0.8727023 | 0.0673289 |              |

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
| 2   | Validity |   2 |  28 | 0.1055586 | 0.9001781 |        | 0.0015791 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7738521 | 0.1889195 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.8155623 | 0.8620669 |              | 0.9082018 | 0.8829381 |              |

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

|     | Effect          | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |  14 | 16.579982 | 0.0011433 | \*     | 0.2644209 |
| 3   | Validity        |   2 |  28 | 10.850917 | 0.0003243 | \*     | 0.1157475 |
| 4   | Target:Validity |   2 |  28 |  1.265178 | 0.2978284 |        | 0.0227882 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9291106 | 0.6200662 |        |
| 4   | Target:Validity | 0.8756058 | 0.4217025 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity        | 0.9338032 | 0.0004680 | \*           | 1.072092 | 0.0003243 | \*           |
| 4   | Target:Validity | 0.8893678 | 0.2962023 |              | 1.009758 | 0.2978284 |              |

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

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 6.718042 | 0.0041391 | \*     | 0.1520444 |

</td>
<td>

|     | Effect   |         W |        p | p\<.05 |
|:----|:---------|----------:|---------:|:-------|
| 2   | Validity | 0.8880981 | 0.462377 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.8993599 | 0.0057382 | \*           | 1.023696 | 0.0041391 | \*           |

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
| 2   | Validity |   2 |  28 | 2.111385 | 0.1399369 |        | 0.0793384 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7494193 | 0.1533598 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7996285 | 0.1517754 |              | 0.8865943 | 0.1466067 |              |

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

|     | Effect                     | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |  14 | 44.3285505 | 0.0000108 | \*     | 0.6204967 |
| 3   | Validity                   |   2 |  28 |  9.7326443 | 0.0006179 | \*     | 0.0894532 |
| 4   | nontargetContrast:Validity |   2 |  28 |  0.3065799 | 0.7383988 |        | 0.0036869 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9929221 | 0.9548798 |        |
| 4   | nontargetContrast:Validity | 0.8032712 | 0.2407711 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.9929719 | 0.0006398 | \*           | 1.1565268 | 0.0006179 | \*           |
| 4   | nontargetContrast:Validity | 0.8356112 | 0.7000672 |              | 0.9355484 | 0.7242731 |              |

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
| 2   | nontargetContrast          |   1 |  14 | 40.3130976 | 0.0000180 | \*     | 0.5255184 |
| 3   | Validity                   |   2 |  28 |  0.3288394 | 0.7225007 |        | 0.0026894 |
| 4   | nontargetContrast:Validity |   2 |  28 |  1.0160564 | 0.3749817 |        | 0.0103837 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.7051439 | 0.1032299 |        |
| 4   | nontargetContrast:Validity | 0.7688165 | 0.1810704 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.7722866 | 0.6679094 |              | 0.8497741 | 0.6882197 |              |
| 4   | nontargetContrast:Validity | 0.8122266 | 0.3629608 |              | 0.9036691 | 0.3692702 |              |

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

### discrimination sub

## anovas

\#dprime

``` r
## dis dprime sub
d = data 
disdPrime_anova = ezANOVA(
  data = d,
  dv = .(dis_dPrime_sub),
  wid = .(SID),
  within = .(Target, nontargetContrast, Validity)
)
knitr::kable(disdPrime_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect                            | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:----------------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | Target                            |   1 |  14 | 39.3362301 | 0.0000205 | \*     | 0.1517410 |
| 3   | nontargetContrast                 |   1 |  14 | 19.4597095 | 0.0005918 | \*     | 0.1382760 |
| 4   | Validity                          |   2 |  28 | 12.7627206 | 0.0001149 | \*     | 0.0825027 |
| 5   | Target:nontargetContrast          |   1 |  14 |  4.6286873 | 0.0493845 | \*     | 0.0172350 |
| 6   | Target:Validity                   |   2 |  28 |  0.5246963 | 0.5974391 |        | 0.0033930 |
| 7   | nontargetContrast:Validity        |   2 |  28 |  1.1019428 | 0.3462047 |        | 0.0120987 |
| 8   | Target:nontargetContrast:Validity |   2 |  28 |  0.5380525 | 0.5898006 |        | 0.0031496 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.9551934 | 0.7423243 |        |
| 6   | Target:Validity                   | 0.8262593 | 0.2892386 |        |
| 7   | nontargetContrast:Validity        | 0.8650654 | 0.3897786 |        |
| 8   | Target:nontargetContrast:Validity | 0.9792683 | 0.8726922 |        |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.9571150 | 0.0001518 | \*           | 1.1051612 | 0.0001149 | \*           |
| 6   | Target:Validity                   | 0.8519769 | 0.5700302 |              | 0.9580034 | 0.5900758 |              |
| 7   | nontargetContrast:Validity        | 0.8811080 | 0.3410635 |              | 0.9982706 | 0.3461381 |              |
| 8   | Target:nontargetContrast:Validity | 0.9796894 | 0.5863431 |              | 1.1374281 | 0.5898006 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis dprime filtered nontarget present
d = data %>% filter(nontargetContrast==1)

disdPrimeNP_anova = ezANOVA(
  data = d,
  dv = .(dis_dPrime_sub),
  wid = .(SID),
  within = .(Target, Validity)
)
knitr::kable(disdPrimeNP_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect          | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |  14 | 42.9351905 | 0.0000129 | \*     | 0.2291268 |
| 3   | Validity        |   2 |  28 |  6.5591261 | 0.0046103 | \*     | 0.1391391 |
| 4   | Target:Validity |   2 |  28 |  0.4710144 | 0.6292263 |        | 0.0064679 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9266116 | 0.6093057 |        |
| 4   | Target:Validity | 0.8269705 | 0.2908608 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.9316292 | 0.0057177 | \*           | 1.0690215 | 0.0046103 | \*           |
| 4   | Target:Validity | 0.8524935 | 0.5999074 |              | 0.9587141 | 0.6214644 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det dprime filtered nontarget present T1
d = data %>% filter(nontargetContrast==1, Target == 1)

disdPrimeNP_T1_anova = ezANOVA(
  data = d,
  dv = .(dis_dPrime_sub),
  wid = .(SID),
  within = .( Validity)
)
knitr::kable(disdPrimeNP_T1_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 5.686266 | 0.0084626 | \*     | 0.1760067 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9274004 | 0.6126853 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9323144 | 0.0101064 | \*           | 1.069989 | 0.0084626 | \*           |

</td>
</tr>
</tbody>
</table>

``` r
## dis dprime filtered nontarget present T2
d = data %>% filter(nontargetContrast==1, Target == 2)

disdPrimeNP_T2_anova = ezANOVA(
  data = d,
  dv = .(dis_dPrime_sub),
  wid = .(SID),
  within = .( Validity)
)
knitr::kable(disdPrimeNP_T2_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 3.312201 | 0.0511517 |        | 0.1149658 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9529293 | 0.7309616 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9550454 | 0.0538553 |              | 1.102215 | 0.0511517 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis dprime filtered nontarget absent
d = data %>% filter(nontargetContrast==2)

disdPrimeNA_anova = ezANOVA(
  data = d,
  dv = .(dis_dPrime_sub),
  wid = .(SID),
  within = .(Target, Validity)
)
knitr::kable(disdPrimeNA_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect          | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |  14 | 8.8947938 | 0.0098902 | \*     | 0.0806379 |
| 3   | Validity        |   2 |  28 | 3.4064422 | 0.0474081 | \*     | 0.0366522 |
| 4   | Target:Validity |   2 |  28 | 0.6139911 | 0.5483133 |        | 0.0065790 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8126122 | 0.2595624 |        |
| 4   | Target:Validity | 0.7861545 | 0.2093156 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8421849 | 0.0573431 |              | 0.9445536 | 0.0506829 |              |
| 4   | Target:Validity | 0.8238281 | 0.5194482 |              | 0.9194548 | 0.5357698 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis dprime filtered nontarget absent T1
d = data %>% filter(nontargetContrast==2, Target == 1)
    
disdPrimeNA_T1_anova = ezANOVA(
  data = d,
  dv = .(dis_dPrime_sub),
  wid = .(SID),
  within = .( Validity)
)
knitr::kable(disdPrimeNA_T1_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 2.684172 | 0.0858079 |        | 0.0690654 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9495528 | 0.7142895 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9519755 | 0.0889847 |              | 1.097849 | 0.0858079 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis dprime filtered nontarget absent T2
d = data %>% filter(nontargetContrast==2, Target == 2)

disdPrimeNA_T2_anova = ezANOVA(
  data = d,
  dv = .(dis_dPrime_sub),
  wid = .(SID),
  within = .( Validity)
)
knitr::kable(disdPrimeNA_T2_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 1.009551 | 0.3772634 |        | 0.0164588 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9532811 | 0.7327171 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9553663 | 0.3746628 |              | 1.102672 | 0.3772634 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis dprime filtered T1
d = data %>% filter(Target==1)

disdPrimeT1_anova = ezANOVA(
  data = d,
  dv = .(dis_dPrime_sub),
  wid = .(SID),
  within = .(nontargetContrast, Validity)
)
knitr::kable(disdPrimeT1_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect                     | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |  14 | 19.7191233 | 0.0005594 | \*     | 0.2317218 |
| 3   | Validity                   |   2 |  28 | 10.4436839 | 0.0004088 | \*     | 0.1181855 |
| 4   | nontargetContrast:Validity |   2 |  28 |  0.5216557 | 0.5991928 |        | 0.0102240 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9263927 | 0.6083708 |        |
| 4   | nontargetContrast:Validity | 0.9515847 | 0.7242832 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity                   | 0.9314393 | 0.0005889 | \*           | 1.068753 | 0.0004088 | \*           |
| 4   | nontargetContrast:Validity | 0.9538205 | 0.5910450 |              | 1.100472 | 0.5991928 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis dprime filtered T2
d = data %>% filter(Target==2)

disdPrimeT2_anova = ezANOVA(
  data = d,
  dv = .(dis_dPrime_sub),
  wid = .(SID),
  within = .(nontargetContrast, Validity)
)
knitr::kable(disdPrimeT2_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect                     | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |  14 | 7.441790 | 0.0163364 | \*     | 0.0636345 |
| 3   | Validity                   |   2 |  28 | 4.032503 | 0.0289073 | \*     | 0.0540104 |
| 4   | nontargetContrast:Validity |   2 |  28 | 1.376133 | 0.2691118 |        | 0.0195367 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9371996 | 0.6560073 |        |
| 4   | nontargetContrast:Validity | 0.8263089 | 0.2893515 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.9409105 | 0.0317683 | \*           | 1.0821475 | 0.0289073 | \*           |
| 4   | nontargetContrast:Validity | 0.8520129 | 0.2691455 |              | 0.9580529 | 0.2692469 |              |

</td>
</tr>
</tbody>
</table>

\#criterion

``` r
## dis crit sub
d = data 
discrit_anova = ezANOVA(
  data = d,
  dv = .(dis_crit_sub),
  wid = .(SID),
  within = .(Target, nontargetContrast, Validity)
)
knitr::kable(discrit_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect                            | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:----------------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Target                            |   1 |  14 | 2.6673338 | 0.1247071 |        | 0.0137343 |
| 3   | nontargetContrast                 |   1 |  14 | 0.0834934 | 0.7768525 |        | 0.0004345 |
| 4   | Validity                          |   2 |  28 | 0.2800967 | 0.7578032 |        | 0.0022717 |
| 5   | Target:nontargetContrast          |   1 |  14 | 2.7402558 | 0.1200841 |        | 0.0107926 |
| 6   | Target:Validity                   |   2 |  28 | 5.6362253 | 0.0087696 | \*     | 0.0246337 |
| 7   | nontargetContrast:Validity        |   2 |  28 | 0.4243540 | 0.6583294 |        | 0.0017369 |
| 8   | Target:nontargetContrast:Validity |   2 |  28 | 2.5644647 | 0.0949093 |        | 0.0154260 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.7091847 | 0.1071361 |        |
| 6   | Target:Validity                   | 0.6561186 | 0.0646227 |        |
| 7   | nontargetContrast:Validity        | 0.9327113 | 0.6358535 |        |
| 8   | Target:nontargetContrast:Validity | 0.3617625 | 0.0013482 | \*     |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.7747042 | 0.7024264 |              | 0.8530167 | 0.7235481 |              |
| 6   | Target:Validity                   | 0.7441133 | 0.0170752 | \*           | 0.8121710 | 0.0142906 | \*           |
| 7   | nontargetContrast:Validity        | 0.9369536 | 0.6456970 |              | 1.0765466 | 0.6583294 |              |
| 8   | Target:nontargetContrast:Validity | 0.6104121 | 0.1230906 |              | 0.6382400 | 0.1209343 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis crit filtered nontarget present
d = data %>% filter(nontargetContrast==1)

discritNP_anova = ezANOVA(
  data = d,
  dv = .(dis_crit_sub),
  wid = .(SID),
  within = .(Target, Validity)
)
knitr::kable(discritNP_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect          | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |  14 |  0.0172366 | 0.8974153 |        | 0.0002164 |
| 3   | Validity        |   2 |  28 |  0.4496248 | 0.6423926 |        | 0.0071186 |
| 4   | Target:Validity |   2 |  28 | 11.6336731 | 0.0002101 | \*     | 0.0796288 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8199605 | 0.2752035 |        |
| 4   | Target:Validity | 0.7055768 | 0.1036425 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8474293 | 0.6111904 |              | 0.9517517 | 0.6330586 |              |
| 4   | Target:Validity | 0.7725449 | 0.0008150 | \*           | 0.8501204 | 0.0005125 | \*           |

</td>
</tr>
</tbody>
</table>

``` r
## dis crit filtered nontarget present T1
d = data %>% filter(nontargetContrast==1, Target == 1)

discritNP_T1_anova = ezANOVA(
  data = d,
  dv = .(dis_crit_sub),
  wid = .(SID),
  within = .( Validity)
)
knitr::kable(discritNP_T1_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |       F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|--------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 1.83794 | 0.1778323 |        | 0.0372316 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.6709782 | 0.0747489 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7524331 | 0.1887798 |              | 0.8232402 | 0.1857985 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis crit filtered nontarget present T2
d = data %>% filter(nontargetContrast==1, Target == 2)

discritNP_T2_anova = ezANOVA(
  data = d,
  dv = .(dis_crit_sub),
  wid = .(SID),
  within = .( Validity)
)
knitr::kable(discritNP_T2_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 6.818857 | 0.0038672 | \*     | 0.1570691 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9748375 | 0.8473437 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9754552 | 0.0041934 | \*           | 1.131357 | 0.0038672 | \*           |

</td>
</tr>
</tbody>
</table>

``` r
## dis crit filtered nontarget absent
d = data %>% filter(nontargetContrast==2)

discritNA_anova = ezANOVA(
  data = d,
  dv = .(dis_crit_sub),
  wid = .(SID),
  within = .(Target, Validity)
)
knitr::kable(discritNA_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect          | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |  14 | 6.3885309 | 0.0241450 | \*     | 0.0412101 |
| 3   | Validity        |   2 |  28 | 0.1784056 | 0.8375465 |        | 0.0016902 |
| 4   | Target:Validity |   2 |  28 | 0.5666481 | 0.5737963 |        | 0.0072650 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8340032 | 0.3073196 |        |
| 4   | Target:Validity | 0.4809236 | 0.0085801 | \*     |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |  p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|---------:|:-------------|
| 3   | Validity        | 0.8576353 | 0.8052074 |              | 0.9657949 | 0.830411 |              |
| 4   | Target:Validity | 0.6582947 | 0.5070461 |              | 0.6996873 | 0.516680 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis crit filtered nontarget absent T1
d = data %>% filter(nontargetContrast==2, Target == 1)

discritNA_T1_anova = ezANOVA(
  data = d,
  dv = .(dis_crit_sub),
  wid = .(SID),
  within = .( Validity)
)
knitr::kable(discritNA_T1_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 0.7328038 | 0.4895497 |        | 0.0153756 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7921404 | 0.2198943 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.8279108 | 0.4669463 |              | 0.925024 | 0.4802219 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis crit filtered nontarget absent T2
d = data %>% filter(nontargetContrast==2, Target == 2)

discritNA_T2_anova = ezANOVA(
  data = d,
  dv = .(dis_crit_sub),
  wid = .(SID),
  within = .( Validity)
)
knitr::kable(discritNA_T2_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 0.0879065 | 0.9160982 |        | 0.0020664 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.4859646 | 0.0091819 | \*     |

</td>
<td>

|     | Effect   |       GGe |  p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|---------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.6604866 | 0.836847 |              | 0.7025222 | 0.8502125 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis crit filtered T1
d = data %>% filter(Target==1)

discritT1_anova = ezANOVA(
  data = d,
  dv = .(dis_crit_sub),
  wid = .(SID),
  within = .(nontargetContrast, Validity)
)
knitr::kable(discritT1_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect                     | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |  14 | 2.104698 | 0.1688828 |        | 0.0137954 |
| 3   | Validity                   |   2 |  28 | 1.669146 | 0.2066132 |        | 0.0190129 |
| 4   | nontargetContrast:Validity |   2 |  28 | 0.749325 | 0.4819284 |        | 0.0071203 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.7401178 | 0.1414020 |        |
| 4   | nontargetContrast:Validity | 0.6077954 | 0.0393028 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.7937250 | 0.2131140 |              | 0.8786168 | 0.2106205 |              |
| 4   | nontargetContrast:Validity | 0.7182852 | 0.4435905 |              | 0.7779944 | 0.4528649 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis crit filtered T2
d = data %>% filter(Target==2)

discritT2_anova = ezANOVA(
  data = d,
  dv = .(dis_crit_sub),
  wid = .(SID),
  within = .(nontargetContrast, Validity)
)
knitr::kable(discritT2_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect                     | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |  14 | 0.640239 | 0.4369919 |        | 0.0079014 |
| 3   | Validity                   |   2 |  28 | 2.733369 | 0.0823427 |        | 0.0365700 |
| 4   | nontargetContrast:Validity |   2 |  28 | 2.765870 | 0.0801359 |        | 0.0295967 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.7543739 | 0.1600712 |        |
| 4   | nontargetContrast:Validity | 0.7504239 | 0.1547010 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.8028091 | 0.0961093 |              | 0.8908986 | 0.0897171 |              |
| 4   | nontargetContrast:Validity | 0.8002714 | 0.0940967 |              | 0.8874639 | 0.0877457 |              |

</td>
</tr>
</tbody>
</table>

#### t-tests

\###dprime \## nontarget present \#T1
<img src="tazoot_det_subsample_files/figure-gfm/vi_disdNTP T1-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/vn_disdNTP T1-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/in_disdNTP T1-1.png" width="90%" />

\#T2
<img src="tazoot_det_subsample_files/figure-gfm/vi_disdNTP T2-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/vn_disdNTP T2-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/in_disdNTP T2-1.png" width="90%" />
\## nontarget absent \#T1
<img src="tazoot_det_subsample_files/figure-gfm/vi_disdNTA T1-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/vn_disdNTA T1-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/in_disdNTA T1-1.png" width="90%" />

\#T2
<img src="tazoot_det_subsample_files/figure-gfm/vi_disdNTA T2-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/in_disdNTA T2-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/vn_disdNTA T2-1.png" width="90%" />

\###criterion \## nontarget present \#T1
<img src="tazoot_det_subsample_files/figure-gfm/vi_discritNTP T1-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/vn_discritNTP T1-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/in_discritNTP T1-1.png" width="90%" />

\#T2
<img src="tazoot_det_subsample_files/figure-gfm/vi_discritNTP T2-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/vn_discritNTP T2-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/in_discritNTP T2-1.png" width="90%" />
\## nontarget absent \#T1
<img src="tazoot_det_subsample_files/figure-gfm/vi_discritNTA T1-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/vn_discritNTA T1-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/in_discritNTA T1-1.png" width="90%" />

\#T2
<img src="tazoot_det_subsample_files/figure-gfm/vi_discritNTA T2-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/vn_discritNTA T2-1.png" width="90%" />

<img src="tazoot_det_subsample_files/figure-gfm/in_discritNTA T2-1.png" width="90%" />

## Including Plots

You can also embed plots, for example:

![](tazoot_det_subsample_files/figure-gfm/pressure-1.png)<!-- -->

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.
