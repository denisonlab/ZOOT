tazoot_SDT
================
Jenny
2024-08-08

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax
for authoring HTML, PDF, and MS Word documents. For more details on
using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that
includes both content as well as the output of any embedded R code
chunks within the document. You can embed an R code chunk like this:

### SDT

## d prime

# detection

``` r
## det dprime 
d = data 
detdPrime_anova = ezANOVA(
  data = d,
  dv = .(det_dPrime),
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
| 2   | Target                            |   1 |  14 | 7.1036878 | 0.0184697 | \*     | 0.0382312 |
| 3   | nontargetContrast                 |   2 |  28 | 8.2839426 | 0.0014925 | \*     | 0.0558030 |
| 4   | Validity                          |   2 |  28 | 9.1141402 | 0.0008943 | \*     | 0.0609875 |
| 5   | Target:nontargetContrast          |   2 |  28 | 7.2377072 | 0.0029261 | \*     | 0.0335131 |
| 6   | Target:Validity                   |   2 |  28 | 0.9779651 | 0.3885555 |        | 0.0056499 |
| 7   | nontargetContrast:Validity        |   4 |  56 | 8.0954363 | 0.0000318 | \*     | 0.0197127 |
| 8   | Target:nontargetContrast:Validity |   4 |  56 | 1.3444556 | 0.2649594 |        | 0.0066512 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 3   | nontargetContrast                 | 0.4726100 | 0.0076607 | \*     |
| 4   | Validity                          | 0.9116304 | 0.5480524 |        |
| 5   | Target:nontargetContrast          | 0.2036677 | 0.0000322 | \*     |
| 6   | Target:Validity                   | 0.9019611 | 0.5113530 |        |
| 7   | nontargetContrast:Validity        | 0.1036633 | 0.0010123 | \*     |
| 8   | Target:nontargetContrast:Validity | 0.0388862 | 0.0000083 | \*     |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | nontargetContrast                 | 0.6547116 | 0.0063155 | \*           | 0.6950570 | 0.0053287 | \*           |
| 4   | Validity                          | 0.9188055 | 0.0013006 | \*           | 1.0509516 | 0.0008943 | \*           |
| 5   | Target:nontargetContrast          | 0.5566899 | 0.0143216 | \*           | 0.5703860 | 0.0136290 | \*           |
| 6   | Target:Validity                   | 0.9107146 | 0.3825739 |              | 1.0395898 | 0.3885555 |              |
| 7   | nontargetContrast:Validity        | 0.4750010 | 0.0020573 | \*           | 0.5475220 | 0.0011463 | \*           |
| 8   | Target:nontargetContrast:Validity | 0.4813051 | 0.2769615 |              | 0.5564968 | 0.2767049 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det dprime filtered nontarget present
d = data %>% filter(nontargetContrast==2)

detdPrimeNP_anova = ezANOVA(
  data = d,
  dv = .(det_dPrime),
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
| 2   | Target          |   1 |  14 | 0.3111374 | 0.5857926 |        | 0.0028592 |
| 3   | Validity        |   2 |  28 | 6.4040933 | 0.0051257 | \*     | 0.0491770 |
| 4   | Target:Validity |   2 |  28 | 0.5025305 | 0.6103507 |        | 0.0066483 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9247533 | 0.6014065 |        |
| 4   | Target:Validity | 0.9640390 | 0.7881608 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity        | 0.9300191 | 0.0063480 | \*           | 1.066749 | 0.0051257 | \*           |
| 4   | Target:Validity | 0.9652873 | 0.6041006 |              | 1.116815 | 0.6103507 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det dprime filtered nontarget present T1
d = data %>% filter(nontargetContrast==2, Target == 1)

detdPrimeNP_T1_anova = ezANOVA(
  data = d,
  dv = .(det_dPrime),
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
| 2   | Validity |   2 |  28 | 3.588626 | 0.0409775 | \*     | 0.0658267 |

</td>
<td>

|     | Effect   |         W |        p | p\<.05 |
|:----|:---------|----------:|---------:|:-------|
| 2   | Validity | 0.8689616 | 0.401332 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.8841433 | 0.0477474 | \*           | 1.002488 | 0.0409775 | \*           |

</td>
</tr>
</tbody>
</table>

``` r
## det dprime filtered nontarget present T2
d = data %>% filter(nontargetContrast==2, Target == 2)

