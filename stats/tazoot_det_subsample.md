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

|     | Effect                            | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:----------------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Target                            |   1 |  17 |  5.782554 | 0.0278606 | \*     | 0.0208557 |
| 3   | nontargetContrast                 |   1 |  17 |  6.117155 | 0.0242353 | \*     | 0.0546707 |
| 4   | Validity                          |   2 |  34 |  1.955306 | 0.1571115 |        | 0.0091639 |
| 5   | Target:nontargetContrast          |   1 |  17 | 16.503757 | 0.0008099 | \*     | 0.0883264 |
| 6   | Target:Validity                   |   2 |  34 |  1.313877 | 0.2820764 |        | 0.0048432 |
| 7   | nontargetContrast:Validity        |   2 |  34 | 11.097064 | 0.0001952 | \*     | 0.0295920 |
| 8   | Target:nontargetContrast:Validity |   2 |  34 |  1.962007 | 0.1561704 |        | 0.0113981 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.9637087 | 0.7439883 |        |
| 6   | Target:Validity                   | 0.7744211 | 0.1293652 |        |
| 7   | nontargetContrast:Validity        | 0.5830585 | 0.0133566 | \*     |
| 8   | Target:nontargetContrast:Validity | 0.8791928 | 0.3570040 |        |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.9649796 | 0.1589169 |              | 1.0862368 | 0.1571115 |              |
| 6   | Target:Validity                   | 0.8159409 | 0.2801039 |              | 0.8906059 | 0.2811946 |              |
| 7   | nontargetContrast:Validity        | 0.7057454 | 0.0011366 | \*           | 0.7507721 | 0.0008667 | \*           |
| 8   | Target:nontargetContrast:Validity | 0.8922141 | 0.1617533 |              | 0.9897659 | 0.1567010 |              |

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
| 2   | Target          |   1 |  17 | 2.5222437 | 0.1306747 |        | 0.0190817 |
| 3   | Validity        |   2 |  34 | 1.3490060 | 0.2730351 |        | 0.0080578 |
| 4   | Target:Validity |   2 |  34 | 0.3285734 | 0.7222107 |        | 0.0031898 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9572197 | 0.7048441 |        |
| 4   | Target:Validity | 0.8586074 | 0.2953637 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity        | 0.9589748 | 0.2729919 |              | 1.078205 | 0.2730351 |              |
| 4   | Target:Validity | 0.8761227 | 0.6942011 |              | 0.968681 | 0.7155041 |              |

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
| 2   | Validity |   2 |  34 | 1.597891 | 0.2171445 |        | 0.0206499 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9282938 | 0.5514213 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9330915 | 0.2189403 |              | 1.043732 | 0.2171445 |              |

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
| 2   | Validity |   2 |  34 | 0.1815054 | 0.8348165 |        | 0.0032353 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8614966 | 0.3034089 |        |

</td>
<td>

|     | Effect   |      GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|---------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.878346 | 0.8074235 |              | 0.9715889 | 0.8288663 |              |

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

|     | Effect          | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Target          |   1 |  17 | 25.26945 | 0.0001036 | \*     | 0.2599566 |
| 3   | Validity        |   2 |  34 | 10.47904 | 0.0002848 | \*     | 0.1026502 |
| 4   | Target:Validity |   2 |  34 |  5.16495 | 0.0109976 | \*     | 0.0453923 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8399742 | 0.2478149 |        |
| 4   | Target:Validity | 0.8213289 | 0.2070793 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8620498 | 0.0006185 | \*           | 0.9503136 | 0.0003764 | \*           |
| 4   | Target:Validity | 0.8484131 | 0.0157676 | \*           | 0.9325801 | 0.0129050 | \*           |

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
| 2   | Validity |   2 |  34 | 9.062911 | 0.0007002 | \*     | 0.1519394 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.6018535 | 0.0172158 | \*     |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7152326 | 0.0027593 | \*           | 0.7626552 | 0.0021932 | \*           |

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
| 2   | Validity |   2 |  34 | 5.86249 | 0.0064943 | \*     | 0.1092913 |

</td>
<td>

