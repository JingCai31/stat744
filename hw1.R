library(tidyverse)
library(ggplot2)

#### data iris ####
# This dataset contains 5 variables and 150 rows
# First four columns are continuous representing the sepal length and width,
# petal length and width.
# Last colomn is the type of iris, which is categorical 
dat2<-read.csv("iris.data",header=FALSE)
names(dat2)<-c("Slength","Swidth","Plength","Pwidth","class")

## plot 1 ##
# plot of the petal length vs. petal width for three types of iris
# linear regression lines added to each type
gg1<-(ggplot(dat2,aes(Plength,Pwidth,colour=class))
      +geom_point()
      +geom_smooth(method="lm")
      +theme(plot.title = element_text(hjust = 0.5))
      +ggtitle("Petal Length vs. Petal Width")
      )
print(gg1
      +scale_color_manual(values=c("#A1D99B","#41AB5D","#005A32")))

## plot 2 ##
# boxplot of sepal length-width ratio for three types of iris
gg2<-(ggplot(dat2,
             aes(class,Slength/Swidth,fill=class))
      +geom_boxplot()
      +theme(plot.title = element_text(hjust = 0.5))
      +ggtitle("boxplot of sepal length-width ratio")
      )
print(gg2+scale_fill_brewer(palette="Greens"))

## plot 3 ##
# add one column to the original data - the area of sepal, approximate to ellipse
# histogram (in dot) of the sepal area to visualize the distribution
# type of iris is not considered in this plot
dat2$area=pi*dat2$Slength*dat2$Swidth/4
gg3<-(ggplot(dat2,aes(x=area))
      +geom_dotplot(aes(fill = ..x..),method = "histodot",binwidth = 0.7)
      +theme(plot.title = element_text(hjust = 0.5))
      +ggtitle("dotplot of sepal area")
      )
print(gg3+scale_fill_gradient(low = "forestgreen", high = "darkseagreen1"))
