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

