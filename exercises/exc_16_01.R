library(FactoMineR)
res.pca <- PCA(res.decat$adjmean, graph = FALSE)
names(res.pca)

