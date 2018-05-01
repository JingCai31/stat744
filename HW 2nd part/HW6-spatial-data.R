## This data is from Police London
## street-level crime, outcome, and stop and search information are provided
## I selected force of Avon and Somerset Constabulary
## numbers of crime are clustered in circle
## keep zooming in, blue icons will appear, which represents individual crime
## by clicking the blue icon, the crime type will pop up.

## JD: Looks nice, but why are most of the crimes far from London?

library(leaflet)
library(tidyverse)
crime_london<-read.csv("2018-02-avon-and-somerset-street.csv")%>%
  select(c(Longitude,Latitude,Crime.type))%>%
  drop_na()
leaflet(crime_london) %>%
  addProviderTiles(providers$CartoDB.DarkMatter) %>%
  addMarkers(lng = crime_london$Longitude, lat = crime_london$Latitude,
             clusterOptions = markerClusterOptions(),popup=paste0(crime_london$Crime.type))
