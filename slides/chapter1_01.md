---
type: slides
---

---

## Context

It corresponds to an assessment in which a given subject _k (k = 1, . . . , K)_ gives scores to a given product _i (i = 1, . . . , I)_ during a given session _s (s = 1, . . . , S)_ according to _J_ attributes. Consequently, the data set consists of _I × K × S_ rows and _3 + J_ columns - one for the product, one for the panelist, one for the session, and J for the sensory attributes. 

<center><img src="/matriceANOVA.JPG" width="50%" /></center>

---

## The _decat_ function

This function is designed to point out the variables that are the most characteristic according to the set of products in its whole, and to each of the products in particular. 

```{r}
res.decat <- decat(donnee, formul, firstvar, lastvar = length(colnames(donnee)))

```
- `donnee` : a dataframe with two qualitative variables (product and panelist) and a set of quantitative variables
- `formul` : the ANOVA model
- `firstvar` : position of the first sensory attribut
- `lastvar` : position of the first sensory attribut (the last column by default)

More arguments : 

- `graph = TRUE`: generate barplot of the P-values associated with the F-test of the product effet is displayed;
- `proba` : the significance threshold considered for the analyses of variance (by default 0.05)

---

```{r}
names(res.decat)

```
```{out}
[1] "tabF" "tabT" "coeff" "adjmean" "resF" "resT"

```
- `tabF` : the V-test and the P-value of the F-test for each descriptor resulting from the analysis of variance model;
- `tabT` : a (products,descriptors) data frame, in which each cell is the Vtest for a given product and a given descriptor;
- `coeff` : a (products,descriptors) data frame, in which each cell is the coefficient resulting from the analysis of variance model for a given product and a given descriptor;
- `adjmean` : a (products,descriptors) data frame, in which each cell is the adjusted mean resulting from the analysis of variance model for a given product and a given descriptor;
- `resF` : the V-test and the P-value for each descriptor resulting from the analysis of variance model, sorted in ascending order;
- `resT` : a list which elements are data frames, one data frame per product: the coefficient, the P-value and the Vtest for each significant descriptor resulting from the analysis of variance model, sorted in descending order.
---







