---
type: slides
---

# Data, sensory issues, and notations

---

Once the quality of the data provided by the panelists has been checked, it makes sense to finally adopt a product perspective, as ultimately, data were collected for that purpose. 

In this chapter, depending on the objectives, two data sets are considered. The first one consists of a sensory evaluation. In other words, it corresponds to an assessment in which a given subject _k (k = 1, . . . , K)_ gives scores to a given product _i (i = 1, . . . , I)_ during a given session _s (s = 1, . . . , S)_ according to _J_ attributes. Consequently, the data set consists of _I × K × S_ rows and _3 + J_ columns - one for the _product_, one for the _panelist_, one for the _session_, and _J_ for the sensory attributes. The second data set can be seen as a “contraction” of the first one, and hence results directly from it. In this second data set, the statistical units of interest are the products, and the variables are the _J_ sensory attributes.

The attributes that differentiate the products are identified through ANOVA (performed attribute per attribute) applied on the first data set. Besides to its classical outputs, ANOVA is also used to compute adjusted means, which defines the “contracted” sensory profiles of the products, constituting the second data set. The analysis of this second data set (and more precisely its visualization) is done by using one of the most important exploratory multivariate methods: Principal Component Analysis (PCA).

Throughout this chapter, particular emphasis is made on the t-test in ANOVA, and on the not-so-well-known (but still very useful) geometrical point of view in PCA. More precisely, the notion of contrasts as well as the notion of supplementary information (also known as illustrative information) are presented. In practice, the *FactoMineR* package (a package dedicated to exploratory multivariate analysis in R) and some of its functions dedicated to the analysis of multivariate data sets are presented and used.


---

## In practice





