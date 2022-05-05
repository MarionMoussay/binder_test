---
type: slides
---



# Introduction

---

# Main objective

The main objective of this tutorial is to allow you to manipulate some R code applied to the analysis of sensory data.

In this tutorial, you will experience what could be called a controlled environment. In this environment, we hope that you will be able to learn R and the analysis of sensory data without too many problems. 

You will be asked (1) to answer to all the questions of this tutorial, (2) to save the code that you will generate, and of course (3) to comment this code, just in case you would forget what it means in a couple of days.

Don't hesitate to use the hint button, it should give you suggestions in order to answer the questions more easily.
![](https://github.com/MarionMoussay/binder_test/blob/master/image/perception-sensorielle.png?raw=true)

---

# The chocolates data

The data used here refer to six varieties of chocolates sold in France.

- For the sensory description: each chocolate was evaluated twice by 29 panellists according to 14 sensory descriptors;

- For the hedonic data: each chocolate was evaluated on a structured scale from 0 to 10, by 222 consumers, according to their liking (0) or disliking (10);

---

# Test 

```r
gam.check(mod)
```

```out
Method: REML   Optimizer: outer newton
full convergence after 9 iterations.
Gradient range [-0.0001467222,0.00171085]
(score 784.6012 & scale 2.868607).
Hessian positive definite, eigenvalue range [0.00014,198.5]
Model rank =  7 / 7 

Basis dimension (k) checking results. Low p-value
(k-index<1) may indicate that k is too low, especially
if edf is close to k'.

        k'  edf k-index p-value    
s(x1) 3.00 1.00    0.35  <2e-16 ***
s(x2) 3.00 2.88    1.00    0.52    
 ---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1
```

---

# Let's practice !

Notes: The next point allows to practice on the dataset introduced.
