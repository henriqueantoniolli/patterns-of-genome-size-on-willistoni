install.packages(c("ape","phytools","nlme","tidyverse","ggpubr","ggplot2"), dep=T)
library(ape)
library(nlme)
library(phytools)
library(tidyverse)
library(ggpubr)
library(ggplot2)
theme_set(theme_pubr())


## Open tree
tree1<-read.tree("supermatrix.dated.tree")
tree1
plot(tree1)

## Open dataset
data1 <- read.table("REF.txt", header=T, sep="\t")
data1
data1[,2]<-log(data1$REF)
data1

data2 <- read.table("gs.txt", header=T, sep = "\t")
data2
data2[,2]<-log(data2$GS)
data2

data3 <- merge(data1,data2,by="sp")
data3

###PGLS

pglsModel1 <- gls(GS~REF, correlation = corPagel(1,phy = tree1, form= ~sp), data = data3, method = "ML")
summary(pglsModel1)

pglsModel2 <- gls(REF~GS, correlation = corPagel(1,phy = tree1, form= ~sp), data = data3, method = "ML")
summary(pglsModel2)
coef(pglsModel2)


colors <- c("#fde725","#8bd646","#42be71","#1fa088","#2a768e","#3f4889","#472e7c","#440154")

plot(data3$REF~data3$GS, xlab="Genome Size (ln)", ylab="Fraction of TEs (ln)", col=colors, cex=1.2,pch=19,
     main="Phylogenetic Generalized Least Squares (PGLS)")
abline(pglsModel2,col="red")

       