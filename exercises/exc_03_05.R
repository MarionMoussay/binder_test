res.pca57.unstd1 <- PCA(napping[,113:114],scale.unit=FALSE,graph=FALSE)
res.pca38.unstd1 <- PCA(napping[,75:76],scale.unit=FALSE,graph=FALSE)

res.pca57.unstd2 <- PCA(napping[,113:114]/sqrt(res.pca38.unstd$eig[1,1]),scale.unit=FALSE,graph=FALSE)
res.pca38.unstd2 <- PCA(napping[,75:76]/sqrt(res.pca57.unstd$eig[1,1]),scale.unit=FALSE, graph=FALSE)



