---
title: 'Lesson 1 : When products are rated according to a single list of attributes'
description:
  'This chapter will teach you about many cool things and introduce you to the
  most important concepts of the course.'
prev: null
next: /chapter2
type: chapter
id: 1
---

<exercise id="1" title="How can I get a list of the sensory attributes that structure the product space?">

# Data set

The data set used to illustrate the methodology consists of 12 panelists, testing and rating 12 luxurious women perfumes on 12 attributes. Each panelist rated each product twice.

First, we import te dataset. A first overview of the data shows that the variables _Session_ and _Rank_ are considered as continuous variables. Since these columns correspond, respectively, to the session information and to the order of presentation, they should be considered as factors. To transform these columns from numerical to categorical, the `as.factor` function is applied on these two variables.

<codeblock id="01_01">
</codeblock>

Let us quickly recall the experts data set by using the summary function.

<codeblock id="02_01">
</codeblock>

As previously explained, the first four columns are categorical: these are the independent factors of our experiment. The other variables are continuous: these are the sensory attributes.

# ANOVA

ANOVA is used to define the sensory attributes that structure the product space. However, here, the interpretation of the results is not panelist oriented, but product oriented.

To explain the sensory attribute _Citrus_ (dependent variable) with respect to the main effects _Product_, _Panelist_, _Session_, and their first-order interactions (independent variables), the following ANOVA model is considered:

![formula](https://render.githubusercontent.com/render/math?math=Citrus_{iks}\sim\mu)+ ![formula](https://render.githubusercontent.com/render/math?math=\alpha_{i})
![formula](https://render.githubusercontent.com/render/math?math=\beta_{k})+
![formula](https://render.githubusercontent.com/render/math?math=\gamma_{s})+
![formula](https://render.githubusercontent.com/render/math?math=\alpha\beta_{ik})+
![formula](https://render.githubusercontent.com/render/math?math=\alpha\gamma_{is})+
![formula](https://render.githubusercontent.com/render/math?math=\beta\gamma_{ks})+
![formula](https://render.githubusercontent.com/render/math?math=\epsilon_{iks})
 
where

- ![formula](https://render.githubusercontent.com/render/math?math=\alpha_{i}) is ![formula](https://render.githubusercontent.com/render/math?math=i^{th}) the coefficient associated with the _Product_ effect;
- ![formula](https://render.githubusercontent.com/render/math?math=\beta_{k}) is ![formula](https://render.githubusercontent.com/render/math?math=k^{th}) the coefficient associated with the _Panelist_ effect;
- ![formula](https://render.githubusercontent.com/render/math?math=\gamma_{s}) is ![formula](https://render.githubusercontent.com/render/math?math=s^{th}) the coefficient associated with the _Session_ effect; 
- ![formula](https://render.githubusercontent.com/render/math?math=\alpha\beta_{ik}) is ![formula](https://render.githubusercontent.com/render/math?math=ik^{th}) the coefficient associated with the _Product-Panelist_ interaction;
- ![formula](https://render.githubusercontent.com/render/math?math=\alpha\gamma_{is}) is ![formula](https://render.githubusercontent.com/render/math?math=is^{th}) the coefficient associated with the _Product-Session_ interaction;
- ![formula](https://render.githubusercontent.com/render/math?math=\beta\gamma_{ks}) is ![formula](https://render.githubusercontent.com/render/math?math=ks^{th}) the coefficient associated with the _Panelist-Session_ interaction;
- and ![formula](https://render.githubusercontent.com/render/math?math=\epsilon_{iks}) denotes the error term.

The errors are assumed to be normally distributed, with mean zero, constant variance $$\sigma^2$$ and independent:

- ![formula](https://render.githubusercontent.com/render/math?math=\epsilon_{iks}\sim N(0,\sigma^2));
- ![formula](https://render.githubusercontent.com/render/math?math=\forall(i,k,s)\ne(i',k',s'),Cov(\epsilon_{iks}, \epsilon_{i'k's'})=0).

By focusing on the _Product_ effect, the question we want to answer is: For the sensory attribute Citrus, is my _Product_ effect _statistically_ significant? This question can be rephrased the following way: Are my products significantly different regarding the sensory attribute Citrus? If it is the case, this sensory attribute _Citrus_ structures the product space, and should play an important role in the explanation of the sensory dimensions.

<codeblock id="03_01">
</codeblock>

With a significance threshold at 5% (=0.05) and a _p-value_ of 6.52e-05, the ANOVA table shows a highly significant _Product_ effect: the products have been differentiated regarding the sensory attribute _Citrus_. Based on this result, we can expect _Citrus_ to play a role in the structure of the product space.

To get the list of attributes that structures the product space, the *decat* function of the *SensoMineR* package is used. This function systematically performs ANOVA on each sensory attribute using a given model. The main feature of the *decat* function is to produce result summaries that are specific to one particular effect (here the _Product_). For the function to know on which effect to focus on, it is of utmost importance to position that effect (here _Product_) in the first place when specifying the ANOVA model.

To use the function, first load the *SensoMineR* package if it has not already been done. The main arguments of the *decat* function to specify are: the data set on which the analyses are performed, the ANOVA model, and the positions of the first and last sensory attributes (by default, the position of the last sensory attribute corresponds to the last column of the data set). The *decat* function produces a list of results that we store here in an object called `res.decat`.

<codeblock id="04_01">
</codeblock>

The names of the different components stored in res.decat are obtained using the *names* function.

<codeblock id="05_01">
</codeblock>

Amongst the different results provided by the decat function, the one we are directly interested in here is `res.decat$resF` , as it stores the results associated with the _F-test_.

<codeblock id="06_01">
</codeblock>

This output highlights the sensory attributes for which products are differentiated at a significance threshold of 0.05 (this threshold can be changed using the argument `proba` in the *decat* function). This list of attributes is sorted from the most significant (_Heady_ with a _p-value_ of 7.74e-57) to the less (but still) significant (_Citrus_ with a _p-value_ of 6.07e-03).

As expressed by the p-values that are singularly small, products have been extremely differentiated by the panelists: it seems that some attributes, such as _Heady_ or _Greedy_, are really specific to some products

</exercise>

<exercise id="2" title="How can I get a sensory profile for each product?">

Now that the list of sensory attributes differentiating the products has been defined, the natural continuity consists in defining which products are specific for those attributes. In other words, rather than focusing on the main effects, we are interested in the effects of the levels associated with the factors and their interactions. This new question to answer can be rephrased as: For the sensory attribute _Citrus_, which product can I consider as significantly different (“positively” or “negatively”, in a sense that will be specified latter) from some kind of an average product?

The answer to that question lies in the analysis of the coefficients ![formula](https://render.githubusercontent.com/render/math?math=\alpha_{i},(i = 1, . . . , I)) associated with the _Product_ effect. Such an analysis of the coefficients is done through the Student’s _t-test_, in which the following hypotheses are tested for each product, i.e., for each level of the _Product_ effect:

![formula](https://render.githubusercontent.com/render/math?math=H0 : \alpha_{i}=0) _versus_ ![formula](https://render.githubusercontent.com/render/math?math=H1:\alpha_{i} \ne 0)

To get a unique estimate for each ![formula](https://render.githubusercontent.com/render/math?math=\alpha_{i}), constraints need to be set on them. These constraints are also called _contrasts_, in the statistical jargon. Different contrasts exist, and the one we are choosing here is a very natural one, in the sense that no _a priori_ on the products is considered:

![formula](https://render.githubusercontent.com/render/math?math=\sum_{i=1}^{I}( \alpha_{i}=0))

This contrast consists in testing each product with respect to some kind of an average product, and not with respect to a specific product. Incidentally, the point of view adopted on the contrast also fits with the point of view adopted by PCA, as we will see further on.

To set contrasts, the *options* function is used. This function allows setting up general options, which affect the way R computes and displays its results.

<codeblock id="07_01">
</codeblock>

To get the results of the t-test, the *summary.lm* function (or more generically, the summary function) is applied to the results of the lm function. In ourcase, this corresponds to applying the *summary.lm* function to `citrus.lm`:

<codeblock id="08_01">
</codeblock>

The previous output is impossible to interpret, unless we have the correspondence between `Product1, . . . , Product11` and the *levels* of the _Product_ effect. To get this correspondence, the *levels* function is applied to the _variable Product_:

<codeblock id="09_01">
</codeblock>

Now we know that `Product1` corresponds to _Angel_, `Product2` to _Aromatics Elixir_, . . . , and `Product11` to _Pure Poison_, so the results of our ANOVA can be interpreted. To do so, the products associated with a _p-value_ higher than 0.05 are separated from the products with a _p-value_ lower than 0.05.

For the first ones (_p-value_ > 0.05), the products are not significantly different from the average product regarding the sensory attribute _Citrus_. This is the case for _Aromatics Elixir_, _Chanel N5_, _Cinéma_, _Coco Mademoiselle_, _L’instant_, and _Lolita Lempicka_. On the contrary, the second ones are significantly different from the average product regarding the attribute _Citrus_. In this case, a distinction between the products that have been perceived with a high intensity of _Citrus_ (at least higher than the average product regarding that attribute) and the products that have been perceived with a low intensity of _Citrus_ (at least lower than the average product regarding that attribute) should be made. Such a distinction is made using the sign of the estimates: the products that have a positive estimate (first column) and a “small” _p-value_ (< 0.05, cf. last column) are significantly more intense in _Citrus_ than the average product. This is the case for _J’adore EP_, _J’adore ET_, and _Pleasures_. Inversely, the products associated with a negative estimate and a “small” _p-value_ (< 0.05, cf. last column) are significantly less intense in _Citrus_ than the average product. This is the case for _Angel_ and _Pure Poison_.

In practice, looking at the results of the t-tests for all sensory attributes can quickly become tedious. As evoked previously, the decat function aims at running systematically all possible ANOVAs, using a given model, and summarizes the results in different matrices. This function is designed to point out the sensory attributes that are the most characteristic of a set of products
as a whole, as well as product by product.

The results of the t-tests are stored in `res.decat$resT`. This list is composed of as many objects as there are products (more precisely, as there are levels in the Product effect). For instance, for _Angel_ and _Pleasures_, the following results are obtained:

<codeblock id="10_01">
</codeblock>

Each sensory profile is structured according to three components:

- in the first column, the estimate of ![formula](https://render.githubusercontent.com/render/math?math=\alpha_{i}) ( _i.e_ ![formula](https://render.githubusercontent.com/render/math?math=\hat{\alpha_{i}}))
- in the second column, the estimate of ![formula](https://render.githubusercontent.com/render/math?math=\mu) + ![formula](https://render.githubusercontent.com/render/math?math=\alpha_{i})(i.e. ![formula](https://render.githubusercontent.com/render/math?math=\hat{\mu}) + ![formula](https://render.githubusercontent.com/render/math?math=\hat{\alpha_{i}}))
- in the third column, the _p-value_ associated with the test ![formula](https://render.githubusercontent.com/render/math?math=H0 : \alpha_{i}=0) _versus_ ![formula](https://render.githubusercontent.com/render/math?math=H1:\alpha_{i} \ne 0)

For each product, the attributes that are associated with p-values lower than the predefined threshold (the significance level can be changed using the proba option, set by default at α = 0.05) are shown. These attributes are then sorted according to two key parameters: the sign of the estimate of the coefficient αi and the value of the _p-value_.

Based on these results, it can be concluded that _Angel_ has been perceived as _Greedy_, _Heady_, to a lesser degree as _Spicy_; on the contrary, it has not been perceived much as _Fruity_, nor as _Floral_. Similarly, _Pleasures_ has been perceived as _Green_, to a lesser extent as _Floral_; it has not been perceived much as _Wrapping_, nor as _Heady_. This constitutes the major information of the sensory profiles of these two products. Such information is extremely useful to understand the product space and the differences between products. Still there is a need for a more global understanding through graphical representations.

</exercise>


<exercise id="3" title="How can I represent the product space on map?">

<exercise id="3_1" title="What's the concept of PCA ?" type = "slides">
<slides source="chapter1_01">
</slides>
</exercise>

<exercise id="3_2" title="Let's pratice">

The main objective of PCA is to summarize the information contained in a multivariate data set into graphical representations of individuals and variables. The general idea is to represent the scatter plot of the individuals, ![formula](https://render.githubusercontent.com/render/math?math=N_{i}) , in a low-dimensional subspace (usually two dimensions), that respects as well as possible the distances between individuals. This subspace is the best lowdimensional representation possible of ![formula](https://render.githubusercontent.com/render/math?math=\mathbb{R}^{j}), the vector space formed of vectors of _J_ real numbers (the _J_ variables). Similarly, PCA aims at providing a representation of the scatter plot of the variables, ![formula](https://render.githubusercontent.com/render/math?math=N_{j}) , in a low-dimensional subspace (usually two dimensions), that respects as well as possible the distances between variables. This subspace is the best low-dimensional representation possible of ![formula](https://render.githubusercontent.com/render/math?math=\mathbb{R}^{i}), the vector space formed of vectors of _I_ real numbers (the _I_ statistical units).

Geometrically, PCA simply consists in changing the frame of reference, by representing the cloud of points ![formula](https://render.githubusercontent.com/render/math?math=N_{i}) (resp. ![formula](https://render.githubusercontent.com/render/math?math=N_{j})), usually defined in ![formula](https://render.githubusercontent.com/render/math?math=\mathbb{R}^{j}) (resp. ![formula](https://render.githubusercontent.com/render/math?math=\mathbb{R}^{i})), into a lower-dimensional subspace. The objective is then to represent individuals in a vector sub-space ![formula](https://render.githubusercontent.com/render/math?math=F_{k}) of ![formula](https://render.githubusercontent.com/render/math?math=\mathbb{R}^{j}) of dimension _k_. 

## Inertia and variance-covariance matrix

First, we will work on the matrix using results in `res.decat$adjmean`.

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

We call these axes ![formula](https://render.githubusercontent.com/render/math?math=C_{i}). The main components that make up the created axes are of the form ![formula](https://render.githubusercontent.com/render/math?math=C {i} = a_{i} {1}X {1} + a_{i} {2}X {2} + ... + a_{i} {p}X {p}) such as ![formula](https://render.githubusercontent.com/render/math?math=C_{i}), a formed _i_ axis, must contain as much information as possible, that is, it must disperse the observations as much as possible. To make this axis is telque when the coordinates of the individuals are projected on it, the coordinates are as scattered as possible and therefore the variance of these projected coordinates is maximum. The axes are non-correled because they must one by one bring new information that another axis does not have. 

The sum of these coefficients weighted by the number of individuals represents the variance of a constructed axis. It also corresponds to the eigenvalue associated with the first axis : [formula](https://render.githubusercontent.com/render/math?math=Var(F_{j})=  frac{1}{n} sum_{i=1} {p} c_{i} {j} =  lambda_{j}) with ![formula](https://render.githubusercontent.com/render/math?math=c_{i} {j}) the projected coordinates on the axis _i_ of ![formula](https://render.githubusercontent.com/render/math?math=F_{j}). Can you try to code it to be sur ?

<codeblock id="20_01">
</codeblock>


Link to the previous part and write inertia according to eigenvalues. 

<codeblock id="21_01">

</codeblock>

**To conclude** : ![formula](https://render.githubusercontent.com/render/math?math=I(F)=\lambda_{1}) + ... + ![formula](https://render.githubusercontent.com/render/math?math=\lambda_{q})

</exercise>

</exercise>