|     | Effect   |        W |         p | p\<.05 |
|:----|:---------|---------:|----------:|:-------|
| 2   | Validity | 0.899277 | 0.4277084 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9084938 | 0.0084082 | \*           | 1.011189 | 0.0064943 | \*           |

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
| 2   | nontargetContrast          |   1 |  17 | 0.3840849 | 0.5436432 |        | 0.0047495 |
| 3   | Validity                   |   2 |  34 | 3.2588283 | 0.0507210 |        | 0.0202588 |
| 4   | nontargetContrast:Validity |   2 |  34 | 6.6408560 | 0.0036758 | \*     | 0.0589940 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9143079 | 0.4883595 |        |
| 4   | nontargetContrast:Validity | 0.6709391 | 0.0410643 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.9210714 | 0.0554720 |              | 1.0278027 | 0.0507210 |              |
| 4   | nontargetContrast:Validity | 0.7524109 | 0.0083806 | \*           | 0.8095033 | 0.0069242 | \*           |

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
| 2   | nontargetContrast          |   1 |  17 | 17.2904710 | 0.0006585 | \*     | 0.2426269 |
| 3   | Validity                   |   2 |  34 |  0.6392173 | 0.5339289 |        | 0.0068195 |
| 4   | nontargetContrast:Validity |   2 |  34 |  2.4850990 | 0.0983303 |        | 0.0188308 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9237059 | 0.5299924 |        |
| 4   | nontargetContrast:Validity | 0.8780895 | 0.3534355 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.9291141 | 0.5233060 |              | 1.0384553 | 0.5339289 |              |
| 4   | nontargetContrast:Validity | 0.8913367 | 0.1054424 |              | 0.9886139 | 0.0990555 |              |

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
| 2   | Target                            |   1 |  17 | 19.3356278 | 0.0003935 | \*     | 0.0987128 |
| 3   | nontargetContrast                 |   1 |  17 | 66.3877920 | 0.0000003 | \*     | 0.5796567 |
| 4   | Validity                          |   2 |  34 | 12.5214342 | 0.0000842 | \*     | 0.0353610 |
| 5   | Target:nontargetContrast          |   1 |  17 |  4.5437829 | 0.0479271 | \*     | 0.0146297 |
| 6   | Target:Validity                   |   2 |  34 |  2.5639353 | 0.0918070 |        | 0.0124199 |
| 7   | nontargetContrast:Validity        |   2 |  34 |  2.1804641 | 0.1285366 |        | 0.0111419 |
| 8   | Target:nontargetContrast:Validity |   2 |  34 |  0.4034287 | 0.6711812 |        | 0.0020094 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.9797217 | 0.8488321 |        |
| 6   | Target:Validity                   | 0.7713690 | 0.1253422 |        |
| 7   | nontargetContrast:Validity        | 0.9690524 | 0.7776389 |        |
| 8   | Target:nontargetContrast:Validity | 0.7204865 | 0.0726117 |        |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.9801247 | 0.0000963 | \*           | 1.1065506 | 0.0000842 | \*           |
| 6   | Target:Validity                   | 0.8139140 | 0.1043663 |              | 0.8879976 | 0.0992023 |              |
| 7   | nontargetContrast:Validity        | 0.9699814 | 0.1303215 |              | 1.0929365 | 0.1285366 |              |
| 8   | Target:nontargetContrast:Validity | 0.7815471 | 0.6219839 |              | 0.8465328 | 0.6379233 |              |

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
| 2   | Target          |   1 |  17 | 4.417438 | 0.0507855 |        | 0.0287576 |
| 3   | Validity        |   2 |  34 | 1.191909 | 0.3160100 |        | 0.0080489 |
| 4   | Target:Validity |   2 |  34 | 1.447226 | 0.2493467 |        | 0.0116082 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8450278 | 0.2599968 |        |
| 4   | Target:Validity | 0.6143270 | 0.0202860 | \*     |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8658217 | 0.3121926 |              | 0.9552299 | 0.3148883 |              |
| 4   | Target:Validity | 0.7216710 | 0.2505552 |              | 0.7707361 | 0.2507585 |              |

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
| 2   | Validity |   2 |  34 | 2.544391 | 0.0933803 |        | 0.0376561 |

</td>
<td>

|     | Effect   |       W |         p | p\<.05 |
|:----|:---------|--------:|----------:|:-------|
| 2   | Validity | 0.74204 | 0.0919218 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7949379 | 0.1072621 |              | 0.8636453 | 0.1024343 |              |

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
| 2   | Validity |   2 |  34 | 0.1329952 | 0.8759225 |        | 0.0019246 |

</td>
<td>

|     | Effect   |        W |         p | p\<.05 |
|:----|:---------|---------:|----------:|:-------|
| 2   | Validity | 0.709553 | 0.0642508 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7749253 | 0.8238715 |              | 0.8380925 | 0.8406945 |              |

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

