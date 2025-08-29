#creating a hurricane date to add to the graph as the point of interest
hurricane <- as.Date("1989-09-18")

# ggplot of the moving average potasium
k_plot <- ggplot(data = mov_avg_k, 
                 aes(x = sample_date, 
                     y = mov_avg_k, 
                     linetype = sample_id)) +
  geom_line() +
  #adding vertical hurricane hugo line
  geom_vline(xintercept = hurricane, linetype = "dashed") + 
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank()) +
  labs(y = "K mg |-1")

# ggplot of the moving average nitrate nitrogen
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

# ggplot of the moving average mangnesium
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

# ggplot of the moving average calcium
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

# ggplot of the moving average ammonium
nh4_n_plot <- ggplot(data = mov_avg_nh4_n, 
                     aes(x = sample_date, 
                         y = mov_avg_nh4_n, 
                         linetype = sample_id)) +
  geom_line() +
  #adding vertical hurricane hugo line
  geom_vline(xintercept = hurricane, linetype = "dashed") +
  labs(x = "Years",
       y = "NH4-N ug |-1")

#compiling the data to create one graph with all of the required subgraphs
fig3 <- k_plot / no3_n_plot / mg_plot / ca_plot / nh4_n_plot +
 plot_layout(guides = 'collect') #removing duplicates of legends

#saving the the fig3 figure into the figs folder
ggsave(here::here("figs", "fig3.png"))
