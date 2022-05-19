library(SensoMineR)
res.decat <- decat(experts,formul="~Product+Panelist",firstvar=5, lastvar=ncol(experts),graph=FALSE)

mat <- res.decat$adjmean
