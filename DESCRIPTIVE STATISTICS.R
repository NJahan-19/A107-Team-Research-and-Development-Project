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

# 3. VISUALIZATIONS
# =================
# Set theme for better visualizations
theme_set(theme_minimal())

# MAIN PLOT: Scatter plot of IQ vs HDI by Continent
main_plot <- ggplot(iq_clean, aes(x = HDI_2021, y = Average_IQ, color = Continent)) +
  geom_point(alpha = 0.7, size = 3) +
  geom_smooth(method = "lm", se = FALSE, size = 0.8) +
  labs(
    title = "Relationship Between Average IQ and Human Development Index (HDI)",
    subtitle = "Colored by Continent with Linear Trend Lines",
    x = "Human Development Index (HDI) 2021",
    y = "Average IQ",
    color = "Continent"
  ) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5),
    legend.position = "bottom"
  ) +
  scale_color_brewer(palette = "Set2")

# Save main plot
ggsave("IQ_HDI_scatter.png", main_plot, width = 10, height = 7, dpi = 300)
print(main_plot)
#  Boxplot by continent
box_plot <- ggplot(iq_clean, aes(x = reorder(Continent, Average_IQ, median), 
                                 y = Average_IQ, fill = Continent)) +
  geom_boxplot(alpha = 0.7) +
  geom_jitter(width = 0.2, alpha = 0.5, size = 1.5) +
  labs(
    title = "Distribution of Average IQ Scores by Continent",
    x = "Continent",
    y = "Average IQ"
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_brewer(palette = "Set3")

ggsave("IQ_by_continent_boxplot.png", box_plot, width = 9, height = 6, dpi = 300)
print(box_plot)

# Correlation test by continent
cor_by_continent <- iq_clean %>%
  group_by(Continent) %>%
  summarise(
    correlation = cor(Average_IQ, HDI_2021, use = "complete.obs"),
    p_value = cor.test(Average_IQ, HDI_202I_2021)$p.value,
    n = n()
  )

print("Correlation by Continent:")
print(cor_by_continent)

# Linear regression model
model <- lm(Average_IQ ~ HDI_2021 + Continent + Literacy_Rate, data = iq_clean)
summary_model <- summary(model)

print("Linear Regression Model Summary:")
print(summary_model)

# ANOVA test for differences between continents
anova_test <- aov(Average_IQ ~ Continent, data = iq_clean)
anova_summary <- summary(anova_test)

print("ANOVA Test Results (IQ by Continent):")
print(anova_summary)