#read in data
bq1_data <- read_csv(here::here("data", "QuebradaCuenca1-Bisley.csv")) |> 
  clean_names() |> 
  select(sample_id, sample_date, k, no3_n, mg, ca, nh4_n)

bq2_data <- read_csv(here::here("data", "QuebradaCuenca2-Bisley.csv")) |> 
  clean_names() |> 
  select(sample_id, sample_date, k, no3_n, mg, ca, nh4_n)

bq3_data <- read_csv(here::here("data", "QuebradaCuenca3-Bisley.csv")) |> 
  clean_names() |> 
  select(sample_id, sample_date, k, no3_n, mg, ca, nh4_n)

prm_data <- read_csv(here::here("data", "RioMameyesPuenteRoto.csv")) |> 
  clean_names() |> 
  select(sample_id, sample_date, k, no3_n, mg, ca, nh4_n)

#join data frames with rbind to maintain column numbers
compiled_data <- rbind(bq1_data, bq2_data, bq3_data, prm_data)

#clean names for easier reference to names
compiled_data <- compiled_data |> clean_names()

#filter data for necessary columns 
compiled_data <- compiled_data |> 
  select(sample_id, sample_date, k, no3_n, mg, ca, nh4_n) |> 
  filter(sample_date >= "1988-01-05",
         sample_date <= "1994-12-27")

write_csv(compiled_data, "outputs/final_data.csv")
