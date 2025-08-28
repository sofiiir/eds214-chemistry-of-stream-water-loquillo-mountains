#Recreating figure 3 from the loquillo mountain hurricane effect study. Author: Sofia Rodas email:sofiarodas@ucsb.edu

#can use rrtools to reformat the README

#calling libraries
library(tidyverse)
library(here)
library(janitor)
library(lubridate)
library(patchwork)
library(zoo)
source(here("R", "moving-average-function.R"))

#read in data
quebrada_1 <- read_csv(here::here("data", "QuebradaCuenca1-Bisley.csv"))

quebrada_2 <- read_csv(here::here("data", "QuebradaCuenca2-Bisley.csv"))

quebrada_3 <- read_csv(here::here("data", "QuebradaCuenca3-Bisley.csv"))

puente_rm <- read_csv(here::here("data", "RioMameyesPuenteRoto.csv"))

#clean names of each column so they can all be in lower_snake for ease of calling 
quebrada_1 <- quebrada_1 |> clean_names() 
quebrada_2 <- quebrada_2 |> clean_names()
quebrada_3 <- quebrada_3 |> clean_names()
puente_rm <- puente_rm |> clean_names()

# checking the class of dates to make sure lubricate isn't necessary in this scenario
class(quebrada_1$sample_date)

# filter for the data columns needed in the needed time frame to make plotting more efficient after analysis
bq_1 <- quebrada_1 |> 
  select(sample_id, sample_date, k, na, mg, ca, nh4_n) |> 
  filter(sample_date >= "1988-01-05",
         sample_date <= "1994-12-27")

bq_2 <- quebrada_2 |> 
  select(sample_id, sample_date, k, na, mg, ca, nh4_n)|> 
  filter(sample_date >= "1988-01-05",
         sample_date <= "1994-12-27")

bq_3 <- quebrada_3 |> 
  select(sample_id, sample_date, k, na, mg, ca, nh4_n)|> 
  filter(sample_date >= "1988-01-05",
         sample_date <= "1994-12-27")

prm <- puente_rm |> 
  select(sample_id, sample_date, k, na, mg, ca, nh4_n)|> 
  filter(sample_date >= "1988-01-05",
         sample_date <= "1994-12-27")

# add lubridate day column for analysis
bq1 <- bq1 |> mutate(day = yday(sample_date))
bq2 <- bq2 |> mutate(day = yday(sample_date))
bq3 <- bq3 |> mutate(day = yday(sample_date))
prm <- prm |> mutate(day = yday(sample_date))

# add lubridate year column for analysis
bq1 <- bq1 |> mutate(year = isoyear(sample_date))
bq2 <- bq2 |> mutate(year = isoyear(sample_date))
bq3 <- bq3 |> mutate(year = isoyear(sample_date))
prm <- prm |> mutate(year = isoyear(sample_date))

#assigning variable to year for a for loop
year_mutate <- bq1$year
day_mutate <- bq1$day

#Adding days to following years
for (i in seq_along(year_mutate)) {
  if (year_mutate[i] == "1989" ){
  mutate(day = day_mutate + 365)
  } 
  }

#join data
# not joining data anymore with the potential to use patchwork to piece the different graphs together, may change approach later
#data <- bq1 |> full_join(bq2, by = "sample_date")

#calculate 9 day moving average
#time_series <-  bq1 |> ts()
bq1_krma <- bq1 |> 
  mutate(krma = rollmean(k, k = 2, fill = NA))
#this gets the moving average across the 2 values around the variable and only works for 

#Adding days to following years
if (bq1$year == "1989" ){
  bq1$year = bq1$day + 365
}

#create vectors to be used in for loop
day_bq1 <- pull(bq1, day)
k_bq1 <- pull(bq1, k)
pull(bq1, day)

#pivot longer
compiled_data_longer <- compiled_data |> 
  pivot_longer(cols = k:nh4_n,
               names_to = "nutrients", 
               values_to = "nutrient_concentrations")
#this isn't working because the function is calling on one column

#for loop to create moving average
for ( in bq1){
 if (day - 31  <= day <= day + 31)
}

#calculate 9 day moving average
compiled_data$mov_avg_k <- sapply(X = as.numeric(compiled_data$sample_date),
                                  FUN = moving_average,
                                  sample_date = compiled_data$sample_date,
                                  nutrient_conc = compiled_data$k,
                                  win_size_wks = 9
)
# ggplot of the rollmean average 
ggplot(data = bq1_krma, aes(x = sample_date, y = krma)) +
  geom_line() +
  labs(x = "Years",
       y = "K mg |-1")

#patchwork
