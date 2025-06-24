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
    ## 2                                    targetContrast   1  15 95.9472235
    ## 3                                 nontargetContrast   1  15 25.3737414
    ## 4                                            Target   1  15 18.2589245
    ## 5                                          Validity   2  30  9.2064820
    ## 6                  targetContrast:nontargetContrast   1  15  8.9793873
    ## 7                             targetContrast:Target   1  15 45.2313824
    ## 8                          nontargetContrast:Target   1  15  2.3986528
    ## 9                           targetContrast:Validity   2  30 27.3850377
    ## 10                       nontargetContrast:Validity   2  30  0.2888933
    ## 11                                  Target:Validity   2  30  0.5211274
    ## 12          targetContrast:nontargetContrast:Target   1  15  0.5173956
    ## 13        targetContrast:nontargetContrast:Validity   2  30  0.3666441
    ## 14                   targetContrast:Target:Validity   2  30  3.2151533
    ## 15                nontargetContrast:Target:Validity   2  30  1.4301755
    ## 16 targetContrast:nontargetContrast:Target:Validity   2  30  0.4034339
    ##               p p<.05          ges
    ## 2  6.555386e-08     * 0.2813771265
    ## 3  1.473578e-04     * 0.1236196326
    ## 4  6.670262e-04     * 0.0428759442
    ## 5  7.627702e-04     * 0.0251082478
    ## 6  9.035757e-03     * 0.0909605402
    ## 7  6.803466e-06     * 0.0801876765
    ## 8  1.422771e-01       0.0037745429
    ## 9  1.710725e-07     * 0.0440804950
    ## 10 7.511526e-01       0.0010139810
    ## 11 5.991284e-01       0.0012889855
    ## 12 4.830116e-01       0.0009768914
    ## 13 6.961189e-01       0.0008426752
    ## 14 5.430958e-02       0.0088685110
    ## 15 2.551149e-01       0.0029720289
    ## 16 6.715922e-01       0.0009387175
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##                                              Effect         W          p p<.05
    ## 5                                          Validity 0.9055503 0.49933037      
    ## 9                           targetContrast:Validity 0.8912547 0.44669668      
    ## 10                       nontargetContrast:Validity 0.9938350 0.95763488      
    ## 11                                  Target:Validity 0.5766671 0.02120686     *
    ## 13        targetContrast:nontargetContrast:Validity 0.9432759 0.66446370      
    ## 14                   targetContrast:Target:Validity 0.6753377 0.06406883      
    ## 15                nontargetContrast:Target:Validity 0.9275183 0.59055088      
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.8214642 0.25241803      
    ## 
    ## $`Sphericity Corrections`
    ##                                              Effect       GGe        p[GG]
    ## 5                                          Validity 0.9137012 1.148506e-03
    ## 9                           targetContrast:Validity 0.9019204 5.934235e-07
    ## 10                       nontargetContrast:Validity 0.9938728 7.498450e-01
    ## 11                                  Target:Validity 0.7025763 5.385514e-01
    ## 13        targetContrast:nontargetContrast:Validity 0.9463208 6.848115e-01
    ## 14                   targetContrast:Target:Validity 0.7549094 7.097861e-02
    ## 15                nontargetContrast:Target:Validity 0.9324168 2.557344e-01
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.8485105 6.389543e-01
    ##    p[GG]<.05       HFe        p[HF] p[HF]<.05
    ## 5          * 1.0339053 7.627702e-04         *
    ## 9          * 1.0177754 1.710725e-07         *
    ## 10           1.1452254 7.511526e-01          
    ## 11           0.7533164 5.504208e-01          
    ## 13           1.0788698 6.961189e-01          
    ## 14           0.8212306 6.602863e-02          
    ## 15           1.0596492 2.551149e-01          
    ## 16           0.9453648 6.604340e-01

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
| 2   | nontargetContrast                 |   1 |  15 |  0.4378883 | 0.5181806 |        | 0.0039803 |
| 3   | Target                            |   1 |  15 | 55.2542310 | 0.0000021 | \*     | 0.2263112 |
| 4   | Validity                          |   2 |  30 | 22.8238194 | 0.0000009 | \*     | 0.1364748 |
| 5   | nontargetContrast:Target          |   1 |  15 |  0.2855241 | 0.6009340 |        | 0.0010428 |
| 6   | nontargetContrast:Validity        |   2 |  30 |  0.0338958 | 0.9667092 |        | 0.0003462 |
| 7   | Target:Validity                   |   2 |  30 |  2.6349430 | 0.0882588 |        | 0.0184851 |
| 8   | nontargetContrast:Target:Validity |   2 |  30 |  0.6407655 | 0.5339478 |        | 0.0029406 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.8558785 | 0.3364224 |        |
| 6   | nontargetContrast:Validity        | 0.9989412 | 0.9926121 |        |
| 7   | Target:Validity                   | 0.6760089 | 0.0645159 |        |
| 8   | nontargetContrast:Target:Validity | 0.9216923 | 0.5650694 |        |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.8740331 | 0.0000038 | \*           | 0.9798214 | 0.0000012 | \*           |
| 6   | nontargetContrast:Validity        | 0.9989423 | 0.9666104 |              | 1.1523569 | 0.9667092 |              |
| 7   | Target:Validity                   | 0.7552921 | 0.1053891 |              | 0.8217311 | 0.1004824 |              |
| 8   | nontargetContrast:Target:Validity | 0.9273791 | 0.5231512 |              | 1.0527053 | 0.5339478 |              |

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
| 2   | nontargetContrast          |   1 |  15 |  0.0502283 | 0.8256905 |        | 0.0007743 |
| 3   | Validity                   |   2 |  30 | 18.0157232 | 0.0000073 | \*     | 0.1857991 |
| 4   | nontargetContrast:Validity |   2 |  30 |  0.1534964 | 0.8583732 |        | 0.0026091 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9420207 | 0.6582990 |        |
| 4   | nontargetContrast:Validity | 0.9319731 | 0.6106941 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity                   | 0.9451981 | 0.0000119 | \*           | 1.077315 | 0.0000073 | \*           |
| 4   | nontargetContrast:Validity | 0.9363060 | 0.8452155 |              | 1.065017 | 0.8583732 |              |

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
| 2   | nontargetContrast          |   1 |  15 | 1.3934426 | 0.2562057 |        | 0.0117518 |
| 3   | Validity                   |   2 |  30 | 5.7832350 | 0.0075105 | \*     | 0.0862890 |
| 4   | nontargetContrast:Validity |   2 |  30 | 0.3899607 | 0.6804657 |        | 0.0043682 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9525916 | 0.7117824 |        |
| 4   | nontargetContrast:Validity | 0.8697401 | 0.3764666 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.9547374 | 0.0084918 | \*           | 1.0905444 | 0.0075105 | \*           |
| 4   | nontargetContrast:Validity | 0.8847523 | 0.6558295 |              | 0.9943721 | 0.6793319 |              |

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
| 2   | nontargetContrast                 |   1 |  15 | 18.8560460 | 0.0005802 | \*     | 0.2991562 |
| 3   | Target                            |   1 |  15 |  1.7003310 | 0.2119014 |        | 0.0061941 |
| 4   | Validity                          |   2 |  30 |  1.7015150 | 0.1995404 |        | 0.0043500 |
| 5   | nontargetContrast:Target          |   1 |  15 |  2.3117621 | 0.1491955 |        | 0.0076241 |
| 6   | nontargetContrast:Validity        |   2 |  30 |  1.2869658 | 0.2909150 |        | 0.0030335 |
| 7   | Target:Validity                   |   2 |  30 |  0.9273946 | 0.4066285 |        | 0.0034942 |
| 8   | nontargetContrast:Target:Validity |   2 |  30 |  1.0976140 | 0.3466939 |        | 0.0046594 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.9415051 | 0.6557809 |        |
| 6   | nontargetContrast:Validity        | 0.8856266 | 0.4273213 |        |
| 7   | Target:Validity                   | 0.7181353 | 0.0985018 |        |
| 8   | nontargetContrast:Target:Validity | 0.7705348 | 0.1612671 |        |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.9447377 | 0.2015459 |              | 1.0766772 | 0.1995404 |              |
| 6   | nontargetContrast:Validity        | 0.8973653 | 0.2897476 |              | 1.0115541 | 0.2909150 |              |
| 7   | Target:Validity                   | 0.7801136 | 0.3876515 |              | 0.8543163 | 0.3947280 |              |
| 8   | nontargetContrast:Target:Validity | 0.8133618 | 0.3377969 |              | 0.8983429 | 0.3422553 |              |

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
| 2   | nontargetContrast          |   1 |  15 | 13.300902 | 0.0023843 | \*     | 0.2631954 |
| 3   | Validity                   |   2 |  30 |  3.178610 | 0.0559705 |        | 0.0155024 |
| 4   | nontargetContrast:Validity |   2 |  30 |  2.072676 | 0.1434976 |        | 0.0116274 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.9665499 | 0.7880791 |        |
| 4   | nontargetContrast:Validity | 0.9171463 | 0.5458464 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity                   | 0.9676325 | 0.0579427 |              | 1.108489 | 0.0559705 |              |
| 4   | nontargetContrast:Validity | 0.9234858 | 0.1478555 |              | 1.047346 | 0.1434976 |              |

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
| 2   | nontargetContrast          |   1 |  15 | 19.7061956 | 0.0004779 | \*     | 0.3321166 |
| 3   | Validity                   |   2 |  30 |  0.1991217 | 0.8205244 |        | 0.0014873 |
| 4   | nontargetContrast:Validity |   2 |  30 |  0.6006051 | 0.5549415 |        | 0.0044264 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.7506220 | 0.1342608 |        |
| 4   | nontargetContrast:Validity | 0.7162895 | 0.0967431 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.8003983 | 0.7722596 |              | 0.8811250 | 0.7935378 |              |
| 4   | nontargetContrast:Validity | 0.7789918 | 0.5168286 |              | 0.8528385 | 0.5305916 |              |

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
| 2   | targetContrast                 |   1 |  15 |  4.1375926 | 0.0600203 |        | 0.0588599 |
| 3   | Target                         |   1 |  15 |  4.3917275 | 0.0534916 |        | 0.0145042 |
| 4   | Validity                       |   2 |  30 |  2.3007456 | 0.1175971 |        | 0.0150192 |
| 5   | targetContrast:Target          |   1 |  15 | 20.2138475 | 0.0004267 | \*     | 0.0651164 |
| 6   | targetContrast:Validity        |   2 |  30 | 11.2447812 | 0.0002268 | \*     | 0.0367263 |
| 7   | Target:Validity                |   2 |  30 |  0.1481399 | 0.8629374 |        | 0.0006773 |
| 8   | targetContrast:Target:Validity |   2 |  30 |  1.7370639 | 0.1932768 |        | 0.0086096 |

