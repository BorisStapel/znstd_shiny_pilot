#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
load("data_env.RData")

dates <- #vector of unique dates
  df %>% 
  distinct(periode) %>% 
  arrange(as.Date(periode)) %>% 
  pull()



# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$uLeaflet <- renderLeaflet({
    
    # generate bins based on input$bins from ui.R
    df <- 
      df %>% 
      na.omit() %>% 
      filter(periode == dates[input$datum])
    
    sp_buurten@data <- 
      data_frame(bu_naam = as.character(sp_buurten@data$bu_naam))
    
    #add data to spDataframe
    sp <- sp::merge(sp_buurten, df, by.x = "bu_naam", by.y = "buurt")
    
    pal <- colorNumeric(c("green", "red"), c(1,54), na.color = "#ed09ac")
    # draw leaflet map
    leaflet(sp) %>% 
      setView(zoom = 11, lat = 52.471, lng = 4.781678) %>% 
      addTiles() %>% 
      addPolygons(weight = 1, fillColor = ~pal(orde), fillOpacity = .3, popup = ~paste("Buurt:", bu_naam, "<br>", 
                                                                                       "categorie:", categorie, "<br>",
                                                                                       "orde:", orde, "/52"))
    
  })
  
})
