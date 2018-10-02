

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
   
  output$dygraph <- renderDygraph({
    dygraph(time) %>% 
      dyLegend(show = "always")
    }) 
    
  
})
