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
| 2   | Target                            |   1 |  15 |  5.797421 | 0.0293745 | \*     | 0.0245571 |
| 3   | nontargetContrast                 |   1 |  15 |  8.294870 | 0.0114477 | \*     | 0.0760496 |
| 4   | Validity                          |   2 |  30 |  1.114094 | 0.3414133 |        | 0.0055087 |
| 5   | Target:nontargetContrast          |   1 |  15 | 11.593014 | 0.0039186 | \*     | 0.0726794 |
| 6   | Target:Validity                   |   2 |  30 |  1.870150 | 0.1716267 |        | 0.0072672 |
| 7   | nontargetContrast:Validity        |   2 |  30 |  8.478998 | 0.0012055 | \*     | 0.0262214 |
| 8   | Target:nontargetContrast:Validity |   2 |  30 |  1.985883 | 0.1548984 |        | 0.0115007 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.9788745 | 0.8611706 |        |
| 6   | Target:Validity                   | 0.6731351 | 0.0626204 |        |
| 7   | nontargetContrast:Validity        | 0.5028722 | 0.0081321 | \*     |
| 8   | Target:nontargetContrast:Validity | 0.8598564 | 0.3475214 |        |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.9793116 | 0.3406411 |              | 1.1248034 | 0.3414133 |              |
| 6   | Target:Validity                   | 0.7536563 | 0.1829864 |              | 0.8195921 | 0.1800726 |              |
| 7   | nontargetContrast:Validity        | 0.6679457 | 0.0051183 | \*           | 0.7089471 | 0.0042758 | \*           |
| 8   | Target:nontargetContrast:Validity | 0.8770825 | 0.1614616 |              | 0.9839561 | 0.1557544 |              |

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
| 2   | Target          |   1 |  15 | 1.2028024 | 0.2900577 |        | 0.0102603 |
| 3   | Validity        |   2 |  30 | 0.9807124 | 0.3867469 |        | 0.0068017 |
| 4   | Target:Validity |   2 |  30 | 0.8349352 | 0.4437358 |        | 0.0080961 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9673782 | 0.7928188 |        |
| 4   | Target:Validity | 0.8858350 | 0.4280256 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity        | 0.9684087 | 0.3847226 |              | 1.109572 | 0.3867469 |              |
| 4   | Target:Validity | 0.8975331 | 0.4333817 |              | 1.011783 | 0.4437358 |              |

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

|     | Effect   | DFn | DFd |       F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|--------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  30 | 2.36798 | 0.1109505 |        | 0.0331511 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8902329 | 0.4431243 |        |

</td>
<td>

|     | Effect   |     GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|--------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.90109 | 0.1173431 |              | 1.016641 | 0.1109505 |              |

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

|     | Effect   | DFn | DFd |         F |        p | p\<.05 |      ges |
|:----|:---------|----:|----:|----------:|---------:|:-------|---------:|
| 2   | Validity |   2 |  30 | 0.0027962 | 0.997208 |        | 5.18e-05 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9051773 | 0.4978923 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |  p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|---------:|:-------------|
| 2   | Validity | 0.9133899 | 0.9955862 |              | 1.033478 | 0.997208 |              |

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
| 2   | Target          |   1 |  15 | 19.286330 | 0.0005257 | \*     | 0.2487870 |
| 3   | Validity        |   2 |  30 |  8.646033 | 0.0010839 | \*     | 0.0867973 |
| 4   | Target:Validity |   2 |  30 |  4.640587 | 0.0175409 | \*     | 0.0433544 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9045635 | 0.4955339 |        |
| 4   | Target:Validity | 0.8378402 | 0.2898201 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.9128781 | 0.0015937 | \*           | 1.0327765 | 0.0010839 | \*           |
| 4   | Target:Validity | 0.8604669 | 0.0231901 | \*           | 0.9614735 | 0.0189433 | \*           |

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
| 2   | Validity |   2 |  30 | 7.523383 | 0.0022484 | \*     | 0.1349757 |

