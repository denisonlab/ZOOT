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

|     | Effect                            | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:----------------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | Target                            |   1 |  14 |  5.0410922 | 0.0414241 | \*     | 0.0268044 |
| 3   | nontargetContrast                 |   2 |  28 | 14.2168024 | 0.0000548 | \*     | 0.0966161 |
| 4   | Validity                          |   2 |  28 | 14.6548820 | 0.0000442 | \*     | 0.0939202 |
| 5   | Target:nontargetContrast          |   2 |  28 |  6.8390618 | 0.0038150 | \*     | 0.0291638 |
| 6   | Target:Validity                   |   2 |  28 |  0.9411806 | 0.4021645 |        | 0.0051513 |
| 7   | nontargetContrast:Validity        |   4 |  56 |  9.5004811 | 0.0000062 | \*     | 0.0211903 |
| 8   | Target:nontargetContrast:Validity |   4 |  56 |  1.3510676 | 0.2626166 |        | 0.0062162 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 3   | nontargetContrast                 | 0.3414088 | 0.0009253 | \*     |
| 4   | Validity                          | 0.9223928 | 0.5914981 |        |
| 5   | Target:nontargetContrast          | 0.2008358 | 0.0000294 | \*     |
| 6   | Target:Validity                   | 0.8396701 | 0.3211490 |        |
| 7   | nontargetContrast:Validity        | 0.0961053 | 0.0007088 | \*     |
| 8   | Target:nontargetContrast:Validity | 0.0271396 | 0.0000013 | \*     |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | nontargetContrast                 | 0.6029213 | 0.0009720 | \*           | 0.6287104 | 0.0008051 | \*           |
| 4   | Validity                          | 0.9279819 | 0.0000752 | \*           | 1.0638744 | 0.0000442 | \*           |
| 5   | Target:nontargetContrast          | 0.5558136 | 0.0168638 | \*           | 0.5692887 | 0.0161131 | \*           |
| 6   | Target:Validity                   | 0.8618239 | 0.3914310 |              | 0.9715719 | 0.4001165 |              |
| 7   | nontargetContrast:Validity        | 0.4829827 | 0.0008355 | \*           | 0.5588915 | 0.0004027 | \*           |
| 8   | Target:nontargetContrast:Validity | 0.4864857 | 0.2753367 |              | 0.5639002 | 0.2748554 |              |

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

|     | Effect          | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |  14 |  0.4508415 | 0.5128631 |        | 0.0041441 |
| 3   | Validity        |   2 |  28 | 10.0871507 | 0.0005021 | \*     | 0.0728684 |
| 4   | Target:Validity |   2 |  28 |  0.6779499 | 0.5157947 |        | 0.0080556 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9701247 | 0.8210678 |        |
| 4   | Target:Validity | 0.9469071 | 0.7014518 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity        | 0.9709913 | 0.0005827 | \*           | 1.124967 | 0.0005021 | \*           |
| 4   | Target:Validity | 0.9495838 | 0.5088946 |              | 1.094450 | 0.5157947 |              |

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
| 2   | Validity |   2 |  28 | 5.520363 | 0.0095271 | \*     | 0.0921426 |

</td>
<td>

|     | Effect   |        W |         p | p\<.05 |
|:----|:---------|---------:|----------:|:-------|
| 2   | Validity | 0.902824 | 0.5145413 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9114308 | 0.0119122 | \*           | 1.040594 | 0.0095271 | \*           |

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
| 2   | Validity |   2 |  28 | 3.725863 | 0.0367527 | \*     | 0.0715299 |

</td>
<td>

