source("scripts/0_request_data.R")
library("tidyverse")
library("rgdal")
library("leaflet")

# request_data() refresh geo data
#read shape data from geoJson

##TODO read data directly from geoserver##
sp_buurten <- readOGR(dsn = "data/buurt_zaanstad.geojson") %>% #read geojson 
  spTransform(CRS("+proj=longlat +datum=WGS84")) #transform to XY to longlat

sp_wijken <- readOGR(dsn = "data/wijk_zaanstad.geojson") %>% #read geojson 
  spTransform(CRS("+proj=longlat +datum=WGS84")) #transform to XY to longlat


df <- read_csv2("data/data.csv")


