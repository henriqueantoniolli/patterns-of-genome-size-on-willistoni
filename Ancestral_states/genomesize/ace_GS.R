install.packages(c("ape","phytools"), dep=T)
library(ape)
library(phytools)

## Open tree
tree1<- read.tree("supermatrix.dated.tree")
plot(tree1)

## Open dataset
data3 <- read.table("gs.txt", header=T,sep="\t", row.names = "sp")
data4 <- as.matrix(data3)[,1]
data4

## Plotting ASR on the tree
final_tree_GS <- contMap(tree1, data4, outline = F)
n<-length(final_tree_GS$cols)
final_tree_GS$cols[1:n]<-colorRampPalette(c("#fde725","#5ec962","#21918c","#3b528b","#440154"), space="Lab")(n)
plot(final_tree_GS, outline = F, lwd=5, leg.txt="Genome Size (Mb)")
