#Recreating figure 3 from the loquillo mountain hurricane effect study

#calling libraries
library(tidyverse)
library(here)
library(janitor)
library(lubridate)
library(patchwork)
library(zoo)


#read in data
bq1_data <- read_csv(here::here("data", "QuebradaCuenca1-Bisley.csv"))

bq2_data <- read_csv(here::here("data", "QuebradaCuenca2-Bisley.csv"))

bq3_data <- read_csv(here::here("data", "QuebradaCuenca3-Bisley.csv"))

prm_data <- read_csv(here::here("data", "RioMameyesPuenteRoto.csv"))

# checking the class of dates to make sure lubricate isn't necessary in this scenario
class(bq1_data$sample_date)

#clean data
bq1_data <- bq1_data |> clean_names() 
bq2_data <- bq2_data |> clean_names()
bq3_data <- bq3_data |> clean_names()
prm_data <- prm_data |> clean_names()




# filter for the data columns needed in the time frame needed
bq1 <- bq1_data |> 
  select(sample_id, sample_date, k, na, mg, ca, nh4_n) |> 
  filter(sample_date >= "1988-01-05",
         sample_date <= "1994-12-27")


bq2 <- bq2_data |> 
  select(sample_id, sample_date, k, na, mg, ca, nh4_n)|> 
  filter(sample_date >= "1988-01-05",
         sample_date <= "1994-12-27")

bq3 <- bq3_data |> 
  select(sample_id, sample_date, k, na, mg, ca, nh4_n)|> 
  filter(sample_date >= "1988-01-05",
         sample_date <= "1994-12-27")

prm <- prm_data |> 
  select(sample_id, sample_date, k, na, mg, ca, nh4_n)|> 
  filter(sample_date >= "1988-01-05",
         sample_date <= "1994-12-27")

# add lubridate day column for analysis
bq1 <- bq1 |> mutate(week = week(sample_date))

#join data
# not joining data anymore with the potential to use patchwork to piece the different graphs together, may change approach later
#data <- bq1 |> full_join(bq2, by = "sample_date")


#calculate 9 day moving average
#time_series <-  bq1 |> ts()
bq1_krma <- bq1 |> 
  mutate(krma = rollmean(k, k = 2, fill = NA))
#this gets the moving average across the 2 values around the variable and only works for 


# ggplot of the rollmean average 
ggplot(data = bq1_krma, aes(x = sample_date, y = krma)) +
  geom_line() +
  labs(x = "Years",
       y = "K mg |-1")

#patchwork