</td>
<td>

|     | Effect                         |         W |         p | p\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------|
| 4   | Validity                       | 0.9556932 | 0.7281646 |        |
| 6   | targetContrast:Validity        | 0.6791310 | 0.0666308 |        |
| 7   | Target:Validity                | 0.7843178 | 0.1825763 |        |
| 8   | targetContrast:Target:Validity | 0.7474790 | 0.1303746 |        |

</td>
<td>

|     | Effect                         |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                       | 0.9575730 | 0.1202600 |              | 1.0944844 | 0.1175971 |              |
| 6   | targetContrast:Validity        | 0.7570773 | 0.0009447 | \*           | 0.8240668 | 0.0006365 | \*           |
| 7   | Target:Validity                | 0.8225834 | 0.8228228 |              | 0.9106317 | 0.8442439 |              |
| 8   | targetContrast:Target:Validity | 0.7983898 | 0.2007572 |              | 0.8784633 | 0.1979263 |              |

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

|     | Effect                  | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | targetContrast          |   1 |  15 | 13.560423 | 0.0022174 | \*     | 0.2180575 |
| 3   | Validity                |   2 |  30 |  1.174095 | 0.3229007 |        | 0.0132369 |
| 4   | targetContrast:Validity |   2 |  30 | 10.210264 | 0.0004147 | \*     | 0.0757855 |

</td>
<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.9636389 | 0.7716143 |        |
| 4   | targetContrast:Validity | 0.8397621 | 0.2945058 |        |

</td>
<td>

|     | Effect                  |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                | 0.9649146 | 0.3219452 |              | 1.1047013 | 0.3229007 |              |
| 4   | targetContrast:Validity | 0.8618922 | 0.0008627 | \*           | 0.9633977 | 0.0005033 | \*           |

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
| 2   | targetContrast          |   1 |  15 | 0.0108501 | 0.9184195 |        | 0.0001818 |
| 3   | Validity                |   2 |  30 | 1.6529335 | 0.2084528 |        | 0.0178617 |
| 4   | targetContrast:Validity |   2 |  30 | 1.7375700 | 0.1931892 |        | 0.0149139 |

</td>
<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.9732690 | 0.8272378 |        |
| 4   | targetContrast:Validity | 0.7626249 | 0.1500296 |        |

</td>
<td>

|     | Effect                  |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                | 0.9739650 | 0.2093041 |              | 1.1173277 | 0.2084528 |              |
| 4   | targetContrast:Validity | 0.8081624 | 0.2003453 |              | 0.8914291 | 0.1973638 |              |

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
| 2   | targetContrast                 |   1 |  15 | 121.397719 | 0.0000000 | \*     | 0.6541504 |
| 3   | Target                         |   1 |  15 |  25.423166 | 0.0001460 | \*     | 0.1372445 |
| 4   | Validity                       |   2 |  30 |  12.193691 | 0.0001332 | \*     | 0.0604671 |
| 5   | targetContrast:Target          |   1 |  15 |  29.530418 | 0.0000691 | \*     | 0.1293181 |
| 6   | targetContrast:Validity        |   2 |  30 |  12.796568 | 0.0000958 | \*     | 0.0704280 |
| 7   | Target:Validity                |   2 |  30 |   3.543639 | 0.0415379 | \*     | 0.0157441 |
| 8   | targetContrast:Target:Validity |   2 |  30 |   2.520847 | 0.0972842 |        | 0.0136242 |

