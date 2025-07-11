tazoot_dis_topHalf
================
Jenny Motzer
2025-07-11

------------------------------------------------------------------------

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

|  | Effect | DFn | DFd | F | p | p\<.05 | ges |
|:---|:---|---:|---:|---:|---:|:---|---:|
| 2 | Target | 1 | 8 | 22.7729262 | 0.0014048 | \* | 0.1585757 |
| 3 | nontargetContrast | 1 | 8 | 0.8161986 | 0.3926846 |  | 0.0290437 |
| 4 | Validity | 2 | 16 | 6.2430583 | 0.0099059 | \* | 0.0871533 |
| 5 | Target:nontargetContrast | 1 | 8 | 2.4769381 | 0.1541734 |  | 0.0190602 |
| 6 | Target:Validity | 2 | 16 | 2.2492468 | 0.1377794 |  | 0.0223475 |
| 7 | nontargetContrast:Validity | 2 | 16 | 3.3680493 | 0.0601495 |  | 0.0415835 |
| 8 | Target:nontargetContrast:Validity | 2 | 16 | 0.8230932 | 0.4568283 |  | 0.0084647 |

</td>

<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.9860984 | 0.9521841 |        |
| 6   | Target:Validity                   | 0.9124167 | 0.7255650 |        |
| 7   | nontargetContrast:Validity        | 0.2764381 | 0.0111069 | \*     |
| 8   | Target:nontargetContrast:Validity | 0.9326310 | 0.7834018 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.9862890 | 0.0102647 | \* | 1.3067944 | 0.0099059 | \* |
| 6 | Target:Validity | 0.9194698 | 0.1431383 |  | 1.1808403 | 0.1377794 |  |
| 7 | nontargetContrast:Validity | 0.5801939 | 0.0952209 |  | 0.6172491 | 0.0914612 |  |
| 8 | Target:nontargetContrast:Validity | 0.9368832 | 0.4507741 |  | 1.2131350 | 0.4568283 |  |

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

|     | Effect          | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |   8 | 17.289730 | 0.0031735 | \*     | 0.2824704 |
| 3   | Validity        |   2 |  16 |  5.679131 | 0.0136852 | \*     | 0.2274769 |
| 4   | Target:Validity |   2 |  16 |  1.617028 | 0.2292941 |        | 0.0380626 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.7436260 | 0.3546018 |        |
| 4   | Target:Validity | 0.8089632 | 0.4761575 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.7959413 | 0.0220119 | \* | 0.9618226 | 0.0149508 | \* |
| 4 | Target:Validity | 0.8396046 | 0.2341963 |  | 1.0372818 | 0.2292941 |  |

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
| 2   | Validity |   2 |  16 | 7.287739 | 0.0056231 | \*     | 0.3149132 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.5893733 | 0.1571689 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7089048 | 0.0139521 | \*           | 0.8173788 | 0.0099238 | \*           |

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
| 2   | Validity |   2 |  16 | 2.052524 | 0.1608863 |        | 0.1583916 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9726863 | 0.9076214 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |     HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|--------:|----------:|:-------------|
| 2   | Validity | 0.9734125 | 0.1624719 |              | 1.28209 | 0.1608863 |              |

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

|     | Effect          | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Target          |   1 |   8 | 6.572397 | 0.0334555 | \*     | 0.0694167 |
| 3   | Validity        |   2 |  16 | 2.432873 | 0.1195332 |        | 0.0264991 |
| 4   | Target:Validity |   2 |  16 | 1.441550 | 0.2656888 |        | 0.0248952 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.7111188 | 0.3032478 |        |
| 4   | Target:Validity | 0.6750801 | 0.2527805 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.7758667 | 0.1358504 |  | 0.9278153 | 0.1245968 |  |
| 4 | Target:Validity | 0.7547626 | 0.2679000 |  | 0.8925177 | 0.2670608 |  |

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
| 2   | Validity |   2 |  16 | 1.803564 | 0.1966292 |        | 0.0663495 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9748282 | 0.9146361 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9754463 | 0.1977777 |              | 1.285978 | 0.1966292 |              |

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

|     | Effect   | DFn | DFd |        F |        p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|---------:|:-------|----------:|
| 2   | Validity |   2 |  16 | 1.864379 | 0.187138 |        | 0.0351823 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7772225 | 0.4139128 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.8178103 | 0.1962354 |              | 0.9993579 | 0.1871704 |              |

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
| 2   | nontargetContrast          |   1 |   8 | 2.296959 | 0.1680954 |        | 0.0891356 |
| 3   | Validity                   |   2 |  16 | 8.691286 | 0.0027848 | \*     | 0.1751703 |
| 4   | nontargetContrast:Validity |   2 |  16 | 1.312872 | 0.2965178 |        | 0.0325466 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.6953649 | 0.2803785 |        |
| 4   | nontargetContrast:Validity | 0.3801692 | 0.0338781 | \*     |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.7664978 | 0.0066847 | \* | 0.9120886 | 0.0038667 | \* |
| 4 | nontargetContrast:Validity | 0.6173484 | 0.2906548 |  | 0.6734563 | 0.2924625 |  |

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
| 2   | nontargetContrast          |   1 |   8 | 0.0242125 | 0.8802001 |        | 0.0011215 |
| 3   | Validity                   |   2 |  16 | 0.9393932 | 0.4113918 |        | 0.0242623 |
| 4   | nontargetContrast:Validity |   2 |  16 | 3.3542388 | 0.0607373 |        | 0.0655049 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.7968489 | 0.4516644 |        |
| 4   | nontargetContrast:Validity | 0.8504568 | 0.5672611 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8311508 | 0.398746 |  | 1.022509 | 0.4113918 |  |
| 4 | nontargetContrast:Validity | 0.8699108 | 0.069953 |  | 1.090895 | 0.0607373 |  |

</td>

</tr>

</tbody>

</table>
