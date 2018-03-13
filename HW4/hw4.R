library(tidyverse)
library(dplyr)
dat1<-read_csv("hw3-data2.csv")
head(dat1)

dat2 <- (dat1
         %>% rename(p7=auc) # column name was "auc", but I cannot stop the automatic ordering in the following gathering
         %>% gather(key=method,value=val,-c(type,rt,distr,or,hetero,parameter),convert=FALSE) 
         %>% spread(key=parameter,value=val) 
)
View(dat2)
head(dat2)

dat3<-(dat2
       %>% rbind(dat2
                 %>% filter(type=="base")
                 %>% mutate(type="ratio"))
       %>% rbind(dat2
                 %>% filter(type=="base")
                 %>% mutate(type="odds.ratio"))
       %>% rbind(dat2
                 %>% filter(type=="base")
                 %>% mutate(type="heterogeneity"))
       %>% mutate(type=ifelse(type=="base","distribution",type))
       %>% mutate(rt=factor(rt))
       %>% mutate(or=factor(or))
       %>% mutate(hetero=factor(hetero))
)
View(dat3)

subdat1<-filter(dat3, type=="distribution")
gg1 <- (ggplot(subdat1,aes(method,mean,colour=distr)) 
        + geom_point(aes(method,mean))
        + geom_point(aes(method,theoretical),colour="black")
        + geom_ribbon(aes(ymin=mean-se,ymax=mean+se,group=distr,fill=distr), 
                      colour=NA,alpha=0.3)
        + facet_grid(~distr)
        + labs(x="method",y="theoretical,mean+/-se")
        + scale_colour_brewer(palette="Dark2") + scale_fill_brewer(palette="Dark2")
        )
print(gg1)

subdat2<-filter(dat3, type=="ratio")
gg2 <- (ggplot(subdat2,aes(method,mean,colour=rt)) 
        + geom_point(aes(method,mean))
        + geom_point(aes(method,theoretical),colour="black")
        + geom_ribbon(aes(ymin=mean-se,ymax=mean+se,group=rt,fill=rt), 
                      colour=NA,alpha=0.3)
        + facet_grid(~rt)
        + labs(x="method",y="theoretical,mean+/-se")
        + scale_colour_brewer(palette="Dark2") + scale_fill_brewer(palette="Dark2")
)
print(gg2)

subdat3<-filter(dat3, type=="odds.ratio")
gg3 <- (ggplot(subdat3,aes(method,mean,colour=or)) 
        + geom_point(aes(method,mean))
        + geom_point(aes(method,theoretical),colour="black")
        + geom_ribbon(aes(ymin=mean-se,ymax=mean+se,group=or,fill=or), 
                      colour=NA,alpha=0.3)
        + facet_grid(~or)
        + labs(x="method",y="theoretical,mean+/-se")
        + scale_colour_brewer(palette="Dark2") + scale_fill_brewer(palette="Dark2")
)
print(gg3)

subdat4<-filter(dat3, type=="heterogeneity")
gg4 <- (ggplot(subdat4,aes(method,mean,colour=hetero)) 
        + geom_point(aes(method,mean))
        + geom_point(aes(method,theoretical),colour="black")
        + geom_ribbon(aes(ymin=mean-se,ymax=mean+se,group=hetero,fill=hetero), 
                      colour=NA,alpha=0.3)
        + facet_grid(~hetero)
        + labs(x="method",y="theoretical,mean+/-se")
        + scale_colour_brewer(palette="Dark2") + scale_fill_brewer(palette="Dark2")
)
print(gg4)
# set different x axis space?


gg5 <- (ggplot(dat3,aes(method,mean,colour=interaction(rt,distr,or,hetero))) 
        + geom_point()
        + geom_point(aes(method,theoretical),colour="black")
        + geom_ribbon(aes(ymin=mean-se,ymax=mean+se,group=interaction(rt,distr,or,hetero),
                          fill=interaction(rt,distr,or,hetero)), 
                      colour=NA,alpha=0.3)
        + facet_grid(~type)
        + labs(x="method",y="theoretical,mean+/-se")
)
print(gg5)