</td>
<td>

|     | Effect                         |         W |         p | p\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------|
| 4   | Validity                       | 0.9209426 | 0.5618596 |        |
| 6   | targetContrast:Validity        | 0.8751377 | 0.3931286 |        |
| 7   | Target:Validity                | 0.6990417 | 0.0815683 |        |
| 8   | targetContrast:Target:Validity | 0.7309785 | 0.1115147 |        |

</td>
<td>

|     | Effect                         |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                       | 0.9267347 | 0.0002119 | \*           | 1.0518179 | 0.0001332 | \*           |
| 6   | targetContrast:Validity        | 0.8889977 | 0.0002006 | \*           | 1.0001481 | 0.0000958 | \*           |
| 7   | Target:Validity                | 0.7686641 | 0.0561424 |              | 0.8392558 | 0.0512090 |              |
| 8   | targetContrast:Target:Validity | 0.7880087 | 0.1117844 |              | 0.8647314 | 0.1063471 |              |

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
| 2   | targetContrast          |   1 |  15 | 115.866107 | 0.0000000 | \*     | 0.6953449 |
| 3   | Validity                |   2 |  30 |   9.792315 | 0.0005329 | \*     | 0.0950224 |
| 4   | targetContrast:Validity |   2 |  30 |   9.267425 | 0.0007345 | \*     | 0.1018675 |

</td>
<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.9466425 | 0.6812430 |        |
| 4   | targetContrast:Validity | 0.9468707 | 0.6823931 |        |

</td>
<td>

|     | Effect                  |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity                | 0.9493453 | 0.0006887 | \*           | 1.083062 | 0.0005329 | \*           |
| 4   | targetContrast:Validity | 0.9495510 | 0.0009345 | \*           | 1.083347 | 0.0007345 | \*           |

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
| 2   | targetContrast          |   1 |  15 | 67.743542 | 0.0000006 | \*     | 0.6042521 |
| 3   | Validity                |   2 |  30 |  3.604651 | 0.0395408 | \*     | 0.0274238 |
| 4   | targetContrast:Validity |   2 |  30 |  4.063721 | 0.0274318 | \*     | 0.0376399 |

</td>
<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.9661887 | 0.7860202 |        |
| 4   | targetContrast:Validity | 0.8106492 | 0.2300545 |        |

</td>
<td>

|     | Effect                  |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                | 0.9672945 | 0.0413111 | \*           | 1.1080182 | 0.0395408 | \*           |
| 4   | targetContrast:Validity | 0.8407948 | 0.0355830 | \*           | 0.9350003 | 0.0305007 | \*           |

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
| 2   | Target          |   1 |  15 | 43.5073041 | 0.0000085 | \*     | 0.2114855 |
| 3   | Validity        |   2 |  30 |  7.3094163 | 0.0025945 | \*     | 0.1478889 |
| 4   | Target:Validity |   2 |  30 |  0.9216364 | 0.4088400 |        | 0.0129255 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9083483 | 0.5102310 |        |
| 4   | Target:Validity | 0.8069901 | 0.2228832 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.9160431 | 0.0035229 | \*           | 1.0371187 | 0.0025945 | \*           |
| 4   | Target:Validity | 0.8382160 | 0.3952549 |              | 0.9315415 | 0.4034477 |              |

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
| 2   | Target          |   1 |  15 | 27.475352 | 0.0000995 | \*     | 0.2407832 |
| 3   | Validity        |   2 |  30 | 13.119846 | 0.0000806 | \*     | 0.1260827 |
| 4   | Target:Validity |   2 |  30 |  3.156729 | 0.0569908 |        | 0.0290034 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8945681 | 0.4584521 |        |
| 4   | Target:Validity | 0.7172819 | 0.0976853 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.9046238 | 0.0001543 | \*           | 1.0214718 | 0.0000806 | \*           |
| 4   | Target:Validity | 0.7795945 | 0.0719154 |              | 0.8536324 | 0.0665179 |              |

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

|     | Effect          | DFn | DFd |        F |         p | p\<.05 |       ges |
|:----|:----------------|----:|----:|---------:|----------:|:-------|----------:|
| 2   | Target          |   1 |  15 | 1.996945 | 0.1780311 |        | 0.0138613 |
| 3   | Validity        |   2 |  30 | 1.553717 | 0.2280006 |        | 0.0073540 |
| 4   | Target:Validity |   2 |  30 | 1.016908 | 0.3738424 |        | 0.0078721 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9171724 | 0.5459550 |        |
| 4   | Target:Validity | 0.7620354 | 0.1492197 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.9235080 | 0.2297412 |              | 1.0473767 | 0.2280006 |              |
| 4   | Target:Validity | 0.8077776 | 0.3614438 |              | 0.8909179 | 0.3672848 |              |

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
| 2   | Target          |   1 |  15 | 0.9582790 | 0.3431463 |        | 0.0029706 |
| 3   | Validity        |   2 |  30 | 0.4340836 | 0.6518627 |        | 0.0076032 |
| 4   | Target:Validity |   2 |  30 | 1.0337045 | 0.3680110 |        | 0.0270942 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8079726 | 0.2247897 |        |
| 4   | Target:Validity | 0.4054623 | 0.0018016 | \*     |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8389069 | 0.6180684 |              | 0.9324678 | 0.6383993 |              |
| 4   | Target:Validity | 0.6271410 | 0.3407605 |              | 0.6572415 | 0.3437701 |              |

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
| 2   | Validity |   2 |  30 | 6.026155 | 0.0063092 | \*     | 0.1930014 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8784359 | 0.4036179 |        |

</td>
<td>

|     | Effect   |      GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|---------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.891612 | 0.0086088 | \*           | 1.003709 | 0.0063092 | \*           |

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
| 2   | Validity |   2 |  30 | 10.11374 | 0.0004392 | \*     | 0.1833629 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9793755 | 0.8642603 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9797922 | 0.0004883 | \*           | 1.125476 | 0.0004392 | \*           |

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

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |      ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|---------:|
| 2   | Validity |   2 |  30 | 2.783249 | 0.0778399 |        | 0.026841 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9622856 | 0.7640605 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9636562 | 0.0802026 |              | 1.102948 | 0.0778399 |              |

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

|     | Effect   | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  30 | 0.5073195 | 0.6071805 |        | 0.0233653 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.5264103 | 0.0112014 | \*     |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.6786149 | 0.5394286 |              | 0.7225687 | 0.5502944 |              |

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
| 2   | Validity |   2 |  30 | 3.424766 | 0.0457445 | \*     | 0.1093284 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9553059 | 0.7261012 |        |

</td>
<td>

|     | Effect   |      GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|---------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.957218 | 0.0482066 | \*           | 1.093991 | 0.0457445 | \*           |

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
| 2   | Validity |   2 |  30 | 4.026048 | 0.0282579 | \*     | 0.0632569 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9570585 | 0.7354776 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9588266 | 0.0301907 | \*           | 1.096227 | 0.0282579 | \*           |

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
| 2   | Validity |   2 |  30 | 0.3763523 | 0.6895552 |        | 0.0055034 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7289737 | 0.1093914 |        |

