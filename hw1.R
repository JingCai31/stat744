library(tidyverse)
## BMB: ggplot2 is loaded as part of tidyverse (redundant)
#>> JC: deleted

## BMB: why not use the built-in iris data set in R, which already comes
##  with column names?
#>> JC: updated

#### data iris ####
# This dataset contains 5 variables and 150 rows
# First four columns are continuous representing the sepal length and width,
# petal length and width.
# Last column is the type of iris, which is categorical 
dat2<-iris

## plot 1 ##
# plot of the petal length vs. petal width for three types of iris
# linear regression lines added to each type
gg1<-(ggplot(dat2,aes(Petal.Length,Petal.Width,colour=Species))
      +geom_point()
      +geom_smooth(method="lm")  ## BMB: why lm rather than loess? 
                                 #>> JC: lm uses simple linear model, then the slopes for different species can be compared.
      +theme(plot.title = element_text(hjust = 0.5))
      +ggtitle("Petal Length vs. Petal Width")  ## redundant? #>> JC: I just thought there must be a plot title
      )

## BMB: why are you adding scale_color_manual separately?
#>> JC: 1. I like green. 2. I want the colour consistent in all plots. 3. If using "Green" palette, the points for species 
#>> setosa are invisible.
print(gg1
      +scale_color_manual(values=c("#A1D99B","#41AB5D","#005A32")))

## plot 2 ##
# boxplot of sepal length-width ratio for three types of iris
gg2<-(ggplot(dat2,
             aes(Species,Sepal.Length/Sepal.Width,fill=Species))
      +geom_boxplot()
      +theme(plot.title = element_text(hjust = 0.5))
      +ggtitle("boxplot of sepal length-width ratio")
      )
print(gg2+scale_fill_brewer(palette="Greens"))

## plot 3 ##
# add one column to the original data - the area of sepal, approximate to ellipse
# histogram (in dot) of the sepal area to visualize the distribution
# type of iris is not considered in this plot

## BMB: could use dat2 %>% mutate(area=pi*Slength*Swidth/4)
#>> JC: updated
dat3<-(dat2
       %>% mutate(area=pi*Sepal.Length*Sepal.Width/4))
gg3<-(ggplot(dat3,aes(x=area))
      +geom_dotplot(aes(fill = ..x..),method = "histodot",binwidth = 0.7)
      +theme(plot.title = element_text(hjust = 0.5))
      +ggtitle("dotplot of sepal area")
      )
print(gg3+scale_fill_gradient(low = "forestgreen", high = "darkseagreen1"))

## JC: Change dotplot to density plot
gg3<-(ggplot(dat3,aes(x=area))
      +geom_density()
      +theme(plot.title = element_text(hjust = 0.5))
      +ggtitle("density plot of sepal area")
)
print(gg3)

## BMB: did you use anything you learned from Rauser's video?
#>> JC: comments on the plots

#>> Colour: I used green in all three plots to make them consistent, and set some of the colours mannually to ensure both the
#>> visibility and contrast.

#>> Method: plot 1 - normally, the petal width increases by the petal length, and for the same species, the petals have similar
#>> shape. Then I wanted to model the data with simple linear regression. If the plots for three species have apparently 
#>> different slope and intercept, then they can be distinguished by the petal length and width data.
#>> plot 2 - The goal for plot 2 is similar to plot 2, while the data for sepal and boxplots are used. Comparing to plot 1, 
#>> only the information for the lenth-width ratio (slope in plot 1) is included, however, the variation can be seen.
#>> plot 3 - I used dotplot because I though each bubble in the dotplot represent each datapoint. When I double check it, I 
#>> found it did not. Then I changed it to density plot.


