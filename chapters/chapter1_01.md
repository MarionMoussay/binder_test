---
title: 'Lesson 1 : ANOVA or how to define the product space'
prev: null
next: /chapter3
type: chapter
id: 1
---


<exercise id="1" title="How to use the decat funtion from SensoMineR?" type="slides">

</exercise>

<exercise id="2" title="What's the method behind the decat function?">
Plan : objectif > data set > decat = plusieurs ANOVA > qu'est ce qu'anova > exercices (idée : entonnoir)

# What's the question here ?

Lister les attributs qui structure l'espace des produits

# Data set
The data set used to illustrate the methodology consists of 12 panelists, testing and rating 12 luxurious women perfumes on 12 attributes. Each panelist rated each product twice.

First, we import te dataset. A first overview of the data shows that the variables _Session_ and _Rank_ are considered as continuous variables. Since these columns correspond, respectively, to the session information and to the order of presentation, they should be considered as factors. To transform these columns from numerical to categorical, the `as.factor` function is applied on these two variables.

<codeblock id="01_01">
</codeblock>

Let us quickly recall the experts data set by using the summary function.

<codeblock id="02_01">
</codeblock>

As previously explained, the first four columns are categorical: these are the independent factors of our experiment. The other variables are continuous: these are the sensory attributes.

# What do the decat function ?

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

# What's ANOVA ?

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

# Exercices 

**Exercise 1**

Let's considere this table of ANOVA :
<center><img src="/anova-table.png" width="50%" /></center>

With it, complete this table : 
<center><img src="/table_anova.JPG"  width="30%" /></center>

<codeblock id="24_01">
</codeblock>

**Exercise 2**

The purpose of a variance analysis (ANOVA) is to test if the variances of the subpopulations corresponding to the expression levels of the factor are equal.

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

<exercise id="3" title="Let's practice!">

</exercise>