|     | Effect   |        W |         p | p\<.05 |
|:----|:---------|---------:|----------:|:-------|
| 2   | Validity | 0.990318 | 0.9387188 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9904109 | 0.0372507 | \*           | 1.152838 | 0.0367527 | \*           |

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
| 2   | Target          |   1 |  14 | 11.932994 | 0.0038705 | \*     | 0.1678265 |
| 3   | Validity        |   2 |  28 | 32.568729 | 0.0000000 | \*     | 0.2985486 |
| 4   | Target:Validity |   2 |  28 |  2.618925 | 0.0906466 |        | 0.0274397 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.5624997 | 0.0237572 | \*     |
| 4   | Target:Validity | 0.7466671 | 0.1497358 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.6956520 | 0.0000034 | \*           | 0.7482757 | 0.0000016 | \*           |
| 4   | Target:Validity | 0.7978726 | 0.1046990 |              | 0.8842199 | 0.0984782 |              |

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

|     | Effect   | DFn | DFd |        F |       p | p\<.05 |      ges |
|:----|:---------|----:|----:|---------:|--------:|:-------|---------:|
| 2   | Validity |   2 |  28 | 20.46262 | 3.3e-06 | \*     | 0.346866 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.5354015 | 0.0172352 | \*     |

</td>
<td>

|     | Effect   |      GGe |  p\[GG\] | p\[GG\]\<.05 |       HFe |  p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|---------:|---------:|:-------------|----------:|---------:|:-------------|
| 2   | Validity | 0.682781 | 7.68e-05 | \*           | 0.7314702 | 4.73e-05 | \*           |

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

|     | Effect   | DFn | DFd |        F |        p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|---------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 15.96057 | 2.37e-05 | \*     | 0.2445709 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.5151677 | 0.0134173 | \*     |

</td>
<td>

|     | Effect   |       GGe |  p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|---------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.6734767 | 0.000325 | \*           | 0.7193644 | 0.0002244 | \*           |

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

