## This is a plot of the path of Statistic courses in McMaster University
library(igraph)

nw<- graph( c("Stats2D03","Stats2MB3","Stats2D03","Stats3S03", "Stats2D03","Stats3PG3","Stats2D03","Stats4D03",
               "Stats3A03","Stats4A03","Stats3A03","Stats4D03","Stats3D03","Stats4A03","Stats3D03","Stats4I03",
               "Stats3G03","Stats3H03"), 
             isolates=c("Stats2B03","Stats3Y03","Stats3U03"))  
plot(nw, edge.arrow.size=.5, vertex.color="darkred", vertex.size=10,
     vertex.frame.color="gray", vertex.label.color="black",vertex.label.cex=0.7) 

