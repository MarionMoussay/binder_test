---
type: slides
---

---

## The _PCA_ function

The main objective of PCA is to summarize the information contained in a multivariate data set into graphical representations of individuals and variables.

```{r}
res.pca <- PCA(donnee, scale.unit = TRUE, ncp = 5, ind.sup = NULL,quanti.sup = NULL, quali.sup = NULL)

```
- `donnee` : a data frame with n rows (individuals) and p columns (numeric variables)
- `ncp` : number of dimensions kept in the results (by default 5)
- `scale.unit` :  if TRUE (value set by default) then data are scaled to unit variance
- `ind.sup` : a vector indicating the indexes of the supplementary individuals
- `quanti.sup` : a vector indicating the indexes of the quantitative supplementary variables
- `quali.sup` : a vector indicating the indexes of the categorical supplementary variables

More arguments : 

- `graph = TRUE`: if TRUE (value set by default) a graph is displayed;
- `proba` : the significance threshold considered for the analyses of variance (by default 0.05);
- `axes` : a length 2 vector specifying the components to plot.

---

```{r}
names(res.pca)

```
```{out}
[1] "eig" "var" "ind" "svd" "call"

```
- `eig` : which contains the eigenvalues and consequently the percentage of variability associated with each dimension;
- `var` : which contains the results associated with the variables, i.e., their coordinates on the components, their correlations with the components, their contributions to the construction of the components, and their quality of representation on each component;

- `ind` :  which contains the results associated with the individuals, i.e., their coordinates on the components, their contributions to the construction of the components, their quality of representation on each component, and their distance to the center of gravity of the scatter plot.

- `svd` : matrix of singular value decomposition;

- `call` : list of 11 elements of the PCA;

---








