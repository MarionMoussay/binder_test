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

<exercise id="1_1" title="ANOVA, how to use the decat function?">

ANOVA is used to define the sensory attributes that structure the product space. However, here, the interpretation of the results is not panelist oriented, but product oriented.

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

<exercise id="1_2" title="What's the method behind decat?">

When the function is used, it performs multiple ANOVA tests for each of the attributes. For example, to explain the sensory attribute _Citrus_ (dependent variable) with respect to the main effects _Product_, _Panelist_, _Session_, and their first-order interactions (independent variables), the following ANOVA model is considered:

![formula](https://render.githubusercontent.com/render/math?math=Citrus_{iks}\sim\mu)+ ![formula](https://render.githubusercontent.com/render/math?math=\alpha_{i})
![formula](https://render.githubusercontent.com/render/math?math=\beta_{k})+
![formula](https://render.githubusercontent.com/render/math?math=\gamma_{s})+
![formula](https://render.githubusercontent.com/render/math?math=\alpha\beta_{ik})+
![formula](https://render.githubusercontent.com/render/math?math=\alpha\gamma_{is})+
![formula](https://render.githubusercontent.com/render/math?math=\beta\gamma_{ks})+
![formula](https://render.githubusercontent.com/render/math?math=\epsilon_{iks})
 
where

- ![formula](https://render.githubusercontent.com/render/math?math=\mu) is the average effect so the average score;
- ![formula](https://render.githubusercontent.com/render/math?math=\alpha_{i}) is ![formula](https://render.githubusercontent.com/render/math?math=i^{th}) the coefficient associated with the _Product_ effect;
- ![formula](https://render.githubusercontent.com/render/math?math=\beta_{k}) is ![formula](https://render.githubusercontent.com/render/math?math=k^{th}) the coefficient associated with the _Panelist_ effect;
- ![formula](https://render.githubusercontent.com/render/math?math=\gamma_{s}) is ![formula](https://render.githubusercontent.com/render/math?math=s^{th}) the coefficient associated with the _Session_ effect; 
- ![formula](https://render.githubusercontent.com/render/math?math=\alpha\beta_{ik}) is ![formula](https://render.githubusercontent.com/render/math?math=ik^{th}) the coefficient associated with the _Product-Panelist_ interaction;
- ![formula](https://render.githubusercontent.com/render/math?math=\alpha\gamma_{is}) is ![formula](https://render.githubusercontent.com/render/math?math=is^{th}) the coefficient associated with the _Product-Session_ interaction;
- ![formula](https://render.githubusercontent.com/render/math?math=\beta\gamma_{ks}) is ![formula](https://render.githubusercontent.com/render/math?math=ks^{th}) the coefficient associated with the _Panelist-Session_ interaction;
- and ![formula](https://render.githubusercontent.com/render/math?math=\epsilon_{iks}) denotes the error term.

The errors are assumed to be normally distributed, with mean zero, constant variance ![formula](https://render.githubusercontent.com/render/math?math=\sigma^2) and independent:

- ![formula](https://render.githubusercontent.com/render/math?math=\epsilon_{iks}\sim N(0,\sigma^2));
- ![formula](https://render.githubusercontent.com/render/math?math=\forall(i,k,s)\ne(i',k',s'),Cov(\epsilon_{iks}, \epsilon_{i'k's'})=0).

By focusing on the _Product_ effect, the question we want to answer is: For the sensory attribute Citrus, is my _Product_ effect _statistically_ significant? This question can be rephrased the following way: Are my products significantly different regarding the sensory attribute Citrus? If it is the case, this sensory attribute _Citrus_ structures the product space, and should play an important role in the explanation of the sensory dimensions.

<codeblock id="03_01">
</codeblock>

With a significance threshold at 5% (=0.05) and a _p-value_ of 6.52e-05, the ANOVA table shows a highly significant _Product_ effect: the products have been differentiated regarding the sensory attribute _Citrus_. Based on this result, we can expect _Citrus_ to play a role in the structure of the product space.

</exercise>

<exercise id="1_2" title="Exercises on ANOVA">

**Exercise 1**

Let's considere this table of ANOVA :
<center><img src="/anova-table.png" width="50%" /></center>

With it, complete this table : 
<center><img src="/table_anova.JPG"  width="30%" /></center>

<codeblock id="24_01">
</codeblock>

**Exercise 2**

The purpose of a variance analysis (ANOVA) has a factor is to test if the variances of the subpopulations corresponding to the expression levels of the factor
are equal.

<choice id=3>
<opt text="True">
This is not the correct answer.
</opt>
<opt text="False" correct="true">
Good job!
</choice>

Let's considere :

![formula](https://render.githubusercontent.com/render/math?math=Spicy_{iks}\sim\mu)+ ![formula](https://render.githubusercontent.com/render/math?math=\alpha_{i})
![formula](https://render.githubusercontent.com/render/math?math=\beta_{k})+
![formula](https://render.githubusercontent.com/render/math?math=\gamma_{s})+
![formula](https://render.githubusercontent.com/render/math?math=\alpha\beta_{ik})+
![formula](https://render.githubusercontent.com/render/math?math=\alpha\gamma_{is})+
![formula](https://render.githubusercontent.com/render/math?math=\beta\gamma_{ks})+
![formula](https://render.githubusercontent.com/render/math?math=\epsilon_{iks})

What is tested with ANOVA here?
<choice id=1>
<opt text="If the sensory attribute 'Spicy' are significantly different regarding products.">
As a reminder, we test the nullity of the coefficients.
</opt>
<opt text="If products are significantly different regarding the sensory attribute 'Spicy'." correct="true">
Good job!
</choice>

Build the ANOVA model :

<codeblock id="25_01">
</codeblock>

There is a highly significant Product effect, what does that mean?

<choice id=2>
<opt text="Many products are spicy.">
This is not the correct answer.
</opt>
<opt text="There are differences between products for the descriptor 'Spicy'." correct="true">
Good job!
</opt>
<opt text="The descriptor 'Spicy' don't play a role in the structure of the product space.">
This is not correct either.
</opt>
</choice>

For the factor produced, find the calculation of the F test statistic and mean square. 

<codeblock id="26_01">
</codeblock>

</exercise>

</exercise>

<exercise id="2" title="How can I get a sensory profile for each product?">

The answer to the question lies in the analysis of the coefficients ![formula](https://render.githubusercontent.com/render/math?math=\alpha_{i},(i = 1, . . . , I)) associated with the _Product_ effect. Such an analysis of the coefficients is done through the Student’s _t-test_, in which the following hypotheses are tested for each product, i.e., for each level of the _Product_ effect:

![formula](https://render.githubusercontent.com/render/math?math=H0 : \alpha_{i}=0) _versus_ ![formula](https://render.githubusercontent.com/render/math?math=H1:\alpha_{i} \ne 0)

To get a unique estimate for each ![formula](https://render.githubusercontent.com/render/math?math=\alpha_{i}), constraints need to be set on them. These constraints are also called _contrasts_, in the statistical jargon. Different contrasts exist, and the one we are choosing here is a very natural one, in the sense that no _a priori_ on the products is considered:

![formula](https://render.githubusercontent.com/render/math?math=\sum_{i=1}^{I}( \alpha_{i}=0))

Now that the list of sensory attributes differentiating the products has been defined, the natural continuity consists in defining which products are specific for those attributes. In other words, rather than focusing on the main effects, we are interested in the effects of the levels associated with the factors and their interactions. This new question to answer can be rephrased as: For the sensory attribute _Citrus_, which product can I consider as significantly different (“positively” or “negatively”, in a sense that will be specified latter) from some kind of an average product?

<exercise id="2_1" title="Using decat's result">

The decat function aims at running systematically all possible ANOVAs, using a given model, and summarizes the results in different matrices. This function is designed to point out the sensory attributes that are the most characteristic of a set of products
as a whole, as well as product by product.

The results of the t-tests are stored in `res.decat$resT`. This list is composed of as many objects as there are products (more precisely, as there are levels in the Product effect). For instance, for _Angel_ and _Pleasures_, the following results are obtained:

<codeblock id="10_01">
</codeblock>

</exercise>

<exercise id="2_2" title="What's the test?">

To get the results of the t-test, the *summary.lm* function (or more generically, the summary function) is applied to the results of the *lm* function. In ourcase, this corresponds to applying the *summary.lm* function to `citrus.lm`:

<codeblock id="08_01">
</codeblock>

The previous output is impossible to interpret, unless we have the correspondence between `Product1, . . . ,Product11` and the *levels* of the _Product_ effect. To get this correspondence, the *levels* function is applied to the _variable Product_ :

<codeblock id="09_01">
</codeblock>

Now we know that `Product1` corresponds to _Angel_, `Product2` to _Aromatics Elixir_, . . . , and `Product11` to _Pure Poison_, so the results of our ANOVA can be interpreted. To do so, the products associated with a _p-value_ higher than 0.05 are separated from the products with a _p-value_ lower than 0.05.

For the first ones (_p-value_ > 0.05), the products are not significantly different from the average product regarding the sensory attribute _Citrus_. This is the case for _Aromatics Elixir_, _Chanel N5_, _Cinéma_, _Coco Mademoiselle_, _L’instant_, and _Lolita Lempicka_. On the contrary, the second ones are significantly different from the average product regarding the attribute _Citrus_. In this case, a distinction between the products that have been perceived with a high intensity of _Citrus_ (at least higher than the average product regarding that attribute) and the products that have been perceived with a low intensity of _Citrus_ (at least lower than the average product regarding that attribute) should be made. Such a distinction is made using the sign of the estimates: the products that have a positive estimate (first column) and a “small” _p-value_ (< 0.05, cf. last column) are significantly more intense in _Citrus_ than the average product. This is the case for _J’adore EP_, _J’adore ET_, and _Pleasures_. Inversely, the products associated with a negative estimate and a “small” _p-value_ (< 0.05, cf. last column) are significantly less intense in _Citrus_ than the average product. This is the case for _Angel_ and _Pure Poison_.

In practice, looking at the results of the t-tests for all sensory attributes can quickly become tedious that's why we use the _decat_ function.

Each sensory profile is structured according to three components:

- in the first column, the estimate of ![formula](https://render.githubusercontent.com/render/math?math=\alpha_{i}) ( _i.e_ ![formula](https://render.githubusercontent.com/render/math?math=\hat{\alpha_{i}}))
- in the second column, the estimate of ![formula](https://render.githubusercontent.com/render/math?math=\mu) + ![formula](https://render.githubusercontent.com/render/math?math=\alpha_{i})(i.e. ![formula](https://render.githubusercontent.com/render/math?math=\hat{\mu}) + ![formula](https://render.githubusercontent.com/render/math?math=\hat{\alpha_{i}}))
- in the third column, the _p-value_ associated with the test ![formula](https://render.githubusercontent.com/render/math?math=H0 : \alpha_{i}=0) _versus_ ![formula](https://render.githubusercontent.com/render/math?math=H1:\alpha_{i} \ne 0)

For each product, the attributes that are associated with p-values lower than the predefined threshold (the significance level can be changed using the proba option, set by default at α = 0.05) are shown. These attributes are then sorted according to two key parameters: the sign of the estimate of the coefficient αi and the value of the _p-value_.

Based on these results, it can be concluded that _Angel_ has been perceived as _Greedy_, _Heady_, to a lesser degree as _Spicy_; on the contrary, it has not been perceived much as _Fruity_, nor as _Floral_. Similarly, _Pleasures_ has been perceived as _Green_, to a lesser extent as _Floral_; it has not been perceived much as _Wrapping_, nor as _Heady_. This constitutes the major information of the sensory profiles of these two products. Such information is extremely useful to understand the product space and the differences between products. Still there is a need for a more global understanding through graphical representations.

What is tested with ANOVA here?
<choice id=1>
<opt text="If there is not an effect of the note on the product">
Bad choice.
</opt>
<opt text="If there is not an effect of the product on the note" correct="true">
Good job!
</choice>

<exercise id="2_3" title="Exercices">
Exercice 2.4 and 2.5
</exercise>

</exercise>

<exercise id="2_4" title="Contrasts in Analysis of Variance">

Analyses of Variance are used to evaluate the significance of one or more factors on a continuous variable. The global significance of each factor is evaluated through the F-test. Additionally, the significance of the different levels within each factor is evaluated through the t-test. Usually, this additional step tests whether the coefficients ![formula](https://render.githubusercontent.com/render/math?math=\alpha_{i}), associated with the ith level of the categorical variable of interest, are significantly different from 0. Without loss of generality, let us consider the simplest ANOVA model in which one continuous variable is explained by one categorical variable:

![formula](https://render.githubusercontent.com/render/math?math=Y_{ij} \sim \mu) + ![formula](https://render.githubusercontent.com/render/math?math=\alpha_{i}) + 
![formula](https://render.githubusercontent.com/render/math?math=\epsilon_{ij})

The estimate of µ and the different levels αi depends on so-called contrasts.
Mainly, three types of contrasts are used:

- ![formula](https://render.githubusercontent.com/render/math?math=\alpha_{1}= 0), the intercept µ corresponds to the average score for the level 1
of that factor, and the coefficient αi corresponds to the deviation between level i and level I, (i = 2, . . . , I);
- ![formula](https://render.githubusercontent.com/render/math?math=\alpha_{I}= 0), the intercept µ corresponds to the average score for the level I
of that factor, and the coefficient αi corresponds to the deviation between level i and level I, (i = 1, . . . , I − 1);
- ![formula](https://render.githubusercontent.com/render/math?math=\sum_{i=1}^{I}( \alpha_{i}=0)), the intercept µ corresponds to the average score of that
factor, and the coefficient αi corresponds to the deviation of level i from
the average.

When there is no a priori on the levels, or in other words when there is no specified level of reference, the third contrast is used. However, R uses by default the second one, i.e., ![formula](https://render.githubusercontent.com/render/math?math=\alpha_{i}). To change the contrast to ![formula](https://render.githubusercontent.com/render/math?math=\sum_{i=1}^{I}( \alpha_{i}=0)), the following code should be used in R. This code should be run before actually performing the ANOVA.

<codeblock id="22_01">
</codeblock>

Note that, by changing the contrast, the estimate of the coefficients change (by definition), but the global analysis does not. However, since the default contrast in R uses the last level as reference (![formula](https://render.githubusercontent.com/render/math?math=\alpha_{I}= 0)), it only displays the results for the (I − 1) first coefficients. When the contrast ![formula](https://render.githubusercontent.com/render/math?math=\sum_{i=1}^{I}( \alpha_{i}=0)) is used, the last coefficient should then be calculated. This could be done in two different ways:

- calculate manually the last coefficient by summing the I − 1 first coefficients, and by multiplying this sum by -1;
- change the order of the levels of the factor (so that αI is not the last one anymore) using the relevel function, and re-run the analysis.

Note that in the first case, only the estimate of ![formula](https://render.githubusercontent.com/render/math?math=\alpha_{I}= 0) is provided, whereas in the second case, the p-value is also available, as the test associated with that coefficient is performed.

This second case is automated with the _AovSum_ function of the FactoMineR package. This function is similar to the aov function except that
it considers the ![formula](https://render.githubusercontent.com/render/math?math=\alpha_{I}= 0) contrast and provides directly the results of the _t-test_ for all the modalities of each effect added in the model. These results are stored in the object `$Ttest`.

</exercise>
</exercise>


<exercise id="3" title="How can I represent the product space on map?">

<exercise id="3_1" title="What's the concept of PCA ?" type = "slides">
<slides source="chapter1_01">
</slides>
</exercise>

<exercise id="3_2" title="Let's understand the method">

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

<exercise id="3_2" title="Let's practice">
Exercice 2.6 and 2.7
</exercise>

</exercise>

</exercise>

<exercise id="4" title="How can I get homogeneous clusters of products?">

Principal component methods (such as PCA) and clustering methods (such as Hierarchical Ascendant Classification [HAC]) are often complementary. Indeed, clustering methods aim at studying the distance between individuals, whereas PCA aims at visualizing these distances. As PCA represents the scatter plot of individuals NI on two components only, two individuals that represented as relatively close on a factorial plane may be actually very distant, hence leading to unfortunate misinterpretations. By combining PCA and HAC, such misinterpretation can be avoided. For example, the cluster information can be added on the factorial plane by using a color code. In this case, our two former individuals, who are represented as relatively close on the two dimensions used, would be associated with different colors. This difference in colors suggests that they are distant on other dimensions, as they belong to two distinct clusters. Similarly, results from **HAC** can be complemented by **PCA**, as the notion of distance between clusters can de facto be visualized in a factorial plane.

Such a combination between multivariate analysis and clustering is the core of the **HCPC** function (Hierarchical Clustering on Principle Components; *FactoMineR* package), as it takes as input the results issued from any multivariate methods implemented in *FactoMineR*, and run HAC on the individual space. As by default, the number of components stored by these multivariate analyses equals 5, the distance used by **HCPC** is usually based on the five first components only. This can be easily modified by changing the number of components to store, using the ncp argument in the different multivariate methods (_e.g._, `PCA(experts,ncp=3)` for three components only; `PCA(experts,ncp=Inf)` for all the components).

By using the previous example, both the **PCA** (more precisely, the object `res.pca`) and the **HCPC** functions can be combined as such:

<codeblock id="32_01">
</codeblock>

The **HCPC** function requires the analyst to set a number of clusters by clicking on the hierarchical tree (also called dendrogram). **HCPC** suggests a natural cut of the hierarchical tree, based on a criterion that depends on both the ratio of the variance within clusters and the total variance of the scatter plot. The criterion used aims at balancing the definition of clusters that are as homogenous as possible (with similar individuals), and as different as possible to each other (for which centers of gravity are different). In our example, we accept the natural cut in four groups suggested by **HCPC**. It is worth mentioning that **HCPC** will never suggest the 2-cluster solution.

Once the number of clusters is determined by the analyst, **HCPC** stores that information and plots the individuals on the factorial plane with a colorcode depending on the cluster they belong to. Such representation is obtained by adding, or representing, supplementary information (also referred to illustrative information) on a factorial plane. This feature is of utmost importance for interpreting exploratory multivariate results, and will be further developed in the next paragraph.

The results provided by **HCPC** are composed of five items :

<codeblock id="33_01">
</codeblock>

The information related to the cluster each individual belongs to is stored in the object called `res.hcpc$data.clust`. Another important output is stored in the object `res.hcpc$desc.var`. This object presents the description of the clusters by the variables of the data set, by providing for each cluster the list of significant attributes. The attributes are sorted according to two keys: the sign of the difference between the average score for that cluster and the overall mean for each attribute (cf. second and third columns), and the significance of the p-value of the test that compares the mean over the individuals of the cluster to the overall mean (cf. last column).

<codeblock id="34_01">
</codeblock>

Cluster 1 is not particularly characterized by any sensory attributes. The perfumes in cluster 1 have been perceived as some kind of average perfumes. De facto, these products are represented close to the center of gravity of the factorial plane. Such result can be directly linked to the notion of contrast defined previously in the t-test: the perfumes in cluster 1 are associated with ![formula](https://render.githubusercontent.com/render/math?math=I(F)=\alpha_{i}) coefficients that are not significantly different from 0.

Cluster 2 is composed of products that have been perceived with a high intensity of _Citrus_, _Green_ (at least higher than the average perfume), and to a lesser extent _Floral_ and _Fruity_: the p-values associated with _Citrus_ and _Green_ are particularly small compared to the ones associated with _Floral_ and _Fruity_. Similarly, products of cluster 2 have been perceived with a low intensity of _Wrapping_, _Oriental_, and to a lesser extent _Vanilla_.

Cluster 3 is composed of products that have been perceived with a high intensity of _Greedy_, _Vanilla_, and with a low intensity of _Floral_.

Cluster 4 is composed of products that have been perceived with a high intensity of _Oriental_, _Spicy_, _Heady_, _Woody_, to a lesser extent _Wrapping_, and with a low intensity of _Fruity_.

</exercise>


<exercise id="5" title="Adding supplementary information to the product space">

<exercise id="5_1" title=" Introduction to supplementary information">

The concept of supplementary information (also called illustrative information), as well as its representation, is of utmost importance when exploring multivariate data. The idea behind the notion of supplementary elements consists in projecting additional rows and/or columns in the plane obtained from PCA performed on the “original” matrix _X_, in order to see how these additional elements connect to _X_, but without taking this additional information into account in the construction of the dimensions. Let’s denote by _X+_ the supplementary rows and by _X+_ the supplementary columns. In practice, these two matrices _X+_ and _X+_ are projected on the vectors ![formula](https://render.githubusercontent.com/render/math?math=u_{s}) and ![formula](https://render.githubusercontent.com/render/math?math=v_{s}), respectively, after the PCA has been applied to _X_.

In terms of variables, supplementary information can either be continuous or categorical. As PCA only uses continuous variables in the calculation of the distances between individuals, categorical variables can only be considered as supplementary. For continuous variables, determining whether they are illustrative or not is arbitrary, and depends on the point of view adopted. Often, continuous variables are considered as supplementary if they are from a different nature (e.g., the liking variable in the sensory space). Similarly, the definition of supplementary entities is arbitrary and depends on both the point of view and the sensory issue tackled.

To illustrate this feature, the data collected by C. Asselin and R. Morlat (INRA, Angers, France), who studied the effect of the soil on the quality of the wine produced in the Loire Valley, are used. These data were used by B. Escofier and J. Pag`es to illustrate Multiple Factor Analysis in their paper entitled “Multiple factor analysis (AFMULT package),” published in _Computational Statistics & Data Analysis_ in 1984. The data can be found either in the book website or in the SensoMineR package.

In the data set, 21 wines are described by 31 variables, amongst which are 29 continuous variables and 2 categorical variables. The 29 continuous variables are made up of 27 sensory attributes and 2 other variables of a slightly different nature, one measuring the overall quality of the wine and the other one measuring the typicality of the wine. The 2 categorical variables are related to the origin of the wine (its appellation) and the nature of the soil on which the grape was produced.

The general idea behind the study is to understand the set of wines regarding their sensory profiles, and eventually to relate these sensory profiles to the origin, the quality, and the typicality of the wines. To do so, the point of view adopted consists in considering the sensory attributes as active variables. From this point of view, it is then possible to project the rest of the variables as illustrative.

<codeblock id="27_01">
</codeblock>

Based on this output, it can be seen that the supplementary categorical variables are the first two variables, and the supplementary continuous variables are the two last variables. Through the quanti.sup and quali.sup arguments of the PCA function, we specify the appropriate role of each variable in the analysis.

<codeblock id="28_01">
</codeblock>

Besides the features previously shown, the plot.PCA function also allows representing, in a convenient way, the supplementary variables through its col.quali, col.quanti, habillage, and col.hab arguments.
In PCA, categorical supplementary information is represented on the individuals factor map. The representation of these categories is obtained by calculating the center of gravity of the individuals belonging to each category in question. This can be illustrated using the following code:

<codeblock id="29_01">
</codeblock>

The supplementary continuous variables are represented within the variables representation, using the correlation between these supplementary elements and the components obtained from the active variables.

<codeblock id="30_01">
</codeblock>

</exercise>

<exercise id="5_2" title="The panellipse function of the SensoMineR package">

As evoked previously, the representation of the individuals on a factorial plane can be misleading. Indeed, when individuals are represented in a subspace of lower dimensionality than the original space RJ , distances amongst individuals are necessarily reduced. This is the price to pay to visualize the individuals. Obviously, this remark is transposable to variables. Based on this observation, how is it possible to find a way to enhance the representation of the distances between individuals and between variables?

One possible solution is to represent confidence areas around the individuals and around the variables. To do so, several strategies can be applied. The one explained in this section is implemented in the panellipse function of the SensoMineR package. The idea of the ellipses is based on the following question: How would the positioning of the perfumes evolve if we would slightly change the composition of the panel?

To answer this question, the original idea was to generate virtual panels from the original data using simulations. To do so, new panels Pi are obtained by sampling panelists with replacement, from the original pool of panelists. For each new virtual panel ![formula](https://render.githubusercontent.com/render/math?math=P_{i}), a new matrix of sensory profiles, denoted ![formula](https://render.githubusercontent.com/render/math?math=X_{P_{i}}), is calculated. Each data set ![formula](https://render.githubusercontent.com/render/math?math=X_{P_{i}}) (associated with the virtual panel Pi) is then combined vertically to the original data set X of sensory profiles, and is projected as a supplementary matrix of illustrative individuals in the original space obtained by PCA on _X_.

Ellipses including 95% of the products associated with the virtual panels are created around each product.

This is the procedure that is automatically performed by the panellipse function of the *SensoMineR* package. To run the panellipse function, the position of the column related to the product information (`col.p`), the panelist information (`col.j`), and the attributes (firstvar and lastvar) should be informed. Regarding the attributes, the argument level.search.desc discards all the attributes for which the Product effect is associated with a p-value larger than the threshold defined (by default 0.2; use 1 to keep all the variables in the analysis). Let’s apply this analysis on the experts data set used throughout this chapter.

<codeblock id="31_01">
</codeblock>

The more ellipses overlap, the less distinctive (or the closer) the two products are. Hence, from this representation, it appears clearly that _Aromatics Elixir_ and _Shalimar_ are perceived as similar, whereas _Shalimar_ and _Pleasures_ are perceived as different.

Regarding the variables, the same idea can be applied to the representation of the sensory attributes in the correlation circle. In this case, each new data set ![formula](https://render.githubusercontent.com/render/math?math=X_{P_{i}}) is combined vertically to the original data set X of sensory profiles. These data set ![formula](https://render.githubusercontent.com/render/math?math=X_{P_{i}}) are then projected as a supplementary matrix of illustrative variables, in the original space obtained by PCA on _X_.

This idea of representing confidence areas can be used to answer a recurrent sensory question regarding the number of panelists in a panel: what if the number of panelists was smaller or higher? Would they still differentiate the products, or not? One way of answering these related questions is to generate virtual panels by increasing or decreasing the number of panelists from the original panel. To do so, the `nbchoix` parameter of the panellipse function can be changed. By default, this parameter is set so that the virtual panel has the same size as the original panel.

</exercise>

</exercise>

<exercise id="6" title="Let's Practice">


</exercise>
