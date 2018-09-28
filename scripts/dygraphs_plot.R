library("dygraphs")
library("janitor")
library("tidyverse")
library("xts")
load("data/data_env.RData")

uitk <- 
df %>% 
  select(periode, buurt, orde) %>% 
  spread(buurt, orde) %>% 
  mutate_if(is.integer, as.numeric) %>% 
  clean_names() 

time <- as.xts(uitk[,2:51], order.by = uitk$periode)


dygraph(time)
