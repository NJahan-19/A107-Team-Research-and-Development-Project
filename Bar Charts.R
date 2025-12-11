# Bar chart: Nobel Prizes by Continent
df_main %>%
  group_by(Continent) %>%
  summarise(total_nobel = sum(NobelPrizes, na.rm = TRUE)) %>%
  ggplot(aes(x = Continent, y = total_nobel, fill = Continent)) +
  geom_col() +
  labs(title = "Total Nobel Prizes by Continent")



