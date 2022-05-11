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
---

Before choosing and presenting the analysis of such particular data, let’s present our expectations from them. The analysis of <img style="margin-bottom:0rem" src="https://render.githubusercontent.com/render/math?math=\,\Large X\,"> should provide a representation of the products based on the J matrices <img style="margin-bottom:-0.75rem" src="https://render.githubusercontent.com/render/math?math=\,\Large X{j}\,">. Similarly to the evaluation of the product space in QDA (cf. Chapter 2), the differences between products should be understandable and interpretable. However, such product configuration should not be related to one particular panelist only (_i.e._, the analysis should not be dominated by one matrix <img style="margin-bottom:-0.75rem" src="https://render.githubusercontent.com/render/math?math=\,\Large X{j}\,"> ),

---

De ce premier tableau centré-réduit, il est déjà possible d'en tirer des hypothèses sur les groupes d'individus.

<center><img src="/analyse_tab_cr.JPG" alt="analyse tableau cr" width="100%" /></center>

On voit ici que le mousseux AOC (MOS1), un autre mousseux (MOS2) et le vin d'Alsace (ALSA) possèdent des valeurs très similaires pour les pays d'exportations que sont la Belgique, les Pays-Bas et le Canada. On peut alors déjà supposer qu'ils appartiennent au même groupe. 

---

En optant pour un seul groupe pour les vins MOS1, MOS2 et ALSA et en les placant dans un repère quelconque on peut en déduire la position des 3 autres individus. On prend comme repère vertical les trois pays d'importation utilisé pour définir le précédent groupe : Canada, Belgique et Pays-Bas. 

Toutes leurs observations sont négatives donc on les positionne en bas à gauche. Le champagne (CHMP) possède des valeurs négatives pour les mêmes pays d'exportation que le précédent groupe définie donc on le met en haut à gauche. Le vin beaujolais (BOJO) se voit avoir toutes ses valeurs positives donc on le positionne en haut à droite. Le dernier vin, le Giro italien (GIRO) possède des valeurs positives pour les trois pays d'importation cités mais quelques valeurs négatives pour les autres pays donc on le met en bas à droite. 

<center><img src="/ACP_main.png" alt="ACP à la main" width="45%" /></center>

---

# Formalisons les notions !