|     | Effect                     | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   2 |  28 |  3.644660 | 0.0391928 | \*     | 0.0278670 |
| 3   | Validity                   |   2 |  28 | 12.843257 | 0.0001102 | \*     | 0.1213134 |
| 4   | nontargetContrast:Validity |   4 |  56 |  6.075288 | 0.0003923 | \*     | 0.0429674 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 2   | nontargetContrast          | 0.6362990 | 0.0529417 |        |
| 3   | Validity                   | 0.9033668 | 0.5165553 |        |
| 4   | nontargetContrast:Validity | 0.0445435 | 0.0000162 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.7332986 | 0.0562734 |              | 0.7978264 | 0.0515550 |              |
| 3   | Validity                   | 0.9118819 | 0.0001961 | \*           | 1.0412273 | 0.0001102 | \*           |
| 4   | nontargetContrast:Validity | 0.4228877 | 0.0100094 | \*           | 0.4747401 | 0.0074339 | \*           |

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
| 2   | nontargetContrast          |   2 |  28 | 15.317054 | 0.0000321 | \*     | 0.1958190 |
| 3   | Validity                   |   2 |  28 |  5.574045 | 0.0091678 | \*     | 0.0741542 |
| 4   | nontargetContrast:Validity |   4 |  56 |  1.739850 | 0.1541094 |        | 0.0110719 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 2   | nontargetContrast          | 0.1883177 | 0.0000194 | \*     |
| 3   | Validity                   | 0.9899248 | 0.9362983 |        |
| 4   | nontargetContrast:Validity | 0.0428766 | 0.0000134 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.5519732 | 0.0010365 | \*           | 0.5644826 | 0.0009397 | \*           |
| 3   | Validity                   | 0.9900253 | 0.0094040 | \*           | 1.1522826 | 0.0091678 | \*           |
| 4   | nontargetContrast:Validity | 0.5408495 | 0.1906919 |              | 0.6431527 | 0.1822476 |              |

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
| 2   | Target                            |   1 |  14 | 37.3032265 | 0.0000271 | \*     | 0.1617372 |
| 3   | nontargetContrast                 |   2 |  28 | 22.0924420 | 0.0000017 | \*     | 0.1018315 |
| 4   | Validity                          |   2 |  28 | 18.3189664 | 0.0000082 | \*     | 0.1561996 |
| 5   | Target:nontargetContrast          |   2 |  28 |  4.7787359 | 0.0163856 | \*     | 0.0133357 |
| 6   | Target:Validity                   |   2 |  28 |  0.1032988 | 0.9021996 |        | 0.0007269 |
| 7   | nontargetContrast:Validity        |   4 |  56 |  0.7589679 | 0.5563976 |        | 0.0054265 |
| 8   | Target:nontargetContrast:Validity |   4 |  56 |  0.3146798 | 0.8669872 |        | 0.0015303 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 3   | nontargetContrast                 | 0.0566536 | 0.0000000 | \*     |
| 4   | Validity                          | 0.9109680 | 0.5454694 |        |
| 5   | Target:nontargetContrast          | 0.1104713 | 0.0000006 | \*     |
| 6   | Target:Validity                   | 0.8746403 | 0.4186892 |        |
| 7   | nontargetContrast:Validity        | 0.0012990 | 0.0000000 | \*     |
| 8   | Target:nontargetContrast:Validity | 0.0035097 | 0.0000000 | \*     |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | nontargetContrast                 | 0.5145763 | 0.0002919 | \*           | 0.5179804 | 0.0002815 | \*           |
| 4   | Validity                          | 0.9182467 | 0.0000171 | \*           | 1.0501659 | 0.0000082 | \*           |
| 5   | Target:nontargetContrast          | 0.5292325 | 0.0435702 | \*           | 0.5361410 | 0.0429490 | \*           |
| 6   | Target:Validity                   | 0.8886048 | 0.8810298 |              | 1.0086954 | 0.9021996 |              |
| 7   | nontargetContrast:Validity        | 0.4512272 | 0.4659094 |              | 0.5140108 | 0.4806670 |              |
| 8   | Target:nontargetContrast:Validity | 0.4769969 | 0.7226324 |              | 0.5503595 | 0.7526183 |              |

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
| 2   | Target          |   1 |  14 | 42.7993892 | 0.0000131 | \*     | 0.2199239 |
| 3   | Validity        |   2 |  28 |  9.8402949 | 0.0005800 | \*     | 0.1982705 |
| 4   | Target:Validity |   2 |  28 |  0.0293967 | 0.9710611 |        | 0.0004081 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8885108 | 0.4637753 |        |
| 4   | Target:Validity | 0.9050366 | 0.5227933 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity        | 0.8996939 | 0.0009586 | \*           | 1.024162 | 0.0005800 | \*           |
| 4   | Target:Validity | 0.9132726 | 0.9626118 |              | 1.043179 | 0.9710611 |              |

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
| 2   | Validity |   2 |  28 | 7.646806 | 0.0022402 | \*     | 0.2212779 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9099369 | 0.5414688 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9173781 | 0.0030632 | \*           | 1.048945 | 0.0022402 | \*           |

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

|     | Effect   | DFn | DFd |        F |        p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|---------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 5.442151 | 0.010078 | \*     | 0.1803536 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9743652 | 0.8446785 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |  p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|---------:|:-------------|
| 2   | Validity | 0.9750059 | 0.0107199 | \*           | 1.130714 | 0.010078 | \*           |

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

|     | Effect          | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |  14 |  7.6468274 | 0.0151821 | \*     | 0.0675150 |
| 3   | Validity        |   2 |  28 | 11.4315034 | 0.0002347 | \*     | 0.1156402 |
| 4   | Target:Validity |   2 |  28 |  0.4913267 | 0.6169904 |        | 0.0053706 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8813171 | 0.4399054 |        |
| 4   | Target:Validity | 0.7437416 | 0.1459633 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity        | 0.8939084 | 0.0004362 | \*           | 1.016086 | 0.0002347 | \*           |
| 4   | Target:Validity | 0.7960146 | 0.5762138 |              | 0.881709 | 0.5944345 |              |

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
| 2   | Validity |   2 |  28 | 5.834431 | 0.0076193 | \*     | 0.1436471 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9198399 | 0.5809376 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9257887 | 0.0093188 | \*           | 1.060782 | 0.0076193 | \*           |

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

