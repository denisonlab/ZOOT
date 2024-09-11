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
| 2   | Target                            |   1 |  14 |  6.8765375 | 0.0200851 | \*     | 0.0365361 |
| 3   | nontargetContrast                 |   2 |  28 |  8.2183632 | 0.0015553 | \*     | 0.0555932 |
| 4   | Validity                          |   2 |  28 | 10.5901716 | 0.0003760 | \*     | 0.0695542 |
| 5   | Target:nontargetContrast          |   2 |  28 |  7.6215045 | 0.0022771 | \*     | 0.0342721 |
| 6   | Target:Validity                   |   2 |  28 |  0.8057621 | 0.4568375 |        | 0.0041684 |
| 7   | nontargetContrast:Validity        |   4 |  56 | 13.2100171 | 0.0000001 | \*     | 0.0266218 |
| 8   | Target:nontargetContrast:Validity |   4 |  56 |  1.0604538 | 0.3846848 |        | 0.0047329 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 3   | nontargetContrast                 | 0.4683880 | 0.0072267 | \*     |
| 4   | Validity                          | 0.8837135 | 0.4477389 |        |
| 5   | Target:nontargetContrast          | 0.1811199 | 0.0000150 | \*     |
| 6   | Target:Validity                   | 0.9152819 | 0.5624795 |        |
| 7   | nontargetContrast:Validity        | 0.1261539 | 0.0025139 | \*     |
| 8   | Target:nontargetContrast:Validity | 0.0184059 | 0.0000002 | \*     |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | nontargetContrast                 | 0.6529069 | 0.0065465 | \*           | 0.6927268 | 0.0055441 | \*           |
| 4   | Validity                          | 0.8958274 | 0.0006603 | \*           | 1.0187630 | 0.0003760 | \*           |
| 5   | Target:nontargetContrast          | 0.5497888 | 0.0126450 | \*           | 0.5617516 | 0.0120759 | \*           |
| 6   | Target:Validity                   | 0.9218985 | 0.4485389 |              | 1.0553030 | 0.4568375 |              |
| 7   | nontargetContrast:Validity        | 0.4634038 | 0.0001490 | \*           | 0.5311092 | 0.0000601 | \*           |
| 8   | Target:nontargetContrast:Validity | 0.4588837 | 0.3557148 |              | 0.5247461 | 0.3619993 |              |

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
| 2   | Target          |   1 |  14 | 0.3787794 | 0.5481322 |        | 0.0034881 |
| 3   | Validity        |   2 |  28 | 7.7137029 | 0.0021454 | \*     | 0.0563965 |
| 4   | Target:Validity |   2 |  28 | 0.4838319 | 0.6214752 |        | 0.0058852 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9628231 | 0.7817220 |        |
| 4   | Target:Validity | 0.9534835 | 0.7337291 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity        | 0.9641557 | 0.0024604 | \*           | 1.115199 | 0.0021454 | \*           |
| 4   | Target:Validity | 0.9555511 | 0.6132370 |              | 1.102935 | 0.6214752 |              |

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
| 2   | Validity |   2 |  28 | 4.619489 | 0.0184605 | \*     | 0.0764691 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8846944 | 0.4509788 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.8966152 | 0.0226213 | \*           | 1.019863 | 0.0184605 | \*           |

</td>
</tr>
</tbody>
</table>