|     | Effect          | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Target          |   1 |  17 | 25.73597 | 0.0000941 | \*     | 0.2814669 |
| 3   | Validity        |   2 |  34 | 13.66451 | 0.0000441 | \*     | 0.1381114 |
| 4   | Target:Validity |   2 |  34 |  1.51586 | 0.2340914 |        | 0.0221162 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9417844 | 0.6188879 |        |
| 4   | Target:Validity | 0.8197523 | 0.2039207 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.9449870 | 0.0000661 | \*           | 1.0595459 | 0.0000441 | \*           |
| 4   | Target:Validity | 0.8472798 | 0.2366332 |              | 0.9311092 | 0.2353698 |              |

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
| 2   | Validity |   2 |  34 | 8.41694 | 0.0010728 | \*     | 0.1658492 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7787321 | 0.1352398 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe | p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|--------:|:-------------|
| 2   | Validity | 0.8188212 | 0.0023889 | \*           | 0.8943146 | 0.00171 | \*           |

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
| 2   | Validity |   2 |  34 | 4.084634 | 0.0257163 | \*     | 0.1236792 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.6999685 | 0.0576272 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.7692121 | 0.0378445 | \*           | 0.830822 | 0.0341286 | \*           |

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
| 2   | nontargetContrast          |   1 |  17 | 57.873811 | 0.0000007 | \*     | 0.6064476 |
| 3   | Validity                   |   2 |  34 |  9.750236 | 0.0004498 | \*     | 0.0766511 |
| 4   | nontargetContrast:Validity |   2 |  34 |  1.188709 | 0.3169566 |        | 0.0114301 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9543766 | 0.6882689 |        |
| 4   | nontargetContrast:Validity | 0.9017396 | 0.4371688 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity                   | 0.9563672 | 0.0005642 | \*           | 1.074722 | 0.0004498 | \*           |
| 4   | nontargetContrast:Validity | 0.9105309 | 0.3145205 |              | 1.013876 | 0.3169566 |              |

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

|     | Effect                     | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |  17 | 58.146347 | 0.0000007 | \*     | 0.5490551 |
| 3   | Validity                   |   2 |  34 |  1.247204 | 0.3001195 |        | 0.0086743 |
| 4   | nontargetContrast:Validity |   2 |  34 |  1.436976 | 0.2517138 |        | 0.0151089 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.6978387 | 0.0562393 |        |
| 4   | nontargetContrast:Validity | 0.7264829 | 0.0775896 |        |

</td>
<td>

|     | Effect                     |      GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|---------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.767954 | 0.2947024 |              | 0.8292224 | 0.2965919 |              |
| 4   | nontargetContrast:Validity | 0.785227 | 0.2528612 |              | 0.8512296 | 0.2528182 |              |

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
| 2   | Target                            |   1 |  17 | 44.6566141 | 0.0000039 | \*     | 0.1383899 |
| 3   | nontargetContrast                 |   1 |  17 | 25.2064953 | 0.0001050 | \*     | 0.1410668 |
| 4   | Validity                          |   2 |  34 | 19.9703305 | 0.0000018 | \*     | 0.1065300 |
| 5   | Target:nontargetContrast          |   1 |  17 |  3.5820507 | 0.0755620 |        | 0.0111861 |
| 6   | Target:Validity                   |   2 |  34 |  1.8437382 | 0.1736967 |        | 0.0106162 |
| 7   | nontargetContrast:Validity        |   2 |  34 |  2.1291838 | 0.1345216 |        | 0.0176955 |
| 8   | Target:nontargetContrast:Validity |   2 |  34 |  0.2097462 | 0.8118312 |        | 0.0010829 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.9492613 | 0.6593049 |        |
| 6   | Target:Validity                   | 0.8751810 | 0.3441780 |        |
| 7   | nontargetContrast:Validity        | 0.8583396 | 0.2946276 |        |
| 8   | Target:nontargetContrast:Validity | 0.9947813 | 0.9590054 |        |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.9517114 | 0.0000030 | \*           | 1.0685075 | 0.0000018 | \*           |
| 6   | Target:Validity                   | 0.8890319 | 0.1787215 |              | 0.9855891 | 0.1743570 |              |
| 7   | nontargetContrast:Validity        | 0.8759173 | 0.1417910 |              | 0.9684123 | 0.1363558 |              |
| 8   | Target:nontargetContrast:Validity | 0.9948084 | 0.8107352 |              | 1.1263238 | 0.8118312 |              |

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

