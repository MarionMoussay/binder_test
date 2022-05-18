---
title: 'Lesson 2 : Relation between PCA and MFA'
description:
  ''
prev: /chapter1
next: null
type: chapter
id: 2
---

<exercise id="1" title="Data and objectives" type="slides">
<slides source="chapter2_01_data">
</slides>
</exercise>

<exercise id="2" title="Let's apply MFA">
Let's consider the first dataset: wine, from FactoMineR: 
<codeblock id="01_02">
</codeblock>

Try to make a MFA on these data and recover the coordinates of the individuals.
You will differenciate the groups as the following : 
* group 1 and 6 in inactive group 
* group 2, 3, 4 and 5 in active group
* name of each group : origin, odor, visual, odor.after.shaking, taste, overall

The group composition is set in `data and objectives`.

You have MFA Reminders in `Reminders on PCA and MFA with FactoMineR`

<codeblock id="02_02">
Here expected results : 

|         |Dim.1 |Dim.2|Dim.3|Dim.4|Dim.5|
|------------|:-------------:|:-------------:|:-----------|:-----------:|
| 2EL  | 0.23887352 |-0.7966775|  0.93573660  | 0.5244065920 | -0.35149196|
|1CHA |-2.04479321 |-1.3833145 | 1.51353029  |0.7295890931 | 0.07128969|
|1FON |-1.22014093| -0.4590203 | 0.06233338 |-1.0363561617 | 0.71797564|
|...|...|...|...|...|...|
|T2  |  0.16996447 | 3.3623417 | 1.05443115| -0.0472654272 | 0.42592614|

</codeblock>
</exercise>

<exercise id="3" title="How can I find MFA results with a PCA? ">

Let's try to find the last results, but in using PCA. To guide you, we decide to work on the weighting aspect of the MFA and how important it is. 

## Why and how weight MFA?
The two main objectives of the MFA are 
* Search automatically for the common structure within the different individual configurations
* summarizes the results by providing a consensual space (_i.e : the common structure shared by a majority of groups._)

It is important to give to each group the same importance. All group should contribute equally in the construction of the first dimension of the consensual space. Such procedure is not so straightforward as different groups are not providing the same number of attributes, and these attributes can be structured differently. To summarize, the variables spaces of each group are not equally multi-dimensional.

To keep the group structure, we need the same weights for all variables from the same group. We don't want a single group generating the first axis on its own and we want a multi-dimensional group contributing to more axes than a uni-dimensional group.

Now, we need to know how weight the MFA to keep this idea of having the same importance for each group in the construction of the consensual space. 

We propose you three different ways of weighting. Can you guess the good one? 

<style>
/* Style the button that is used to open and close the collapsible content */
#hidden {
  display: none;
  height: auto;
  border: solid #00A9FF;
  text-align:left;
  padding:1em;
}
:checked + #hidden {
  display: block;
}
label { 
      background : #00A9FF;
      padding : 5px 10px 5px 10px;
      color:white;
}

</style>

<HTML>
<center>
<input type="checkbox" id="my_checkbox1" style="display:none;">
<div id="hidden"  style="border: solid red;">You chose to weight the different groups of the MFA by it number of variables. Sorry, but it is not the good answer!
Let's imagine this case : <br>
  - The dataset is composed by two groups. <br>
  - The first group contains 8 variables non-collinear.<br>
  - The second group contains 4 variables, but last 7 variables are proportionnal to the fisrt one.<br>
Here, the second group will be uni-dimensionnal, while the first one can be multi-dimensionnal. The number of variables is not taking into acocunt in the variables space construction of each group. Hence, it can't balance the importance of the first dimension construction.
</div>
<label for="my_checkbox1">Number of variables</label>
<input type="checkbox" id="my_checkbox2" style="display:none;">
<div id="hidden" style="border: solid red;">
You chose to weight the different groups of the MFA by the total inertia of the group. Sorry, but it is not the good answer!<br>
Here, we will have what we want considering only the first dimension construction: All groups will contribute with the same weight. But in the case where two groups are multi-dimensionnal, they will be as important as an uni-dimensionnal group in the contruction of multi-dimensionnal groups. Which is not what we want. </div>
<label for="my_checkbox2">Total inertia</label>
<input type="checkbox" id="my_checkbox3" style="display:none;">
<div id="hidden" style="border: solid green;">
Correct! <br>
By balancing each group by it first eigen value, the variance of the principal dimension of each group is equal to 1, which means that no group can construct the first dimension alone. In scaling by the first eigen value, we also allow a multi-dimensional group to contribute to more dimensions than an uni-dimensional group
</div>
<label for="my_checkbox3">First eigen value</label>
</center>
</br>
</HTML>