|     | Effect   | DFn | DFd |        F |        p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|---------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 6.492078 | 0.004826 | \*     | 0.0947156 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9110267 | 0.5456976 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |  p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|---------:|:-------------|
| 2   | Validity | 0.9182961 | 0.0062221 | \*           | 1.050235 | 0.004826 | \*           |

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
| 2   | nontargetContrast          |   2 |  28 | 19.5135846 | 0.0000049 | \*     | 0.1833632 |
| 3   | Validity                   |   2 |  28 | 13.3139011 | 0.0000864 | \*     | 0.1898307 |
| 4   | nontargetContrast:Validity |   4 |  56 |  0.1957743 | 0.9395944 |        | 0.0027398 |

</td>
<td>

|     | Effect                     |         W |        p | p\<.05 |
|:----|:---------------------------|----------:|---------:|:-------|
| 2   | nontargetContrast          | 0.0387186 | 0.000000 | \*     |
| 3   | Validity                   | 0.9103419 | 0.543037 |        |
| 4   | nontargetContrast:Validity | 0.0018503 | 0.000000 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.5098708 | 0.0005317 | \*           | 0.5121671 | 0.0005200 | \*           |
| 3   | Validity                   | 0.9177190 | 0.0001508 | \*           | 1.0494242 | 0.0000864 | \*           |
| 4   | nontargetContrast:Validity | 0.4712353 | 0.8108944 |              | 0.5421789 | 0.8397783 |              |

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

|     | Effect                     | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   2 |  28 | 9.6614315 | 0.0006445 | \*     | 0.0475157 |
| 3   | Validity                   |   2 |  28 | 8.7916847 | 0.0010887 | \*     | 0.1286289 |
| 4   | nontargetContrast:Validity |   4 |  56 | 0.9839149 | 0.4238213 |        | 0.0102281 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 2   | nontargetContrast          | 0.1284550 | 0.0000016 | \*     |
| 3   | Validity                   | 0.9869833 | 0.9183614 |        |
| 4   | nontargetContrast:Validity | 0.0023116 | 0.0000000 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.5343179 | 0.0064845 | \*           | 0.5424616 | 0.0062249 | \*           |
| 3   | Validity                   | 0.9871505 | 0.0011525 | \*           | 1.1481460 | 0.0010887 | \*           |
| 4   | nontargetContrast:Validity | 0.4295127 | 0.3767628 |              | 0.4838557 | 0.3843653 |              |

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
| 2   | Target                            |   1 |  14 |  9.4287129 | 0.0083029 | \*     | 0.0845361 |
| 3   | nontargetContrast                 |   2 |  28 | 60.1785567 | 0.0000000 | \*     | 0.5399872 |
| 4   | Validity                          |   2 |  28 | 16.6842569 | 0.0000169 | \*     | 0.0793258 |
| 5   | Target:nontargetContrast          |   2 |  28 |  4.9436637 | 0.0144976 | \*     | 0.0168496 |
| 6   | Target:Validity                   |   2 |  28 |  2.3508842 | 0.1138191 |        | 0.0161582 |
| 7   | nontargetContrast:Validity        |   4 |  56 |  3.7937461 | 0.0084590 | \*     | 0.0167314 |
| 8   | Target:nontargetContrast:Validity |   4 |  56 |  0.6885596 | 0.6029215 |        | 0.0033669 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 3   | nontargetContrast                 | 0.0673287 | 0.0000000 | \*     |
| 4   | Validity                          | 0.9802226 | 0.8782350 |        |
| 5   | Target:nontargetContrast          | 0.5936916 | 0.0337401 | \*     |
| 6   | Target:Validity                   | 0.8749849 | 0.4197623 |        |
| 7   | nontargetContrast:Validity        | 0.0062039 | 0.0000000 | \*     |
| 8   | Target:nontargetContrast:Validity | 0.0312835 | 0.0000027 | \*     |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | nontargetContrast                 | 0.5174186 | 0.0000014 | \*           | 0.5214958 | 0.0000013 | \*           |
| 4   | Validity                          | 0.9806062 | 0.0000199 | \*           | 1.1387436 | 0.0000169 | \*           |
| 5   | Target:nontargetContrast          | 0.7110816 | 0.0271895 | \*           | 0.7685124 | 0.0239806 | \*           |
| 6   | Target:Validity                   | 0.8888769 | 0.1210342 |              | 1.0090742 | 0.1138191 |              |
| 7   | nontargetContrast:Validity        | 0.5075026 | 0.0340902 | \*           | 0.5941976 | 0.0265581 | \*           |
| 8   | Target:nontargetContrast:Validity | 0.5135069 | 0.5140919 |              | 0.6029315 | 0.5351773 |              |

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