</td>
<td>

|     | Effect   |       GGe | p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|--------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7867658 | 0.64066 |              | 0.8630902 | 0.6595644 |              |

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

|     | Effect   | DFn | DFd |        F |        p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|---------:|:-------|----------:|
| 2   | Validity |   2 |  30 | 1.540962 | 0.230652 |        | 0.0568345 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.4251616 | 0.0025112 | \*     |

</td>
<td>

|     | Effect   |       GGe |  p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|---------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.6349858 | 0.235399 |              | 0.6671343 | 0.2354186 |              |

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
| 2   | targetContrast                            |   1 |  15 | 165.4839719 | 0.0000000 | \*     | 0.4483271 |
| 3   | nontargetContrast                         |   1 |  15 |  17.0586192 | 0.0008901 | \*     | 0.0863195 |
| 4   | Validity                                  |   2 |  30 |   8.3242255 | 0.0013313 | \*     | 0.0346797 |
| 5   | targetContrast:nontargetContrast          |   1 |  15 |   5.0586023 | 0.0399544 | \*     | 0.0722264 |
| 6   | targetContrast:Validity                   |   2 |  30 |  19.4064257 | 0.0000039 | \*     | 0.0825874 |
| 7   | nontargetContrast:Validity                |   2 |  30 |   0.7902090 | 0.4629677 |        | 0.0054190 |
| 8   | targetContrast:nontargetContrast:Validity |   2 |  30 |   0.3357719 | 0.7174379 |        | 0.0015679 |

</td>
<td>

|     | Effect                                    |         W |         p | p\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------|
| 4   | Validity                                  | 0.8539969 | 0.3312792 |        |
| 6   | targetContrast:Validity                   | 0.9809459 | 0.8740082 |        |
| 7   | nontargetContrast:Validity                | 0.9967168 | 0.9772427 |        |
| 8   | targetContrast:nontargetContrast:Validity | 0.6232783 | 0.0365404 | \*     |

</td>
<td>

|     | Effect                                    |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                                  | 0.8725980 | 0.0022859 | \*           | 0.9778770 | 0.0014620 | \*           |
| 6   | targetContrast:Validity                   | 0.9813022 | 0.0000047 | \*           | 1.1275899 | 0.0000039 | \*           |
| 7   | nontargetContrast:Validity                | 0.9967275 | 0.4626201 |              | 1.1492399 | 0.4629677 |              |
| 8   | targetContrast:nontargetContrast:Validity | 0.7263632 | 0.6499534 |              | 0.7840553 | 0.6661777 |              |

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
| 2   | targetContrast                            |   1 |  15 | 15.8498398 | 0.0012046 | \*     | 0.1025085 |
| 3   | nontargetContrast                         |   1 |  15 | 22.4885745 | 0.0002620 | \*     | 0.1665478 |
| 4   | Validity                                  |   2 |  30 |  2.7455658 | 0.0803565 |        | 0.0170565 |
| 5   | targetContrast:nontargetContrast          |   1 |  15 | 12.0776340 | 0.0033912 | \*     | 0.1121799 |
| 6   | targetContrast:Validity                   |   2 |  30 |  3.9490630 | 0.0300298 | \*     | 0.0166184 |
| 7   | nontargetContrast:Validity                |   2 |  30 |  0.5763978 | 0.5680197 |        | 0.0024045 |
| 8   | targetContrast:nontargetContrast:Validity |   2 |  30 |  0.4402271 | 0.6479830 |        | 0.0020110 |

</td>
<td>

|     | Effect                                    |         W |         p | p\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------|
| 4   | Validity                                  | 0.9667584 | 0.7892703 |        |
| 6   | targetContrast:Validity                   | 0.7046142 | 0.0862303 |        |
| 7   | nontargetContrast:Validity                | 0.9836994 | 0.8913264 |        |
| 8   | targetContrast:nontargetContrast:Validity | 0.8688294 | 0.3737158 |        |

</td>
<td>

