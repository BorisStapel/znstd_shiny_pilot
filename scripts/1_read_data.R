library("magrittr")
library("rgdal")
library("leaflet")

#read shape data from geoJson

##TODO read data directly from geoserver##
sp_buurten <- readOGR(dsn = "data/buurten_zaanstad.geojson") %>% #read geojson 
  spTransform(CRS("+proj=longlat +datum=WGS84")) #transform to XY to longlat

sp_wijken <- readOGR(dsn = "data/wijken_zaanstad.geojson") %>% #read geojson 
  spTransform(CRS("+proj=longlat +datum=WGS84")) #transform to XY to longlat
