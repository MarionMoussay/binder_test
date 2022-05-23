---
title: 'Lesson 5 : Napping'
description:
  ''
prev: /chapter4
next: null
type: chapter
id: 5
---

<exercise id="1" title="What's the concept?" type="slides">
<slides source="chapter5_01">
</slides>
</exercise>

<exercise id="2" title="Why not standardize?">

To start, let’s compare two CPAs performed for one individual, one is standardized the other no. We import the dataset and represent the rectangle, like in the slides:

<codeblock id="01_05">
</codeblock>

Next, do two ACP, one standardized and the other unstandardized. Then plot the individuals representations: 

<codeblock id="02_05">
</codeblock>

The two representations of the product space are different. By standardizing the data, the length and the height of the rectangle are given the same importance, which is not in accordance with the spirit of Napping. Intrinsically, by using Napping, subjects favor the length of the rectangle when positioning the products. Hence, the representation of the perfumes using PCA when data are unstandardized is much closer (actually, it is very similar) to the genuine representation than when data are standardized.

</exercise>

<exercise id="2" title="First step of the MFA : PCA">

In this case, is it appropriate to compare two standardized PCA?

<choice id=1>
<opt text="True">
The two subjects are not comparable anymore, at least with respect to the variance of their first dimension. To convince oneself of this it is possible to a closer look at the numerical indicators provided by the PCA function.
</opt>
<opt text="False" correct="true">
Technically, when performing MFA on Napping data, the separate analyses of each group of coordinates are not standardized (i.e., variables are not scaled to unit variance). Otherwise, the analyst would lose the information about the relative importance of the dimensions of variability amongst the stimuli, which is basically why Napping was originally proposed on a rectangle.
</choice>

Similarly to the previous part, Multiple Factor Analysis is considered for the analysis of such data. Indeed, MFA was conceived precisely for the purpose that each group of variables is equally balanced within the global analysis. To keep the specified dimensions of the rectangle unchanged within the analysis, a particularity of MFA consisting in performing unstandardized Principal Component Analysis (PCA) on each separate group, is presented here. That's used in order to be able to extract the first eigenvalue in order to weight each group. 

Let's do unstandardized PCA on two group to compare them. One groupe is on subject who representated product on a map, let's take the subject 38 and 57. 
To compare these two analyses, one idea could be to balance the first dimension of each separate analysis, without changing the structure amongst products induced by each analysis. To do so, a homothetic transformation is applied on each individual configuration: the data of each subject are divided by the square root of the first eigenvalue of each separate analysis, i.e., by the standard deviation of the first dimension of each separate analysis. After performing such transformation, let’s re-run an unstandardized PCA on each rectangle.

<codeblock id="03_05">
</codeblock>

What should be the value of the variance of the first dimension (i.e. the first eigenvalue) at this level of analysis?

<choice id=2>
<opt text="0">
If this were the case, it would mean that no information is explained by the first axis built or this is not the objective of a PCA.
</opt>
<opt text="1" correct="true">
</choice>

Both graphically and numerically, the two rectangles are comparable. This is a direct consequence of the transformation performed, which corresponds exactly to the particular weighting procedure considered in MFA. As we will see, when analyzing the data, one has to specify this fundamental option, as
it is closely related to the intrinsic nature of the data.

<codeblock id="04_05">
</codeblock>

</exercise>

<exercise id="3" title="Let's do MFA">

As mentioned previously, as a result of the Napping, each subject provides two vectors of coordinates of dimension _I × 1_ each (one for the _x-axis_, one for the _y-axis_), where _I_ denotes the number of stimuli to be positioned on the rectangle. Hence, the final data set to be analyzed, denoted _X_, is obtained by merging the _J_ couples of vectors of coordinates, where _J_ denotes the number of subjects. In other words, _X_ can be seen as a data set structured into _J_ groups of two variables each. Typically, the statistical analysis of such data set _X_ should take into account the natural partition on the variables.

The first step was to divide each group by the first own value of its non-standardized ACP. Next, we're going to do the MFA on this dataset in order to represent the product space on a map with this arguments : 

- `group` : the data set is a succession of 60 groups of 2 variables each, _group=rep(2,60)_
- `type` : _type=rep("c",60)_, as data shouldn’t be scaled to unit variance.

<codeblock id="05_05">
</codeblock>

This space opposes, on the first dimension, _Aromatics Elixir_, _Chanel N5_, and _Shalimar_ to the rest of the products. The second dimension opposes _Angel_ and _Lolita Lempicka_ to _Pleasures_ and _Chanel N5_. However, the sole representation of the products does not speak for itself unless the analyst has a great expertise on the products (hence the need of integrating supplementary information, if available).

</exercise>

<exercise id="3" title="Introducing supplementary information">
</exercise>