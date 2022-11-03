#community ecology example with R
#multivariate analasys
install.packages ("vegan")
library(vegan)
#vegetation ecology package
# setwd("path/lab") 
 setwd("C:/lab/")
 #we put a file data into lab folder
 #we used to read the table but today we are importing a complete r whatever so the xtention is RData so a complete R project with a lot of files
 load("biomes_multivar.RData")
 #to see the list of files inside the function is ls
ls()
# plot per species matrix
head(biomes)
multivar <- decorana(biomes)
multivar
plot(multivar)
# biomes names in the graph:
attach(biomes_types)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)

pdf("multivar.pdf")
plot(multivar)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)
dev.off()
