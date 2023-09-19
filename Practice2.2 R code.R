library(tidyr)
library(dplyr)

rairuoho <- read.table("https://www.dipintothereef.com/uploads/3/7/3/5/37359245/rairuoho.txt",header=T, sep="\t", dec='.')


rairuoho$treatment <- replace(rairuoho$treatment,rairuoho$treatment=="nutrient","enriched")

rairuoho_day <- rairuoho %>% pivot_longer(day3:day8, names_to = "Day", values_to = "Length")

rairuoho_day_spatial <- rairuoho_day %>% unite(Spatial, c("spatial1","spatial2"))

rairuoho_day_spatial$row <- NULL
rairuoho_day_spatial$column <- NULL

rairuoho_final <- rairuoho_day_spatial
rairuoho_final
print(rairuoho_final,n = 288)
