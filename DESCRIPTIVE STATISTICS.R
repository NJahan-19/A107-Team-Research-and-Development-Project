library(tidyverse)
library(ggplot2)
library(dplyr)
library(readr)
library(knitr)
library(corrplot)

# 1. LOAD AND CLEAN DATA
# ======================
# Read the main dataset
iq_data <- read_csv("avgIQpercountry.csv")# Check structure
str(iq_data)
summary(iq_data)

# Clean column names
colnames(iq_data) <- c("Rank", "Country", "Average_IQ", "Continent", 
                       "Literacy_Rate", "Nobel_Prices", "HDI_2021", 
                       "Mean_years_schooling", "GNI_2021", "Population_2023")

# Convert appropriate columns to numeric
iq_data$Average_IQ <- as.numeric(iq_data$Average_IQ)
iq_data$HDI_2021 <- as.numeric(iq_data$HDI_2021)
iq_data$Literacy_Rate <- as.numeric(iq_data$Literacy_Rate)
iq_data$GNI_2021 <- as.numeric(iq_data$GNI_2021)

# Remove rows with missing HDI or IQ values for analysis
iq_clean <- iq_data %>% 
  filter(!is.na(Average_IQ) & !is.na(HDI_2021))

# 2. DESCRIPTIVE STATISTICS
# =========================
# Summary statistics by continent
continent_stats <- iq_clean %>%
  group_by(Continent) %>%
  summarise(
    n_countries = n(),
    mean_IQ = mean(Average_IQ, na.rm = TRUE),
    sd_IQ = sd(Average_IQ, na.rm = TRUE),
    mean_HDI = mean(HDI_2021, na.rm = TRUE),
    sd_HDI = sd(HDI_2021, na.rm = TRUE),
    min_IQ = min(Average_IQ, na.rm = TRUE),
    max_IQ = max(Average_IQ, na.rm = TRUE)
  )

print("Summary Statistics by Continent:")
print(continent_stats)

# Overall correlation
correlation_test <- cor.test(iq_clean$Average_IQ, iq_clean$HDI_2021, 
                             method = "pearson")
print("Overall Correlation Test:")
print(correlation_test)