|     | Effect          | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Target          |   1 |  17 | 40.78890 | 0.0000068 | \*     | 0.1974882 |
| 3   | Validity        |   2 |  34 | 11.35541 | 0.0001670 | \*     | 0.1802845 |
| 4   | Target:Validity |   2 |  34 |  1.01697 | 0.3724275 |        | 0.0135619 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8880008 | 0.3866399 |        |
| 4   | Target:Validity | 0.7686483 | 0.1218489 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8992812 | 0.0003090 | \*           | 0.9990543 | 0.0001680 | \*           |
| 4   | Target:Validity | 0.8121157 | 0.3602294 |              | 0.8856847 | 0.3654539 |              |

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
| 2   | Validity |   2 |  34 | 10.41324 | 0.0002967 | \*     | 0.2616501 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9733621 | 0.8057408 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9740532 | 0.0003428 | \*           | 1.098397 | 0.0002967 | \*           |

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
| 2   | Validity |   2 |  34 | 3.897877 | 0.0299154 | \*     | 0.1104346 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9406336 | 0.6128637 |        |

</td>
<td>

|     | Effect   |       GGe |  p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|---------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9439605 | 0.032627 | \*           | 1.058179 | 0.0299154 | \*           |

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
| 2   | Target          |   1 |  17 | 12.030967 | 0.0029375 | \*     | 0.0832166 |
| 3   | Validity        |   2 |  34 |  5.178328 | 0.0108853 | \*     | 0.0446602 |
| 4   | Target:Validity |   2 |  34 |  1.179936 | 0.3195669 |        | 0.0096042 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.7724648 | 0.1267738 |        |
| 4   | Target:Validity | 0.8657839 | 0.3157010 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8146406 | 0.0169437 | \*           | 0.8889325 | 0.0141841 | \*           |
| 4   | Target:Validity | 0.8816662 | 0.3160309 |              | 0.9759346 | 0.3189326 |              |

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

|     | Effect   | DFn | DFd |      F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|-------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  34 | 4.9556 | 0.0129229 | \*     | 0.0964727 |

</td>
<td>

|     | Effect   |       W |         p | p\<.05 |
|:----|:---------|--------:|----------:|:-------|
| 2   | Validity | 0.95417 | 0.6870782 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9561784 | 0.0142531 | \*           | 1.074469 | 0.0129229 | \*           |

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

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |      ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|---------:|
| 2   | Validity |   2 |  34 | 1.042657 | 0.3635158 |        | 0.014021 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9786635 | 0.8415251 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9791092 | 0.3624395 |              | 1.105186 | 0.3635158 |              |

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

|     | Effect                     | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |  17 | 24.03243 | 0.0001345 | \*     | 0.2191061 |
| 3   | Validity                   |   2 |  34 | 18.07444 | 0.0000045 | \*     | 0.1774820 |
| 4   | nontargetContrast:Validity |   2 |  34 |  1.41225 | 0.2575224 |        | 0.0224507 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9663113 | 0.7602149 |        |
| 4   | nontargetContrast:Validity | 0.9754096 | 0.8194002 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |     HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|--------:|----------:|:-------------|
| 3   | Validity                   | 0.9674092 | 0.0000061 | \*           | 1.08949 | 0.0000045 | \*           |
| 4   | nontargetContrast:Validity | 0.9759997 | 0.2577045 |              | 1.10101 | 0.2575224 |              |

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

|     | Effect                     | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |  17 | 10.565637 | 0.0047070 | \*     | 0.0772540 |
| 3   | Validity                   |   2 |  34 |  4.711397 | 0.0156293 | \*     | 0.0520771 |
| 4   | nontargetContrast:Validity |   2 |  34 |  1.387534 | 0.2634706 |        | 0.0154737 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9254328 | 0.5379711 |        |
| 4   | nontargetContrast:Validity | 0.8598926 | 0.2989192 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.9306072 | 0.0180540 | \*           | 1.0404355 | 0.0156293 | \*           |
| 4   | nontargetContrast:Validity | 0.8771104 | 0.2636927 |              | 0.9699725 | 0.2636006 |              |

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
| 2   | Target                            |   1 |  17 | 1.3192590 | 0.2666305 |        | 0.0065223 |
| 3   | nontargetContrast                 |   1 |  17 | 0.0060357 | 0.9389821 |        | 0.0000259 |
| 4   | Validity                          |   2 |  34 | 0.4460376 | 0.6438519 |        | 0.0025963 |
| 5   | Target:nontargetContrast          |   1 |  17 | 1.2453917 | 0.2799610 |        | 0.0046136 |
| 6   | Target:Validity                   |   2 |  34 | 4.4137319 | 0.0197634 | \*     | 0.0171699 |
| 7   | nontargetContrast:Validity        |   2 |  34 | 0.5818017 | 0.5643574 |        | 0.0018276 |
| 8   | Target:nontargetContrast:Validity |   2 |  34 | 1.7811324 | 0.1838068 |        | 0.0083398 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.7517717 | 0.1020205 |        |
| 6   | Target:Validity                   | 0.8558591 | 0.2878844 |        |
| 7   | nontargetContrast:Validity        | 0.9247304 | 0.5347132 |        |
| 8   | Target:nontargetContrast:Validity | 0.4007775 | 0.0006656 | \*     |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.8011355 | 0.6015838 |              | 0.8715856 | 0.6176220 |              |
| 6   | Target:Validity                   | 0.8740182 | 0.0250661 | \*           | 0.9659299 | 0.0210731 | \*           |
| 7   | nontargetContrast:Validity        | 0.9299993 | 0.5528232 |              | 1.0396292 | 0.5643574 |              |
| 8   | Target:nontargetContrast:Validity | 0.6253038 | 0.1974367 |              | 0.6511660 | 0.1967469 |              |

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

