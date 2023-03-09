if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("PCAtools")


library("PCAtools")

##PCA on copy number
dados <- read.csv("copy_number.csv", header=T, row.names = "A")
dados
dados2 <- log(dados+1)
dados2

metadata <- data.frame(row.names = colnames(dados2))

p1<-pca(mat=dados2, metadata=metadata)
biplot(p1, pointSize = 5, labSize = 5)
biplot(p1, showLoadings = TRUE,
       labSize = 3.75, pointSize = 3, sizeLoadingsNames = 5)

##PCA on total length
dados3 <- read.csv("total_length_LOG.csv", row.names = "A")
dados3
metadata <- data.frame(row.names = colnames(dados3))

p2<-pca(mat=dados3, metadata=metadata)
biplot(p2, pointSize = 5, labSize = 5)
biplot(p2, showLoadings = TRUE,
       labSize = 3.75, pointSize = 3, sizeLoadingsNames = 5)
