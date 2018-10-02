
library("dygraphs")
library("janitor")
library("tidyverse")
library("xts")
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Tijdseries"),
  
  # Sidebar 
  sidebarLayout(
    sidebarPanel(
      
    ),
    
    # Show a plot of the time series
    mainPanel(
      dygraphOutput("dygraph")
    )
  )
))
