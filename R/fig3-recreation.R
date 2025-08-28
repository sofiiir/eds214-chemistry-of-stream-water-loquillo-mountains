#Recreating figure 3 from the loquillo mountain hurricane effect study
rm(list = ls())

#calling libraries
library(tidyverse)
library(here)
library(janitor)
library(lubridate)
library(patchwork)

#sourcing the moving average function 
source(here("R", "moving-average-function.R"))

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
compiled_data <- compiled_data |> 
  select(sample_id, sample_date, k, na, mg, ca, nh4_n) |> 
  filter(sample_date >= "1988-01-05",
         sample_date <= "1994-12-27")

#pivot longer
compiled_data_longer <- compiled_data |> 
  pivot_longer(cols = k:nh4_n,
               names_to = "nutrients", 
               values_to = "nutrient_concentrations")
#this isn't working because the function is calling on one column

#calculate 9 day moving average
compiled_data$mov_avg_k <- sapply(X = as.numeric(compiled_data$sample_date),
       FUN = moving_average,
       sample_date = compiled_data$sample_date,
       nutrient_conc = compiled_data$k,
       win_size_wks = 9
       )

# ggplot


#patchwork