install.packages("caper")
library(caper)

## Open tree
tree1<- read.tree("dated.tree")
tree1
plot(tree1)
nodelabels()
tree2 <- extract.clade(tree1, node=21)
plot(tree2)


## Open dataset
data1 <- read.table("REF.txt", header=T, sep=",")
data1
data1[,2]<-log(data1$REF)
data1

data2 <- read.table("gs.txt", header=T, sep = ",")
data2
data2[,2]<-log(data2$GS)
data2

data3 <- merge(data1,data2,by="sp")
data3


datacomp <- comparative.data(tree2,data3,sp, vcv = T, vcv.dim=3)

pgls <- pgls(GS~REF, datacomp, lambda="ML", delta="ML", kappa="ML")
summary(pgls)

pgls2 <- pgls(REF~GS, datacomp, lambda="ML", delta="ML", kappa="ML")
summary(pgls2)
