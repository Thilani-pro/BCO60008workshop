install.packages("tidyverse") #installing packages (only once)

library(tidyverse)

install.packages("tidymodels") #installed packages (only once)
library(tidymodels)

install.packages("skimr") #installed packages (only once)
library(skimr)

install.packages("janitor") #installed packages (only once)
library(janitor)


olympics<-read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-07-27/olympics.csv')

olympics%>%head()