|     | Effect          | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |  17 | 0.0193392 | 0.8910326 |        | 0.0002044 |
| 3   | Validity        |   2 |  34 | 0.8349270 | 0.4426077 |        | 0.0099811 |
| 4   | Target:Validity |   2 |  34 | 7.7861281 | 0.0016447 | \*     | 0.0536897 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.7866723 | 0.1466733 |        |
| 4   | Target:Validity | 0.7987582 | 0.1657000 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8241797 | 0.4238634 |              | 0.9012219 | 0.4325708 |              |
| 4   | Target:Validity | 0.8324718 | 0.0032329 | \*           | 0.9119297 | 0.0023448 | \*           |

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

|     | Effect   | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  34 | 0.8363697 | 0.4419995 |        | 0.0153348 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.6933268 | 0.0533954 |        |

</td>
<td>

|     | Effect   |       GGe |  p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|---------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7653023 | 0.416058 |              | 0.8258527 | 0.4235166 |              |

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
| 2   | Validity |   2 |  34 | 7.292784 | 0.0023148 | \*     | 0.1304155 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9520231 | 0.6748072 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9542195 | 0.0027445 | \*           | 1.071854 | 0.0023148 | \*           |

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
| 2   | Target          |   1 |  17 | 2.5461236 | 0.1289861 |        | 0.0184868 |
| 3   | Validity        |   2 |  34 | 0.0749660 | 0.9279279 |        | 0.0005122 |
| 4   | Target:Validity |   2 |  34 | 0.4617647 | 0.6340645 |        | 0.0044349 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8643907 | 0.3116596 |        |
| 4   | Target:Validity | 0.6770372 | 0.0441469 | \*     |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8805845 | 0.9077743 |              | 0.9745184 | 0.9240675 |              |
| 4   | Target:Validity | 0.7558791 | 0.5817542 |              | 0.8138964 | 0.5955218 |              |

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
| 2   | Validity |   2 |  34 | 0.4117655 | 0.6657388 |        | 0.0058539 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9157528 | 0.4945681 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9222989 | 0.6497267 |              | 1.029427 | 0.6657388 |              |

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
| 2   | Validity |   2 |  34 | 0.1859634 | 0.8311428 |        | 0.0036336 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.5361062 | 0.0068235 | \*     |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.6831097 | 0.7466845 |              | 0.7225363 | 0.7597441 |              |

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

|     | Effect                     | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |  17 | 0.6912856 | 0.4172534 |        | 0.0044328 |
| 3   | Validity                   |   2 |  34 | 0.8001637 | 0.4575344 |        | 0.0071586 |
| 4   | nontargetContrast:Validity |   2 |  34 | 0.3885397 | 0.6810183 |        | 0.0027555 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9184942 | 0.5065373 |        |
| 4   | nontargetContrast:Validity | 0.6372794 | 0.0272044 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.9246368 | 0.4493384 |              | 1.0325222 | 0.4575344 |              |
| 4   | nontargetContrast:Validity | 0.7338262 | 0.6183378 |              | 0.7860287 | 0.6322566 |              |

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

|     | Effect                     | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |  17 | 0.4796594 | 0.4979291 |        | 0.0049503 |
| 3   | Validity                   |   2 |  34 | 3.5957584 | 0.0383186 | \*     | 0.0379633 |
| 4   | nontargetContrast:Validity |   2 |  34 | 2.3875839 | 0.1070851 |        | 0.0210594 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.7667227 | 0.1194281 |        |
| 4   | nontargetContrast:Validity | 0.7506837 | 0.1008453 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.8108476 | 0.0494987 | \*           | 0.8840544 | 0.0448263 | \*           |
| 4   | nontargetContrast:Validity | 0.8004378 | 0.1201780 |              | 0.8706911 | 0.1154467 |              |

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
