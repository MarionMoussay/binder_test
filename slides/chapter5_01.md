---
type: slides
---

---

## Objectives

The main objective of napping is to understand why stimuli are perceived differently for each subject and extend these reasons to all subjects. For this, they are asked to position stimuli on an A4 sheet (40x60) and the positions of each stimuli are implemented in a data frame. Here a stimuli corresponds to a product.

<center><img src="/nappingA4.JPG" width="35%" /></center>

---

This method has its source in two elements:

- _Projective test_, Risvik (1994) : based on psychoanalytic psychology, which argues that humans have conscious and unconscious attitudes and motivations that are beyond or hidden from conscious awareness. The idea of positioning stimuli on a sheet of paper based on their perceived similarities arose in sensory analysis, as well as the idea of statistically analyzing this type of information. In their paper, the authors proposed to use Generalized Procrustes Analysis (GPA) to analyze such data.
 
- _Napping_, Pagès (2005) : the protocol consists in positioning products (more generally, stimuli) on a rectangle, according to their resemblances and differences. Two products are close if they are perceived as similar; on the contrary, two products are distant as they are perceived as different.

Here both points of view are taken into account. The fact that it is a rectangle individuals implicitly take into account a first dimension and then a second one when placing the products. In Napping, the specified dimensions of the rectangle, on which stimuli are positioned, render the method unique (60 cm by 40 cm). The main feature of this method is to reveal and to order the first two dimensions of variability for each subject: as it is rectangular (and not square nor round), the subject implicitly opposes products with respect to the first dimension, at first, and with respect to the second dimension, in a second time. Additionally, Napping provides the possibility to describe products, or groups of products, using free text comments. This feature is of utmost importance, as without this information the interpretation of the sensory dimensions of the product space is impossible. Finally, if additional data are available (e.g., free text comments), we would like to be able to relate the product space to this additional information to deepen the interpretation of the product space.

---

## Formalization

- statistical units of interest : products (_I_) ; measured in function of their positions on the rectangle by _J_ subjects;
- _x-axis_ : 0 to 60;
- _y-axis_ : 0 to 40;

The dataset <img src="https://render.githubusercontent.com/render/math?math=X=(x_{ik})_{\text{I}\times\text{2J}}"> is such that <img src="https://render.githubusercontent.com/render/math?math=x_{ik}"> presents the coordinate of product _i_ on the _x-axis_ (for _k = 2j − 1_), or on the _y-axis_ (for _k = 2j_) for subject _j_.

<center><img src="/matrice_napping.JPG" width="25%" /></center>

---

## Example of data set

```{r}
napping <- read.table("data/perfumes_napping.csv",header=TRUE,sep=",",dec=".",row.names=1)
summary(napping[,1:9])
```

```{out}
       X1              Y1              X2              Y2              X3              Y3              X4              Y4              X5       
 Min.   : 3.30   Min.   : 8.20   Min.   : 2.00   Min.   : 3.70   Min.   : 6.00   Min.   : 4.70   Min.   : 7.10   Min.   : 5.60   Min.   : 2.20  
 1st Qu.:15.47   1st Qu.:18.95   1st Qu.:26.55   1st Qu.:10.78   1st Qu.:11.07   1st Qu.:20.00   1st Qu.:15.32   1st Qu.:13.72   1st Qu.:17.25  
 Median :20.35   Median :31.85   Median :29.50   Median :20.55   Median :26.55   Median :29.20   Median :25.80   Median :20.30   Median :25.40  
 Mean   :27.13   Mean   :26.64   Mean   :29.58   Mean   :17.85   Mean   :25.65   Mean   :23.15   Mean   :28.32   Mean   :19.45   Mean   :22.33  
 3rd Qu.:44.33   3rd Qu.:33.48   3rd Qu.:34.98   3rd Qu.:22.50   3rd Qu.:36.25   3rd Qu.:29.32   3rd Qu.:41.62   3rd Qu.:25.02   3rd Qu.:29.12  
 Max.   :57.50   Max.   :37.80   Max.   :56.00   Max.   :37.20   Max.   :54.50   Max.   :29.60   Max.   :55.90   Max.   :35.20   Max.   :42.00  

```
---

## Plotting the map for one subject

```{r}
rectangle <- function(data,i){
  plot(data[,((i-1)*2+1):(i*2)],col="blue",xlim=c(0,60),
  ylim=c(0,40),xlab="",ylab="",
  main=paste("Napping: Subject ",i,sep=""),type="n",asp=1)
  points(data[,((i-1)*2+1):(i*2)],col="blue",pch=20)
  text(data[,((i-1)*2+1):(i*2)],
  label=rownames(data),col="blue",pos=3,offset=0.2)
}

rectangle(napping,38)
```
<img src="/napping_example.JPG" width="35%" />
