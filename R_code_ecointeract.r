# This is a code for investigating relationships among ecological variables
# install.packages is used to install packages install.packages("sp")
library(sp)
# data is used to recall datasets
data(meuse)
#muse is used for like information from somewhere
head (meuse)
#head is used to view what is in meuse
View(meuse) # it might not work for mac
# solve using: https://www.xquartz.org

head(meuse)


# Exercise: mean of all of the variables?
# cadmium crazy mean extraction
# (11.7+8.6+6.5....)/N
summary(meuse)

# Exercise: plot zinc (y) against cadmium (x)
# error
plot(cadmium, zinc)
# Error in h(simpleError(msg, call)) : 
#  error in evaluating the argument 'x' in selecting a method for function 'plot': object 'cadmium' not found
# $

plot(meuse$cadmium, meuse$zinc)

# if you attach you do not need the dollar symbol!
attach(meuse)
plot(cadmium, zinc)

plot(cadmium,lead)

# how to impress your supervisor!
# Scatterplot Matrices
pairs(meuse)

# Question!!!
# pairing only the elements part of the dataset: how to do that?
# only with cadmium, copper, lead, zinc...
# Lecture #2 on ecological variables

# Exercise
# Recall the package sp, recall the dataset meuse

library(sp)
data(meuse)

pairs(meuse)

head(meuse)

# cadmium copper lead zinc
# pairs with soil variables
# from column 3 to column 6
pairs(meuse[,3:6]) # how to do quadratic parathenses: AltGr + è

# let's use the names of the columns:
pairs(~ cadmium + copper + lead + zinc, data=meuse) 
# tilde is going to be done by AltGr + ^
# in windows: Alt + 0126 or Alt + 126
# In Mac: alt + n on mac
pol <- meuse[,3:6]
head(pol) 
#head(pol) nly show you the first six rows so the head
# Lecture #2 on ecological variables

# Exercise
# Recall the package sp, recall the dataset meuse

library(sp)
data(meuse)

pairs(meuse)

head(meuse)

# cadmium copper lead zinc
# pairs with soil variables
# from column 3 to column 6
pairs(meuse[,3:6]) # how to do quadratic parathenses: AltGr + è

# let's use the names of the columns:
pairs(~ cadmium + copper + lead + zinc, data=meuse) 
# tilde is going to be done by AltGr + ^
# in windows: Alt + 0126 or Alt + 126
# In Mac: alt + n on mac

# let's prettify the graph
# Exercise: just use cadmium, lead and zince
pairs(~ cadmium + lead + zinc, data=meuse)

# Exercise: change the color
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red") 

# for the future change colours of single panels by the par() function 

# Exercise: change the symbol to filled triangles: pch
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red", pch=17) 

# nice page on pairs:
# https://statisticsglobe.com/r-pairs-plot-example/

# Exercise: increase the size of the trinagles
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red", pch=17, cex=3) 


# let's prettify the graph
# Exercise: just use cadmium, lead and zince
pairs(~ cadmium + lead + zinc, data=meuse)

# Exercise: change the color
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red") 

# for the future change colours of single panels by the par() function 

# Exercise: change the symbol to filled triangles: pch
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red", pch=17) 

# nice page on pairs:
# https://statisticsglobe.com/r-pairs-plot-example/

# Exercise: increase the size of the trinagles
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red", pch=17, cex=3) 
# R spatial

install.packages("sp")
library(sp)

data(meuse)

head(meuse)

coordinates(meuse) = ~x+y

plot(meuse)

# spplot is used to plot elements like zinc, lead etc. spread in space
spplot(meuse, "zinc", main="Concentration of zinc")

# Exercise: plot the concentration of Copper
spplot(meuse, "copper", main="Concentration of copper")

# Exercise: see copper and zinc
spplot(meuse, c("copper","zinc"))

# this is the same solution we used for te first lecture
# primates <- c(1,5,10)

# Rather than using colours, let's make us of bubbles
bubble(meuse, "zinc")

# do the same for lead
bubble(meuse, "lead")
bubble(meuse, "lead", col="red")