</td>
<td>

|     | Effect   |        W |         p | p\<.05 |
|:----|:---------|---------:|----------:|:-------|
| 2   | Validity | 0.661017 | 0.0551427 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7468355 | 0.0058636 | \*           | 0.8106842 | 0.0045991 | \*           |

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

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  30 | 4.998757 | 0.0133759 | \*     | 0.0941917 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9094731 | 0.5146701 |        |

</td>
<td>

|     | Effect   |       GGe |  p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|---------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9169879 | 0.016089 | \*           | 1.038416 | 0.0133759 | \*           |

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
| 2   | nontargetContrast          |   1 |  15 | 0.0039294 | 0.9508452 |        | 0.0000469 |
| 3   | Validity                   |   2 |  30 | 2.4180863 | 0.1062582 |        | 0.0151978 |
| 4   | nontargetContrast:Validity |   2 |  30 | 6.3388111 | 0.0050561 | \*     | 0.0628223 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9460071 | 0.6780486 |        |
| 4   | nontargetContrast:Validity | 0.6549908 | 0.0517186 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.9487730 | 0.1095652 |              | 1.0822681 | 0.1062582 |              |
| 4   | nontargetContrast:Validity | 0.7434893 | 0.0111142 | \*           | 0.8063208 | 0.0091558 | \*           |

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

|     | Effect                     | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |  15 | 15.219200 | 0.0014178 | \*     | 0.2480753 |
| 3   | Validity                   |   2 |  30 |  0.880658 | 0.4249536 |        | 0.0100473 |
| 4   | nontargetContrast:Validity |   2 |  30 |  1.155908 | 0.3283962 |        | 0.0084940 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.8736332 | 0.3884219 |        |
| 4   | nontargetContrast:Validity | 0.8309886 | 0.2736310 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.8878102 | 0.4147853 |              | 0.9985318 | 0.4248292 |              |
| 4   | nontargetContrast:Validity | 0.8554236 | 0.3233780 |              | 0.9546717 | 0.3270024 |              |

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
| 2   | Target                            |   1 |  15 | 13.4855025 | 0.0022642 | \*     | 0.0788005 |
| 3   | nontargetContrast                 |   1 |  15 | 51.5084865 | 0.0000032 | \*     | 0.5658931 |
| 4   | Validity                          |   2 |  30 | 10.7347439 | 0.0003045 | \*     | 0.0357429 |
| 5   | Target:nontargetContrast          |   1 |  15 |  4.1619045 | 0.0593567 |        | 0.0159180 |
| 6   | Target:Validity                   |   2 |  30 |  3.6324928 | 0.0386638 | \*     | 0.0171521 |
| 7   | nontargetContrast:Validity        |   2 |  30 |  1.5157519 | 0.2359900 |        | 0.0082030 |
| 8   | Target:nontargetContrast:Validity |   2 |  30 |  0.9093559 | 0.4135994 |        | 0.0048055 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.9790705 | 0.8623782 |        |
| 6   | Target:Validity                   | 0.8656972 | 0.3643863 |        |
| 7   | nontargetContrast:Validity        | 0.9190925 | 0.5540060 |        |
| 8   | Target:nontargetContrast:Validity | 0.6301044 | 0.0394355 | \*     |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.9794996 | 0.0003413 | \*           | 1.1250665 | 0.0003045 | \*           |
| 6   | Target:Validity                   | 0.8815988 | 0.0454097 | \*           | 0.9900866 | 0.0391872 | \*           |
| 7   | nontargetContrast:Validity        | 0.9251485 | 0.2373989 |              | 1.0496341 | 0.2359900 |              |
| 8   | Target:nontargetContrast:Validity | 0.7299827 | 0.3881774 |              | 0.7887515 | 0.3945875 |              |

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

