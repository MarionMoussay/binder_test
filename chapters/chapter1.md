---
title: 'How to describe a set of products'
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

1. Please notice that for this tutorial, you are in a controlled environment and everything has been downloaded for you, the datasets and the different packages you need ; the packages have been installed as well. Remember, the first thing you have to think of, before analysing your data, is the different packages you might need. For this tutorial, we will use the _SensoMineR_ package. This package is a very useful package as it can analyse many different types of sensory data, from QDA to holistic approaches such as sorting or napping data. In a real life situation you would have to import the dataset, and to install and load the packages. To install, then load a package, you can refer to the code below.


<codeblock id="01_02">

Before loading a package, you first have to install it. To do so, use the **install.packages** function, just like this `install.packages("name_package")`.

As you can see, all you have to do to load a package is to apply the **library** function to the package, just like this `library(name_package)`.

</codeblock>

Thanks to the code above, you can load the four packages _dplyr_, _xlsx_, _ggplot2_, and _SensoMineR_.

2. Now that the _SensoMineR_ package has been installed, we're going to play with the sensory description of the chocolates. To do so, let's have a look at the _sensochoc_ dataset. Before that, we're going to load the _chocolates_ data that are included in the _SensoMineR_ package as examples. To do so, we're going to use the **data** function. Then, we're going to have a look at the first lines of the _sensochoc_ dataset, which corresponds to the sensory description of the chocolates. To do so, we're going to use the **head** function.

<codeblock id="02_02">

Before loading a package, you first have to install it. To do so, use the **install.packages** function, just like this `install.packages("name_package")`.

As you can see, all you have to do to load a package is to apply the **library** function to the package, just like this `library(name_package)`.

</codeblock>

</exercise>
