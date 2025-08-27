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
compiled_data <- rbind(bq1_data, bq2_data, bq3_data, prm_data)


#clean data
compiled_data <- compiled_data |> clean_names()

#filter data for necessary columns 
bq_1 <- compiled_data |> 
  select(sample_id, sample_date, k, na, mg, ca, nh4_n) |> 
  filter(sample_date >= "1988-01-05",
         sample_date <= "1994-12-27")

#calculate 9 day moving average


# ggplot


#patchwork