|     | Effect          | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |  15 | 2.4468476 | 0.1386098 |        | 0.0177778 |
| 3   | Validity        |   2 |  30 | 0.9582815 | 0.3949818 |        | 0.0074020 |
| 4   | Target:Validity |   2 |  30 | 3.0204281 | 0.0638105 |        | 0.0222508 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8192955 | 0.2477902 |        |
| 4   | Target:Validity | 0.6663141 | 0.0583113 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8469520 | 0.3834868 |              | 0.9432693 | 0.3910071 |              |
| 4   | Target:Validity | 0.7498017 | 0.0812969 |              | 0.8145559 | 0.0763777 |              |

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
| 2   | Validity |   2 |  30 | 3.562337 | 0.0409147 | \*     | 0.0558956 |

</td>
<td>

|     | Effect   |        W |         p | p\<.05 |
|:----|:---------|---------:|----------:|:-------|
| 2   | Validity | 0.719605 | 0.0999215 |        |

</td>
<td>

|     | Effect   |      GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|---------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.781009 | 0.0545609 |              | 0.8554963 | 0.0494693 | \*           |

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
| 2   | Validity |   2 |  30 | 0.2832985 | 0.7552878 |        | 0.0039893 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7770032 | 0.1709857 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.8176637 | 0.7117213 |              | 0.9040714 | 0.7336268 |              |

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
| 2   | Target          |   1 |  15 | 18.949895 | 0.0005678 | \*     | 0.2641902 |
| 3   | Validity        |   2 |  30 | 13.078547 | 0.0000824 | \*     | 0.1393543 |
| 4   | Target:Validity |   2 |  30 |  1.152781 | 0.3293513 |        | 0.0203877 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8563776 | 0.3377981 |        |
| 4   | Target:Validity | 0.8148999 | 0.2386327 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8744145 | 0.0001934 | \*           | 0.9803384 | 0.0000941 | \*           |
| 4   | Target:Validity | 0.8438106 | 0.3237611 |              | 0.9390485 | 0.3274083 |              |

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
| 2   | Validity |   2 |  30 | 7.725169 | 0.0019668 | \*     | 0.1672127 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8466266 | 0.3117766 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.8670219 | 0.0033012 | \*           | 0.9703297 | 0.0022071 | \*           |

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