|     | Effect          | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Target          |   1 |  14 |  1.060500 | 0.3205650 |        | 0.0089003 |
| 3   | Validity        |   2 |  28 | 11.409680 | 0.0002376 | \*     | 0.0891105 |
| 4   | Target:Validity |   2 |  28 |  1.901918 | 0.1680735 |        | 0.0165092 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8600910 | 0.3754382 |        |
| 4   | Target:Validity | 0.7907193 | 0.2173428 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8772630 | 0.0004861 | \*           | 0.9929338 | 0.0002475 | \*           |
| 4   | Target:Validity | 0.8269379 | 0.1765667 |              | 0.9236962 | 0.1718539 |              |

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

|     | Effect   | DFn | DFd |       F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|--------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 8.20369 | 0.0015698 | \*     | 0.1540642 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8698762 | 0.4040855 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.8848588 | 0.0025193 | \*           | 1.003483 | 0.0015698 | \*           |

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
| 2   | Validity |   2 |  28 | 4.240943 | 0.0246111 | \*     | 0.0531821 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7739944 | 0.1891454 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.8156569 | 0.0338672 | \*           | 0.9083304 | 0.0288375 | \*           |

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
| 2   | Target          |   1 |  14 | 17.0896393 | 0.0010127 | \*     | 0.2413263 |
| 3   | Validity        |   2 |  28 |  3.8199751 | 0.0341266 | \*     | 0.0577040 |
| 4   | Target:Validity |   2 |  28 |  0.3448548 | 0.7112893 |        | 0.0070294 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8606498 | 0.3770267 |        |
| 4   | Target:Validity | 0.9005570 | 0.5062009 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8776933 | 0.0408251 | \*           | 0.9935307 | 0.0344510 | \*           |
| 4   | Target:Validity | 0.9095515 | 0.6915809 |              | 1.0379591 | 0.7112893 |              |

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
| 2   | Validity |   2 |  28 | 2.351058 | 0.1138022 |        | 0.0685926 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8379768 | 0.3169626 |        |

</td>
<td>

|     | Effect   |      GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|---------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.860568 | 0.1229082 |              | 0.9698389 | 0.1157263 |              |

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

