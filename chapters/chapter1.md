---
title: 'Lesson 1 : How to describe a set of products'
description:
  'This chapter will teach you about many cool things and introduce you to the
  most important concepts of the course.'
prev: null
next: /chapter2
type: chapter
id: 1
---

<exercise id="1" title="Introduction" type="slides">

<slides source="chapter1_01_introduction">
</slides>

</exercise>

<exercise id="2" title="Introducing the sensochoc dataset">

### Question 1 : 

Please notice that for this tutorial, you are in a controlled environment and everything has been downloaded for you, the datasets and the different packages you need ; the packages have been installed as well. Remember, the first thing you have to think of, before analysing your data, is the different packages you might need. For this tutorial, we will use the _SensoMineR_ package. This package is a very useful package as it can analyse many different types of sensory data, from QDA to holistic approaches such as sorting or napping data. In a real life situation you would have to import the dataset, and to install and load the packages. To install, then load a package, you can refer to the code below.

![](https://github.com/MarionMoussay/binder_test/blob/master/image/sensominer.png?raw=true)


<codeblock id="01_02">

Before loading a package, you first have to install it. To do so, use the **install.packages** function, just like this `install.packages("name_package")`.

As you can see, all you have to do to load a package is to apply the **library** function to the package, just like this `library(name_package)`.

</codeblock>

Thanks to the code above, you can load the four packages _dplyr_, _xlsx_, _ggplot2_, and _SensoMineR_.

### Question 2 : 

Now that the _SensoMineR_ package has been installed, we're going to play with the sensory description of the chocolates. To do so, let's have a look at the _sensochoc_ dataset. Before that, we're going to load the _chocolates_ data that are included in the _SensoMineR_ package as examples. To do so, we're going to use the **data** function. Then, we're going to have a look at the first lines of the _sensochoc_ dataset, which corresponds to the sensory description of the chocolates. To do so, we're going to use the **head** function.

<codeblock id="02_02">
</codeblock>

What does this object refer to ? 

<choice>

<opt text="Summarization">

Summarization is used with summary().

</opt>

<opt text="Clustering">

It's just a no.

</opt>

<opt text="First observations" correct="true">

Good job !

</opt>

</choice>

### Question 3 : 

The **summary** function is one of the most important function in R. For example, with the **summary** function, you can check that your dataset has been well imported. You can also display the important features of your dataset, variable per variable. This is what we're going to do.

<codeblock id="03_02">
</codeblock>

### Question 4 :

Change the _maxsum_ argument of the **summary** function (to get some [help](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/summary). As you can see, this argument indicates the number of levels to be displayed.

<codeblock id="04_02">
</codeblock>

### Question 5 :

Plot the histogram of the variable _CocoaA_.

<codeblock id="05_02">
</codeblock>

</exercise>


<exercise id="3" title="Analysing the sensochoc dataset from a univariate point of view">

# Manually with analysis of variance (ANOVA)

### Just introduce : 

<html><center>
<iframe width="560" height="315" src="https://www.youtube.com/watch?v=CS_BKChyPuc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center></html>

### Question 1 :

Let's have a look at the sensory descriptor _Sweetness_. The sweetness of a chocolate can be explained by the chocolate itself, or by the person who has tasted the chocolate. These assumptions can be assessed by using an analysis of variance, a method designed to identify the sources of variability of a continuous variable. In other words, with an analysis of variance, we want to explain a continuous variable by some categorical variables (our sources of variability). In our case, the model we're going to test is the _Sweetness_ according to the _Product_ and the _Panelist_. To do so, we're going to use the **AovSum** function of the _FactoMineR_ package. All you need to specify is the model, then the name of the dataset. In the example, we store the results in an object named _res_: to do so we use that very important sign `<-`, on its left the name of the object where we want to store, on its right the results of the function. Use the **names** function to get a list of the different results produced by the **AovSum** function. Then take a look at each one of these results.

<codeblock id="01_03">
As you can see, _res_ is made up of two components. The first one is related to the variables of the model, the second one is related to the levels (or categories) of the variables of the model. You can have an access of each component by using the `$` sign: `res$name_component`.
</codeblock>

### Question 2 :

Let's do the same thing with the sensory descriptor _CocoaA_.

<codeblock id="02_03">
</codeblock>

# Automatically with the **decat** function

### Question 1 :

The **decat** function is one of the most important and useful function of the _SensoMineR_ package. This function is designed to point out the variables that are the most characteristic of a set of products. The idea behind this function is to perform all the analyses of variance for all the sensory descriptors, for a given model. Then the function summarises all the results that you have seen previously for a categorical variable of interest, usually the product effect. The main arguments you need to specify are the name of the dataset, the model, the position of the first sensory descriptor in your dataset. Notice that the dataset has to be structured the following way: a block of factors, then a block of sensory descriptors. Run the **decat** function on the _sensochoc_ dataset, save the results in an object named _resdecat_, identify the different components of this object with the function **names**. You can also have a look at the help page of the [**decat** function](https://www.rdocumentation.org/packages/SensoMineR/versions/1.26/topics/decat).

<codeblock id="03_03">
Notice that the dataset has to be structured the following way: a block of factors, then a block of sensory descriptors.
</codeblock>

### Question 2 :

Let's have a look at the component named _tabF_.

<codeblock id="04_03">
Remember to have a look at one particular component you have to write the following way: `result$name_component`.
</codeblock>

</exercise>


<exercise id="4" title="Analysing the sensochoc dataset from a multivariate point of view">

# With Principle Component Analysis
# With Principle Component Analysis and confidence ellipses


</exercise>

<exercise id="5" title="Analysing the hedochoc dataset from a product point of view">

# From a univariate point of view with analysis of variance (ANOVA)
# From a multivariate point of view with PCA

</exercise>

</exercise>

<exercise id="6" title="Analysing the hedochoc dataset from a panelist point of view">

# First with PCA and the _hedochoc_ dataset
# Then with hierarchical clustering

</exercise>
