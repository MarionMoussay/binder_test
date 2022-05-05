library(SensoMineR)
data(chocolates)

resdecat <- decat(sensochoc, formul="~Product+Panelist", firstvar = 5)