|     | Effect   | DFn | DFd |       F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|--------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 1.13608 | 0.3354321 |        | 0.0527273 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8769986 | 0.4260817 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.8904708 | 0.3314371 |              | 1.011294 | 0.3354321 |              |

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
| 2   | nontargetContrast          |   2 |  28 | 54.645524 | 0.0000000 | \*     | 0.5940397 |
| 3   | Validity                   |   2 |  28 | 11.542003 | 0.0002209 | \*     | 0.1459161 |
| 4   | nontargetContrast:Validity |   4 |  56 |  2.608618 | 0.0451298 | \*     | 0.0300756 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 2   | nontargetContrast          | 0.0965164 | 0.0000003 | \*     |
| 3   | Validity                   | 0.9981996 | 0.9883549 |        |
| 4   | nontargetContrast:Validity | 0.0188355 | 0.0000002 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.5253526 | 0.0000021 | \*           | 0.5313253 | 0.0000018 | \*           |
| 3   | Validity                   | 0.9982028 | 0.0002233 | \*           | 1.1640715 | 0.0002209 | \*           |
| 4   | nontargetContrast:Validity | 0.4421046 | 0.0992654 |              | 0.5012900 | 0.0912696 |              |

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
| 2   | nontargetContrast          |   2 |  28 | 48.329490 | 0.0000000 | \*     | 0.4851617 |
| 3   | Validity                   |   2 |  28 |  4.137795 | 0.0266446 | \*     | 0.0386990 |
| 4   | nontargetContrast:Validity |   4 |  56 |  1.504685 | 0.2132320 |        | 0.0105897 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 2   | nontargetContrast          | 0.1922676 | 0.0000222 | \*     |
| 3   | Validity                   | 0.6876793 | 0.0877018 |        |
| 4   | nontargetContrast:Validity | 0.0138739 | 0.0000000 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.5531792 | 0.0000026 | \*           | 0.5659912 | 0.0000020 | \*           |
| 3   | Validity                   | 0.7620088 | 0.0396306 | \*           | 0.8360169 | 0.0350171 | \*           |
| 4   | nontargetContrast:Validity | 0.4519321 | 0.2411771 |              | 0.5149969 | 0.2389094 |              |

</td>
</tr>
</tbody>
</table>

# discrimination

