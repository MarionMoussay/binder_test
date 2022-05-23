napping <- read.table("data/perfumes_napping.csv",header=TRUE,sep=",",dec=".",row.names=1)

rectangle <- function(data,i){
  plot(data[,((i-1)*2+1):(i*2)],col="blue",xlim=c(0,60),ylim=c(0,40),xlab="",ylab="",main=paste("Napping: Subject ",i,sep=""),type="n",asp=1)
  points(data[,((i-1)*2+1):(i*2)],col="blue",pch=20)
  text(data[,((i-1)*2+1):(i*2)],label=rownames(data),col="blue",pos=3,offset=0.2)
}

rectangle(napping,38)