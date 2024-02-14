## Install Packages





if(!require(pacman)) install.packages("pacman") ; require(pacman)


p_load(rio, # import/export data
       tidyverse, # tidy-data
       skimr, # summary data
       gridExtra, ## visualizing missing data
       corrplot, ## Correlation Plots 
       stargazer, ## tables/output to TEX. 
       MASS)   


## load data
db <- import("https://github.com/ignaciomsarmiento/datasets/blob/main/GEIH_sample1.Rds?raw=true")



db <- as_tibble(db) %>% rename(gender=sex) 




db_of<- db %>% 
  group_by(oficio, gender)  %>% 
  summarise(ofic_ingLab= mean(y_ingLab_m, na.rm=T), .groups="drop") %>%
  mutate(ofic_ingLab= ofic_ingLab/1000000)



db_of  %>% dplyr:: select(oficio, gender, ofic_ingLab) %>% head(4)

