library(SensoMineR)
data(chocolates)

res <- AovSum(CocoaA~Product+Panelist,data=sensochoc)