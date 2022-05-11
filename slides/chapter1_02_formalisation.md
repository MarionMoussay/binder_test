---
type: slides
---



# Formalisation

---

## Notations

Les données utilisées sont les mesures effectuées sur les _n_ individus pour _p_ variables. On le note _X_ et on le définit comme tel :

<center><img src="/tab_format.JPG" alt="Format du tableau de départ" width="25%" /></center>

Chaque individu ou variable peuvent être également écrits sous la forme vectorielle. On note alors, respectivement pour une individu _i_ et une variable _j_ :

<center><img src="/ind_var.JPG" alt="Format du tableau de départ" width="20%" /></center>

---

L'ensemble des points qui représentent les individus est appelé "nuage de points" et de manière équivalente, l'ensemble des points qui représentent les variables est appelé "nuage des variables". Le nombre de dimensions étant le plus souvent supérieure à deux, on ne peut pas visualiser ces représentations. Les méthodes factorielles telle que l'ACP permettent de visualiser ces points par la recherche de plans tels que les projection de ce nuage de points sur leurs axes permettent de reconstituer les positions des points. 

<center><img src="/plans_factoriels.JPG" alt="Format du tableau de départ" width="40%" /></center>

---

## Notion de distance

L'objectif, rappelons le, est de visualiser des similitudes entre individus qui formeraient plus ou moins un groupe homogène. La similitude entre deux points peut être mesurée par leur distance sur le plan. La distance entre deux individus est la distance euclidienne qu'on écrit comme :

<center><img src="/dist_euc.JPG" alt="Distance euclidienne" width="20%" /></center>

Toutes les variables jouent le même rôle et axes définis par les variables constituent une base orthogonale.

---

L'angle entre deux vecteurs peut se définir par son cosinus :

<center><img src="/cos.JPG" alt="cosinus" width="45%" /></center>

avec le produit scalaire qu'on note :

<center><img src="/prod_sca.JPG" alt="produit scalaire" width="20%" /></center>

et la norme d'un vecteur : 

<center><img src="/norme.JPG" alt="norme" width="20%" /></center>

et _o_ le point correspondant au vecteur de coordonnées nulles.
---

## Notion d'origine

Précédemment, l'origine utilisée est le vecteur de coordonnées nulles hors il ne s'agit pas de l'origine utilisée pour l'ACP. Si les individus sont éloignés de cette origine alors le nuage de point l'est également et en terme de représentation ce n'est pas pertinent. 

On choisit le centre de gravité qui est alors directement lié au nuage de points lui-même. Le poids de chaque individu est le même pour une ACP et ainsi on le définit tel quel : 

<center><img src="/gravite.JPG" alt="norme" width="25%" /></center>

---

## Centrage 

Utiliser _G_ comme point d'origine implique de travailler sur des données centrées tel que : 

<center><img src="/centrage.JPG" alt="norme" width="30%" /></center>

---

## Moments d'inertie

### Inertie totale 

L'inertie totale représente le moment d'inertie des individus par rapport au centre de gravité. Il s'agit d'une mesure de dispersion du nuage des individus par rapport à son centre de gravité. Plus le nuage est dispersé, plus l'inertie sera grande.

<center><img src="/inertie_totale.JPG" alt="inertie totale" width="30%" /></center>

### Inertie du nuage des individus par rapport à un axe passant par G

Lorsqu'on mesure l'inertie du nuage des individus par rapport à un axe passant par G représente la somme des distances entre les coordonnées des individus et leur projeté sur cet axe pondéré par le nombre d'individus, on le note :

<center><img src="/inertie_axe.JPG" alt="inertie totale" width="10%" /></center>

---

On peut représenter cette distance de cette manière : 

<center><img src="/inertie_axe_graph.JPG" alt="inertie totale" width="20%" /></center>

### Inertie du nuage des individus par rapport à un sous-espae vectoriel V passant par G 

De la même manière que précédemment, on définit l'inertie d'un nuage d'individus à un sous espace vectoriel _V_ la somme des distances entre les coordonnées des individus et leur projection orthogonale sur le sous espace, pondéré par le nombre d'individus.

<center><img src="/inertie_sev.JPG" alt="inertie totale" width="10%" /></center>

--- 

## Décomposition de l'inertie totale

Le théorème de Huygens explique : 

<center><img src="/huygens.JPG" alt="huygens" width="10%" /></center>

Il est déduit du fait que si on appelle _V*_ le complémentaire orthogonal de V et qu'on applique le théorème de pythagore on a :

<center><img src="/huygens_pythagore.JPG" alt="huygens" width="10%" /></center>


--- 