``` r
## det dprime filtered nontarget present T1
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

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |      ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|---------:|
| 2   | Validity |   2 |  28 | 2.588903 | 0.0929705 |        | 0.052178 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9941871 | 0.9628151 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9942207 | 0.0933471 |              | 1.158327 | 0.0929705 |              |

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
| 2   | Target          |   1 |  14 | 12.728300 | 0.0030905 | \*     | 0.1956258 |
| 3   | Validity        |   2 |  28 | 31.405446 | 0.0000001 | \*     | 0.2712304 |
| 4   | Target:Validity |   2 |  28 |  2.122314 | 0.1386147 |        | 0.0205578 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.6526036 | 0.0624053 |        |
| 4   | Target:Validity | 0.6106893 | 0.0405352 | \*     |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.7421721 | 0.0000023 | \*           | 0.8095925 | 0.0000009 | \*           |
| 4   | Target:Validity | 0.7197814 | 0.1552947 |              | 0.7799666 | 0.1517139 |              |

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

|     | Effect   | DFn | DFd |        F |       p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|--------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 19.73892 | 4.5e-06 | \*     | 0.3148569 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.5567048 | 0.0222107 | \*     |

</td>
<td>

|     | Effect   |       GGe |  p\[GG\] | p\[GG\]\<.05 |      HFe | p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|---------:|:-------------|---------:|--------:|:-------------|
| 2   | Validity | 0.6928589 | 8.57e-05 | \*           | 0.744623 | 5.2e-05 | \*           |

</td>
</tr>
</tbody>
</table>

``` r
## det dprime filtered nontarget absent T1
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

|     | Effect   | DFn | DFd |        F |       p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|--------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 14.90844 | 3.9e-05 | \*     | 0.2233478 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.5164532 | 0.0136364 | \*     |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.6740603 | 0.0004573 | \*           | 0.7201226 | 0.0003223 | \*           |

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
| 2   | nontargetContrast          |   2 |  28 |  1.185161 | 0.3205685 |        | 0.0094787 |
| 3   | Validity                   |   2 |  28 | 10.608550 | 0.0003720 | \*     | 0.0911505 |
| 4   | nontargetContrast:Validity |   4 |  56 |  6.816145 | 0.0001526 | \*     | 0.0456510 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 2   | nontargetContrast          | 0.8260767 | 0.2888234 |        |
| 3   | Validity                   | 0.8920818 | 0.4760256 |        |
| 4   | nontargetContrast:Validity | 0.0590254 | 0.0000660 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.8518444 | 0.3162223 |              | 0.9578211 | 0.3195015 |              |
| 3   | Validity                   | 0.9025937 | 0.0006305 | \*           | 1.0282163 | 0.0003720 | \*           |
| 4   | nontargetContrast:Validity | 0.4289214 | 0.0061997 | \*           | 0.4830405 | 0.0043329 | \*           |

</td>
</tr>
</tbody>
</table>

