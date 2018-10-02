library(shiny)
library(leaflet)
library(tidyverse)
library("shinyWidgets")
tags$style(type="text/css", "#output_id.recalculating { opacity: 1.0 !import; }")
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("time map"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("datum",
                   "Number of bins:",
                   min = 1,
                   max = 45,
                   value = 1, 
                   step = 1,
                   animate = TRUE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       leafletOutput("uLeaflet")
    )
  )
))