|     | Effect                                    |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                                  | 0.9678279 | 0.0824500 |              | 1.1087618 | 0.0803565 |              |
| 6   | targetContrast:Validity                   | 0.7719708 | 0.0428806 | \*           | 0.8436001 | 0.0383331 | \*           |
| 7   | nontargetContrast:Validity                | 0.9839608 | 0.5654387 |              | 1.1313140 | 0.5680197 |              |
| 8   | targetContrast:nontargetContrast:Validity | 0.8840399 | 0.6244192 |              | 0.9934037 | 0.6467167 |              |

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
    ## 2                                    targetContrast   1  15 37.8707721
    ## 3                                 nontargetContrast   1  15 16.9723460
    ## 4                                            Target   1  15 25.9612103
    ## 5                                          Validity   2  30 14.2048302
    ## 6                  targetContrast:nontargetContrast   1  15 20.6108833
    ## 7                             targetContrast:Target   1  15  4.3248891
    ## 8                          nontargetContrast:Target   1  15  0.2390907
    ## 9                           targetContrast:Validity   2  30 10.1748978
    ## 10                       nontargetContrast:Validity   2  30  4.3081267
    ## 11                                  Target:Validity   2  30  2.2193826
    ## 12          targetContrast:nontargetContrast:Target   1  15  4.4860352
    ## 13        targetContrast:nontargetContrast:Validity   2  30  2.6465591
    ## 14                   targetContrast:Target:Validity   2  30  3.7731751
    ## 15                nontargetContrast:Target:Validity   2  30  0.8228714
    ## 16 targetContrast:nontargetContrast:Target:Validity   2  30  0.5882012
    ##               p p<.05          ges
    ## 2  1.845180e-05     * 0.1559951390
    ## 3  9.091313e-04     * 0.0290353604
    ## 4  1.317605e-04     * 0.0382580942
    ## 5  4.566133e-05     * 0.0523627352
    ## 6  3.909542e-04     * 0.0153663605
    ## 7  5.512417e-02       0.0043337797
    ## 8  6.319358e-01       0.0001145214
    ## 9  4.234997e-04     * 0.0220022961
    ## 10 2.266036e-02     * 0.0041798927
    ## 11 1.262133e-01       0.0022485326
    ## 12 5.128364e-02       0.0039288873
    ## 13 8.739133e-02       0.0018762339
    ## 14 3.453846e-02     * 0.0027832333
    ## 15 4.488378e-01       0.0006246229
    ## 16 5.616023e-01       0.0002491621
    ## 
    ## $`Mauchly's Test for Sphericity`
    ##                                              Effect         W           p p<.05
    ## 5                                          Validity 0.4242829 0.002475078     *
    ## 9                           targetContrast:Validity 0.5547806 0.016175178     *
    ## 10                       nontargetContrast:Validity 0.8512893 0.323996351      
    ## 11                                  Target:Validity 0.9820078 0.880652729      
    ## 13        targetContrast:nontargetContrast:Validity 0.8362277 0.285938075      
    ## 14                   targetContrast:Target:Validity 0.9198705 0.557297100      
    ## 15                nontargetContrast:Target:Validity 0.8174426 0.243893848      
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.9383554 0.640577184      
    ## 
    ## $`Sphericity Corrections`
    ##                                              Effect       GGe        p[GG]
    ## 5                                          Validity 0.6346317 0.0006788495
    ## 9                           targetContrast:Validity 0.6919365 0.0021711969
    ## 10                       nontargetContrast:Validity 0.8705412 0.0285665061
    ## 11                                  Target:Validity 0.9823258 0.1272887493
    ## 13        targetContrast:nontargetContrast:Validity 0.8592746 0.0969281831
    ## 14                   targetContrast:Target:Validity 0.9258149 0.0384523198
    ## 15                nontargetContrast:Target:Validity 0.8456249 0.4322659998
    ## 16 targetContrast:nontargetContrast:Target:Validity 0.9419348 0.5522414764
    ##    p[GG]<.05       HFe        p[HF] p[HF]<.05
    ## 5          * 0.6666873 0.0005347521         *
    ## 9          * 0.7396364 0.0016830533         *
    ## 10         * 0.9750916 0.0236908176         *
    ## 11           1.1290234 0.1262133330          
    ## 13           0.9598646 0.0900193069          
    ## 14         * 1.0505514 0.0345384566         *
    ## 15           0.9414857 0.4429052320          
    ## 16           1.0727979 0.5616022592

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
| 2   | nontargetContrast                 |   1 |  15 |  1.0651513 | 0.3183976 |        | 0.0017572 |
| 3   | Target                            |   1 |  15 | 18.2360533 | 0.0006706 | \*     | 0.0510704 |
| 4   | Validity                          |   2 |  30 | 13.8606055 | 0.0000545 | \*     | 0.1017151 |
| 5   | nontargetContrast:Target          |   1 |  15 |  2.0626576 | 0.1714741 |        | 0.0020695 |
| 6   | nontargetContrast:Validity        |   2 |  30 |  0.4538874 | 0.6394443 |        | 0.0006968 |
| 7   | Target:Validity                   |   2 |  30 |  3.2760152 | 0.0516590 |        | 0.0065246 |
| 8   | nontargetContrast:Target:Validity |   2 |  30 |  0.9788374 | 0.3874282 |        | 0.0012535 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.4624284 | 0.0045218 | \*     |
| 6   | nontargetContrast:Validity        | 0.8023710 | 0.2141049 |        |
| 7   | Target:Validity                   | 0.9363839 | 0.6312154 |        |
| 8   | nontargetContrast:Target:Validity | 0.9354149 | 0.6266572 |        |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.6503762 | 0.0006803 | \*           | 0.6866085 | 0.0005228 | \*           |
| 6   | nontargetContrast:Validity        | 0.8349831 | 0.6055276 |              | 0.9272092 | 0.6252102 |              |
| 7   | Target:Validity                   | 0.9401888 | 0.0552761 |              | 1.0703831 | 0.0516590 |              |
| 8   | nontargetContrast:Target:Validity | 0.9393331 | 0.3834352 |              | 1.0691999 | 0.3874282 |              |

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
| 2   | nontargetContrast          |   1 |  15 |  0.0049660 | 0.9447504 |        | 0.0000109 |
| 3   | Validity                   |   2 |  30 | 12.3826928 | 0.0001200 | \*     | 0.1213794 |
| 4   | nontargetContrast:Validity |   2 |  30 |  0.9902342 | 0.3833068 |        | 0.0020755 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.8332406 | 0.2788643 |        |
| 4   | nontargetContrast:Validity | 0.9393685 | 0.6454340 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.8570747 | 0.0003017 | \*           | 0.9568974 | 0.0001584 | \*           |
| 4   | nontargetContrast:Validity | 0.9428345 | 0.3796919 |              | 1.0740427 | 0.3833068 |              |

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

|     | Effect                     | DFn | DFd |          F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|-----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |  15 |  2.8044118 | 0.1147220 |        | 0.0091936 |
| 3   | Validity                   |   2 |  30 | 10.6746759 | 0.0003154 | \*     | 0.0856466 |
| 4   | nontargetContrast:Validity |   2 |  30 |  0.4610177 | 0.6350351 |        | 0.0017677 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.3574342 | 0.0007454 | \*     |
| 4   | nontargetContrast:Validity | 0.6912692 | 0.0754276 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.6088036 | 0.0028071 | \*           | 0.6342047 | 0.0024325 | \*           |
| 4   | nontargetContrast:Validity | 0.7640991 | 0.5849474 |              | 0.8332653 | 0.6010227 |              |

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
| 2   | nontargetContrast                 |   1 |  15 | 30.8584289 | 0.0000551 | \*     | 0.1137815 |
| 3   | Target                            |   1 |  15 | 14.6727183 | 0.0016379 | \*     | 0.0251347 |
| 4   | Validity                          |   2 |  30 |  4.8294134 | 0.0151957 | \*     | 0.0104309 |
| 5   | nontargetContrast:Target          |   1 |  15 |  3.8580180 | 0.0683163 |        | 0.0077589 |
| 6   | nontargetContrast:Validity        |   2 |  30 |  8.2765205 | 0.0013728 | \*     | 0.0160086 |
| 7   | Target:Validity                   |   2 |  30 |  1.6842752 | 0.2026557 |        | 0.0021551 |
| 8   | nontargetContrast:Target:Validity |   2 |  30 |  0.1533694 | 0.8584811 |        | 0.0001527 |

</td>
<td>

|     | Effect                            |         W |         p | p\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------|
| 4   | Validity                          | 0.7044934 | 0.0861268 |        |
| 6   | nontargetContrast:Validity        | 0.9397945 | 0.6474856 |        |
| 7   | Target:Validity                   | 0.8500685 | 0.3207580 |        |
| 8   | nontargetContrast:Target:Validity | 0.6223336 | 0.0361545 | \*     |

</td>
<td>

|     | Effect                            |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                          | 0.7718988 | 0.0246706 | \*           | 0.8435055 | 0.0211786 | \*           |
| 6   | nontargetContrast:Validity        | 0.9432133 | 0.0017434 | \*           | 1.0745670 | 0.0013728 | \*           |
| 7   | Target:Validity                   | 0.8696170 | 0.2070766 |              | 0.9738406 | 0.2035779 |              |
| 8   | nontargetContrast:Target:Validity | 0.7258651 | 0.7901938 |              | 0.7834094 | 0.8073530 |              |

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

|     | Effect                     | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | nontargetContrast          |   1 |  15 | 20.438038 | 0.0004061 | \*     | 0.1395670 |
| 3   | Validity                   |   2 |  30 |  1.204127 | 0.3140394 |        | 0.0042066 |
| 4   | nontargetContrast:Validity |   2 |  30 |  3.712766 | 0.0362492 | \*     | 0.0111498 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.8196408 | 0.2485221 |        |
| 4   | nontargetContrast:Validity | 0.7575810 | 0.1432200 |        |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.8471998 | 0.3099772 |              | 0.9436024 | 0.3127466 |              |
| 4   | nontargetContrast:Validity | 0.8048815 | 0.0477332 | \*           | 0.8870719 | 0.0425028 | \*           |

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
| 2   | nontargetContrast          |   1 |  15 | 27.910155 | 0.0000920 | \*     | 0.0864635 |
| 3   | Validity                   |   2 |  30 |  7.731092 | 0.0019591 | \*     | 0.0255809 |
| 4   | nontargetContrast:Validity |   2 |  30 |  8.677339 | 0.0010626 | \*     | 0.0240567 |

