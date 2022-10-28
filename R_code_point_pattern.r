# install.packages("spatstat")
library(spatstat)
# setwd for Windows
setwd("C:/lab/")
covid <- read.table("covid_agg.csv", header=TRUE)
covid
# Now, let's see the density of the covid data!
# let's make a planar point pattern in spatstat
attach(covid)
# x, y, ranges
covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))

density_map <- density(covid_planar)

plot(density_map)
points(covid_planar)
cl <- colorRampPalette(c('yellow','orange','red'))(100) # 
plot(density_map, col = cl)
points(covid_planar)

# Exercise: change the colour of the map
cl <- colorRampPalette(c('blue','yellow','orange','red','magenta'))(100)  
plot(density_map, col = cl)
points(covid_planar)
# Install the rgdal package by:
# install.packages("rgdal")

library(rgdal)
library(spatstat)
setwd("C:/lab/")
#we are using the library and we are using this function readOGR and we have vectors
coastlines <- readOGR("ne_10m_coastline.shp")
coastlines
covid <- read.table("covid_agg.csv", header=TRUE)
head(covid)
covid_planar <- ppp(x=covid$lon,y=covid$lat, c(-180,180), c(-90,90))
plot(covid_planar)
we added the point and now are plotting the coastlines so we have both that is why it is add
plot(coastlines, add=T)
#calculating the density
density_map <- density(covid_planar)
plot(density_map)
#this whipes out the previous map but you can add it
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)
plot(density_map, col = cl)

plot(coastlines, add = TRUE)
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) 
#we want to see some parts
head(covid)
#now we want to see the exact  number of cases 
###### interpolate case data
attach(covid)
marks(covid_planar) <- cases
#notice Smooth is with a capital S
cases_map <- Smooth(covid_planar)
#you recieve a warning
plot(cases_map, col = cln)
points(covid_planar)
plot(coastlines, add = T)
#this point of wiev is looking at real values not density
