for (i in 1:5){
  print(paste0("Variance of component coordinates ", i, " : ", sum(res.pca$ind$coord[,i]^2)/n))
  print(paste0(i, "th eigen value : ",res.pca$eig[i]))
}