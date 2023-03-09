table <- read.table("table.txt", header=T, sep=",")
table

## Test of normality
shapiro.test(table$others)
shapiro.test(table$wil_salt)

## Wilcoxon test
wilcox.test(table$others,table$wil_salt, correct=F, exact=F, conf.int = T)
