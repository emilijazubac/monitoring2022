 install.packages(c("raster","RStoolbox"))
library(raster)
library(RStoolbox)
#rasterbrick is a file with more layers formed from pixels with the valu of the reflextants
#grd is the type of file we are using
#masked means that part of the data was cleaned
setwd("C:/lab/")
p224r63_2011 <- brick("p224r63_2011_masked.grd")

p224r63_2011

plot(p224r63_2011)

cl <- colorRampPalette(c('black','grey','light grey'))(100) # 
plot(p224r63_2011, col=cl)


par(mfrow=c(2,2))

clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # 
plot(p224r63_2011$B1_sre, col=clb)

clg <- colorRampPalette(c('dark green','green','light green'))(100) # 
plot(p224r63_2011$B2_sre, col=clg)

clr <- colorRampPalette(c('dark red','red','pink'))(100) # 
plot(p224r63_2011$B3_sre, col=clr)

