#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library("dygraphs")
library("janitor")
library("tidyverse")
library("xts")
load("data_env.RData")
uitk <- 
  df %>% 
  select(periode, buurt, orde) %>% 
  spread(buurt, orde) %>% 
  mutate_if(is.integer, as.numeric) %>% 
  clean_names() 

time <- as.xts(uitk[,2:51], order.by = uitk$periode)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$dygraph <- renderDygraph({dygraph(time)})
  
})
