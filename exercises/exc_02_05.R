library(FactoMineR)

res.pca38.std <- PCA(napping[,75:76],scale.unit=TRUE,graph=FALSE)
res.pca38.unstd <- PCA(napping[,75:76],scale.unit=FALSE,graph=FALSE)

par(mfrow=c(1,2))
plot.PCA(res.pca38.std,choix="ind",title="Napping: Subject 38 (Standardized)")
plot.PCA(res.pca38.unstd,choix="ind",title="Napping: Subject 38 (Unstandardized)")

