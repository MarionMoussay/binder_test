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

Let's try to find the last results, but in using PCA. To guide you, we decide to work on the weighting aspect of the afm and how important it is. 

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
<input type="checkbox" id="my_checkbox1" style="display:none; border:">
<div id="hidden">You chose to weight the different groups of the MFA by it number of variables. Sorry, but it is not the good answer!
Let's imagine this case : <br>
  - The dataset is composed by two groups. <br>
  - The first group contains 8 variables non-collinear.<br>
  - The second group contains 4 variables, but last 7 variables are proportionnal to the fisrt one.<br>
Here, the second group will be uni-dimensionnal, while the first one can be multi-dimensionnal. The number of variables is not taking into acocunt in the variables space construction of each group. Hence, it can't balance the importance of the first dimension construction.
</div>
<label for="my_checkbox1">Number of variables</label>
<input type="checkbox" id="my_checkbox2" style="display:none;">
<div id="hidden">Idées d'implémentation</div>
<label for="my_checkbox2">Total inertia</label>
<input type="checkbox" id="my_checkbox3" style="display:none;">
<div id="hidden">Idées d'implémentation</div>
<label for="my_checkbox3">First eigen value</label>
</center>
</br>
</HTML>

## Links between PCA weighted and MFA
You can have reminders of PCA utilisation with factoMineR in `Reminders on MFA and PCA with FactoMineR`. 

Using weighted PCA, try to find MFA results :
<codeblock id="03_02"></codeblock>


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
<style>
/* The flip card container - set the width and height to whatever you want. We have added the border property to demonstrate that the flip itself goes out of the box on hover (remove perspective if you don't want the 3D effect */
.flip-card {
  background-color: transparent;
  width: 300px;
  height: 200px;
  border: 1px solid #f1f1f1;
  perspective: 1000px; /* Remove this if you don't want the 3D effect */
}
</style>
<style>
.flip-card-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;
}
</style>
<style>
/* Do an horizontal flip when you move the mouse over the flip box container */
.flip-card:hover .flip-card-inner {
  transform: rotateY(180deg);
}
</style>
<style>
/* Position the front and back side */
.flip-card-front, .flip-card-back {
  position: absolute;
  width: 100%;
  height: 100%;
  -webkit-backface-visibility: hidden; /* Safari */
  backface-visibility: hidden;
}
</style>
<style>
/* Style the front side (fallback if image is missing) */
.flip-card-front {
  background-color: #bbb;
  color: black;
}
</style>
<style>
/* Style the back side */
.flip-card-back {
  background-color: dodgerblue;
  color: white;
  transform: rotateY(180deg);
}
</style>

<HTML><div class="flip-card">
  <div class="flip-card-inner">
    <div class="flip-card-front">
      <h1>Test FLIPCARD</h1>
    </div>
    <div class="flip-card-back">
      <h1>Idées d'implémentations</h1>
      <p>Test</p>
    </div>
  </div>
</div>
</HTML>
</exercise>

<exercise id="0" title="Reminders on MFA and PCA with FactoMineR">

</exercise>