</td>
<td>

|     | Effect                     |         W |         p | p\<.05 |
|:----|:---------------------------|----------:|----------:|:-------|
| 3   | Validity                   | 0.6242053 | 0.0369226 | \*     |
| 4   | nontargetContrast:Validity | 0.5881058 | 0.0243326 | \*     |

</td>
<td>

|     | Effect                     |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                   | 0.7268526 | 0.0057022 | \*           | 0.7846900 | 0.0045423 | \*           |
| 4   | nontargetContrast:Validity | 0.7082684 | 0.0039082 | \*           | 0.7606524 | 0.0030890 | \*           |

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
| 2   | targetContrast                 |   1 |  15 | 23.6439939 | 0.0002069 | \*     | 0.0803066 |
| 3   | Target                         |   1 |  15 | 28.1552408 | 0.0000880 | \*     | 0.0398068 |
| 4   | Validity                       |   2 |  30 | 12.5277799 | 0.0001109 | \*     | 0.0763927 |
| 5   | targetContrast:Target          |   1 |  15 |  0.0055781 | 0.9414511 |        | 0.0000094 |
| 6   | targetContrast:Validity        |   2 |  30 |  4.5915506 | 0.0182111 | \*     | 0.0106152 |
| 7   | Target:Validity                |   2 |  30 |  2.0706218 | 0.1437569 |        | 0.0034252 |
| 8   | targetContrast:Target:Validity |   2 |  30 |  2.6159322 | 0.0896983 |        | 0.0025080 |

</td>
<td>

|     | Effect                         |         W |         p | p\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------|
| 4   | Validity                       | 0.3338260 | 0.0004620 | \*     |
| 6   | targetContrast:Validity        | 0.4808610 | 0.0059448 | \*     |
| 7   | Target:Validity                | 0.7208647 | 0.1011525 |        |
| 8   | targetContrast:Target:Validity | 0.9561893 | 0.7308146 |        |

</td>
<td>

|     | Effect                         |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                       | 0.6001774 | 0.0015279 | \*           | 0.6234101 | 0.0013101 | \*           |
| 6   | targetContrast:Validity        | 0.6582676 | 0.0357824 | \*           | 0.6966278 | 0.0331601 | \*           |
| 7   | Target:Validity                | 0.7817781 | 0.1562138 |              | 0.8565101 | 0.1519446 |              |
| 8   | targetContrast:Target:Validity | 0.9580281 | 0.0924478 |              | 1.0951171 | 0.0896983 |              |

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
| 2   | targetContrast          |   1 |  15 | 12.579137 | 0.0029289 | \*     | 0.0721970 |
| 3   | Validity                |   2 |  30 | 10.904327 | 0.0002759 | \*     | 0.0734647 |
| 4   | targetContrast:Validity |   2 |  30 |  7.250479 | 0.0026995 | \*     | 0.0189312 |

</td>
<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.6787666 | 0.0663809 |        |
| 4   | targetContrast:Validity | 0.8946603 | 0.4587829 |        |

</td>
<td>

|     | Effect                  |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                | 0.7568686 | 0.0011010 | \*           | 0.8237936 | 0.0007511 | \*           |
| 4   | targetContrast:Validity | 0.9046993 | 0.0038078 | \*           | 1.0215750 | 0.0026995 | \*           |

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

|     | Effect                  | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | targetContrast          |   1 |  15 | 23.223288 | 0.0002253 | \*     | 0.0909783 |
| 3   | Validity                |   2 |  30 |  9.941614 | 0.0004870 | \*     | 0.0870447 |
| 4   | targetContrast:Validity |   2 |  30 |  1.235167 | 0.3051528 |        | 0.0051012 |

</td>
<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.2034863 | 0.0000144 | \*     |
| 4   | targetContrast:Validity | 0.6874098 | 0.0725287 |        |

</td>
<td>

|     | Effect                  |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                | 0.5566337 | 0.0048736 | \*           | 0.5693304 | 0.0045591 | \*           |
| 4   | targetContrast:Validity | 0.7618524 | 0.2991751 |              | 0.8303200 | 0.3014089 |              |

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

|     | Effect                         | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:-------------------------------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | targetContrast                 |   1 |  15 | 41.934550 | 0.0000105 | \*     | 0.2477518 |
| 3   | Target                         |   1 |  15 | 14.516830 | 0.0017076 | \*     | 0.0367144 |
| 4   | Validity                       |   2 |  30 | 11.425986 | 0.0002046 | \*     | 0.0318962 |
| 5   | targetContrast:Target          |   1 |  15 |  8.420047 | 0.0109561 | \*     | 0.0174330 |
| 6   | targetContrast:Validity        |   2 |  30 | 11.130374 | 0.0002422 | \*     | 0.0383982 |
| 7   | Target:Validity                |   2 |  30 |  1.176342 | 0.3222285 |        | 0.0022373 |
| 8   | targetContrast:Target:Validity |   2 |  30 |  2.611091 | 0.0900689 |        | 0.0036264 |

</td>
<td>

|     | Effect                         |         W |         p | p\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------|
| 4   | Validity                       | 0.8501128 | 0.3208751 |        |
| 6   | targetContrast:Validity        | 0.8589352 | 0.3449234 |        |
| 7   | Target:Validity                | 0.9498870 | 0.6977559 |        |
| 8   | targetContrast:Target:Validity | 0.9342520 | 0.6212243 |        |

</td>
<td>

|     | Effect                         |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:-------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                       | 0.8696505 | 0.0004446 | \*           | 0.9738860 | 0.0002389 | \*           |
| 6   | targetContrast:Validity        | 0.8763744 | 0.0004959 | \*           | 0.9829956 | 0.0002672 | \*           |
| 7   | Target:Validity                | 0.9522784 | 0.3209258 |              | 1.0871305 | 0.3222285 |              |
| 8   | targetContrast:Target:Validity | 0.9383082 | 0.0941364 |              | 1.0677833 | 0.0900689 |              |

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
| 2   | targetContrast          |   1 |  15 | 34.539216 | 0.0000304 | \*     | 0.2857909 |
| 3   | Validity                |   2 |  30 |  6.736187 | 0.0038337 | \*     | 0.0373392 |
| 4   | targetContrast:Validity |   2 |  30 |  8.897771 | 0.0009247 | \*     | 0.0513723 |

</td>
<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.9796729 | 0.8660993 |        |
| 4   | targetContrast:Validity | 0.9104080 | 0.5183851 |        |

</td>
<td>

