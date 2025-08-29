##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            ~~
##                                  PLOTTING                                ----
##                                                                            ~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
library(tidyverse)
library(patchwork)

#read in moving average data sets
mov_avg_k <- read_csv(here::here("outputs", "mov_avg_k.csv"))
mov_avg_no3_n <- read_csv(here::here("outputs", "mov_avg_no3_n.csv"))
mov_avg_mg <- read_csv(here::here("outputs", "mov_avg_mg.csv"))
mov_avg_ca <- read_csv(here::here("outputs", "mov_avg_ca.csv"))
mov_avg_nh4_n <- read_csv(here::here("outputs", "mov_avg_nh4_n.csv"))

#creating a hurricane line
hurricane <- as.Date("1989-09-18")

#....................ggplot: moving average k ...................
k_plot <- ggplot(data = mov_avg_k, 
                 aes(x = sample_date, 
                     y = mov_avg_k, 
                     linetype = sample_id)) +
  geom_line() +
  #adding vertical hurricane hugo line
  geom_vline(xintercept = hurricane, linetype = "dashed") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank()) +
  labs(title = "Hurricane Hugo Effects on Stream Chemistry",
       y = "K mg |-1")

#..................ggplot: moving average no3_n..................
no3_n_plot <- ggplot(data = mov_avg_no3_n, 
                     aes(x = sample_date, 
                         y = mov_avg_no3_n, 
                         linetype = sample_id)) +
  geom_line() +
  #adding vertical hurricane hugo line
  geom_vline(xintercept = hurricane, linetype = "dashed") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank()) +
  labs(y = "NO3-N ug |-1")

#....................ggplot: moving average mg...................
mg_plot <- ggplot(data = mov_avg_mg, 
                  aes(x = sample_date, 
                      y = mov_avg_mg, 
                      linetype = sample_id)) +
  geom_line() +
  #adding vertical hurricane hugo line
  geom_vline(xintercept = hurricane, linetype = "dashed") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank()) +
  labs(y = "Mg mg |-1")

#....................ggplot: moving average ca...................
ca_plot <- ggplot(data = mov_avg_ca, 
                  aes(x = sample_date, 
                      y = mov_avg_ca, 
                      linetype = sample_id)) +
  geom_line() +
  #adding vertical hurricane hugo line
  geom_vline(xintercept = hurricane, linetype = "dashed") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank()) +
  labs(y = "Ca mg |-1")

#..................ggplot: moving average nh4_n..................
nh4_n_plot <- ggplot(data = mov_avg_nh4_n, 
                     aes(x = sample_date, 
                         y = mov_avg_nh4_n, 
                         linetype = sample_id)) +
  geom_line() +
  #adding vertical hurricane hugo line
  geom_vline(xintercept = hurricane, linetype = "dashed") +
  labs(x = "Years",
       y = "NH4-N ug |-1")

#...........compilation graph containing all subgraphs...........
fig3 <- k_plot / no3_n_plot / mg_plot / ca_plot / nh4_n_plot +
  plot_layout(guides = 'collect')

#saving the the fig3 figure into the figs folder
ggsave(here::here("figs", "fig3.png"))
