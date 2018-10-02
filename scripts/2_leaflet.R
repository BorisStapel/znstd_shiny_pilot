#visualize 
library("tidyverse")
library("leaflet")
# pal <- colorNumeric(c("green", "red"), range(sp_buurten$aant_inw))
# 
# leaflet(sp_buurten) %>% 
#   setView(zoom = 12, lat = 52.471, lng = 4.781678) %>% 
#   addTiles() %>%
#   addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = .8,
#               fillColor = ~pal(aant_inw))
# 
# 
# pal <- colorNumeric(c("green", "red"), range(sp_wijken$aant_inw))
# 
# leaflet(sp_wijken) %>% 
#   setView(zoom = 12, lat = 52.471, lng = 4.781678) %>% 
#   addTiles() %>%
#   addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = .8,
#               fillColor = ~pal(aant_inw))

##########################

load("data/data_env.RData")

dates <- #vector of unique dates
  df %>% 
  distinct(periode) %>% 
  arrange(as.Date(periode)) %>% 
  pull()

dt <- as.Date("2015-08-01")

df <- 
  df %>% 
  na.omit() %>% 
  filter(periode == dt)

sp_buurten@data <- 
data_frame(bu_naam = as.character(sp_buurten@data$bu_naam))

#add data to spDataframe
sp <- sp::merge(sp_buurten, df, by.x = "bu_naam", by.y = "buurt")

rainbow(10)

pal <- colorNumeric(c("green", "red"), range(sp@data$orde, na.rm = TRUE), na.color = "#ed09ac")

leaflet(sp) %>% 
  setView(zoom = 12, lat = 52.471, lng = 4.781678) %>% 
  addTiles() %>% 
  addPolygons(weight = 1, fillColor = ~pal(orde), fillOpacity = .3, popup = ~paste("Buurt:", bu_naam, "<br>", 
                                                                                   "categorie:", categorie, "<br>",
                                                                                   "orde:", orde, "/52"))


dates
zoo::as.yearmon(dates)
