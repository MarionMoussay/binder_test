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

<exercise id="1" title="Data, sensory issues, and notations" type="slides">

<slides source="chapter1_01">
</slides>

</exercise>

<exercise id="2" title="In practice">

The data set used to illustrate the methodology consists of 12 panelists, testing and rating 12 luxurious women perfumes on 12 attributes. Each panelist rated each product twice.

First, we import te dataset. A first overview of the data shows that the variables Session and Rank are considered as continuous variables. Since these columns correspond, respectively, to the session information and to the order of presentation, they should be considered as factors. To transform these columns from numerical to categorical, the as.factor function is applied on these two variables.

<codeblock id="01_01">
</codeblock>


Let us quickly recall the experts data set by using the summary function.

<codeblock id="02_01">
</codeblock>

As previously explained, the first four columns are categorical: these are the independent factors of our experiment. The other variables are continuous: these are the sensory attributes.

</exercise>

<exercise id="3" title="How can I get a list of the sensory attributes that structure the product space?">

ANOVA is used to define the sensory attributes that structure the product space. However, here, the interpretation of the results is not panelist oriented, but product oriented.

To explain the sensory attribute _Citrus_ (dependent variable) with respect to the main effects _Product_, _Panelist_, _Session_, and their first-order interactions (independent variables), the following ANOVA model is considered:

![formula](https://render.githubusercontent.com/render/math?math=Citrus_{iks}\sim\mu+\alpha_{i}+\beta_{k}+\gamma_{s}+\alpha\beta_{ik}+\alpha\gamma_{is}+\beta\gamma_{ks}+\epsilon_{iks})
 
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

To use the function, first load the *SensoMineR* package if it has not already been done. The main arguments of the *decat* function to specify are: the data set on which the analyses are performed, the ANOVA model, and the positions of the first and last sensory attributes (by default, the position of the last sensory attribute corresponds to the last column of the data set). The *decat* function produces a list of results that we store here in an object called res.decat.

<codeblock id="04_01">
</codeblock>

</exercise>