|     | Effect                  |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity                | 0.9800779 | 0.0040938 | \*           | 1.125876 | 0.0038337 | \*           |
| 4   | targetContrast:Validity | 0.9177747 | 0.0013462 | \*           | 1.039496 | 0.0009247 | \*           |

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
| 2   | targetContrast          |   1 |  15 | 35.657395 | 0.0000256 | \*     | 0.2055666 |
| 3   | Validity                |   2 |  30 |  9.189365 | 0.0007709 | \*     | 0.0283710 |
| 4   | targetContrast:Validity |   2 |  30 |  8.258893 | 0.0013885 | \*     | 0.0252959 |

</td>
<td>

|     | Effect                  |         W |         p | p\<.05 |
|:----|:------------------------|----------:|----------:|:-------|
| 3   | Validity                | 0.3993635 | 0.0016202 | \*     |
| 4   | targetContrast:Validity | 0.7277764 | 0.1081399 |        |

</td>
<td>

|     | Effect                  |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity                | 0.6247515 | 0.0046095 | \*           | 0.6542326 | 0.0040004 | \*           |
| 4   | targetContrast:Validity | 0.7860254 | 0.0034211 | \*           | 0.8621127 | 0.0024799 | \*           |

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
| 2   | Target          |   1 |  15 | 14.148570 | 0.0018862 | \*     | 0.0334121 |
| 3   | Validity        |   2 |  30 | 10.613414 | 0.0003269 | \*     | 0.1101807 |
| 4   | Target:Validity |   2 |  30 |  2.776077 | 0.0783123 |        | 0.0077780 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.2334695 | 0.0000378 | \*     |
| 4   | Target:Validity | 0.9104250 | 0.5184529 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.5660814 | 0.0036510 | \*           | 0.5810064 | 0.0033572 | \*           |
| 4   | Target:Validity | 0.9177891 | 0.0837579 |              | 1.0395158 | 0.0783123 |              |

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
| 2   | Target          |   1 |  15 | 14.116275 | 0.0019029 | \*     | 0.0718933 |
| 3   | Validity        |   2 |  30 | 13.458061 | 0.0000673 | \*     | 0.0941394 |
| 4   | Target:Validity |   2 |  30 |  2.078568 | 0.1427568 |        | 0.0077454 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.8138577 | 0.2365045 |        |
| 4   | Target:Validity | 0.8814999 | 0.4135764 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8430692 | 0.0002017 | \*           | 0.9380529 | 0.0001038 | \*           |
| 4   | Target:Validity | 0.8940544 | 0.1488248 |              | 1.0070376 | 0.1427568 |              |

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
| 2   | Target          |   1 |  15 | 12.155674 | 0.0033141 | \*     | 0.0499927 |
| 3   | Validity        |   2 |  30 |  9.785615 | 0.0005350 | \*     | 0.0424285 |
| 4   | Target:Validity |   2 |  30 |  1.264035 | 0.2971286 |        | 0.0028902 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.7987507 | 0.2074334 |        |
| 4   | Target:Validity | 0.5820791 | 0.0226399 | \*     |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 3   | Validity        | 0.8324667 | 0.0012519 | \*           | 0.9238399 | 0.0007868 | \*           |
| 4   | Target:Validity | 0.7052580 | 0.2903301 |              | 0.7567710 | 0.2921350 |              |

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
| 2   | Target          |   1 |  15 | 2.1091715 | 0.1670149 |        | 0.0062930 |
| 3   | Validity        |   2 |  30 | 0.4781987 | 0.6245434 |        | 0.0017205 |
| 4   | Target:Validity |   2 |  30 | 0.6524314 | 0.5280095 |        | 0.0014700 |

</td>
<td>

|     | Effect          |         W |         p | p\<.05 |
|:----|:----------------|----------:|----------:|:-------|
| 3   | Validity        | 0.9130008 | 0.5288080 |        |
| 4   | Target:Validity | 0.9648752 | 0.7785708 |        |

</td>
<td>

|     | Effect          |       GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:----------------|----------:|----------:|:-------------|---------:|----------:|:-------------|
| 3   | Validity        | 0.9199639 | 0.6092847 |              | 1.042504 | 0.6245434 |              |
| 4   | Target:Validity | 0.9660671 | 0.5231630 |              | 1.106307 | 0.5280095 |              |

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
| 2   | Validity |   2 |  30 | 12.26903 | 0.0001277 | \*     | 0.1304465 |

</td>
<td>

|     | Effect   |        W |         p | p\<.05 |
|:----|:---------|---------:|----------:|:-------|
| 2   | Validity | 0.724519 | 0.1047969 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.7840179 | 0.0005091 | \*           | 0.8594638 | 0.0003136 | \*           |

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

|     | Effect   | DFn | DFd |        F |        p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|---------:|:-------|----------:|
| 2   | Validity |   2 |  30 | 9.295328 | 0.000722 | \*     | 0.1163204 |

</td>
<td>

|     | Effect   |       W |         p | p\<.05 |
|:----|:---------|--------:|----------:|:-------|
| 2   | Validity | 0.89883 | 0.4739613 |        |

</td>
<td>

|     | Effect   |      GGe |   p\[GG\] | p\[GG\]\<.05 |      HFe |  p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|---------:|----------:|:-------------|---------:|---------:|:-------------|
| 2   | Validity | 0.908125 | 0.0011214 | \*           | 1.026263 | 0.000722 | \*           |

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

|     | Effect   | DFn | DFd |        F |         p | p\<.05 |      ges |
|:----|:---------|----:|----:|---------:|----------:|:-------|---------:|
| 2   | Validity |   2 |  30 | 3.733576 | 0.0356499 | \*     | 0.024194 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.8300118 | 0.2713876 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.8547095 | 0.0438385 | \*           | 0.9537094 | 0.0380742 | \*           |

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

|     | Effect   | DFn | DFd |         F |         p | p\<.05 |      ges |
|:----|:---------|----:|----:|----------:|----------:|:-------|---------:|
| 2   | Validity |   2 |  30 | 0.3357697 | 0.7174394 |        | 0.002147 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.9044551 | 0.4951186 |        |

</td>
<td>

|     | Effect   |       GGe |  p\[GG\] | p\[GG\]\<.05 |      HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|---------:|:-------------|---------:|----------:|:-------------|
| 2   | Validity | 0.9127878 | 0.698311 |              | 1.032653 | 0.7174394 |              |

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

|     | Effect   | DFn | DFd |       F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|--------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  30 | 6.36435 | 0.0049662 | \*     | 0.0987466 |

</td>
<td>

|     | Effect   |        W |         p | p\<.05 |
|:----|:---------|---------:|----------:|:-------|
| 2   | Validity | 0.305864 | 0.0002504 | \*     |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.5902714 | 0.0176668 | \*           | 0.6110473 | 0.0165568 | \*           |

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

|     | Effect   | DFn | DFd |        F |        p | p\<.05 |       ges |
|:----|:---------|----:|----:|---------:|---------:|:-------|----------:|
| 2   | Validity |   2 |  30 | 11.25932 | 0.000225 | \*     | 0.0723205 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.5015017 | 0.0079782 | \*     |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.6673348 | 0.0015976 | \*           | 0.7081685 | 0.0012538 | \*           |

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
| 2   | Validity |   2 |  30 | 11.68959 | 0.0001763 | \*     | 0.0767327 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.5480889 | 0.0148579 | \*     |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 2   | Validity | 0.6887474 | 0.0011829 | \*           | 0.7355445 | 0.0008869 | \*           |

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

