---
type: slides
---



#  Data, sensory issues, and notations

---

## Free Choice Profiling (FCP)

FCP is an avant-gardist way of describing products. One fundamental rule of the game is dramatically changing: panelists can use their own list of sensory attributes to describe the same set of products.

This radical evolution of the way descriptive data could be collected induced many different changes. The recurrent question regarding the quality of the panel, and therefore of the data, did not arise anymore (or at least very differently, and certainly more simply). Indeed, the strategies developed to assess the performance of the panel, based on ANOVA models (cf. Chapter 1), could not be applied anymore.

On the contrary, as the rationale behind FCP is to offer panelists the choice in the sensory attributes to describe the stimuli, we expect from the method that panelists provide reliable data, as they have used their own criteria. Intrinsically, assessing the performance of
the panel may not be as crucial as it can be with classical descriptive analysis methods; it may even be irrelevant, considering the idea of freedom (which does not mean that panelists cannot be trained).

Notes: Classical in the sense that they are based on a single list of sensory attributes.
---

## Data construction 

As a descriptive method, we expect of FCP that it provides data that would allow us to precisely describe the product space.

As previously explained, each panelist  <img src="https://render.githubusercontent.com/render/math?math=\,j \,(j\in\{1,...,J\})\,">  describes the products using their own attributes. Each panelist then provides the sensory profiles of the products in the form of a matrix : <img style="margin-bottom:-0.75rem" src="https://render.githubusercontent.com/render/math?math=\,\Large {X_{j}}\,"> of dimensions <img style="margin-bottom:-0.75rem" src="https://render.githubusercontent.com/render/math?math=\,\Large I\times K_{j}\,"> where <img style="margin-bottom:0rem" src="https://render.githubusercontent.com/render/math?math=\,\Large I\,"> denotes the number of products and <img style="margin-bottom:-0.75rem" src="https://render.githubusercontent.com/render/math?math=\,\Large K_{j}\,"> the number of sensory attributes used by panelist j.

These J matrices are usually bound together into a matrix <img style="margin-bottom:-0.75rem" src="https://render.githubusercontent.com/render/math?math=\,\Large X = [X_{1}\mid ...\mid X_{J}]\,">. This matrix <img style="margin-bottom:0rem" src="https://render.githubusercontent.com/render/math?math=\,\Large X\,">  is then subjected to some analysis

<center><img src="/MFA_Data_01.png" width="80%" alt="A" /></center>
---

Before choosing and presenting the analysis of such particular data, let’s present our expectations from them. The analysis of <img style="margin-bottom:0rem" src="https://render.githubusercontent.com/render/math?math=\,\Large X\,"> should provide a representation of the products based on the J matrices <img style="margin-bottom:-0.75rem" src="https://render.githubusercontent.com/render/math?math=\,\Large X{j}\,">. Similarly to the evaluation of the product space in QDA (cf. Chapter 2), the differences between products should be understandable and interpretable. However, such product configuration should not be related to one particular panelist only (_i.e._, the analysis should not be dominated by one matrix <img style="margin-bottom:-0.75rem" src="https://render.githubusercontent.com/render/math?math=\,\Large X{j}\,"> ), but should be balanced across the individual matrices. 

In other words, the different panelists’ points of view (associated with the individual matrices <img style="margin-bottom:-0.75rem" src="https://render.githubusercontent.com/render/math?math=\,\Large X{j}\,"> ) should be equally balanced in the analysis. Additionally, it would be interesting to compare, within the product configuration, the individual points of view (_i.e._, the J matrices) at different levels of interest: we would like to see what is common between the individual matrices, and what is specific to each of them.

As a matrix is associated with one panelist, this representation would help us in understanding the panelists, and therefore would help us in assessing some kind of performance of the panel, at least in terms of agreement: if all the individual judgments are projected close together regarding a given product, it can be concluded that the panelists are in agreement with the description of that product.

---

## MFA approach

As we will see, all these expectations are fulfilled by MFA. MFA is an exploratory multivariate method dedicated to the analysis of so-called multiple data tables, in the sense that one set of statistical individuals is described by several groups of variables. Without loss of generality, MFA is presented here within the framework of this chapter, _i.e._, when the different groups of data contain quantitative variables. In the following chapters, other examples involving MFA, in which the groups of variables are either qualitative or contingency tables, will be presented.

Notes: The methodology presented here can also be applied to Flash Profile data. Indeed, Flash Profile is a variation of Free Choice Profile, in which panelists are asked to rank (rather than rate) the products according to their own, freely defined, sensory attributes. By considering these ranks as quantitative scores (i.e., a low rank corresponds to a low intensity score), as it is often done in practice, the situation is identical to Free Choice Profile, and the same analyses do apply.

---

En optant pour un seul groupe pour les vins MOS1, MOS2 et ALSA et en les placant dans un repère quelconque on peut en déduire la position des 3 autres individus. On prend comme repère vertical les trois pays d'importation utilisé pour définir le précédent groupe : Canada, Belgique et Pays-Bas. 

Toutes leurs observations sont négatives donc on les positionne en bas à gauche. Le champagne (CHMP) possède des valeurs négatives pour les mêmes pays d'exportation que le précédent groupe définie donc on le met en haut à gauche. Le vin beaujolais (BOJO) se voit avoir toutes ses valeurs positives donc on le positionne en haut à droite. Le dernier vin, le Giro italien (GIRO) possède des valeurs positives pour les trois pays d'importation cités mais quelques valeurs négatives pour les autres pays donc on le met en bas à droite. 

<center><img src="/ACP_main.png" alt="ACP à la main" width="45%" /></center>

---

# Formalisons les notions !





