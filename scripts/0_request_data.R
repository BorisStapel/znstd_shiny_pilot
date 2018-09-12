library("httr")
# call webservice for data

request_data <- function(){
  buurt_url <- "http://geo.zaanstad.nl/geoserver/geo/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=geo:cbs_buurten_2017&maxFeatures=50&outputFormat=application%2Fjson"
  wijk_url <- "http://geo.zaanstad.nl/geoserver/geo/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=geo:cbs_wijken_2017&maxFeatures=50&outputFormat=application%2Fjson"
  
  r_buurt <- GET(buurt_url)
  bin_buurt <- content(r_buurt, "raw")
  writeBin(bin_buurt, "data/buurt_zaanstad.geojson")
  
  r_wijk <- GET(wijk_url)
  bin_wijk <- content(r_wijk, "raw")
  writeBin(bin_wijk, "data/wijk_zaanstad.geojson")
}

