library(SensoMineR)
res.decat <- decat(experts,formul="~Product+Panelist+Session",firstvar=5, lastvar=ncol(experts),graph=FALSE)