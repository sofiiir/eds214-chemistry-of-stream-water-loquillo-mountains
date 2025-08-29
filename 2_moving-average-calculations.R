##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            ~~
##                        MOVING AVERAGE CALCULATIONS                       ----
##                                                                            ~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
library(tidyverse)
library(here)

#sourcing the moving average function for analysis of the data 
source(here::here("R", "moving-average-function.R"))

#read in data
compiled_data <- read_csv(here::here("outputs", "compiled_data.csv")) 

#..........calculating 9 day moving average: potassium...........
mov_avg_k <- compiled_data |> 
  group_by(sample_id) |> #group by sample sites
  #mutating to create a new column
  mutate(mov_avg_k = sapply(sample_date, #sapply to run on all of the data 
                            moving_average, 
                            sample_date = sample_date, 
                            nutrient_conc = k, 
                            win_size_wks = 9)) |> 
  #selecting for just necessary data to create a plot 
  select(sample_id, sample_date, k, mov_avg_k)

#saving the moving average for potassium dataframe in outputs as a csv
write_csv(mov_avg_k, "outputs/mov_avg_k.csv")

#..........calculating 9 day moving average: magnesium .......... 
mov_avg_mg <- compiled_data |> 
  group_by(sample_id) |> #group by sample sites
  #mutating to create a new column
  mutate(mov_avg_mg = sapply(sample_date, #sapply to run on all of the data 
                             moving_average, 
                             sample_date = sample_date, 
                             nutrient_conc = mg, 
                             win_size_wks = 9)) |> 
  #selecting for just necessary data to create a plot 
  select(sample_id, sample_date, mg, mov_avg_mg)

#saving the moving average for magnesium dataframe in outputs as a csv
write_csv(mov_avg_mg, "outputs/mov_avg_mg.csv")

#......calculating 9 day moving average: nitrate nitrogen .......
mov_avg_no3_n <- compiled_data |> 
  group_by(sample_id) |> #group by sample sites
  #mutating to create a new column
  mutate(mov_avg_no3_n = sapply(sample_date, #sapply to run on all of the data 
                                moving_average, 
                                sample_date = sample_date, 
                                nutrient_conc = no3_n, 
                                win_size_wks = 9)) |> 
  #selecting for just necessary data to create a plot 
  select(sample_id, sample_date, no3_n, mov_avg_no3_n)

#saving the moving average for nitrate nitrogen dataframe in outputs as a csv
write_csv(mov_avg_no3_n, "outputs/mov_avg_no3_n.csv")

#......calculating 9 day moving average: calcium .......
mov_avg_ca <- compiled_data |> 
  group_by(sample_id) |> #group by sample sites
  #mutating to create a new column
  mutate(mov_avg_ca = sapply(sample_date, #sapply to run on all of the data 
                             moving_average, 
                             sample_date = sample_date, 
                             nutrient_conc = ca, 
                             win_size_wks = 9)) |> 
  #selecting for just necessary data to create a plot 
  select(sample_id, sample_date, ca, mov_avg_ca)

#saving the moving average for calcium dataframe in outputs as a csv
write_csv(mov_avg_ca, "outputs/mov_avg_ca.csv")

#......calculating 9 day moving average: ammonium .......
mov_avg_nh4_n <- compiled_data |> 
  group_by(sample_id) |> #group by sample sites
  #mutating to create a new column
  mutate(mov_avg_nh4_n = sapply(sample_date, #sapply to run on all of the data 
                                moving_average, 
                                sample_date = sample_date, 
                                nutrient_conc = nh4_n, 
                                win_size_wks = 9)) |> 
  #selecting for just necessary data to create a plot 
  select(sample_id, sample_date, nh4_n, mov_avg_nh4_n)

#saving the moving average for ammonium dataframe in outputs as a csv
write_csv(mov_avg_nh4_n, "outputs/mov_avg_nh4_n.csv")
