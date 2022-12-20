library(phytools)
library(ape)
library(nlme)
library(geiger)

## Open tree
tree1<- read.tree("supermatrix.dated.tree")
tree1

## Open datasets
data_REF <- read.table("REF.txt", header=T, sep="\t", row.names = "sp")
data_REF<-as.matrix(data_REF)
data_REF

data_GS <- read.table("gs.txt", header=T, sep="\t", row.names = "sp")
data_GS<-as.matrix(data_GS)
data_GS

## Pagel's lambda -- GS
lambda_GS <- phylosig(tree=tree1, x = data_GS, method = "lambda", test = T)
lambda_GS
## Bloomsberg's K -- GS
K_GS <- phylosig(tree=tree1, x = data_GS, method = "K", test = T)
K_GS

## Pagel's lambda -- REF
lambda_REF <- phylosig(tree=tree1, x = data_REF, method = "lambda", test = T)
lambda_REF
## Bloomsberg's K -- REF
K_REF <- phylosig(tree=tree1, x = data_REF, method = "K", test = T)
K_REF


