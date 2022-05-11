---
type: slides
---



# Introduction

---

## Historique et proposition d'analyse 

Une des méthodes descriptives multidimensionnelles est l'analyse en composantes principales. Elle propose à partir d'un tableau de données de _p_ variables quantitatives pour _n_ individus des représentations géométriques. Elles permettent de voir s'il existe une structure non connue à priori sur cet ensemble d'individus. On cherche donc à distinguer des groupes d'individus dans l'ensemble de l'échantillon qui reposent sur une similarité définie au préalable. Du point de vue des variables, l'objectif est de définir celles qui sont corrélées ou non entre elles. 

Les interprétations qui peuvent être issues d'une ACP reposent sur l'origine du recueil de données et du problème qui est posé au début de l'étude. L'ACP ne représente pas une fin en soi mais elle permet de mieux connaître les données sur lesquelles on travaille et à détecter d'éventuelles valeurs aberrantes ou encore à formuler des hypothèses qui peuvent être ensuite étudiées sur la base d'autres outils statistiques. 


<center><img src="/echantillonnage.jpeg" alt="Echantillonnage" width="25%" /></center>

---

## Introduction avec un exemple de data

La Direction Générale des Impots publie au Journal Officiel une Statistique Mensuelle des Vins le 4 novembre 1987. Voici le tableau qui croise des catégories de vins avec des pays exportateurs. L'unité commune est l'hectolitre. Voici les résultats pour 5 différents vins :

 ID | BELGIQUE | NEDERLAND | RFA | ITALIE | UK | SUISSE | USA | CANADA
 :--: |:--: |:--: |:--: |:--: |:--:|:--: |:--: |:--: 
 CHMP | 7069 | 3786 | 12578 | 8037 | 13556 | 9664 | 10386 | 206
 MOS1 | 2436 | 586 | 2006 | 30 | 1217 | 471 | 997 | 51
 MOS2 | 3066 | 290 | 10439 | 1413 | 7214 | 112 | 3788 | 330
 ALSA | 2422 | 1999 | 17183 | 57 | 1127 | 600 | 408 | 241
 GIRO | 22986 | 22183 | 21023 | 56 | 30025 | 6544 | 13114 | 3447
 BOJO | 17465 | 19840 | 72977 | 2364 | 39919 | 17327 | 17487 | 2346
 
L'objectif est alors ici d'identifier des groupes parmis ces 6 individus que représentent les vins. 

---

La première étape consiste à centrer et réduire les données. Cela signifie que pour chaque valeur d'une variable _j_, on soustrait l'observation avec la moyenne de la colonne et on la divise par l'écart type de cette même colonne.

On obtient alors le tableau suivant : 

 ID | BELGIQUE | NEDERLAND | RFA | ITALIE | UK | SUISSE | USA | CANADA
 :--: |:--: |:--: |:--: |:--: |:--:|:--: |:--: |:--: 
 CHMP | -0.245 | -0.429 | -0.398 | 1.944 | -0.122 | 0.564 | 0.384 | -0.626
 MOS1 | -0.768 | -0.746 | -0.813 | -0.631 | -0.890 | -0.773 | -0.956 | -0.734
 MOS2 | -0.697 | -0.775 | -0.482 | -0.186 | -0.516 | -0.826 | -0.558 | -0.539
 ALSA | -0.770 | -0.606 | -0.217 | -0.622 | -0.895 | -0.755 | -1.040 | -0.601
 GIRO | 1.552 | 1.394 | -0.066 | -0.623  | 0.904 | 0.110 | 0.773 | 1.633
 BOJO | 0.929 | 1.162 | 1.974 | 0.119 | 1.519 | 1.679 | 1.397 | 0.866

Cette étape très importante permet de pouvoir comparer les individus entre eux par rapport à une valeur de référence qui est celle en 0. De plus, en divisant par l'écart type, chaque individu possède le même poids qui est de 1. On nomme chaque variable, après centrage réduction, comme une variable _Z_ en référence au _z score_. Il représente le nombre d'écart-type d'un individu au dessus ou en dessous de la moyenne. Il permet ainsi de juger s'il est significativement probable ou non de nouveau observer une différence entre l'observation d'une variable et de sa moyenne, pour un individu, au moins aussi grande. De ce fait, on peut distinguer les individus ordinaires des individus extraordinaires. Ces derniers représentent les individus les plus éloignés de la moyenne, c'est à dire ceux avec un _z-score_ plus élevé.

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





