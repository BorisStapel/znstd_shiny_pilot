#visualize 
pal <- colorNumeric(c("green", "red"), range(sp_wijken$aant_inw))

leaflet(sp_wijken) %>% 
  setView(zoom = 12, lat = 52.471, lng = 4.781678) %>% 
  addTiles() %>%
  addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = .8,
              fillColor = ~pal(aant_inw))


pal <- colorNumeric(c("green", "red"), range(sp_buurten$aant_inw))

leaflet(sp_buurten) %>% 
  setView(zoom = 12, lat = 52.471, lng = 4.781678) %>% 
  addTiles() %>%
  addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = .8,
              fillColor = ~pal(aant_inw))
download.file("http://geo.zaanstad.nl/geoserver/geo/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=geo:cbs_buurten_2017&maxFeatures=50&outputFormat=application%2Fjson",
              destfile = "blabla.geojson")
