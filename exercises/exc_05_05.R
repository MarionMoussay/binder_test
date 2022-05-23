res.napping <- MFA(napping,group=rep(2,60),type=rep("c",60),name.group=paste("S",1:60,sep=""),graph=FALSE)
plot.MFA(res.napping,choix="ind",habillage="none")
