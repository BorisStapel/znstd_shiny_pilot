source("scripts/0_request_data.R")
library("tidyverse")
library("rgdal")
library("leaflet")

# request_data() refresh geo data
#read shape data from geoJson

##TODO read data directly from geoserver##
sp_buurten <- readOGR(dsn = "data/buurt_zaanstad.geojson", stringsAsFactors = F) %>% #read geojson 
  spTransform(CRS("+proj=longlat +datum=WGS84")) #transform to XY to longlat

sp_wijken <- readOGR(dsn = "data/wijk_zaanstad.geojson", stringsAsFactors = F) %>% #read geojson 
  spTransform(CRS("+proj=longlat +datum=WGS84")) #transform to XY to longlat


df <- read_csv2("data/data.csv") %>% 
  mutate(periode = lubridate::ymd(paste0(periode,"01"))) %>%
  left_join(read_csv2("data/ordered_categorie.csv"), by = "categorie")



save.image("~/Documents/DataScience/Zaanstad/znstd_shiny_pilot/data/data_env.RData")