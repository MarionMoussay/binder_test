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

Let's take this dataset represents 6 perfumes with 5 sensory attributs:

 PRODUCT | INTENSITY | FRESHNESS | JASMIN | ROSE | CAMOMILLE 
 :--: |:--: |:--: |:--: |:--: |:--:
 	
Angel | 77 | 36.1 | 30 | 13.3 | 15.2 
 2
Aromatics Elixir | 69.7 | 26.7 | 75.2 | 17.9 | 15.5 
 Chanel N5
 | 52.7 | 50.6 | 41.5 | 45.8 | 18.8
 Cinéma | 70 | 60.9 | 26.4 | 21.8 | 18.8 
 Coco Mademoiselle
 | 73 | 66.1 | 40.6 | 18.2 | 15.2
 J'adore EP
 | 48.8 | 50.9 | 30 | 14.2 | 16.7 
 
The objective here is to identify groups among the 6 individuals represented by the wines. 

---

# First step 

The first step is to center and reduce the data. This means that for each value of a _j_variable, subtract the observation with the column mean and divide it by the standard deviation of that same column.

The following table is then obtained: 

 PRODUCT | INTENSITY | FRESHNESS | JASMIN | ROSE | CAMOMILLE 
 :--: |:--: |:--: |:--: |:--: |:--:
 	
Angel | 1.10 | -0.89 | -0.59 | -0.71
 | -0.87 
 2
Aromatics Elixir | 0.27 | -1.50 | 1.92 | -0.33 | -0.70 
 Chanel N5
 | -1.68 | 0.05 | 0.05 | 1.98 | 1.22
 Cinéma | 0.30 | 0.72 | -0.79 | -0.01 | 1.22
 Coco Mademoiselle
 | 0.64 | 1.06 | 0.00 | -0.30 | -0.87
 J'adore EP
 | -0.64 | 0.56 | -0.59 | -0.63 | 0.00 
 
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