|     | Effect   | DFn | DFd |         F |         p | p\<.05 |       ges |
|:----|:---------|----:|----:|----------:|----------:|:-------|----------:|
| 2   | Validity |   2 |  30 | 0.9744241 | 0.3890368 |        | 0.0048368 |

</td>
<td>

|     | Effect   |         W |         p | p\<.05 |
|:----|:---------|----------:|----------:|:-------|
| 2   | Validity | 0.7476833 | 0.1306242 |        |

</td>
<td>

|     | Effect   |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |  p\[HF\] | p\[HF\]\<.05 |
|:----|:---------|----------:|----------:|:-------------|----------:|---------:|:-------------|
| 2   | Validity | 0.7985201 | 0.3740586 |              | 0.8786358 | 0.380565 |              |

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
| 2   | targetContrast                            |   1 |  15 | 30.083156 | 0.0000628 | \*     | 0.1707636 |
| 3   | nontargetContrast                         |   1 |  15 | 12.484925 | 0.0030100 | \*     | 0.0274621 |
| 4   | Validity                                  |   2 |  30 | 11.081646 | 0.0002491 | \*     | 0.0535311 |
| 5   | targetContrast:nontargetContrast          |   1 |  15 | 14.897317 | 0.0015430 | \*     | 0.0286667 |
| 6   | targetContrast:Validity                   |   2 |  30 | 10.184336 | 0.0004211 | \*     | 0.0328014 |
| 7   | nontargetContrast:Validity                |   2 |  30 |  2.048801 | 0.1465417 |        | 0.0029162 |
| 8   | targetContrast:nontargetContrast:Validity |   2 |  30 |  2.413620 | 0.1066677 |        | 0.0024228 |

</td>
<td>

|     | Effect                                    |         W |         p | p\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------|
| 4   | Validity                                  | 0.8199595 | 0.2491993 |        |
| 6   | targetContrast:Validity                   | 0.7817833 | 0.1784863 |        |
| 7   | nontargetContrast:Validity                | 0.9982587 | 0.9878747 |        |
| 8   | targetContrast:nontargetContrast:Validity | 0.9347200 | 0.6234056 |        |

</td>
<td>

|     | Effect                                    |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                                  | 0.8474285 | 0.0006011 | \*           | 0.9439099 | 0.0003441 | \*           |
| 6   | targetContrast:Validity                   | 0.8208720 | 0.0010872 | \*           | 0.9083486 | 0.0006835 | \*           |
| 7   | nontargetContrast:Validity                | 0.9982618 | 0.1466386 |              | 1.1513989 | 0.1465417 |              |
| 8   | targetContrast:nontargetContrast:Validity | 0.9387203 | 0.1106306 |              | 1.0683530 | 0.1066677 |              |

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
| 2   | targetContrast                            |   1 |  15 | 36.797171 | 0.0000216 | \*     | 0.1411601 |
| 3   | nontargetContrast                         |   1 |  15 | 14.775826 | 0.0015935 | \*     | 0.0316239 |
| 4   | Validity                                  |   2 |  30 | 12.777054 | 0.0000968 | \*     | 0.0556405 |
| 5   | targetContrast:nontargetContrast          |   1 |  15 |  4.253646 | 0.0569291 |        | 0.0047657 |
| 6   | targetContrast:Validity                   |   2 |  30 |  5.235670 | 0.0112100 | \*     | 0.0123524 |
| 7   | nontargetContrast:Validity                |   2 |  30 |  3.489624 | 0.0433958 | \*     | 0.0075767 |
| 8   | targetContrast:nontargetContrast:Validity |   2 |  30 |  1.273327 | 0.2945937 |        | 0.0016821 |

</td>
<td>

|     | Effect                                    |         W |         p | p\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------|
| 4   | Validity                                  | 0.2588821 | 0.0000779 | \*     |
| 6   | targetContrast:Validity                   | 0.6132947 | 0.0326351 | \*     |
| 7   | nontargetContrast:Validity                | 0.4596310 | 0.0043338 | \*     |
| 8   | targetContrast:nontargetContrast:Validity | 0.7219479 | 0.1022212 |        |

</td>
<td>

|     | Effect                                    |       GGe |   p\[GG\] | p\[GG\]\<.05 |       HFe |   p\[HF\] | p\[HF\]\<.05 |
|:----|:------------------------------------------|----------:|----------:|:-------------|----------:|----------:|:-------------|
| 4   | Validity                                  | 0.5743437 | 0.0016717 | \*           | 0.5912435 | 0.0014912 | \*           |
| 6   | targetContrast:Validity                   | 0.7211338 | 0.0217949 | \*           | 0.7772790 | 0.0190521 | \*           |
| 7   | nontargetContrast:Validity                | 0.6491951 | 0.0676630 |              | 0.6851109 | 0.0646710 |              |
| 8   | targetContrast:nontargetContrast:Validity | 0.7824407 | 0.2907051 |              | 0.8573836 | 0.2924723 |              |

</td>
</tr>
</tbody>
</table>

# paired t-tests

## full acc

<img src="tazoot_AccRT_files/figure-gfm/vi_acc-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_acc-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/ni_acc-1.png" width="90%" />

## accuracy by target (T1, T2)

### T1

<img src="tazoot_AccRT_files/figure-gfm/vi_acc T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_acc T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/ni_acc T1-1.png" width="90%" />

### T2

<img src="tazoot_AccRT_files/figure-gfm/vi_acc T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_acc T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/ni_acc T2-1.png" width="90%" />

## accuracy by target and nontarget contrast

### PresentPresent

<img src="tazoot_AccRT_files/figure-gfm/vi_accPP T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accPP T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/ni_accPP T1-1.png" width="90%" />
\#### T2
<img src="tazoot_AccRT_files/figure-gfm/vi_accPP T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accPP T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/ni_accPP T2-1.png" width="90%" />
\### PresentAbsent
<img src="tazoot_AccRT_files/figure-gfm/vi_accPA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accPA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_accPA T1-1.png" width="90%" />
\##### T2
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

## accuracy by nontarget

\#nontarget present
<img src="tazoot_AccRT_files/figure-gfm/vi_accNP T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accNP T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_accNP T1-1.png" width="90%" />
\# T2
<img src="tazoot_AccRT_files/figure-gfm/vi_accNP T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accNP T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_accNP T2-1.png" width="90%" />
\#nontarget absent
<img src="tazoot_AccRT_files/figure-gfm/vi_accNA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accNA T1-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_accNA T1 -1.png" width="90%" />
\#T2
<img src="tazoot_AccRT_files/figure-gfm/vi_accNA T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/vn_accNA T2-1.png" width="90%" />

<img src="tazoot_AccRT_files/figure-gfm/in_accNA T2-1.png" width="90%" />

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