|     | Effect   | DFn | DFd |       F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|--------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  30 | 3.36302 | 0.0481069 | \*     | 0.1218417 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.6358136 | 0.0420057 | \*     |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7330376 | 0.0660325 |              | 0.7927192 | 0.0615259 |              |

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
| 2   | nontargetContrast          |   1 |  15 | 45.5441575 | 0.0000065 | \*     | 0.6020166 |
| 3   | Validity                   |   2 |  30 | 10.9837884 | 0.0002635 | \*     | 0.0900705 |
| 4   | nontargetContrast:Validity |   2 |  30 |  0.6065056 | 0.5518027 |        | 0.0064293 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9938631 | 0.9578244 |        |
| 4   | nontargetContrast:Validity | 0.8018660 | 0.2131635 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.9939005 | 0.0002729 | \*           | 1.1452644 | 0.0002635 | \*           |
| 4   | nontargetContrast:Validity | 0.8346312 | 0.5244333 |              | 0.9267379 | 0.5402510 |              |

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
| 2   | nontargetContrast          |   1 |  15 | 44.6856068 | 0.0000073 | \*     | 0.5238683 |
| 3   | Validity                   |   2 |  30 |  0.5304217 | 0.5937726 |        | 0.0039090 |
| 4   | nontargetContrast:Validity |   2 |  30 |  1.8976449 | 0.1674851 |        | 0.0202242 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.7030062 | 0.0848622 |        |
| 4   | nontargetContrast:Validity | 0.6984108 | 0.0810544 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.7710137 | 0.5496138 |              | 0.8423423 | 0.5645673 |              |
| 4   | nontargetContrast:Validity | 0.7682915 | 0.1786132 |              | 0.8387666 | 0.1753241 |              |

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
| 2   | Target                            |   1 |  15 | 42.7994170 | 0.0000093 | \*     | 0.1512066 |
| 3   | nontargetContrast                 |   1 |  15 | 22.9219144 | 0.0002396 | \*     | 0.1519912 |
| 4   | Validity                          |   2 |  30 | 15.2410454 | 0.0000271 | \*     | 0.0965908 |
| 5   | Target:nontargetContrast          |   1 |  15 |  3.4101894 | 0.0846182 |        | 0.0129241 |
| 6   | Target:Validity                   |   2 |  30 |  0.8575724 | 0.4343285 |        | 0.0050879 |
| 7   | nontargetContrast:Validity        |   2 |  30 |  1.5367545 | 0.2315340 |        | 0.0156180 |
| 8   | Target:nontargetContrast:Validity |   2 |  30 |  0.8024219 | 0.4576296 |        | 0.0041816 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.9264850 | 0.5859610 |        |
| 6   | Target:Validity                   | 0.8557698 | 0.3361234 |        |
| 7   | nontargetContrast:Validity        | 0.8643497 | 0.3604346 |        |
| 8   | Target:nontargetContrast:Validity | 0.9856661 | 0.9038755 |        |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.9315194 | 0.0000463 | \*           | 1.0584114 | 0.0000271 | \*           |
| 6   | Target:Validity                   | 0.8739500 | 0.4221033 |              | 0.9797089 | 0.4324817 |              |
| 7   | nontargetContrast:Validity        | 0.8805528 | 0.2339376 |              | 0.9886660 | 0.2317855 |              |
| 8   | Target:nontargetContrast:Validity | 0.9858686 | 0.4561621 |              | 1.1339883 | 0.4576296 |              |

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
| 2   | Target          |   1 |  15 | 39.9272339 | 0.0000138 | \*     | 0.2162851 |
| 3   | Validity        |   2 |  30 |  8.2078743 | 0.0014350 | \*     | 0.1643517 |
| 4   | Target:Validity |   2 |  30 |  0.7603463 | 0.4763021 |        | 0.0094254 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8884653 | 0.4370017 |        |
| 4   | Target:Validity | 0.8381854 | 0.2906570 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |  p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|---------:|:-------------|
| 3   | Validity        | 0.8996570 | 0.0021813 | \*           | 1.0146830 | 0.001435 | \*           |
| 4   | Target:Validity | 0.8607225 | 0.4592768 |              | 0.9618186 | 0.471888 |              |

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

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |      ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|---------:|
| 2   | Validity |   2 |  30 | 7.140236 | 0.0029083 | \*     | 0.206394 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8877484 | 0.4345396 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.8990772 | 0.0041589 | \*           | 1.013891 | 0.0029083 | \*           |

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
| 2   | Validity |   2 |  30 | 4.327255 | 0.0223263 | \*     | 0.1364751 |

</td>
<td>

|     | Effect   |        W |         p | p\<.05 |
|:----|:---------|---------:|----------:|:-------|
| 2   | Validity | 0.949159 | 0.6940213 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9516188 | 0.0243559 | \*           | 1.086215 | 0.0223263 | \*           |

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

|     | Effect          | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |  15 | 10.7615675 | 0.0050573 | \*     | 0.0899927 |
| 3   | Validity        |   2 |  30 |  4.1748533 | 0.0251413 | \*     | 0.0405462 |
| 4   | Target:Validity |   2 |  30 |  0.9316251 | 0.4050118 |        | 0.0090111 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8146611 | 0.2381436 |        |
| 4   | Target:Validity | 0.8108636 | 0.2304808 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8436406 | 0.0328223 | \*           | 0.9388202 | 0.0279005 | \*           |
| 4   | Target:Validity | 0.8409464 | 0.3920488 |              | 0.9352037 | 0.4000655 |              |

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
| 2   | Validity |   2 |  30 | 3.555695 | 0.0411349 | \*     | 0.0838519 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9513088 | 0.7050997 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9535695 | 0.0437112 | \*           | 1.088923 | 0.0411349 | \*           |

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
| 2   | Validity |   2 |  30 | 1.003755 | 0.3784778 |        | 0.0143652 |

