#creating a hurricane line
hurricane <- as.Date("1989-09-18")

# ggplot of the moving  average k 
k_plot <- ggplot(data = mov_avg_k, aes(x = sample_date, y = mov_avg_k, linetype = sample_id)) +
  geom_line() +
  geom_vline(xintercept = hurricane, linetype = "dashed") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank()) +
  labs(y = "K mg |-1")

# ggplot of the moving average NO3_N
no3_n_plot <- ggplot(data = mov_avg_no3_n, aes(x = sample_date, y = mov_avg_no3_n, linetype = sample_id)) +
  geom_line() +
  geom_vline(xintercept = hurricane, linetype = "dashed") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank()) +
  labs(y = "NO3-N ug |-1")

# ggplot of the moving average NO3_N
mg_plot <- ggplot(data = mov_avg_mg, aes(x = sample_date, y = mov_avg_mg, linetype = sample_id)) +
  geom_line() +
  geom_vline(xintercept = hurricane, linetype = "dashed") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank()) +
  labs(y = "Mg mg |-1")

# ggplot of the moving average NO3_N
ca_plot <- ggplot(data = mov_avg_ca, aes(x = sample_date, y = mov_avg_ca, linetype = sample_id)) +
  geom_line() +
  geom_vline(xintercept = hurricane, linetype = "dashed") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank()) +
  labs(y = "Ca mg |-1")

# ggplot of the moving average NH4_N
nh4_n_plot <- ggplot(data = mov_avg_nh4_n, aes(x = sample_date, y = mov_avg_nh4_n, linetype = sample_id)) +
  geom_line() +
  geom_vline(xintercept = hurricane, linetype = "dashed") +
  labs(x = "Years",
       y = "NH4-N ug |-1")

fig3 <- k_plot / no3_n_plot / mg_plot / ca_plot / nh4_n_plot +
  plot_layout(guides = 'collect')

ggsave(here::here("figs", "fig3.png"))
