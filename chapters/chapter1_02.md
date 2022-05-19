---
title: 'Lesson 2 : PCA or how to represent the product space on a MAP'
prev: null
next: /chapter2
type: chapter
id: 2
---

<exercise id="1" title="What's the principal component analysis method?" type="slides">
<slides source="chapter1_02">
</slides>
</exercise>

<exercise id="2" title="How to use the PCA function from FactoMineR?" type="slides">
</exercise>


<exercise id="3" title="How is it build?">

The main objective of PCA is to summarize the information contained in a multivariate data set into graphical representations of individuals and variables. The general idea is to represent the scatter plot of the individuals, ![formula](https://render.githubusercontent.com/render/math?math=N_{i}) , in a low-dimensional subspace (usually two dimensions), that respects as well as possible the distances between individuals. This subspace is the best lowdimensional representation possible of ![formula](https://render.githubusercontent.com/render/math?math=\mathbb{R}^{j}), the vector space formed of vectors of _J_ real numbers (the _J_ variables). Similarly, PCA aims at providing a representation of the scatter plot of the variables, ![formula](https://render.githubusercontent.com/render/math?math=N_{j}) , in a low-dimensional subspace (usually two dimensions), that respects as well as possible the distances between variables. This subspace is the best low-dimensional representation possible of ![formula](https://render.githubusercontent.com/render/math?math=\mathbb{R}^{i}), the vector space formed of vectors of _I_ real numbers (the _I_ statistical units).

Geometrically, PCA simply consists in changing the frame of reference, by representing the cloud of points ![formula](https://render.githubusercontent.com/render/math?math=N_{i}) (resp. ![formula](https://render.githubusercontent.com/render/math?math=N_{j})), usually defined in ![formula](https://render.githubusercontent.com/render/math?math=\mathbb{R}^{j}) (resp. ![formula](https://render.githubusercontent.com/render/math?math=\mathbb{R}^{i})), into a lower-dimensional subspace. The objective is then to represent individuals in a vector sub-space ![formula](https://render.githubusercontent.com/render/math?math=F_{k}) of ![formula](https://render.githubusercontent.com/render/math?math=\mathbb{R}^{j}) of dimension _k_. 

## Inertia and variance-covariance matrix

First, we will work on the matrix using results in `res.decat$adjmean` build in the last part.

<codeblock id="11_01">
</codeblock>

Using the Euclidean matrix, calculate the matrix of distances of individuals and the center of gravity. 

<codeblock id="12_01">
</codeblock>

The dispersion of the cloud of individuals is measured with inertia. For an individual ![formula](https://render.githubusercontent.com/render/math?math=x_{i}), inertia is noted : ![formula](https://render.githubusercontent.com/render/math?math=I=\frac{1}{n}\sum_{i=1}^{n} d^{2}(x_{i}, g))

Regain the value of inertia with previous results.

<codeblock id="13_01">
</codeblock>

Calculate the variance-covariance matrix and observe its diagonal. What can you say?

<codeblock id="14_01">
The sum of the diagonal corresponds to the value of the inertia. 
</codeblock>

Next, do the same job with the centered and reduced matrix using results in `res.decat$adjmean`. What can you conclude ?

<codeblock id="15_01">
Inertia is the number of variables in the case of a reduced centered matrix.
</codeblock>

**To conclude**, inertia is then the sum of the variances. We can also say that inertia is the generalization of the variance.

![formula](https://render.githubusercontent.com/render/math?math=I=\sum_{i=1}^{n} \frac{1}{n} d^{2}(x_{i}, g) = \frac{1}{n}\sum_{i=1}^{n} d^{2}(x_{i}, g))
![formula](https://render.githubusercontent.com/render/math?math=\Leftrightarrow \frac{1}{n}\sum_{i=1}^{n} \sum_{j=1}^{p}(x_{ij}-x_{.j})^{2}))
![formula](https://render.githubusercontent.com/render/math?math=\Leftrightarrow \sum_{j=1}^{p} \frac{1}{n}\sum_{i=1}^{n}(x_{ij}-x_{.j})^{2}))
![formula](https://render.githubusercontent.com/render/math?math=\Leftrightarrow \sum_{j=1}^{p} Var(X_{j}))

## Using *FactoMineR*

# PCA function 

The PCA function is then applied directly on the sensory profiles of the products, i.e., `res.decat$adjmean`. We store the results in an object called `res.pca`. As usual, the names of the different objects saved in res.pca are obtained using the names function.

<codeblock id="16_01">
</codeblock>

The most important results provided by the PCA function are:

- eig, which contains the eigenvalues and consequently the percentage of variability associated with each dimension;
- var, which contains the results associated with the variables, i.e., their coordinates on the components, their correlations with the components, their contributions to the construction of the components, and their quality of representation on each component;
- ind, which contains the results associated with the individuals, i.e., their coordinates on the components, their contributions to the construction of the components, their quality of representation on each component, and their distance to the center of gravity of the scatter plot ![formula](https://render.githubusercontent.com/render/math?math=N_{I}).

<codeblock id="17_01">
</codeblock>

The representation of the perfumes is based on the coordinates of the individuals stored in `res.pca$ind$coord`. This result is supported by the following output, which highlights the contribution of the products to the construction of the components (note that the sum of the contributions across products equals 100 for a given component).

<codeblock id="18_01">
</codeblock>

# Construction of axes

The constructed axes are the orthonormed eigenvectors of the _pxp_ matrix of the linear correlations of the variables. We can obtain these values with `res.pca$svd$V`. Let’s check to be sure: 

<codeblock id="19_01">
</codeblock>

We call these axes ![formula](https://render.githubusercontent.com/render/math?math=C_{i}). The main components that make up the created axes are of the form ![formula](https://render.githubusercontent.com/render/math?math=C {i} = a_{i}^{1}X_{1}) + ![formula](https://render.githubusercontent.com/render/math?math=a_{i}^{2}X_{2}) + ... + ![formula](https://render.githubusercontent.com/render/math?math=a_{i}^{p}X_{p}) such as ![formula](https://render.githubusercontent.com/render/math?math=C_{i}), a formed _i_ axis, must contain as much information as possible, that is, it must disperse the observations as much as possible. To make this axis is telque when the coordinates of the individuals are projected on it, the coordinates are as scattered as possible and therefore the variance of these projected coordinates is maximum. The axes are non-correled because they must one by one bring new information that another axis does not have. 

The sum of these coefficients weighted by the number of individuals represents the variance of a constructed axis. It also corresponds to the eigenvalue associated with the first axis : [formula](https://render.githubusercontent.com/render/math?math=Var(F_{j})=  frac{1}{n} sum_{i=1} {p} c_{i} {j} =  lambda_{j}) with ![formula](https://render.githubusercontent.com/render/math?math=c_{i} {j}) the projected coordinates on the axis _i_ of ![formula](https://render.githubusercontent.com/render/math?math=F_{j}). Can you try to code it to be sur ?

<codeblock id="20_01">
</codeblock>

Link to the previous part and write inertia according to eigenvalues. 

<codeblock id="21_01">

</codeblock>

**To conclude** : ![formula](https://render.githubusercontent.com/render/math?math=I(F)=\lambda_{1}) + ... + ![formula](https://render.githubusercontent.com/render/math?math=\lambda_{q})

# plot.PCA

By default, the PCA function generates two graphics: the representation of the individuals, and the representation of the variables. We can visualize representations like it : 

<codeblock id="23_01">
</codeblock>

The main dimension of variability (i.e., the first component) opposes products such as _Pleasures_ to products such as _Angel_.

</exercise>

<exercise id="4" title="Why using complementary information?">

</exercise>

<exercise id="5" title="Let's practice">
Exercice 2.6 and 2.7
</exercise>