``` r
## det dprime filtered T1
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
| 2   | nontargetContrast          |   2 |  28 | 11.488173 | 0.0002275 | \*     | 0.1514276 |
| 3   | Validity                   |   2 |  28 |  3.842825 | 0.0335198 | \*     | 0.0546062 |
| 4   | nontargetContrast:Validity |   4 |  56 |  2.707597 | 0.0392027 | \*     | 0.0162358 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 2   | nontargetContrast          | 0.2229164 | 0.0000579 | \*     |
| 3   | Validity                   | 0.9618963 | 0.7768436 |        |
| 4   | nontargetContrast:Validity | 0.0435388 | 0.0000144 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.5627197 | 0.0030242 | \*           | 0.5779456 | 0.0027610 | \*           |
| 3   | Validity                   | 0.9632949 | 0.0353880 | \*           | 1.1139705 | 0.0335198 | \*           |
| 4   | nontargetContrast:Validity | 0.5004316 | 0.0840828 |              | 0.5839568 | 0.0739045 |              |

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
| 2   | Target                            |   1 |  14 | 35.7072468 | 0.0000339 | \*     | 0.1770132 |
| 3   | nontargetContrast                 |   2 |  28 | 22.1610690 | 0.0000017 | \*     | 0.1028446 |
| 4   | Validity                          |   2 |  28 | 13.7086360 | 0.0000707 | \*     | 0.1103495 |
| 5   | Target:nontargetContrast          |   2 |  28 |  5.2633738 | 0.0114694 | \*     | 0.0139010 |
| 6   | Target:Validity                   |   2 |  28 |  0.0778104 | 0.9253391 |        | 0.0005889 |
| 7   | nontargetContrast:Validity        |   4 |  56 |  0.6990696 | 0.5958430 |        | 0.0052949 |
| 8   | Target:nontargetContrast:Validity |   4 |  56 |  0.4017230 | 0.8065897 |        | 0.0020430 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 3   | nontargetContrast                 | 0.0691005 | 0.0000000 | \*     |
| 4   | Validity                          | 0.8760829 | 0.4231982 |        |
| 5   | Target:nontargetContrast          | 0.1606044 | 0.0000069 | \*     |
| 6   | Target:Validity                   | 0.8810769 | 0.4391268 |        |
| 7   | nontargetContrast:Validity        | 0.0061164 | 0.0000000 | \*     |
| 8   | Target:nontargetContrast:Validity | 0.0056530 | 0.0000000 | \*     |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | nontargetContrast                 | 0.5178933 | 0.0002778 | \*           | 0.5220834 | 0.0002656 | \*           |
| 4   | Validity                          | 0.8897453 | 0.0001522 | \*           | 1.0102836 | 0.0000707 | \*           |
| 5   | Target:nontargetContrast          | 0.5436568 | 0.0340183 | \*           | 0.5540948 | 0.0331786 | \*           |
| 6   | Target:Validity                   | 0.8937165 | 0.9074420 |              | 1.0158182 | 0.9253391 |              |
| 7   | nontargetContrast:Validity        | 0.4619987 | 0.4953943 |              | 0.5291291 | 0.5127791 |              |
| 8   | Target:nontargetContrast:Validity | 0.4723403 | 0.6616728 |              | 0.5437454 | 0.6895706 |              |

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
| 2   | Target          |   1 |  14 | 42.3029255 | 0.0000139 | \*     | 0.2350011 |
| 3   | Validity        |   2 |  28 |  6.7489169 | 0.0040537 | \*     | 0.1453565 |
| 4   | Target:Validity |   2 |  28 |  0.1103823 | 0.8958795 |        | 0.0016002 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8631175 | 0.3841091 |        |
| 4   | Target:Validity | 0.9485025 | 0.7091698 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8795984 | 0.0060064 | \*           | 0.9961745 | 0.0041046 | \*           |
| 4   | Target:Validity | 0.9510246 | 0.8869117 |              | 1.0964972 | 0.8958795 |              |

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

|     | Effect   | DFn | DFd |       F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|--------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  28 | 4.82106 | 0.0158773 | \*     | 0.1582681 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9036955 | 0.5177783 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9121554 | 0.0190784 | \*           | 1.041611 | 0.0158773 | \*           |

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
| 2   | Validity |   2 |  28 | 3.942941 | 0.0309943 | \*     | 0.1370737 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9365811 | 0.6531981 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9403632 | 0.0339776 | \*           | 1.081372 | 0.0309943 | \*           |

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
| 2   | Target          |   1 |  14 | 8.8553824 | 0.0100207 | \*     | 0.0805419 |
| 3   | Validity        |   2 |  28 | 9.5678336 | 0.0006813 | \*     | 0.0828792 |
| 4   | Target:Validity |   2 |  28 | 0.3872527 | 0.6824994 |        | 0.0046739 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8643063 | 0.3875609 |        |
| 4   | Target:Validity | 0.7598627 | 0.1677948 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8805191 | 0.0012182 | \*           | 0.9974528 | 0.0006897 | \*           |
| 4   | Target:Validity | 0.8063624 | 0.6391860 |              | 0.8957123 | 0.6603501 |              |

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
| 2   | Validity |   2 |  28 | 4.402712 | 0.0217494 | \*     | 0.1068983 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8707948 | 0.4068674 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.8855786 | 0.0268184 | \*           | 1.004484 | 0.0217494 | \*           |

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
| 2   | Validity |   2 |  28 | 4.413807 | 0.0215666 | \*     | 0.0669852 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9566734 | 0.7498322 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9584727 | 0.0232743 | \*           | 1.107095 | 0.0215666 | \*           |

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
| 2   | nontargetContrast          |   2 |  28 | 21.3543046 | 0.0000023 | \*     | 0.1933590 |
| 3   | Validity                   |   2 |  28 |  9.4486970 | 0.0007314 | \*     | 0.1405781 |
| 4   | nontargetContrast:Validity |   4 |  56 |  0.1264847 | 0.9722653 |        | 0.0018728 |

</td>
<td>

|     | Effect                     |         W |        p | p\<.05 |
|:----|:---------------------------|----------:|---------:|:-------|
| 2   | nontargetContrast          | 0.0345923 | 0.000000 | \*     |
| 3   | Validity                   | 0.8389116 | 0.319268 |        |
| 4   | nontargetContrast:Validity | 0.0066871 | 0.000000 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.5088003 | 0.0003616 | \*           | 0.5108458 | 0.0003540 | \*           |
| 3   | Validity                   | 0.8612609 | 0.0014238 | \*           | 0.9707949 | 0.0008412 | \*           |
| 4   | nontargetContrast:Validity | 0.4844966 | 0.8758239 |              | 0.5610546 | 0.9019318 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis dprime filtered T1
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
| 2   | nontargetContrast          |   2 |  28 | 8.338825 | 0.0014419 | \*     | 0.0421286 |
| 3   | Validity                   |   2 |  28 | 5.895479 | 0.0072985 | \*     | 0.0866613 |
| 4   | nontargetContrast:Validity |   4 |  56 | 1.043030 | 0.3933261 |        | 0.0114336 |

</td>
<td>

|     | Effect                     |         W |        p | p\<.05 |
|:----|:---------------------------|----------:|---------:|:-------|
| 2   | nontargetContrast          | 0.2158744 | 0.000047 | \*     |
| 3   | Validity                   | 0.9750863 | 0.848750 |        |
| 4   | nontargetContrast:Validity | 0.0052505 | 0.000000 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.5604986 | 0.0092111 | \*           | 0.5751594 | 0.0086527 | \*           |
| 3   | Validity                   | 0.9756919 | 0.0078024 | \*           | 1.1316966 | 0.0072985 | \*           |
| 4   | nontargetContrast:Validity | 0.4236140 | 0.3570448 |              | 0.4757377 | 0.3631704 |              |

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
| 2   | Target                            |   1 |  14 | 10.3701336 | 0.0061669 | \*     | 0.1014189 |
| 3   | nontargetContrast                 |   2 |  28 | 63.2777891 | 0.0000000 | \*     | 0.5498712 |
| 4   | Validity                          |   2 |  28 | 11.2098468 | 0.0002653 | \*     | 0.0542074 |
| 5   | Target:nontargetContrast          |   2 |  28 |  7.1186808 | 0.0031656 | \*     | 0.0238586 |
| 6   | Target:Validity                   |   2 |  28 |  2.3129007 | 0.1175860 |        | 0.0168557 |
| 7   | nontargetContrast:Validity        |   4 |  56 |  4.2405372 | 0.0045513 | \*     | 0.0202987 |
| 8   | Target:nontargetContrast:Validity |   4 |  56 |  0.6058438 | 0.6600539 |        | 0.0031028 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 3   | nontargetContrast                 | 0.1004334 | 0.0000003 | \*     |
| 4   | Validity                          | 0.9830231 | 0.8946726 |        |
| 5   | Target:nontargetContrast          | 0.7219523 | 0.1203110 |        |
| 6   | Target:Validity                   | 0.8852928 | 0.4529655 |        |
| 7   | nontargetContrast:Validity        | 0.0128558 | 0.0000000 | \*     |
| 8   | Target:nontargetContrast:Validity | 0.0885117 | 0.0004795 | \*     |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | nontargetContrast                 | 0.5264359 | 0.0000008 | \*           | 0.5326693 | 0.0000007 | \*           |
| 4   | Validity                          | 0.9833065 | 0.0002919 | \*           | 1.1426207 | 0.0002653 | \*           |
| 5   | Target:nontargetContrast          | 0.7824434 | 0.0067672 | \*           | 0.8634140 | 0.0050954 | \*           |
| 6   | Target:Validity                   | 0.8970966 | 0.1241853 |              | 1.0205346 | 0.1175860 |              |
| 7   | nontargetContrast:Validity        | 0.5252118 | 0.0225698 | \*           | 0.6200591 | 0.0163056 | \*           |
| 8   | Target:nontargetContrast:Validity | 0.5536382 | 0.5681209 |              | 0.6622212 | 0.5956060 |              |

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
| 2   | Target          |   1 |  14 | 1.139937 | 0.3037312 |        | 0.0090380 |
| 3   | Validity        |   2 |  28 | 8.161240 | 0.0016124 | \*     | 0.0690270 |
| 4   | Target:Validity |   2 |  28 | 1.845932 | 0.1765807 |        | 0.0166949 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8601195 | 0.3755192 |        |
| 4   | Target:Validity | 0.7697113 | 0.1824446 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8772850 | 0.0026619 | \*           | 0.9929642 | 0.0016593 | \*           |
| 4   | Target:Validity | 0.8128173 | 0.1850954 |              | 0.9044714 | 0.1809967 |              |

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
| 2   | Validity |   2 |  28 | 6.195746 | 0.0059177 | \*     | 0.1283657 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8575233 | 0.3682126 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.8752914 | 0.0085336 | \*           | 0.9901998 | 0.0060899 | \*           |

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
| 2   | Validity |   2 |  28 | 3.008165 | 0.0655523 |        | 0.0384208 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7818834 | 0.2020333 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |  p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|---------:|:-------------|
| 2   | Validity | 0.8209395 | 0.0777856 |              | 0.9155188 | 0.071069 |              |

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
| 2   | Target          |   1 |  14 | 17.1537309 | 0.0009976 | \*     | 0.2543179 |
| 3   | Validity        |   2 |  28 |  3.1401327 | 0.0588293 |        | 0.0448411 |
| 4   | Target:Validity |   2 |  28 |  0.3028817 | 0.7410762 |        | 0.0057860 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8503742 | 0.3487109 |        |
| 4   | Target:Validity | 0.8834927 | 0.4470120 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8698483 | 0.0673436 |              | 0.9826612 | 0.0598981 |              |
| 4   | Target:Validity | 0.8956502 | 0.7176075 |              | 1.0185157 | 0.7410762 |              |

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
| 2   | Validity |   2 |  28 | 2.114208 | 0.1395941 |        | 0.0587372 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7624932 | 0.1716066 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.8080764 | 0.1509513 |              | 0.8980364 | 0.1455955 |              |

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
| 2   | Validity |   2 |  28 | 0.8052094 | 0.4570763 |        | 0.0334204 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9332611 | 0.6382938 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |     HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|--------:|----------:|:-------------|
| 2   | Validity | 0.9374365 | 0.4504783 |              | 1.07723 | 0.4570763 |              |

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
| 2   | nontargetContrast          |   2 |  28 | 59.014940 | 0.0000000 | \*     | 0.6101835 |
| 3   | Validity                   |   2 |  28 |  9.446734 | 0.0007322 | \*     | 0.1213570 |
| 4   | nontargetContrast:Validity |   4 |  56 |  2.507490 | 0.0521123 |        | 0.0309585 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 2   | nontargetContrast          | 0.1536613 | 0.0000052 | \*     |
| 3   | Validity                   | 0.9985027 | 0.9903075 |        |
| 4   | nontargetContrast:Validity | 0.0333206 | 0.0000037 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.5416124 | 0.0000009 | \*           | 0.5515453 | 0.0000008 | \*           |
| 3   | Validity                   | 0.9985049 | 0.0007375 | \*           | 1.1645077 | 0.0007322 | \*           |
| 4   | nontargetContrast:Validity | 0.4544347 | 0.1056623 |              | 0.5185015 | 0.0972291 |              |

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
| 2   | nontargetContrast          |   2 |  28 | 49.367599 | 0.0000000 | \*     | 0.4867264 |
| 3   | Validity                   |   2 |  28 |  1.427645 | 0.2568015 |        | 0.0148680 |
| 4   | nontargetContrast:Validity |   4 |  56 |  2.171568 | 0.0839702 |        | 0.0160029 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 2   | nontargetContrast          | 0.2516421 | 0.0001274 | \*     |
| 3   | Validity                   | 0.7033486 | 0.1015334 |        |
| 4   | nontargetContrast:Validity | 0.0426551 | 0.0000130 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.5719653 | 0.0000016 | \*           | 0.5895643 | 0.0000012 | \*           |
| 3   | Validity                   | 0.7712173 | 0.2578109 |              | 0.8483407 | 0.2578446 |              |
| 4   | nontargetContrast:Validity | 0.4914705 | 0.1338434 |              | 0.5710478 | 0.1245126 |              |

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
| 2   | Target                            |   1 |  14 | 2.2350010 | 0.1571133 |        | 0.0146886 |
| 3   | nontargetContrast                 |   2 |  28 | 0.0732805 | 0.9295178 |        | 0.0003101 |
| 4   | Validity                          |   2 |  28 | 0.3603558 | 0.7006154 |        | 0.0031799 |
| 5   | Target:nontargetContrast          |   2 |  28 | 2.6350571 | 0.0894236 |        | 0.0065997 |
| 6   | Target:Validity                   |   2 |  28 | 4.2078530 | 0.0252447 | \*     | 0.0226931 |
| 7   | nontargetContrast:Validity        |   4 |  56 | 0.4424548 | 0.7773837 |        | 0.0016059 |
| 8   | Target:nontargetContrast:Validity |   4 |  56 | 1.7609574 | 0.1496427 |        | 0.0080529 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 3   | nontargetContrast                 | 0.1029903 | 0.0000004 | \*     |
| 4   | Validity                          | 0.7612030 | 0.1697280 |        |
| 5   | Target:nontargetContrast          | 0.1578228 | 0.0000061 | \*     |
| 6   | Target:Validity                   | 0.8828953 | 0.4450509 |        |
| 7   | nontargetContrast:Validity        | 0.0291781 | 0.0000019 | \*     |
| 8   | Target:nontargetContrast:Validity | 0.0029226 | 0.0000000 | \*     |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | nontargetContrast                 | 0.5271454 | 0.8034398 |              | 0.5335499 | 0.8063394 |              |
| 4   | Validity                          | 0.8072348 | 0.6564839 |              | 0.8968951 | 0.6782365 |              |
| 5   | Target:nontargetContrast          | 0.5428359 | 0.1234111 |              | 0.5530709 | 0.1225913 |              |
| 6   | Target:Validity                   | 0.8951712 | 0.0301963 | \*           | 1.0178474 | 0.0252447 | \*           |
| 7   | nontargetContrast:Validity        | 0.5395646 | 0.6613707 |              | 0.6412460 | 0.6942170 |              |
| 8   | Target:nontargetContrast:Validity | 0.3596804 | 0.2010091 |              | 0.3897060 | 0.1989798 |              |

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

|     | Effect          | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Target          |   1 |  14 | 0.052104 | 0.8227420 |        | 0.0006736 |
| 3   | Validity        |   2 |  28 | 0.389583 | 0.6809537 |        | 0.0062285 |
| 4   | Target:Validity |   2 |  28 | 9.329549 | 0.0007854 | \*     | 0.0691756 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8774575 | 0.4275330 |        |
| 4   | Target:Validity | 0.8431154 | 0.3298113 |        |

</td>
<td>

|     | Effect          |       GGe |  p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|---------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8908349 | 0.657754 |              | 1.0118014 | 0.6809537 |              |
| 4   | Target:Validity | 0.8643904 | 0.001493 | \*           | 0.9751155 | 0.0008834 | \*           |

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
| 2   | Validity |   2 |  28 | 1.888079 | 0.1701347 |        | 0.0364973 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7050403 | 0.1031313 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |  p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|---------:|:-------------|
| 2   | Validity | 0.7722248 | 0.1810163 |              | 0.8496912 | 0.177412 |              |

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
| 2   | Validity |   2 |  28 | 4.650195 | 0.0180395 | \*     | 0.1196305 |

</td>
<td>

|     | Effect   |         W |        p | p\<.05 |
|:----|:---------|----------:|---------:|:-------|
| 2   | Validity | 0.9991191 | 0.994288 |        |

</td>
<td>

|     | Effect   |       GGe |  p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|---------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9991199 | 0.018071 | \*           | 1.165396 | 0.0180395 | \*           |

</td>
</tr>
</tbody>
</table>

``` r
## dis crit filtered nontarget absent
d = data %>% filter(nontargetContrast==3)