## Links between PCA weighted and MFA
You can have reminders of PCA utilisation with factoMineR in `Reminders on PCA and MFA with FactoMineR`. 

Using weighted PCA, try to find MFA results :
<codeblock id="03_02">

Here expected results : 

|         |Dim.1 |Dim.2|Dim.3|Dim.4|Dim.5|
|------------|:-------------:|:-------------:|:-----------|:-----------:|
| 2EL  | 0.23887352 |-0.7966775|  0.93573660  | 0.5244065920 | -0.35149196|
|1CHA |-2.04479321 |-1.3833145 | 1.51353029  |0.7295890931 | 0.07128969|
|1FON |-1.22014093| -0.4590203 | 0.06233338 |-1.0363561617 | 0.71797564|
|...|...|...|...|...|...|
|T2  |  0.16996447 | 3.3623417 | 1.05443115| -0.0472654272 | 0.42592614|

</codeblock>

</exercise>

<exercise id="4" title="Let’s apply PCA">

We work on the dataset decathlon :

<codeblock id="04_02"></codeblock>

To facilitate the next part, we will work on the first four variables:

<codeblock id="05_02"></codeblock>

Run a PCA on the new dataframe and find the individuals coordinates.

<codeblock id="06_02">

Here expected results : 

|         |Dim.1 |Dim.2|Dim.3|Dim.4|
|------------|:-------------:|:-------------:|:-----------:|
|SEBRLE      | 1.13921677 |0.29485966|  0.85002742 | 0.52879719|
|CLAY       | -0.03337845 |-1.43874614| -0.89886543 | 0.02153567|
|KARPOV    |   0.53057016 | 0.52508373 | 0.33343766 | 0.03854637|
|...|...|...|...|...|
|Casarsa   |  -1.63391395 | 1.64437723| -0.68175577 | 0.13598627|

</codeblock>
</exercise>

<exercise id="5" title="How can I find PCA results with an MFA? ">
Now using MFA, try to find the same results as previously.
<codeblock id="07_02"> You can consider one variable as one group!

Here expected results : 

|         |Dim.1 |Dim.2|Dim.3|Dim.4|
|------------|:-------------:|:-------------:|:-----------:|
|SEBRLE      | 1.13921677 |0.29485966|  0.85002742 | 0.52879719|
|CLAY       | -0.03337845 |-1.43874614| -0.89886543 | 0.02153567|
|KARPOV    |   0.53057016 | 0.52508373 | 0.33343766 | 0.03854637|
|...|...|...|...|...|
|Casarsa   |  -1.63391395 | 1.64437723| -0.68175577 | 0.13598627|</codeblock>
</exercise>

<exercise id="6" title="Summary: What did you learn?">
Through this courses we learn many important things about MFA and PCA. <br>
Weighting is very important. In case of MFA, it allows you to balance each group importance in the dimension construction. In QDA, MFA is similar to a PCA, where each group is weighting with it first eigen value. Reciprocally, we can also see a PCA as a MFA, where each group is composed by one variable. 

</exercise>

<exercise id="7" title="To go further: An other approach with MFA and Lg measure ">
Another way of looking MFA is to see it as a canonical analysis using the Lg Measure. 

### Canonical Analysis (CA) and Generalized Canonical Analysis (GCA)

Without loss of generality, when two groups of attributes only are considered, the idea of Canonical Analysis is to find two linear combinations of variables, one for each group, that are most highly correlated together. These two linear combinations (one for each group) are the so-called canonical variables. In practice, they are qualified as “canonical” as they are representative of something, in our case a group of sensory attributes.

In the case of Generalized Canonical Analysis (GCA), canonical variables are not defined directly by comparing sets of variables two by two, but indirectly by first defining a variable that would be representative of all the groups of variables. In other words, the idea is to find a sequence of 
<img src="https://render.githubusercontent.com/render/math?math=\large z_{s}"> such that the following criterion is maximized:<br><center>
<img src="https://render.githubusercontent.com/render/math?math=\Large \sum_{j} R^{2}(z_{s}, X_{j})"></center>

