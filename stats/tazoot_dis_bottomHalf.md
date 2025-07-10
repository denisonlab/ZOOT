tazoot_dis_bottomHalf
================
Jenny Motzer
2025-07-09

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
| 2 | Target | 1 | 8 | 19.2356655 | 0.0023305 | \* | 0.1223377 |
| 3 | nontargetContrast | 1 | 8 | 11.2800178 | 0.0099528 | \* | 0.2528176 |
| 4 | Validity | 2 | 16 | 8.8496548 | 0.0025822 | \* | 0.1012996 |
| 5 | Target:nontargetContrast | 1 | 8 | 2.5757820 | 0.1471779 |  | 0.0083101 |
| 6 | Target:Validity | 2 | 16 | 0.9543898 | 0.4059120 |  | 0.0126571 |
| 7 | nontargetContrast:Validity | 2 | 16 | 2.3335418 | 0.1290406 |  | 0.0326500 |
| 8 | Target:nontargetContrast:Validity | 2 | 16 | 0.2040539 | 0.8175077 |  | 0.0032948 |

</td>

<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.9406315 | 0.8071761 |        |
| 6   | Target:Validity                   | 0.9245886 | 0.7600109 |        |
| 7   | nontargetContrast:Validity        | 0.8923086 | 0.6711240 |        |
| 8   | Target:nontargetContrast:Validity | 0.8381905 | 0.5391376 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 4 | Validity | 0.9439586 | 0.0031948 | \* | 1.226362 | 0.0025822 | \* |
| 6 | Target:Validity | 0.9298767 | 0.4012406 |  | 1.200097 | 0.4059120 |  |
| 7 | nontargetContrast:Validity | 0.9027785 | 0.1357268 |  | 1.150226 | 0.1290406 |  |
| 8 | Target:nontargetContrast:Validity | 0.8607263 | 0.7860934 |  | 1.074538 | 0.8175077 |  |

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
| 2   | Target          |   1 |   8 | 24.2396193 | 0.0011591 | \*     | 0.1876914 |
| 3   | Validity        |   2 |  16 |  6.2123056 | 0.0100787 | \*     | 0.2200910 |
| 4   | Target:Validity |   2 |  16 |  0.1254449 | 0.8829634 |        | 0.0053902 |

</td>

<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9404075 | 0.8065035 |        |
| 4   | Target:Validity | 0.6636476 | 0.2381120 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9437590 | 0.0116549 | \* | 1.2259883 | 0.0100787 | \* |
| 4 | Target:Validity | 0.7483056 | 0.8254486 |  | 0.8818096 | 0.8592422 |  |

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
| 2   | Validity |   2 |  16 | 3.779741 | 0.0452516 | \*     | 0.2812303 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9880605 | 0.9588316 |        |

</td>

<td>

|     | Effect   |       GGe | p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|--------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9882013 | 0.04596 | \*           | 1.310481 | 0.0452516 | \*           |

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
| 2   | Validity |   2 |  16 | 2.610231 | 0.1044531 |        | 0.1649785 |

</td>

<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8120689 | 0.4825863 |        |

</td>

<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |     HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|--------:|----------:|:-------------|
| 2   | Validity | 0.8417996 | 0.1161621 |              | 1.04113 | 0.1044531 |              |

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

|     | Effect                     | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |   8 | 12.5783344 | 0.0075468 | \*     | 0.3262555 |
| 3   | Validity                   |   2 |  16 |  5.3983283 | 0.0161553 | \*     | 0.1610353 |
| 4   | nontargetContrast:Validity |   2 |  16 |  0.8290045 | 0.4543871 |        | 0.0271254 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9420825 | 0.8115426 |        |
| 4   | nontargetContrast:Validity | 0.8857744 | 0.6540800 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.9452533 | 0.0181985 | \* | 1.228789 | 0.0161553 | \* |
| 4 | nontargetContrast:Validity | 0.8974843 | 0.4444727 |  | 1.140584 | 0.4543871 |  |

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
| 2   | nontargetContrast          |   1 |   8 | 7.885552 | 0.0229092 | \*     | 0.1841983 |
| 3   | Validity                   |   2 |  16 | 3.747417 | 0.0462574 | \*     | 0.0628994 |
| 4   | nontargetContrast:Validity |   2 |  16 | 1.608741 | 0.2308808 |        | 0.0431807 |

</td>

<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.8820066 | 0.6443938 |        |
| 4   | nontargetContrast:Validity | 0.8196239 | 0.4984839 |        |

</td>

<td>

|  | Effect | GGe | p\[GG\] | p\[GG\]\<.05 | HFe | p\[HF\] | p\[HF\]\<.05 |
|:---|:---|---:|---:|:---|---:|---:|:---|
| 3 | Validity | 0.8944596 | 0.0530713 |  | 1.13509 | 0.0462574 | \* |
| 4 | nontargetContrast:Validity | 0.8471876 | 0.2354501 |  | 1.05060 | 0.2308808 |  |

</td>

</tr>

</tbody>

</table>
