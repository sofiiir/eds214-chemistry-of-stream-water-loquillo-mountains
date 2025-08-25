#Recreating figure 3 from the loquillo mountain hurricane effect study

#calling libraries
library(tidyverse)
library(here)
library(janitor)
library(lubridate)
library(patchwork)


#read in data
bq1_data <- read_csv(here::here("data", "QuebradaCuenca1-Bisley.csv"))

bq2_data <- read_csv(here::here("data", "QuebradaCuenca2-Bisley.csv"))

bq3_data <- read_csv(here::here("data", "QuebradaCuenca3-Bisley.csv"))

prm_data <- read_csv(here::here("data", "RioMameyesPuenteRoto.csv"))

#join data frames


#clean data


#calculate 9 day moving average


# ggplot


#patchwork