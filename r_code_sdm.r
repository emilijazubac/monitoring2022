#SDM package at work
 install.packages("sdm")
# install.packages("rgdal", dependencies=T)
library(sdm)
library(raster) 
library(rgdal) 
file <- system.file("external/species.shp", package="sdm") 
library(raster)
species <- shapefile(file)
# looking at the set
species

# plot
plot(species)

# looking at the occurrences
species$Occurrence
species
species$Occurrence
# copy and then write:
plot(species[species$Occurrence == 1,],col='blue',pch=16)
absences <- species [species$occurrence == 0,]
points(species[species$Occurrence == 0,],col='red',pch=16) 
path <- system.file("external", package="sdm") 
lst <- list.files(path=path,pattern='asc$',full.names = T) #
lst
# stack
preds <- stack(lst)
# plot preds
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)
# plot predictors and occurrences
plot(preds$elevation, col=cl)
points(species[species$Occurrence == 1,], pch=16)

plot(preds$temperature, col=cl)
points(species[species$Occurrence == 1,], pch=16)

plot(preds$precipitation, col=cl)
points(species[species$Occurrence == 1,], pch=16)

plot(preds$vegetation, col=cl)
points(species[species$Occurrence == 1,], pch=16)

# model

# set the data for the sdm
datasdm <- sdmData(train=species, predictors=preds)

# model
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")

# make the raster output layer
p1 <- predict(m1, newdata=preds) 

# plot the output
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=16)
# add to the stack
s1 <- stack(preds,p1)
plot(s1, col=cl)

# Do you want to change names in the plot of the stack?
# Here your are!:
# choose a vector of names for the stack, looking at the previous graph, qhich are:
names(s1) <- c('elevation', 'precipitation', 'temperature', 'vegetation', 'model')
# and then replot!:
plot(s1, col=cl)
# you are done, with one line of code (as usual!) 