detdPrimeNP_T2_anova = ezANOVA(
  data = d,
  dv = .(det_dPrime),
  wid = .(SID),
  within = .( Validity)
)
knitr::kable(detdPrimeNP_T2_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 2.253535 | 0.1237437 |        | 0.0482873 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9981594 | 0.9880963 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9981627 | 0.1238571 |              | 1.164014 | 0.1237437 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det dprime filtered nontarget absent
d = data %>% filter(nontargetContrast==3)

detdPrimeNA_anova = ezANOVA(
  data = d,
  dv = .(det_dPrime),
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
| 2   | Target          |   1 |  14 | 12.259773 | 0.0035254 | \*     | 0.1787669 |
| 3   | Validity        |   2 |  28 | 21.616792 | 0.0000021 | \*     | 0.2104015 |
| 4   | Target:Validity |   2 |  28 |  2.793399 | 0.0783163 |        | 0.0292626 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.5382289 | 0.0178355 | \*     |
| 4   | Target:Validity | 0.6931932 | 0.0923747 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.6841016 | 0.0000550 | \*           | 0.7331914 | 0.0000330 | \*           |
| 4   | Target:Validity | 0.7652240 | 0.0949444 |              | 0.8403157 | 0.0893043 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det dprime filtered nontarget absent T1
d = data %>% filter(nontargetContrast==3, Target == 1)

detdPrimeNA_T1_anova = ezANOVA(
  data = d,
  dv = .(det_dPrime),
  wid = .(SID),
  within = .( Validity)
)
knitr::kable(detdPrimeNA_T1_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |        F |        p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|---------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 15.17418 | 3.43e-05 | \*     | 0.2794726 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.4846558 | 0.0090223 | \*     |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.6599161 | 0.0004668 | \*           | 0.7017842 | 0.0003378 | \*           |

</td>
</tr>
</tbody>
</table>

``` r
## det dprime filtered nontarget absent T2
d = data %>% filter(nontargetContrast==3, Target == 2)

detdPrimeNA_T2_anova = ezANOVA(
  data = d,
  dv = .(det_dPrime),
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
| 2   | Validity |   2 |  28 | 8.184496 | 0.0015889 | \*     | 0.1372445 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.4786725 | 0.0083224 | \*     |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.6573206 | 0.0065224 | \*           | 0.698428 | 0.0054987 | \*           |

</td>
</tr>
</tbody>
</table>

``` r
## det dprime filtered T1
d = data %>% filter(Target==1)

detdPrimeT1_anova = ezANOVA(
  data = d,
  dv = .(det_dPrime),
  wid = .(SID),
  within = .(nontargetContrast, Validity)
)
knitr::kable(detdPrimeT1_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect                     | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   2 |  28 | 2.604511 | 0.0917545 |        | 0.0200092 |
| 3   | Validity                   |   2 |  28 | 9.580850 | 0.0006760 | \*     | 0.0908564 |
| 4   | nontargetContrast:Validity |   4 |  56 | 5.226165 | 0.0011958 | \*     | 0.0413920 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 2   | nontargetContrast          | 0.7144582 | 0.1124215 |        |
| 3   | Validity                   | 0.8743003 | 0.4176322 |        |
| 4   | nontargetContrast:Validity | 0.0503875 | 0.0000300 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.7778821 | 0.1072684 |              | 0.8572830 | 0.1014836 |              |
| 3   | Validity                   | 0.8883364 | 0.0011645 | \*           | 1.0083216 | 0.0006760 | \*           |
| 4   | nontargetContrast:Validity | 0.4177476 | 0.0173341 | \*           | 0.4676949 | 0.0137077 | \*           |

</td>
</tr>
</tbody>
</table>

``` r
## det dprime filtered T2
d = data %>% filter(Target==2)

detdPrimeT2_anova = ezANOVA(
  data = d,
  dv = .(det_dPrime),
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
| 2   | nontargetContrast          |   2 |  28 | 10.350040 | 0.0004313 | \*     | 0.1407366 |
| 3   | Validity                   |   2 |  28 |  2.783427 | 0.0789703 |        | 0.0409162 |
| 4   | nontargetContrast:Validity |   4 |  56 |  1.667580 | 0.1703861 |        | 0.0110538 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 2   | nontargetContrast          | 0.2647854 | 0.0001773 | \*     |
| 3   | Validity                   | 0.9754614 | 0.8508749 |        |
| 4   | nontargetContrast:Validity | 0.0744517 | 0.0002059 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.5762976 | 0.0041122 | \*           | 0.5950201 | 0.0037182 | \*           |
| 3   | Validity                   | 0.9760492 | 0.0805328 |              | 1.1322086 | 0.0789703 |              |
| 4   | nontargetContrast:Validity | 0.5445174 | 0.2037656 |              | 0.6486049 | 0.1960946 |              |

</td>
</tr>
</tbody>
</table>

# discrimination

``` r
## dis dprime 
d = data 
disdPrime_anova = ezANOVA(
  data = d,
  dv = .(dis_dPrime),
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
| 2   | Target                            |   1 |  14 | 36.1733400 | 0.0000318 | \*     | 0.1655106 |
| 3   | nontargetContrast                 |   2 |  28 | 22.1462845 | 0.0000017 | \*     | 0.1048366 |
| 4   | Validity                          |   2 |  28 | 12.3860971 | 0.0001401 | \*     | 0.1156305 |
| 5   | Target:nontargetContrast          |   2 |  28 |  4.6366421 | 0.0182241 | \*     | 0.0126485 |
| 6   | Target:Validity                   |   2 |  28 |  0.0894040 | 0.9147360 |        | 0.0006949 |
| 7   | nontargetContrast:Validity        |   4 |  56 |  0.8564198 | 0.4958048 |        | 0.0061489 |
| 8   | Target:nontargetContrast:Validity |   4 |  56 |  0.3186557 | 0.8643208 |        | 0.0015982 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 3   | nontargetContrast                 | 0.0477655 | 0.0000000 | \*     |
| 4   | Validity                          | 0.9187717 | 0.5765667 |        |
| 5   | Target:nontargetContrast          | 0.1087543 | 0.0000005 | \*     |
| 6   | Target:Validity                   | 0.8587351 | 0.3716079 |        |
| 7   | nontargetContrast:Validity        | 0.0010361 | 0.0000000 | \*     |
| 8   | Target:nontargetContrast:Validity | 0.0039263 | 0.0000000 | \*     |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | nontargetContrast                 | 0.5122335 | 0.0002960 | \*           | 0.5150851 | 0.0002871 | \*           |
| 4   | Validity                          | 0.9248741 | 0.0002252 | \*           | 1.0594934 | 0.0001401 | \*           |
| 5   | Target:nontargetContrast          | 0.5287520 | 0.0464885 | \*           | 0.5355443 | 0.0458658 | \*           |
| 6   | Target:Validity                   | 0.8762208 | 0.8921943 |              | 0.9914884 | 0.9133647 |              |
| 7   | nontargetContrast:Validity        | 0.4542088 | 0.4268291 |              | 0.5181850 | 0.4387076 |              |
| 8   | Target:nontargetContrast:Validity | 0.4700145 | 0.7166914 |              | 0.5404496 | 0.7459792 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis dprime filtered nontarget present
d = data %>% filter(nontargetContrast==2)

disdPrimeNP_anova = ezANOVA(
  data = d,
  dv = .(dis_dPrime),
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
| 2   | Target          |   1 |  14 | 43.5100339 | 0.0000120 | \*     | 0.2251334 |
| 3   | Validity        |   2 |  28 |  7.3406837 | 0.0027345 | \*     | 0.1593425 |
| 4   | Target:Validity |   2 |  28 |  0.0925023 | 0.9119245 |        | 0.0013726 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9090145 | 0.5379107 |        |
| 4   | Target:Validity | 0.9079363 | 0.5337770 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity        | 0.9166024 | 0.0036951 | \*           | 1.047855 | 0.0027345 | \*           |
| 4   | Target:Validity | 0.9156975 | 0.8970064 |              | 1.046584 | 0.9119245 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis dprime filtered nontarget present T1
d = data %>% filter(nontargetContrast==2, Target == 1)

disdPrimeNP_T1_anova = ezANOVA(
  data = d,
  dv = .(dis_dPrime),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(disdPrimeNP_T1_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 6.168623 | 0.0060301 | \*     | 0.1903416 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9042355 | 0.5197925 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9126048 | 0.0077806 | \*           | 1.042242 | 0.0060301 | \*           |

</td>
</tr>
</tbody>
</table>

``` r
## dis dprime filtered nontarget present T2
d = data %>% filter(nontargetContrast==2, Target == 2)

disdPrimeNP_T2_anova = ezANOVA(
  data = d,
  dv = .(dis_dPrime),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(disdPrimeNP_T2_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 3.805349 | 0.0345212 | \*     | 0.1389341 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9781732 | 0.8663681 |        |

</td>
<td>

|     | Effect   |       GGe | p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|--------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9786394 | 0.03561 | \*           | 1.135922 | 0.0345212 | \*           |

</td>
</tr>
</tbody>
</table>

``` r
## dis dprime filtered nontarget absent
d = data %>% filter(nontargetContrast==3)

disdPrimeNA_anova = ezANOVA(
  data = d,
  dv = .(dis_dPrime),
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
| 2   | Target          |   1 |  14 | 7.8319968 | 0.0142203 | \*     | 0.0709419 |
| 3   | Validity        |   2 |  28 | 6.0916963 | 0.0063615 | \*     | 0.0668457 |
| 4   | Target:Validity |   2 |  28 | 0.3611201 | 0.7000936 |        | 0.0042071 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8856477 | 0.4541471 |        |
| 4   | Target:Validity | 0.8295500 | 0.2968087 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity        | 0.8973823 | 0.0085410 | \*           | 1.020934 | 0.0063615 | \*           |
| 4   | Target:Validity | 0.8543722 | 0.6677103 |              | 0.961300 | 0.6919963 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis dprime filtered nontarget absent T1
d = data %>% filter(nontargetContrast==3, Target == 1)

disdPrimeNA_T1_anova = ezANOVA(
  data = d,
  dv = .(dis_dPrime),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(disdPrimeNA_T1_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 3.544989 | 0.0424276 | \*     | 0.0920754 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8930828 | 0.4795083 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9034099 | 0.0480672 | \*           | 1.029358 | 0.0424276 | \*           |

</td>
</tr>
</tbody>
</table>

``` r
## dis dprime filtered nontarget absent T2
d = data %>% filter(nontargetContrast==3, Target == 2)

disdPrimeNA_T2_anova = ezANOVA(
  data = d,
  dv = .(dis_dPrime),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(disdPrimeNA_T2_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 2.746774 | 0.0814247 |        | 0.0478711 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9794042 | 0.8734796 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9798198 | 0.0827426 |              | 1.137615 | 0.0814247 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis dprime filtered T1
d = data %>% filter(Target==1)

disdPrimeT1_anova = ezANOVA(
  data = d,
  dv = .(dis_dPrime),
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
| 2   | nontargetContrast          |   2 |  28 | 19.8426414 | 0.0000043 | \*     | 0.1940043 |
| 3   | Validity                   |   2 |  28 |  9.8446551 | 0.0005785 | \*     | 0.1499398 |
| 4   | nontargetContrast:Validity |   4 |  56 |  0.2186786 | 0.9269449 |        | 0.0030597 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 2   | nontargetContrast          | 0.0338373 | 0.0000000 | \*     |
| 3   | Validity                   | 0.8950537 | 0.4864286 |        |
| 4   | nontargetContrast:Validity | 0.0013212 | 0.0000000 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.5086049 | 0.0005006 | \*           | 0.5106047 | 0.0004909 | \*           |
| 3   | Validity                   | 0.9050213 | 0.0009311 | \*           | 1.0316131 | 0.0005785 | \*           |
| 4   | nontargetContrast:Validity | 0.4688495 | 0.7912568 |              | 0.5388006 | 0.8204473 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis dprime filtered T2
d = data %>% filter(Target==2)

disdPrimeT2_anova = ezANOVA(
  data = d,
  dv = .(dis_dPrime),
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
| 2   | nontargetContrast          |   2 |  28 | 9.506701 | 0.0007065 | \*     | 0.0456031 |
| 3   | Validity                   |   2 |  28 | 5.262994 | 0.0114725 | \*     | 0.0893515 |
| 4   | nontargetContrast:Validity |   4 |  56 | 1.033357 | 0.3981918 |        | 0.0111606 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 2   | nontargetContrast          | 0.1252181 | 0.0000014 | \*     |
| 3   | Validity                   | 0.9721326 | 0.8321770 |        |
| 4   | nontargetContrast:Validity | 0.0020093 | 0.0000000 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.5333954 | 0.0068658 | \*           | 0.5413143 | 0.0066027 | \*           |
| 3   | Validity                   | 0.9728881 | 0.0122309 | \*           | 1.1276812 | 0.0114725 | \*           |
| 4   | nontargetContrast:Validity | 0.4322913 | 0.3611827 |              | 0.4876905 | 0.3676907 |              |

</td>
</tr>
</tbody>
</table>

### paired t-test

## detection dprime

\#all conditions
<img src="tazoot_SDT_files/figure-gfm/vi_detdAll T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_detdAll T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_detdAll T1-1.png" width="90%" />

\#T2
<img src="tazoot_SDT_files/figure-gfm/vi_detdAll T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_detdAll T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_detdAll T2-1.png" width="90%" />
\# nontarget present
<img src="tazoot_SDT_files/figure-gfm/vi_detdNP T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_detdNP T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_detdNP T1-1.png" width="90%" />

\#T2
<img src="tazoot_SDT_files/figure-gfm/vi_detdNP T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_detdNP T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_detdNP T2-1.png" width="90%" />
\# nontarget absent
<img src="tazoot_SDT_files/figure-gfm/vi_detdNA T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_detdNA T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_detdNA T1-1.png" width="90%" />

\#T2
<img src="tazoot_SDT_files/figure-gfm/vi_detdNA T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_detdNA T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_detdNA T2-1.png" width="90%" />

## discrimination

\#all conditions
<img src="tazoot_SDT_files/figure-gfm/vi_disdAll T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_disdAll T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_disdAll T1-1.png" width="90%" />

\#T2
<img src="tazoot_SDT_files/figure-gfm/vi_disdAll T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_disdAll T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_disdAll T2-1.png" width="90%" />
\# nontarget present
<img src="tazoot_SDT_files/figure-gfm/vi_disdNP T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_disdNP T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_disdNP T1-1.png" width="90%" />

\#T2
<img src="tazoot_SDT_files/figure-gfm/vi_disdNP T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_disdNP T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_disdNP T2-1.png" width="90%" />
\# nontarget absent
<img src="tazoot_SDT_files/figure-gfm/vi_disdNA T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_disdNA T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_disdNA T1-1.png" width="90%" />

\#T2
<img src="tazoot_SDT_files/figure-gfm/vi_disdNA T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_disdNA T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_disdNA T2-1.png" width="90%" />

## criterion

# detection

``` r
## det crit 
d = data 
detcrit_anova = ezANOVA(
  data = d,
  dv = .(det_crit),
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
| 2   | Target                            |   1 |  14 | 10.6135172 | 0.0057228 | \*     | 0.1010936 |
| 3   | nontargetContrast                 |   2 |  28 | 62.6535202 | 0.0000000 | \*     | 0.5503489 |
| 4   | Validity                          |   2 |  28 | 10.8189999 | 0.0003302 | \*     | 0.0532441 |
| 5   | Target:nontargetContrast          |   2 |  28 |  6.3407700 | 0.0053536 | \*     | 0.0219094 |
| 6   | Target:Validity                   |   2 |  28 |  2.4103024 | 0.1081833 |        | 0.0168410 |
| 7   | nontargetContrast:Validity        |   4 |  56 |  3.2146075 | 0.0190923 | \*     | 0.0158595 |
| 8   | Target:nontargetContrast:Validity |   4 |  56 |  0.5898051 | 0.6713839 |        | 0.0030977 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 3   | nontargetContrast                 | 0.0848360 | 0.0000001 | \*     |
| 4   | Validity                          | 0.9836005 | 0.8980939 |        |
| 5   | Target:nontargetContrast          | 0.6394221 | 0.0546537 |        |
| 6   | Target:Validity                   | 0.8747981 | 0.4191805 |        |
| 7   | nontargetContrast:Validity        | 0.0074605 | 0.0000000 | \*     |
| 8   | Target:nontargetContrast:Validity | 0.0407610 | 0.0000105 | \*     |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | nontargetContrast                 | 0.5221485 | 0.0000010 | \*           | 0.5273529 | 0.0000009 | \*           |
| 4   | Validity                          | 0.9838651 | 0.0003610 | \*           | 1.1434232 | 0.0003302 | \*           |
| 5   | Target:nontargetContrast          | 0.7349818 | 0.0119609 | \*           | 0.8000557 | 0.0098086 | \*           |
| 6   | Target:Validity                   | 0.8887294 | 0.1155098 |              | 1.0088689 | 0.1081833 |              |
| 7   | nontargetContrast:Validity        | 0.5087354 | 0.0543257 |              | 0.5959879 | 0.0449820 | \*           |
| 8   | Target:nontargetContrast:Validity | 0.5323242 | 0.5709542 |              | 0.6305325 | 0.5975587 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det crit filtered nontarget present
d = data %>% filter(nontargetContrast==2)

detcritNP_anova = ezANOVA(
  data = d,
  dv = .(det_crit),
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
| 2   | Target          |   1 |  14 | 1.251328 | 0.2821261 |        | 0.0100364 |
| 3   | Validity        |   2 |  28 | 7.051909 | 0.0033091 | \*     | 0.0613925 |
| 4   | Target:Validity |   2 |  28 | 1.846568 | 0.1764816 |        | 0.0169577 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8397953 | 0.3214604 |        |
| 4   | Target:Validity | 0.7763844 | 0.1929742 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8619169 | 0.0053255 | \*           | 0.9717002 | 0.0036471 | \*           |
| 4   | Target:Validity | 0.8172502 | 0.1848104 |              | 0.9104972 | 0.1806258 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det crit filtered nontarget present T1
d = data %>% filter(nontargetContrast==2, Target == 1)

detcritNP_T1_anova = ezANOVA(
  data = d,
  dv = .(det_crit),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(detcritNP_T1_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 5.536061 | 0.0094205 | \*     | 0.1181834 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8438897 | 0.3317852 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.8649694 | 0.0132659 | \*           | 0.9759153 | 0.0100119 | \*           |

</td>
</tr>
</tbody>
</table>

``` r
## det crit filtered nontarget present T2
d = data %>% filter(nontargetContrast==2, Target == 2)

detcritNP_T2_anova = ezANOVA(
  data = d,
  dv = .(det_crit),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(detcritNP_T2_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 2.620707 | 0.0905106 |        | 0.0340674 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7802487 | 0.1993034 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.8198392 | 0.1029525 |              | 0.9140206 | 0.0962701 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det crit filtered nontarget absent
d = data %>% filter(nontargetContrast==3)

detcritNA_anova = ezANOVA(
  data = d,
  dv = .(det_crit),
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
| 2   | Target          |   1 |  14 | 16.8823717 | 0.0010637 | \*     | 0.2489680 |
| 3   | Validity        |   2 |  28 |  3.1570475 | 0.0580225 |        | 0.0464640 |
| 4   | Target:Validity |   2 |  28 |  0.2984693 | 0.7442843 |        | 0.0056719 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8815365 | 0.4406178 |        |
| 4   | Target:Validity | 0.8701654 | 0.4049596 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity        | 0.8940837 | 0.0648420 |              | 1.016330 | 0.0580225 |              |
| 4   | Target:Validity | 0.8850853 | 0.7182209 |              | 1.003798 | 0.7442843 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det crit filtered nontarget absent T1
d = data %>% filter(nontargetContrast==3, Target == 1)

detcritNA_T1_anova = ezANOVA(
  data = d,
  dv = .(det_crit),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(detcritNA_T1_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 2.199434 | 0.1296566 |        | 0.0614675 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7783472 | 0.1961673 |        |

</td>
<td>

|     | Effect   |       GGe |  p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|---------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.8185631 | 0.140915 |              | 0.9122836 | 0.1350392 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det crit filtered nontarget present T2
d = data %>% filter(nontargetContrast==3, Target == 2)

detcritNA_T2_anova = ezANOVA(
  data = d,
  dv = .(det_crit),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(detcritNA_T2_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 0.7534802 | 0.4800316 |        | 0.0319411 |

</td>
<td>

|     | Effect   |         W |        p | p\<.05 |
|:----|:---------|----------:|---------:|:-------|
| 2   | Validity | 0.9430163 | 0.682928 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9460884 | 0.4736805 |              | 1.089488 | 0.4800316 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det crit filtered T1
d = data %>% filter(Target==1)

detcritT1_anova = ezANOVA(
  data = d,
  dv = .(det_crit),
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
| 2   | nontargetContrast          |   2 |  28 | 58.368671 | 0.0000000 | \*     | 0.6097523 |
| 3   | Validity                   |   2 |  28 |  9.570281 | 0.0006803 | \*     | 0.1195745 |
| 4   | nontargetContrast:Validity |   4 |  56 |  1.929668 | 0.1181522 |        | 0.0250643 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 2   | nontargetContrast          | 0.0923377 | 0.0000002 | \*     |
| 3   | Validity                   | 0.9980455 | 0.9873641 |        |
| 4   | nontargetContrast:Validity | 0.0162424 | 0.0000001 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.5242018 | 0.0000014 | \*           | 0.5298982 | 0.0000013 | \*           |
| 3   | Validity                   | 0.9980493 | 0.0006867 | \*           | 1.1638500 | 0.0006803 | \*           |
| 4   | nontargetContrast:Validity | 0.4335009 | 0.1707823 |              | 0.4893620 | 0.1651070 |              |

</td>
</tr>
</tbody>
</table>

``` r
## det crit filtered T1
d = data %>% filter(Target==2)

detcritT2_anova = ezANOVA(
  data = d,
  dv = .(det_crit),
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
| 2   | nontargetContrast          |   2 |  28 | 48.510395 | 0.0000000 | \*     | 0.4876178 |
| 3   | Validity                   |   2 |  28 |  1.437304 | 0.2545611 |        | 0.0149322 |
| 4   | nontargetContrast:Validity |   4 |  56 |  1.769446 | 0.1478816 |        | 0.0130050 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 2   | nontargetContrast          | 0.2830546 | 0.0002736 | \*     |
| 3   | Validity                   | 0.7262294 | 0.1250201 |        |
| 4   | nontargetContrast:Validity | 0.0261836 | 0.0000011 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.5824297 | 0.0000015 | \*           | 0.6027550 | 0.0000010 | \*           |
| 3   | Validity                   | 0.7850707 | 0.2558802 |              | 0.8669496 | 0.2557073 |              |
| 4   | nontargetContrast:Validity | 0.4828847 | 0.1903838 |              | 0.5587515 | 0.1839673 |              |

</td>
</tr>
</tbody>
</table>

# discrimination

``` r
## dis crit 
d = data 
discrit_anova = ezANOVA(
  data = d,
  dv = .(dis_crit),
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
| 2   | Target                            |   1 |  14 | 2.1792540 | 0.1620187 |        | 0.0146094 |
| 3   | nontargetContrast                 |   2 |  28 | 0.0623075 | 0.9397239 |        | 0.0002529 |
| 4   | Validity                          |   2 |  28 | 0.3131708 | 0.7336527 |        | 0.0029012 |
| 5   | Target:nontargetContrast          |   2 |  28 | 2.5299739 | 0.0977197 |        | 0.0064017 |
| 6   | Target:Validity                   |   2 |  28 | 3.7603594 | 0.0357658 | \*     | 0.0211659 |
| 7   | nontargetContrast:Validity        |   4 |  56 | 0.5235248 | 0.7188105 |        | 0.0018395 |
| 8   | Target:nontargetContrast:Validity |   4 |  56 | 1.3063942 | 0.2788152 |        | 0.0063178 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 3   | nontargetContrast                 | 0.1327630 | 0.0000020 | \*     |
| 4   | Validity                          | 0.7398805 | 0.1411075 |        |
| 5   | Target:nontargetContrast          | 0.1353646 | 0.0000023 | \*     |
| 6   | Target:Validity                   | 0.8710559 | 0.4076611 |        |
| 7   | nontargetContrast:Validity        | 0.0296273 | 0.0000021 | \*     |
| 8   | Target:nontargetContrast:Validity | 0.0033474 | 0.0000000 | \*     |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | nontargetContrast                 | 0.5355507 | 0.8228907 |              | 0.5439953 | 0.8265428 |              |
| 4   | Validity                          | 0.7935755 | 0.6843631 |              | 0.8784150 | 0.7061484 |              |
| 5   | Target:nontargetContrast          | 0.5362979 | 0.1313107 |              | 0.5449252 | 0.1306591 |              |
| 6   | Target:Validity                   | 0.8857835 | 0.0421003 | \*           | 1.0047691 | 0.0357658 | \*           |
| 7   | nontargetContrast:Validity        | 0.5396095 | 0.6112577 |              | 0.6413126 | 0.6411891 |              |
| 8   | Target:nontargetContrast:Validity | 0.3585678 | 0.2824790 |              | 0.3882399 | 0.2839755 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis crit filtered nontarget present
d = data %>% filter(nontargetContrast==2)

discritNP_anova = ezANOVA(
  data = d,
  dv = .(dis_crit),
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
| 2   | Target          |   1 |  14 | 0.0410128 | 0.8424268 |        | 0.0005454 |
| 3   | Validity        |   2 |  28 | 0.3278887 | 0.7231722 |        | 0.0054181 |
| 4   | Target:Validity |   2 |  28 | 8.3015968 | 0.0014760 | \*     | 0.0629797 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8398443 | 0.3215823 |        |
| 4   | Target:Validity | 0.8651869 | 0.3901348 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8619533 | 0.6918870 |              | 0.9717504 | 0.7171709 |              |
| 4   | Target:Validity | 0.8812024 | 0.0024206 | \*           | 0.9984017 | 0.0014858 | \*           |

</td>
</tr>
</tbody>
</table>

``` r
## dis crit filtered nontarget present T1
d = data %>% filter(nontargetContrast==2, Target ==1 )

discritNP_T1_anova = ezANOVA(
  data = d,
  dv = .(dis_crit),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(discritNP_T1_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 1.729447 | 0.1957962 |        | 0.0343329 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7154507 | 0.1134405 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7784832 | 0.2038629 |              | 0.8580904 | 0.2011409 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis crit filtered nontarget present T2
d = data %>% filter(nontargetContrast==2, Target ==2 )

discritNP_T2_anova = ezANOVA(
  data = d,
  dv = .(dis_crit),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(discritNP_T2_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |      ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|---------:|
| 2   | Validity |   2 |  28 | 4.002842 | 0.0295813 | \*     | 0.107315 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9925983 | 0.9528571 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9926526 | 0.0299261 | \*           | 1.156067 | 0.0295813 | \*           |

</td>
</tr>
</tbody>
</table>

``` r
## dis crit filtered nontarget absent
d = data %>% filter(nontargetContrast==3)

discritNA_anova = ezANOVA(
  data = d,
  dv = .(dis_crit),
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
| 2   | Target          |   1 |  14 | 4.8370988 | 0.0451561 | \*     | 0.0353014 |
| 3   | Validity        |   2 |  28 | 0.3016780 | 0.7419499 |        | 0.0031172 |
| 4   | Target:Validity |   2 |  28 | 0.1783087 | 0.8376267 |        | 0.0025945 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9068208 | 0.5295288 |        |
| 4   | Target:Validity | 0.6403997 | 0.0551992 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.9147631 | 0.7229943 |              | 1.0452713 | 0.7419499 |              |
| 4   | Target:Validity | 0.7355103 | 0.7710030 |              | 0.8007559 | 0.7901870 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis crit filtered nontarget absent T1
d = data %>% filter(nontargetContrast==3, Target ==1 )

discritNA_T1_anova = ezANOVA(
  data = d,
  dv = .(dis_crit),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(discritNA_T1_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 0.4790991 | 0.6243253 |        | 0.0110011 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8698357 | 0.4039634 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.8848271 | 0.6020548 |              | 1.003439 | 0.6243253 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis crit filtered nontarget absent T2
d = data %>% filter(nontargetContrast==3, Target ==2 )

discritNA_T2_anova = ezANOVA(
  data = d,
  dv = .(dis_crit),
  wid = .(SID),
  within = .(Validity)
)
knitr::kable(discritNA_T2_anova)
```

<table class="kable_wrapper">
<tbody>
<tr>
<td>

|     | Effect   | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 0.0046504 | 0.9953612 |        | 0.0001244 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.6661835 | 0.0713444 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7497283 | 0.9845261 |              | 0.8196383 | 0.9889797 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis crit filtered T1
d = data %>% filter(Target==1)

discritT1_anova = ezANOVA(
  data = d,
  dv = .(dis_crit),
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
| 2   | nontargetContrast          |   2 |  28 | 1.7019108 | 0.2006584 |        | 0.0085048 |
| 3   | Validity                   |   2 |  28 | 1.6734816 | 0.2058144 |        | 0.0202870 |
| 4   | nontargetContrast:Validity |   4 |  56 | 0.2717156 | 0.8949899 |        | 0.0021001 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 2   | nontargetContrast          | 0.1224998 | 0.0000012 | \*     |
| 3   | Validity                   | 0.7670922 | 0.1784469 |        |
| 4   | nontargetContrast:Validity | 0.0045600 | 0.0000000 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.5326231 | 0.2130310 |              | 0.5403540 | 0.2129910 |              |
| 3   | Validity                   | 0.8110906 | 0.2119051 |              | 0.9021266 | 0.2091154 |              |
| 4   | nontargetContrast:Validity | 0.4261181 | 0.7295241 |              | 0.4791801 | 0.7549708 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis crit filtered T2
d = data %>% filter(Target==2)

discritT2_anova = ezANOVA(
  data = d,
  dv = .(dis_crit),
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
| 2   | nontargetContrast          |   2 |  28 | 0.5530018 | 0.5813750 |        | 0.0045910 |
| 3   | Validity                   |   2 |  28 | 1.5987579 | 0.2200555 |        | 0.0279650 |
| 4   | nontargetContrast:Validity |   4 |  56 | 1.6434255 | 0.1761814 |        | 0.0147306 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 2   | nontargetContrast          | 0.1383282 | 0.0000026 | \*     |
| 3   | Validity                   | 0.8893724 | 0.4667063 |        |
| 4   | nontargetContrast:Validity | 0.0313715 | 0.0000027 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.5371516 | 0.4807325 |              | 0.5459879 | 0.4833231 |              |
| 3   | Validity                   | 0.9003918 | 0.2227454 |              | 1.0251377 | 0.2200555 |              |
| 4   | nontargetContrast:Validity | 0.4714892 | 0.2132294 |              | 0.5425387 | 0.2085874 |              |

</td>
</tr>
</tbody>
</table>

### paired t-test

## detection crit

\#all conditions
<img src="tazoot_SDT_files/figure-gfm/vi_detcAll T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_detcAll T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_detcAll T1-1.png" width="90%" />
\#T2
<img src="tazoot_SDT_files/figure-gfm/vi_detcAll T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_detcAll T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_detcAll T2-1.png" width="90%" />

# nontarget present

<img src="tazoot_SDT_files/figure-gfm/vi_detcNP T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_detcNP T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_detcNP T1-1.png" width="90%" />

\#T2
<img src="tazoot_SDT_files/figure-gfm/vi_detcNP T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_detcNP T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_detcNP T2-1.png" width="90%" />

# nontarget absent

<img src="tazoot_SDT_files/figure-gfm/vi_detcNA T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_detcNA T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_detcNA T1-1.png" width="90%" />

\#T2
<img src="tazoot_SDT_files/figure-gfm/vi_detcNA T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_detcNA T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_detcNA T2-1.png" width="90%" />

## discrimination

\#all conditions
<img src="tazoot_SDT_files/figure-gfm/vi_discAll T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_discAll T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_discAll T1-1.png" width="90%" />

\#T2
<img src="tazoot_SDT_files/figure-gfm/vi_discAll T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_discAll T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_discAll T2-1.png" width="90%" />

# nontarget present

<img src="tazoot_SDT_files/figure-gfm/vi_discNP T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_discNP T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_discNP T1-1.png" width="90%" />

\#T2
<img src="tazoot_SDT_files/figure-gfm/vi_discNP T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_discNP T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_discNP T2-1.png" width="90%" />

# nontarget absent

<img src="tazoot_SDT_files/figure-gfm/vi_discNA T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_discNA T1-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_discNA T1-1.png" width="90%" />

\#T2
<img src="tazoot_SDT_files/figure-gfm/vi_discNA T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/vn_discNA T2-1.png" width="90%" />

<img src="tazoot_SDT_files/figure-gfm/in_discNA T2-1.png" width="90%" />