The <img src="https://render.githubusercontent.com/render/math?math=\large z_{s}"> are the common factors to the group of variables. To obtain the
canonical variables, <img src="https://render.githubusercontent.com/render/math?math=\large z"> is simply regressed on the variables of <img style="margin-bottom: -0.7rem" src="https://render.githubusercontent.com/render/math?math=\large X_{j}"> . A drawback of
GCA is related to the use of the coefficient of determination, and de facto the
use of multiple linear regression. Unfortunately, this method is very sensitive
to multi-collinearity, a phenomenon that is very often observed with sensory
data.

### Lg measure
By definition, the <img style="margin-bottom: -0.7rem" src="https://render.githubusercontent.com/render/math?math=\large L_{g}(z,X_{j})"> coefficient, measured between a variable z and <img style="margin-bottom: -0.7rem" src="https://render.githubusercontent.com/render/math?math=\large X_{j}"> , equals the inertia of all the variables of <img style="margin-bottom: -0.7rem" src="https://render.githubusercontent.com/render/math?math=\large X_{j}"> orthogonally projected onto z. When the variables<img style="margin-bottom: -0.7rem" src="https://render.githubusercontent.com/render/math?math=\large \nu_{k}"> of <img style="margin-bottom: -0.7rem" src="https://render.githubusercontent.com/render/math?math=\large X_{j}"> are continuous (which is our case), with weights equal to mk, the coefficient  <img style="margin-bottom: -0.7rem" src="https://render.githubusercontent.com/render/math?math=\large L_{g}(z,X_{j})"> is defined by: <br><center>
<img src="https://render.githubusercontent.com/render/math?math=\Large L_{g}(z, X_{j})=\sum_{k} m_{k}r^{2}(z,\nu_{k})"></center>
By analogy, this measure is precisely the one used in PCA when extracting its main dimensions of variability

### MFA and GCA
The way MFA extracts its dimensions of variability from the groups of variables can be seen as a variant of GCA. In MFA, the coefficient of determination is replaced by the Lg measure, a measure of relationship between a variable and a group of variables.
As mentioned previously, in
MFA, the variables of a group j are all weighed by <img style="margin-bottom: -0.7rem" src="https://render.githubusercontent.com/render/math?math=\large X_{j}">. In that particular case, the <img style="margin-bottom: -2.25rem" src="https://render.githubusercontent.com/render/math?math=\large \dfrac{1}{\lambda_{1}^{j}}"> coefficient measured between a variable z and <img style="margin-bottom: -0.7rem" src="https://render.githubusercontent.com/render/math?math=\large X_{j}"> can be
written as follows:<br>
<center><img src="https://render.githubusercontent.com/render/math?math=\Large L_{g}(z, X_{j})=\dfrac{1}{\lambda_{1}^{j}} \sum_{k} r^{2}(z,\nu_{k})"></center>
This measure equals 1 if and only if z corresponds to the first dimension
of the PCA performed on the variables of <img style="margin-bottom: -0.7rem" src="https://render.githubusercontent.com/render/math?math=\large X_{j}">
<br>
<br>

### Let's practice !

We run a MFA on two identical groups<img style="margin-bottom: -0.5rem" src="https://render.githubusercontent.com/render/math?math=\large X_{1}"> and <img style="margin-bottom: -0.5rem" src="https://render.githubusercontent.com/render/math?math=\large X_{2}">, which give us two factors <img style="margin-bottom: -0.5rem" src="https://render.githubusercontent.com/render/math?math=\large F_{1}"> and <img style="margin-bottom: -0.5rem" src="https://render.githubusercontent.com/render/math?math=\large F_{2}">. 

We are going to represent the square of Lg measure between the first table <img style="margin-bottom: -0.5rem" src="https://render.githubusercontent.com/render/math?math=\large X_{1}"> and <img style="margin-bottom: -0.5rem" src="https://render.githubusercontent.com/render/math?math=\large X_{2}"> according to <img style="margin-bottom: -0.5rem" src="https://render.githubusercontent.com/render/math?math=\large F_{1}"> and <img style="margin-bottom: -0.5rem" src="https://render.githubusercontent.com/render/math?math=\large F_{2}">.

First, we need to discuss about the relative position of each point:
<choice>
<opt text="Superposed" correct="true">
Correct! As we run a PCA on the same tables, the principal component of the MFA is the same 
</opt>
<opt text="On the same x-axis but y-axis different">
</opt>
<opt text="On the same y-axis but x-axis different" >
</opt>
<opt text="Independant position">
</opt>
</choice>

</exercise>

<exercise id="0" title="Reminders on PCA and MFA with FactoMineR" type="slides">
<slides source="chapter2_02">
</slides>
</exercise>