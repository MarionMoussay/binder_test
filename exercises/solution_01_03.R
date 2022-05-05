library(SensoMineR)
data(chocolates)

res <- AovSum(Sweetness~Product+Panelist,data=sensochoc)
names(res)