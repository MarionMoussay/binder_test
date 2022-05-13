---
type: slides
---

## Packages and objectives
We are going to use 2 packages : `FactoMineR` and `factoextra`

The objectives of this tutorial is to have a better understanding of FMA and PCA constructions for quantitative data.
You will learn to find MFA results thanks to PCA and reciprocally. 
 If needed, you can check _Reminders_ to get some tips and reminders about PCA and MFA. 

---

## Data

Two datasets are given : 
* The dataset _wine_ include in the package FactoMineR. The dataset is composed by 21 rows (the number of wines) and 31 columns. The first column corresponds to the label of origin, the second column corresponds to the soil, and the others correspond to sensory descriptors.

<center><img src="/wine.png" alt="Echantillonnage" width="60%" /></center>
---

The groups are building as the following : 

<span style="color:blue">First group</span> - A group of categorical variables specifying the origin of the wines. These are the Label and Soil variables corresponding to the first 2 columns of the data table. In FactoMineR terminology, the argument group = 2 is used to define the first 2 columns as a group.

<span style="color:blue">Second group</span> - A group of continuous variables, describing the smell of the wines before shaking. These are the variables: Odor.Intensity.before.shaking, Aroma.quality.before.shaking, Fruity.before.shaking, Flower.before.shaking and Spice.before.shaking. These variables correspond to the next 5 columns after the first group. FactoMineR terminology: group = 5.

<span style="color:blue">Third group</span> - A group of continuous variables quantifying the visual inspection of wines. These are the variables: Visual.intensity, Nuance and Surface.feeling. FactoMineR terminology: group = 3.

<span style="color:blue">Fourth group</span>- A group of continuous variables concerning the odour of the wines after shaking. These are the variables: Odor.Intensity, Quality.of.odour, Fruity, Flower, Spice, Plante, Phenolic, Aroma.intensity, Aroma.persency and Aroma.quality. These variables correspond to the next 10 columns after the third group. FactoMineR terminology: group = 10.

<span style="color:blue">Fifth group</span> - A group of continuous variables evaluating the taste of wines. These are the variables Attack.intensity, Acidity, Astringency, Alcohol, Balance, Smoothness, Bitterness, Intensity and Harmony. These variables correspond to the next 9 columns after the fourth group. FactoMineR terminology: group = 9.

<span style="color:blue">Sixth group</span> - A group of continuous variables concerning the overall judgement of the wines. These are the variables Overall.quality and Typical. These variables correspond to the next two columns after the fifth group. FactoMineR terminology: group = 2.

---

## Data

Two datasets are given : 
* The dataset _decathlon_ include in the package FactoMineR. A data frame with 41 rows and 13 columns: the first ten columns corresponds to the performance of the athletes for the 10 events of the decathlon. The columns 11 and 12 correspond respectively to the rank and the points obtained. The last column is a categorical variable corresponding to the sporting event (2004 Olympic Game or 2004 Decastar). TO simplify the analysis, we will focus on the only first four columns.

<center><img src="/decathlon.png" alt="Echantillonnage" width="40%" /></center>