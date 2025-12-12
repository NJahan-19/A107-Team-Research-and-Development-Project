#Load libraries
library(readr)
library(tidyverse)
library(corrplot)
theme_set(theme_minimal())

#Load dataset
df <- read_csv("avgIQpercountry.csv")
print(names(df))  # sanity check

#Clean column names (ASCII-safe backticks)
df <- df %>%
  rename(
    AverageIQ = `Average IQ`,
    HDI = `HDI (2021)`,
    LiteracyRate = `Literacy Rate`,
    NobelPrizes = `Nobel Prices`,
    MeanYearsSchooling = `Mean years of schooling - 2021`,
    GNI = `GNI - 2021`,
    Population = `Population - 2023`
  ) %>%
  mutate(Continent = factor(Continent))
#Filter valid rows
df_main <- df %>% filter(!is.na(AverageIQ), !is.na(HDI))
cat("Rows in df_main:", nrow(df_main), "\n")

#Summary statistics
print(summary(df_main))

by_continent <- df_main %>%
  group_by(Continent) %>%
  summarise(
    mean_IQ = mean(AverageIQ),
    mean_HDI = mean(HDI),
    mean_schooling = mean(MeanYearsSchooling, na.rm = TRUE),
    mean_literacy = mean(LiteracyRate, na.rm = TRUE),
    total_population = sum(as.numeric(Population), na.rm = TRUE)
  )
print(by_continent)
#Visualisations
# Scatterplot: IQ vs HDI
ggplot(df_main, aes(x = HDI, y = AverageIQ, color = Continent)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = TRUE) +
  labs(title = "Average IQ vs HDI", x = "HDI", y = "Average IQ")

# Boxplot: IQ by Continent
ggplot(df_main, aes(x = Continent, y = AverageIQ, fill = Continent)) +
  geom_boxplot() +
  labs(title = "IQ by Continent")
# Histogram: HDI
ggplot(df_main, aes(x = HDI)) +
  geom_histogram(bins = 30, fill = "skyblue") +
  labs(title = "HDI distribution", x = "HDI", y = "Count")

# Bar chart: Nobel Prizes by Continent
df_main %>%
  group_by(Continent) %>%
  summarise(total_nobel = sum(NobelPrizes, na.rm = TRUE)) %>%
  ggplot(aes(x = Continent, y = total_nobel, fill = Continent)) +
  geom_col() +
  labs(title = "Total Nobel Prizes by Continent", x = "Continent", y = "Total Nobel Prizes")

#Scatterplot: GNI vs HDI (log x) 
ggplot(df_main, aes(x = GNI, y = HDI, color = Continent)) +
  geom_point(alpha = 0.7) +
  scale_x_log10() +
  labs(title = "Gross National Income vs HDI", x = "GNI (log scale)", y = "HDI")

