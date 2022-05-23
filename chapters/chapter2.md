---
title: 'Lesson 2 : PCA or how to represent the product space on a MAP ?'
prev: /chapter1
next: /chapter3
type: chapter
id: 2
---

<exercise id="1" title="What's the principal component analysis method?" type="slides">
<slides source="chapter1_02">
</slides>
</exercise>

<exercise id="2" title="How to use the PCA function from FactoMineR?" type="slides">
<slides source="chapter1_03">
</slides>
</exercise>


<exercise id="3" title="How is it build?">

The general idea is to represent the scatter plot of the individuals, ![formula](https://render.githubusercontent.com/render/math?math=N_{i}) , in a low-dimensional subspace (usually two dimensions), that respects as well as possible the distances between individuals. This subspace is the best lowdimensional representation possible of ![formula](https://render.githubusercontent.com/render/math?math=\mathbb{R}^{j}), the vector space formed of vectors of _J_ real numbers (the _J_ variables). Similarly, PCA aims at providing a representation of the scatter plot of the variables, ![formula](https://render.githubusercontent.com/render/math?math=N_{j}) , in a low-dimensional subspace (usually two dimensions), that respects as well as possible the distances between variables. This subspace is the best low-dimensional representation possible of ![formula](https://render.githubusercontent.com/render/math?math=\mathbb{R}^{i}), the vector space formed of vectors of _I_ real numbers (the _I_ statistical units).

Geometrically, PCA simply consists in changing the frame of reference, by representing the cloud of points ![formula](https://render.githubusercontent.com/render/math?math=N_{i}) (resp. ![formula](https://render.githubusercontent.com/render/math?math=N_{j})), usually defined in ![formula](https://render.githubusercontent.com/render/math?math=\mathbb{R}^{j}) (resp. ![formula](https://render.githubusercontent.com/render/math?math=\mathbb{R}^{i})), into a lower-dimensional subspace. The objective is then to represent individuals in a vector sub-space ![formula](https://render.githubusercontent.com/render/math?math=F_{k}) of ![formula](https://render.githubusercontent.com/render/math?math=\mathbb{R}^{j}) of dimension _k_. 

## Using *FactoMineR*

# PCA function 

The PCA function is then applied directly on the sensory profiles of the products, i.e., `res.decat$adjmean`. We store the results in an object called `res.pca`. As usual, the names of the different objects saved in res.pca are obtained using the names function.

<codeblock id="16_01">
</codeblock>

The representation of the perfumes is based on the coordinates of the individuals stored in `res.pca$ind$coord`. This result is supported by the following output, which highlights the contribution of the products to the construction of the components (note that the sum of the contributions across products equals 100 for a given component).

<codeblock id="18_01">
</codeblock>

# Construction of axes

The constructed axes are the orthonormed eigenvectors of the _pxp_ matrix of the linear correlations of the variables. We can obtain these values with `res.pca$svd$V`. By default the matrix size is _p x 5_ according to the `ncp` argument of the PCA function which is 5 by default. Try to find the matrix of `res.pca$svd$V` by working the matrix of correlations of `res.decat$adjmean` :

<codeblock id="19_01">
</codeblock>

We call these axes ![formula](https://render.githubusercontent.com/render/math?math=C_{i}). The main components that make up the created axes are of the form ![formula](https://render.githubusercontent.com/render/math?math=C_{i} = a_{i}^{1}X_{1}) + ![formula](https://render.githubusercontent.com/render/math?math=a_{i}^{2}X_{2}) + ... + ![formula](https://render.githubusercontent.com/render/math?math=a_{i}^{p}X_{p}) such as ![formula](https://render.githubusercontent.com/render/math?math=C_{i}), a formed _i_ axis, must contain as much information as possible, that is, it must disperse the observations as much as possible. This axis is constructed such as when the coordinates of the individuals are projected on it, the coordinates are as scattered as possible and therefore the variance of these projected coordinates is maximum. The axes are non-correled because they must one by one bring new information that another axis does not have. 

The sum of these coefficients weighted by the number of individuals represents the variance of a constructed axis. It also corresponds to the eigenvalue associated with the first axis ![formula](https://render.githubusercontent.com/render/math?math=(Var(F_{j})= \frac{1}{n}\sum_{i=1}^{p} c_{i}=\lambda_{j})) with ![formula](https://render.githubusercontent.com/render/math?math=c_{i}) the projected coordinates on the axis _i_ of ![formula](https://render.githubusercontent.com/render/math?math=F_{j}). Can you try to code it to be sur ?

<codeblock id="20_01">
</codeblock>

## Understand inertia 

Let's use the `res.decat$adjmean` matrix like before.

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


With the results of pca, write inertia according to eigenvalues. 

<codeblock id="21_01">

</codeblock>

**To conclude** : ![formula](https://render.githubusercontent.com/render/math?math=I(F)=\lambda_{1}) + ... + ![formula](https://render.githubusercontent.com/render/math?math=\lambda_{q})

# plot.PCA

By default, the PCA function generates two graphics: the representation of the individuals, and the representation of the variables. We can visualize representations like it : 

<codeblock id="23_01">
</codeblock>

The main dimension of variability (i.e., the first component) opposes products such as _Pleasures_ to products such as _Angel_.

# factoextra

The package _factoextra_ offers automatic methods for extracting accurate information or for viewing :

- `get_eigenvalue(res.pca)` : extracting eigenvalues;
- `fviz_eig(res.pca)` : visualization of eigenvalues;
- `get_pca_ind(res.pca)` / `get_pca(res.pca)` : visualization of individuals or variables results;
- `fviz_pca_biplot(res.pca)` : biplot of individuals and variables.

The `fviz_eig(res.pca)` function is usefull to choose the number of dimension. The scree plot is used to visualize the number of axes beyond which eigenvalues are all relatively small.

<codeblock id="17_01">
</codeblock>

With the scree plot, how many dimensions can you choose ?
<choice id=4>
<opt text="1">
Look at the second dimension, what's the pourcentage of variability ?
</opt>
<opt text="2" correct="true">
</opt>
<opt text="3" correct="false">
4.7% is too small to choose 3 dimensions.
</opt>
</choice>

</exercise>

<exercise id="4" title="Why using complementary information?">

A a reminder, PCA function has this arguments : `ind.sup`, `quanti.sup` and `quali.sup`. What are they for? 

# Introduction to supplementary information

### What's the concept?

The concept of supplementary information (also called illustrative information), as well as its representation, is of utmost importance when exploring multivariate data. The idea behind the notion of supplementary elements consists in projecting additional rows and/or columns in the plane obtained from PCA performed on the “original” matrix _X_, in order to see how these additional elements connect to _X_, but without taking this additional information into account in the construction of the dimensions. 

- `ind.supp` : individuals or variables may be considered illustrative (additional). This makes it possible to take better account of the data collection and its context. An **individual** may be considered additional and therefore not participate in the calculation of the axes if he is an outlier in relation to the sample for example. Generally speaking, to consider an individual as illustrative is to give it a weighting of zero but still represent it ; 
- `quanti.sup`, `quali.sup` : the **additional variables** provide some expertise in reading the results. A variable is chosen as illustrative from the moment it can be considered as an explanatory factor for the result of another variable. It nevertheless appears in the circle of correlation without participating in the construction of axes. 


### Illustration

To illustrate this feature, the data collected by C. Asselin and R. Morlat (INRA, Angers, France), who studied the effect of the soil on the quality of the wine produced in the Loire Valley, are used. These data were used by B. Escofier and J. Pagès to illustrate Multiple Factor Analysis in their paper entitled “Multiple factor analysis (AFMULT package),” published in _Computational Statistics & Data Analysis_ in 1984. The data can be found either in the book website or in the SensoMineR package.

In the data set, 21 wines are described by 31 variables, amongst which are 29 continuous variables and 2 categorical variables. The 29 continuous variables are made up of 27 sensory attributes and 2 other variables of a slightly different nature, one measuring the overall quality of the wine and the other one measuring the typicality of the wine. The 2 categorical variables are related to the origin of the wine (its appellation) and the nature of the soil on which the grape was produced.

The general idea behind the study is to understand the set of wines regarding their sensory profiles, and eventually to relate these sensory profiles to the origin, the quality, and the typicality of the wines. To do so, the point of view adopted consists in considering the sensory attributes as active variables. From this point of view, it is then possible to project the rest of the variables as illustrative.

<codeblock id="27_01">
</codeblock>

Based on this output, it can be seen that the supplementary categorical variables are the first two variables, and the supplementary continuous variables are the two last variables. Through the `quanti.sup` and `quali.sup` arguments of the PCA function, we specify the appropriate role of each variable in the analysis.

<codeblock id="28_01">
</codeblock>

Besides the features previously shown, the plot.PCA function also allows representing, in a convenient way, the supplementary variables through its `col.quali`, `col.quanti`, `habillage`, and `col.hab` arguments.
In PCA, categorical supplementary information is represented on the individuals factor map. The representation of these categories is obtained by calculating the center of gravity of the individuals belonging to each category in question. This can be illustrated using the following code:

<codeblock id="29_01">
</codeblock>

The supplementary continuous variables are represented within the variables representation, using the correlation between these supplementary elements and the components obtained from the active variables.

<codeblock id="30_01">
</codeblock>


# The panellipse function of the SensoMineR package

As evoked previously, the representation of the individuals on a factorial plane can be misleading. Indeed, when individuals are represented in a subspace of lower dimensionality than the original space RJ , distances amongst individuals are necessarily reduced. This is the price to pay to visualize the individuals. Obviously, this remark is transposable to variables. Based on this observation, how is it possible to find a way to enhance the representation of the distances between individuals and between variables?

One possible solution is to represent confidence areas around the individuals and around the variables. To do so, several strategies can be applied. The one explained in this section is implemented in the panellipse function of the SensoMineR package. The idea of the ellipses is based on the following question: How would the positioning of the perfumes evolve if we would slightly change the composition of the panel?

To answer this question, the original idea was to generate virtual panels from the original data using simulations. To do so, new panels Pi are obtained by sampling panelists with replacement, from the original pool of panelists. For each new virtual panel ![formula](https://render.githubusercontent.com/render/math?math=P_{i}), a new matrix of sensory profiles, denoted ![formula](https://render.githubusercontent.com/render/math?math=X_{P_{i}}), is calculated. Each data set ![formula](https://render.githubusercontent.com/render/math?math=X_{P_{i}}) (associated with the virtual panel Pi) is then combined vertically to the original data set X of sensory profiles, and is projected as a supplementary matrix of illustrative individuals in the original space obtained by PCA on _X_.

Ellipses including 95% of the products associated with the virtual panels are created around each product.

This is the procedure that is automatically performed by the panellipse function of the *SensoMineR* package. To run the panellipse function, the position of the column related to the product information (`col.p`), the panelist information (`col.j`), and the attributes (`firstvar` and `lastvar`) should be informed. Regarding the attributes, the argument `level.search.desc` discards all the attributes for which the Product effect is associated with a p-value larger than the threshold defined (by default 0.2; use 1 to keep all the variables in the analysis). Let’s apply this analysis on the experts data set used throughout this chapter.

<codeblock id="31_01">
</codeblock>

The more ellipses overlap, the less distinctive (or the closer) the two products are. Hence, from this representation, it appears clearly that _Aromatics Elixir_ and _Shalimar_ are perceived as similar, whereas _Shalimar_ and _Pleasures_ are perceived as different.

Regarding the variables, the same idea can be applied to the representation of the sensory attributes in the correlation circle. In this case, each new data set ![formula](https://render.githubusercontent.com/render/math?math=X_{P_{i}}) is combined vertically to the original data set X of sensory profiles. These data set ![formula](https://render.githubusercontent.com/render/math?math=X_{P_{i}}) are then projected as a supplementary matrix of illustrative variables, in the original space obtained by PCA on _X_.

This idea of representing confidence areas can be used to answer a recurrent sensory question regarding the number of panelists in a panel: what if the number of panelists was smaller or higher? Would they still differentiate the products, or not? One way of answering these related questions is to generate virtual panels by increasing or decreasing the number of panelists from the original panel. To do so, the `nbchoix` parameter of the panellipse function can be changed. By default, this parameter is set so that the virtual panel has the same size as the original panel.

</exercise>


<exercise id="5" title="Let's practice">

Exercice 2.6 and 2.7

</exercise>

<exercise id="6" title="Algebraic vision of PCA">
PCA à l'anglaise

</exercise>