``` r
## dis dprime 
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
| 2   | Target                            |   1 |  14 | 1.4819231 | 0.2435960 |        | 0.0092875 |
| 3   | nontargetContrast                 |   2 |  28 | 1.2814503 | 0.2934192 |        | 0.0050401 |
| 4   | Validity                          |   2 |  28 | 1.2281819 | 0.3081199 |        | 0.0108142 |
| 5   | Target:nontargetContrast          |   2 |  28 | 3.0954799 | 0.0610175 |        | 0.0079028 |
| 6   | Target:Validity                   |   2 |  28 | 4.0178538 | 0.0292381 | \*     | 0.0195003 |
| 7   | nontargetContrast:Validity        |   4 |  56 | 0.4715595 | 0.7563651 |        | 0.0016254 |
| 8   | Target:nontargetContrast:Validity |   4 |  56 | 1.4138150 | 0.2413007 |        | 0.0064905 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 3   | nontargetContrast                 | 0.1634091 | 0.0000077 | \*     |
| 4   | Validity                          | 0.7326526 | 0.1323846 |        |
| 5   | Target:nontargetContrast          | 0.1043287 | 0.0000004 | \*     |
| 6   | Target:Validity                   | 0.8251289 | 0.2866763 |        |
| 7   | nontargetContrast:Validity        | 0.0282939 | 0.0000016 | \*     |
| 8   | Target:nontargetContrast:Validity | 0.0027271 | 0.0000000 | \*     |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | nontargetContrast                 | 0.5444871 | 0.2798043 |              | 0.5551307 | 0.2804814 |              |
| 4   | Validity                          | 0.7890496 | 0.3029129 |              | 0.8723097 | 0.3054082 |              |
| 5   | Target:nontargetContrast          | 0.5275176 | 0.0977560 |              | 0.5340118 | 0.0971521 |              |
| 6   | Target:Validity                   | 0.8511572 | 0.0370475 | \*           | 0.9568759 | 0.0313098 | \*           |
| 7   | nontargetContrast:Validity        | 0.5195737 | 0.6359674 |              | 0.6117921 | 0.6661204 |              |
| 8   | Target:nontargetContrast:Validity | 0.3651460 | 0.2603272 |              | 0.3969236 | 0.2607419 |              |

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
| 2   | Target          |   1 |  14 | 0.0267704 | 0.8723714 |        | 0.0003339 |
| 3   | Validity        |   2 |  28 | 0.6058592 | 0.5526026 |        | 0.0094067 |
| 4   | Target:Validity |   2 |  28 | 7.9931038 | 0.0017938 | \*     | 0.0584483 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8589534 | 0.3722225 |        |
| 4   | Target:Validity | 0.8408449 | 0.3240809 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8763884 | 0.5326501 |              | 0.9917208 | 0.5513412 |              |
| 4   | Target:Validity | 0.8626973 | 0.0031028 | \*           | 0.9727775 | 0.0019991 | \*           |

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
| 2   | Validity |   2 |  28 | 2.214118 | 0.1280224 |        | 0.0430008 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7457331 | 0.1485225 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7972785 | 0.1407179 |              | 0.8834168 | 0.1352506 |              |

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

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 3.891451 | 0.0322667 | \*     | 0.0974064 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9968598 | 0.9797642 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9968696 | 0.0324193 | \*           | 1.162147 | 0.0322667 | \*           |

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
| 2   | Target          |   1 |  14 | 4.4838463 | 0.0525993 |        | 0.0316391 |
| 3   | Validity        |   2 |  28 | 1.4701810 | 0.2470910 |        | 0.0149884 |
| 4   | Target:Validity |   2 |  28 | 0.1512296 | 0.8603477 |        | 0.0019951 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9179100 | 0.5730608 |        |
| 4   | Target:Validity | 0.6748719 | 0.0776138 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.9241376 | 0.2481508 |              | 1.0584558 | 0.2470910 |              |
| 4   | Target:Validity | 0.7546440 | 0.8011347 |              | 0.8261867 | 0.8210652 |              |

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

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 1.134016 | 0.3360731 |        | 0.0260449 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8544422 | 0.3596975 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.8729372 | 0.3312958 |              | 0.9869376 | 0.3356402 |              |

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

|     | Effect   | DFn | DFd |         F |         p | p\<.05 |      ges |
|:----|:---------|----:|----:|----------:|----------:|:-------|---------:|
| 2   | Validity |   2 |  28 | 0.3141144 | 0.7329759 |        | 0.007345 |

</td>
<td>

|     | Effect   |         W |        p | p\<.05 |
|:----|:---------|----------:|---------:|:-------|
| 2   | Validity | 0.7444155 | 0.146825 |        |

</td>
<td>

|     | Effect   |       GGe |  p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|---------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7964418 | 0.684489 |              | 0.8822861 | 0.7064235 |              |

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
| 2   | nontargetContrast          |   2 |  28 | 4.1128140 | 0.0271637 | \*     | 0.0187317 |
| 3   | Validity                   |   2 |  28 | 2.5546692 | 0.0956986 |        | 0.0306775 |
| 4   | nontargetContrast:Validity |   4 |  56 | 0.4009467 | 0.8071425 |        | 0.0030351 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 2   | nontargetContrast          | 0.1562048 | 0.0000057 | \*     |
| 3   | Validity                   | 0.7480610 | 0.1515620 |        |
| 4   | nontargetContrast:Validity | 0.0056470 | 0.0000000 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.5423596 | 0.0578783 |              | 0.5524769 | 0.0569245 |              |
| 3   | Validity                   | 0.7987609 | 0.1095886 |              | 0.8854210 | 0.1034111 |              |
| 4   | nontargetContrast:Validity | 0.4277270 | 0.6424638 |              | 0.4813948 | 0.6659431 |              |

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
| 2   | nontargetContrast          |   2 |  28 | 0.6946106 | 0.5076675 |        | 0.0060073 |
| 3   | Validity                   |   2 |  28 | 1.9220308 | 0.1651255 |        | 0.0289996 |
| 4   | nontargetContrast:Validity |   4 |  56 | 1.6300820 | 0.1794623 |        | 0.0138679 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 2   | nontargetContrast          | 0.1339569 | 0.0000021 | \*     |
| 3   | Validity                   | 0.9180779 | 0.5737423 |        |
| 4   | nontargetContrast:Validity | 0.0285018 | 0.0000017 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.5358933 | 0.4274648 |              | 0.5444217 | 0.4294866 |              |
| 3   | Validity                   | 0.9242809 | 0.1689577 |              | 1.0586577 | 0.1651255 |              |
| 4   | nontargetContrast:Validity | 0.4869241 | 0.2147713 |              | 0.5645278 | 0.2097551 |              |

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
