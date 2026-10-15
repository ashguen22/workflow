library(tidyverse)

price_by_cut_color <- diamonds |>
  group_by(cut, color) |>
  summarise(mean_price = mean(price), .groups = "drop")

diamond_plot <- ggplot(price_by_cut_color, aes(x = color, y = cut, fill = mean_price)) +
  geom_tile(color = "white", linewidth = 1) +
  geom_text(aes(label = scales::dollar(mean_price, accuracy = 1)), color = "white", size = 3.5) +
  scale_fill_viridis_c(option = "C", labels = scales::label_dollar()) +
  labs(
    title = "The price spectrum of diamonds",
    subtitle = "Average price by cut and color",
    x = "Diamond color",
    y = "Cut quality",
    fill = "Average price"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold"),
    panel.grid = element_blank()
  )

ggsave("diamonds-2.png", plot = diamond_plot, width = 9, height = 6, dpi = 300)