</td>
<td>

|     | Effect   |         W |        p | p\<.05 |
|:----|:---------|----------:|---------:|:-------|
| 2   | Validity | 0.9565952 | 0.732989 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9584008 | 0.3759943 |              | 1.095635 | 0.3784778 |              |

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
| 2   | nontargetContrast          |   1 |  15 | 22.3434185 | 0.0002700 | \*     | 0.2334639 |
| 3   | Validity                   |   2 |  30 | 12.4058908 | 0.0001185 | \*     | 0.1406117 |
| 4   | nontargetContrast:Validity |   2 |  30 |  0.8439156 | 0.4399781 |        | 0.0150359 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9078348 | 0.5082154 |        |
| 4   | nontargetContrast:Validity | 0.9482009 | 0.6891322 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity                   | 0.9156124 | 0.0002043 | \*           | 1.036528 | 0.0001185 | \*           |
| 4   | nontargetContrast:Validity | 0.9507519 | 0.4352603 |              | 1.085012 | 0.4399781 |              |

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
| 2   | nontargetContrast          |   1 |  15 | 9.200304 | 0.0083859 | \*     | 0.0832907 |
| 3   | Validity                   |   2 |  30 | 5.113912 | 0.0122722 | \*     | 0.0613839 |
| 4   | nontargetContrast:Validity |   2 |  30 | 1.839172 | 0.1764240 |        | 0.0238223 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9379345 | 0.6385688 |        |
| 4   | nontargetContrast:Validity | 0.8168223 | 0.2426013 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.9415616 | 0.0140343 | \*           | 1.0722815 | 0.0122722 | \*           |
| 4   | nontargetContrast:Validity | 0.8451816 | 0.1834034 |              | 0.9408901 | 0.1791290 |              |

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
| 2   | Target                            |   1 |  15 | 2.6404955 | 0.1249927 |        | 0.0118950 |
| 3   | nontargetContrast                 |   1 |  15 | 0.0223755 | 0.8830852 |        | 0.0001015 |
| 4   | Validity                          |   2 |  30 | 0.2676980 | 0.7669472 |        | 0.0019171 |
| 5   | Target:nontargetContrast          |   1 |  15 | 1.0012343 | 0.3328813 |        | 0.0046013 |
| 6   | Target:Validity                   |   2 |  30 | 4.6004790 | 0.0180871 | \*     | 0.0188594 |
| 7   | nontargetContrast:Validity        |   2 |  30 | 0.8457066 | 0.4392328 |        | 0.0031205 |
| 8   | Target:nontargetContrast:Validity |   2 |  30 | 1.8339508 | 0.1772467 |        | 0.0103216 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.7494375 | 0.1327846 |        |
| 6   | Target:Validity                   | 0.7719946 | 0.1634180 |        |
| 7   | nontargetContrast:Validity        | 0.9242998 | 0.5763548 |        |
| 8   | Target:nontargetContrast:Validity | 0.3604855 | 0.0007911 | \*     |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.7996401 | 0.7182404 |              | 0.8801201 | 0.7393597 |              |
| 6   | Target:Validity                   | 0.8143287 | 0.0261099 | \*           | 0.8996298 | 0.0220499 | \*           |
| 7   | nontargetContrast:Validity        | 0.9296270 | 0.4324380 |              | 1.0558025 | 0.4392328 |              |
| 8   | Target:nontargetContrast:Validity | 0.6099367 | 0.1931460 |              | 0.6356245 | 0.1923396 |              |

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
| 2   | Target          |   1 |  15 | 0.1787628 | 0.6784374 |        | 0.0020655 |
| 3   | Validity        |   2 |  30 | 0.7465019 | 0.4826224 |        | 0.0106442 |
| 4   | Target:Validity |   2 |  30 | 8.2108263 | 0.0014322 | \*     | 0.0603878 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8013174 | 0.2121445 |        |
| 4   | Target:Validity | 0.6881344 | 0.0730656 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8342492 | 0.4614412 |              | 0.9262262 | 0.4736704 |              |
| 4   | Target:Validity | 0.7622732 | 0.0038769 | \*           | 0.8308715 | 0.0029052 | \*           |

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
| 2   | Validity |   2 |  30 | 0.8807151 | 0.4249307 |        | 0.0188932 |

