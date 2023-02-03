library(tidyverse)

df <- read_csv("bftw_workers.csv")

df |>
  group_by(size) |>
  summarise(n = n()) |>
  arrange(desc(n))

size_filter <- c("1-9 Employees", "10-49 Employees", "50-249 Employees")

filtered_df <- df |>
  filter(size %in% size_filter)

filtered_df |>
  ggplot(aes(x = area_score, y = size, fill = size)) +
  geom_boxplot() +
  theme_minimal()

filtered_df %>%
  aov(area_score ~ size, data = .) %>%
  summary()