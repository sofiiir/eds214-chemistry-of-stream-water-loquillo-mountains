#Recreating figure 3 from the loquillo mountain hurricane effect study

#calling libraries
library(tidyverse)
library(here)
library(janitor)
library(lubridate)


#reading in data
bq1_data <- read_csv(here::here("data", "QuebradaCuenca1-Bisley.csv"))