discritNA_anova = ezANOVA(
  data = d,
  dv = .(dis_dPrime),
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
| 2   | Target          |   1 |  14 | 8.8553824 | 0.0100207 | \*     | 0.0805419 |
| 3   | Validity        |   2 |  28 | 9.5678336 | 0.0006813 | \*     | 0.0828792 |
| 4   | Target:Validity |   2 |  28 | 0.3872527 | 0.6824994 |        | 0.0046739 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8643063 | 0.3875609 |        |
| 4   | Target:Validity | 0.7598627 | 0.1677948 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8805191 | 0.0012182 | \*           | 0.9974528 | 0.0006897 | \*           |
| 4   | Target:Validity | 0.8063624 | 0.6391860 |              | 0.8957123 | 0.6603501 |              |

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
| 2   | Validity |   2 |  28 | 0.4013452 | 0.6732086 |        | 0.0086573 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8834161 | 0.4467603 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |     HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|--------:|----------:|:-------------|
| 2   | Validity | 0.8955888 | 0.6513196 |              | 1.01843 | 0.6732086 |              |

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
| 2   | Validity |   2 |  28 | 0.0060051 | 0.9940142 |        | 0.0001556 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7278862 | 0.1268857 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7860932 | 0.9841566 |              | 0.8683263 | 0.9891278 |              |

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
| 2   | nontargetContrast          |   2 |  28 | 1.7229949 | 0.1969240 |        | 0.0091200 |
| 3   | Validity                   |   2 |  28 | 1.7067700 | 0.1997911 |        | 0.0194907 |
| 4   | nontargetContrast:Validity |   4 |  56 | 0.4062855 | 0.8033371 |        | 0.0031180 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 2   | nontargetContrast          | 0.0854139 | 0.0000001 | \*     |
| 3   | Validity                   | 0.7938235 | 0.2229490 |        |
| 4   | nontargetContrast:Validity | 0.0060053 | 0.0000000 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.5223061 | 0.2103455 |              | 0.5275482 | 0.2103143 |              |
| 3   | Validity                   | 0.8290660 | 0.2058433 |              | 0.9266013 | 0.2024877 |              |
| 4   | nontargetContrast:Validity | 0.4263896 | 0.6385223 |              | 0.4795536 | 0.6617380 |              |

</td>
</tr>
</tbody>
</table>

``` r
## dis crit filtered T1
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
| 2   | nontargetContrast          |   2 |  28 | 0.5300422 | 0.5943691 |        | 0.0044028 |
| 3   | Validity                   |   2 |  28 | 1.9362264 | 0.1630781 |        | 0.0326559 |
| 4   | nontargetContrast:Validity |   4 |  56 | 1.9354978 | 0.1171877 |        | 0.0168613 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 2   | nontargetContrast          | 0.1425409 | 0.0000032 | \*     |
| 3   | Validity                   | 0.8882476 | 0.4628830 |        |
| 4   | nontargetContrast:Validity | 0.0354250 | 0.0000051 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | nontargetContrast          | 0.5383699 | 0.4906768 |              | 0.5475049 | 0.4934374 |              |
| 3   | Validity                   | 0.8994808 | 0.1682334 |              | 1.0238647 | 0.1630781 |              |
| 4   | nontargetContrast:Validity | 0.4975284 | 0.1634363 |              | 0.5797662 | 0.1550422 |              |

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
