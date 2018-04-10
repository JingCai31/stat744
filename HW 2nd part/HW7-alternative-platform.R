## This is a plot of the path of Statistic courses in McMaster University
library(networkD3)

source<-c(0,0,0,0,1,2,2,3,3,6)
target<-c(2,4,5,10,0,8,9,9,10,7)
value<-rep(1,length(source))
Links<-data.frame(source,target,value)
name<-c("Stats2D03","Stats2MB3","Stats3A03","Stats3D03","Stats3G03","Stats3H03",
        "Stats3PG3","Stats3S03","Stats4A03","Stats4D03","Stats4I03")
group<-c(rep("second year",2), rep("third year",6), rep("fourth year", 3))
size<-rep(1,length(name))
Nodes<-data.frame(name,group,size)

forceNetwork(Links = Links, Nodes = Nodes, Source = "source",
             Target = "target", Value = "value", NodeID = "name",
             Group = "group", opacity = 1, fontSize = 16 , arrows = TRUE,
             zoom = TRUE, legend = TRUE)
