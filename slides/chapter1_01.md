---
type: slides
---

---

## Concept

One of the multidimensional descriptive methods is principal component analysis. It proposes from a data table of _p_ quantitative variables for _n_ individuals geometric representations. They allow to see if there is a structure not known a priori on this set of individuals. The aim is to distinguish groups of individuals in the sample as a whole based on a predefined similarity. From the point of view of variables, the objective is to define which ones are correlated or not. 

The interpretations that may be derived from a CPA are based on the origin of the data collection and the problem that arises at the outset of the study. The CPA is not an end in itself, but it provides a better understanding of the data on which we are working and to detect possible outliers or to formulate hypotheses that can then be studied on the basis of other statistical tools.


<center><img src="/echantillonnage.jpeg" alt="Echantillonnage" width="25%" /></center>

---

## Presentation of the data set 

The Directorate-General for Taxes publishes a Monthly Wine Statistics in the Official Journal on 4 November 1987. This is the table that crosses wine categories with exporting countries. The common unit is the hectolitre. Here are the results for 5 different wines:

 ID | BELGIQUE | NEDERLAND | RFA | ITALIE | UK | SWITZERLAND | USA | CANADA
 :--: |:--: |:--: |:--: |:--: |:--:|:--: |:--: |:--: 
 CHMP | 7069 | 3786 | 12578 | 8037 | 13556 | 9664 | 10386 | 206
 MOS1 | 2436 | 586 | 2006 | 30 | 1217 | 471 | 997 | 51
 MOS2 | 3066 | 290 | 10439 | 1413 | 7214 | 112 | 3788 | 330
 ALSA | 2422 | 1999 | 17183 | 57 | 1127 | 600 | 408 | 241
 GIRO | 22986 | 22183 | 21023 | 56 | 30025 | 6544 | 13114 | 3447
 BOJO | 17465 | 19840 | 72977 | 2364 | 39919 | 17327 | 17487 | 2346
 
The objective here is to identify groups among the 6 individuals represented by the wines. 

---

# First step 

The first step is to center and reduce the data. This means that for each value of a _j_variable, subtract the observation with the column mean and divide it by the standard deviation of that same column.

The following table is then obtained: 

 ID | BELGIQUE | NEDERLAND | RFA | ITALIE | UK | SUISSE | USA | CANADA
 :--: |:--: |:--: |:--: |:--: |:--:|:--: |:--: |:--: 
 CHMP | -0.245 | -0.429 | -0.398 | 1.944 | -0.122 | 0.564 | 0.384 | -0.626
 MOS1 | -0.768 | -0.746 | -0.813 | -0.631 | -0.890 | -0.773 | -0.956 | -0.734
 MOS2 | -0.697 | -0.775 | -0.482 | -0.186 | -0.516 | -0.826 | -0.558 | -0.539
 ALSA | -0.770 | -0.606 | -0.217 | -0.622 | -0.895 | -0.755 | -1.040 | -0.601
 GIRO | 1.552 | 1.394 | -0.066 | -0.623  | 0.904 | 0.110 | 0.773 | 1.633
 BOJO | 0.929 | 1.162 | 1.974 | 0.119 | 1.519 | 1.679 | 1.397 | 0.866
 
Why is this step necessary? What does it allow and why?

Notes: This very important step makes it possible to compare individuals with each other in relation to a reference value which is the one in 0. Moreover, by dividing by the standard deviation, each individual has the same weight which is 1. We name each variable, after centering reduction, as a _Z_ variable with reference to the _z score_. It represents the number of standard deviations of an individual above or below the average. It thus makes it possible to judge whether it is significantly likely or not to again observe a difference between the observation of a variable and its mean, for an individual, at least as large. As a result, ordinary individuals can be distinguished from extraordinary individuals. The latter represent the individuals furthest from the average, those with a higher _z-score_ .

---

From this first centered-reduced table, it is already possible to draw hypotheses on the groups of individuals.

<center><img src="/analyse_tab_cr.JPG" alt="analyse tableau cr" width="110%" /></center>

With this information we can already imagine the plan of individuals.

<center><img src="/ACP_main.png" alt="ACP à la main" width="45%" /></center>

Notes: We see here that the AOC sparkling wine (MOS1), another sparkling wine (MOS2) and the Alsace wine (ALSA) have very similar values for the export countries Belgium, the Netherlands and Canada. We can already assume that they belong to the same group. 
By opting for a single group for the MOS1, MOS2 and ALSA wines and by placing them in any reference we can deduce the position of the other 3 individuals. The three importing countries used to define the previous group are taken as vertical benchmarks: Canada, Belgium and the Netherlands. 
All their observations are negative so we position them at the bottom left. Champagne (CHMP) has negative values for the same export countries as the previous defined group so it is put in the top left. Beaujolais wine (BOJO) has all its positive values so we position it on the top right. The last wine, the Italian Giro (GIRO) has positive values for the three countries of import mentioned but some negative values for the other countries so we put it at the bottom right. 
---

# You have just completed a first PCA !





