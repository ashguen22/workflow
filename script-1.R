library(tidyverse)

total <- sum(1:10)
print(total)

diamond_plot <- ggplot(diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point(alpha = 0.45, size = 1.2) +
  scale_color_viridis_d(option = "C") +
  labs(
    title = "A brilliant relationship",
    subtitle = "Diamond price rises with carat, with cut shown by color",
    x = "Carat",
    y = "Price (USD)",
    color = "Cut"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold"),
    legend.position = "bottom",
    panel.grid.minor = element_blank()
  )

ggsave("diamonds-1.png", plot = diamond_plot, width = 9, height = 6, dpi = 300)
