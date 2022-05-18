---
type: slides
---

# PCA and MFA with FactoMineR 

---

## PCA with FactoMineR 

```r
res.pca <- PCA(data, graph = FALSE)
```
additional arguments of `PCA`:
```r
scale.unit=TRUE # Chose to scale variables
ncp=5 # Number of dimensions to keep
quanti.sup = c() # Index vector of quantitatives illustratives variables 
quali.sup = c() # Index vector of qualitatives illustratives variables 
row.w # Matrix to weight individuals
col.w # Matrix to weight variables
```

---

## PCA with FactoMineR 

### Different results:
```r 
# Eigen values
eig.val <- res.pca$eig

# Variables
res.var <- res.pca$var
res.var$coord          # Coordinnates
res.var$contrib        # Contributions
res.var$cos2           # Quality of the representation

# Individuals
res.ind <- res.pca$ind
res.ind$coord          # Coordinnates
res.ind$contrib        # Contributions 
res.ind$cos2           # Quality of the representation
```

---

## MFA with FactoMineR 

```r
res.mfa<-MFA (data, group, type = rep("s",length(group)), ind.sup = NULL, 
    name.group = NULL, num.group.sup = NULL, graph = TRUE)
```
Main arguments of `MFA`:


<span style="color:blue">group</span>: Vector specifying the number of variables in each group<br>
<span style="color:blue">type</span>: type of variable for each group :
* "c" for quantitatives centered variables, "s" for scaled quantitatives variables
* "n" for categorial variables
* "f" for contingency tables

<span style="color:blue">ncp</span>: Number of dimensions to keep<br>
<span style="color:blue">ind.sup</span>: Vector of index of illustrative individuals<br>
<span style="color:blue">name.group</span>: Name of different groups<br>
<span style="color:blue">num.group.sup</span>: Vector of index of illustrative variables<br>

---

## MFA with FactoMineR 

### Eigen values and variances:
```r
library("factoextra")
eig.val <- get_eigenvalue(res.mfa)
```

### Variables group:
```r
group <- get_mfa_var(res.mfa, "group")
group$coord
group$cos2
group$contrib
```

### Quantitatives variables:
```r
quanti.var <- get_mfa_var(res.mfa, "quanti.var")
quanti.var$coord
quanti.var$cos2
quanti.var$contrib
```
---

## MFA with FactoMineR 

### Individuals :

```r
ind <- get_mfa_ind(res.mfa)
ind$coord
ind$cos2
ind$contrib
ind$within.inertia
ind$coord.partiel
```
---