</td>
<td>

|     | Effect   |         W |        p | p\<.05 |
|:----|:---------|----------:|---------:|:-------|
| 2   | Validity | 0.6228179 | 0.036352 | \*     |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7261204 | 0.3971327 |              | 0.7837404 | 0.4038984 |              |

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

|     | Effect   | DFn | DFd |       F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|--------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  30 | 7.12749 | 0.0029335 | \*     | 0.1399362 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9727635 | 0.8242349 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9734857 | 0.0032213 | \*           | 1.116658 | 0.0029335 | \*           |

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
| 2   | Target          |   1 |  15 | 3.6675686 | 0.0747475 |        | 0.0265322 |
| 3   | Validity        |   2 |  30 | 0.1091268 | 0.8969710 |        | 0.0009060 |
| 4   | Target:Validity |   2 |  30 | 0.3979872 | 0.6751644 |        | 0.0044947 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8550785 | 0.3342273 |        |
| 4   | Target:Validity | 0.5477771 | 0.0147988 | \*     |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8734223 | 0.8720180 |              | 0.9789938 | 0.8932373 |              |
| 4   | Target:Validity | 0.6885995 | 0.6007002 |              | 0.7353548 | 0.6137800 |              |

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

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  30 | 0.477735 | 0.6248241 |        | 0.0084629 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8507819 | 0.3226471 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.8701569 | 0.5993965 |              | 0.9745713 | 0.6201054 |              |

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
| 2   | Validity |   2 |  30 | 0.0708508 | 0.9317563 |        | 0.0015477 |

</td>
<td>

|     | Effect   |        W |         p | p\<.05 |
|:----|:---------|---------:|----------:|:-------|
| 2   | Validity | 0.491938 | 0.0069722 | \*     |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.6631027 | 0.8585511 |              | 0.7027781 | 0.8705728 |              |

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
| 2   | nontargetContrast          |   1 |  15 | 0.7314932 | 0.4058540 |        | 0.0052419 |
| 3   | Validity                   |   2 |  30 | 1.0217069 | 0.3721664 |        | 0.0106711 |
| 4   | nontargetContrast:Validity |   2 |  30 | 0.2769273 | 0.7600265 |        | 0.0025102 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.8282757 | 0.2674389 |        |
| 4   | nontargetContrast:Validity | 0.6039675 | 0.0293154 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.8534431 | 0.3632260 |              | 0.9520034 | 0.3694645 |              |
| 4   | nontargetContrast:Validity | 0.7163157 | 0.6870364 |              | 0.7710450 | 0.7034011 |              |

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
| 2   | nontargetContrast          |   1 |  15 | 0.336183 | 0.5706479 |        | 0.0039604 |
| 3   | Validity                   |   2 |  30 | 2.839654 | 0.0742288 |        | 0.0341351 |
| 4   | nontargetContrast:Validity |   2 |  30 | 2.928254 | 0.0689127 |        | 0.0278989 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.7601706 | 0.1466823 |        |
| 4   | nontargetContrast:Validity | 0.7456331 | 0.1281375 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity                   | 0.8065626 | 0.0875826 |              | 0.889304 | 0.0816148 |              |
| 4   | nontargetContrast:Validity | 0.7972149 | 0.0828921 |              | 0.876907 | 0.0771022 |              |

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
