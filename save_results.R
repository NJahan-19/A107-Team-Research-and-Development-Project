# =====================================================================
# save_results.R
# Generate and save all key plots and model summaries to /results
# =====================================================================

# 1️⃣ Load required packages
library(readr)
library(dplyr)
library(ggplot2)
library(corrplot)

# 2️⃣ Create results folder if it doesn't exist
if (!dir.exists("results")) {
  dir.create("results")
}

# 3️⃣ Load and clean dataset
df <- read_csv("avgIQpercountry.csv")

df <- df %>%
  rename(
    AverageIQ = `Average IQ`,
    LiteracyRate = `Literacy Rate`,
    NobelPrizes = `Nobel Prices`,
    HDI = `HDI (2021)`,
    MeanYearsSchooling = `Mean years of schooling - 2021`,
    GNI = ` GNI - 2021`
  )

# 4️⃣ Histogram of Average IQ (saved as PNG)
p_hist <- ggplot(df, aes(x = AverageIQ)) +
  geom_histogram(binwidth = 2, color = "black") +
  labs(
    title = "Distribution of Average IQ Across Countries",
    x = "Average IQ",
    y = "Frequency"
  )

ggsave("results/iq_histogram.png", plot = p_hist, width = 7, height = 5, dpi = 300)

# 5️⃣ Top 10 Countries by Average IQ (saved as PNG)
df_top10 <- df[order(-df$AverageIQ), ][1:10, ]

p_top10 <- ggplot(df_top10, aes(x = reorder(Country, AverageIQ), y = AverageIQ)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(
    title = "Top 10 Countries by Average IQ",
    x = "Country",
    y = "Average IQ"
  )

ggsave("results/top10_countries_iq.png", plot = p_top10, width = 7, height = 5, dpi = 300)

# 6️⃣ GNI vs HDI Scatter Plot (saved as PNG)
p_scatter <- ggplot(df, aes(x = GNI, y = HDI, color = Continent)) +
  geom_point() +
  scale_x_log10() +
  labs(
    title = "GNI vs HDI Across Countries",
    x = "Gross National Income (log scale)",
    y = "Human Development Index"
  )

ggsave("results/gni_vs_hdi.png", plot = p_scatter, width = 7, height = 5, dpi = 300)

# 7️⃣ Correlation Matrix & Heatmap (saved as PNG)
df_numeric <- df %>%
  select(AverageIQ, LiteracyRate, HDI, GNI, MeanYearsSchooling)

cor_matrix <- cor(df_numeric, use = "complete.obs")

png("results/correlation_heatmap.png", width = 800, height = 800)
corrplot(cor_matrix, method = "color", tl.cex = 0.8, number.cex = 0.7)
dev.off()

# 8️⃣ Linear Regression Model (saved as TXT)
lm_model <- lm(AverageIQ ~ LiteracyRate + HDI + GNI + MeanYearsSchooling, data = df)

sink("results/linear_regression_summary.txt")
cat("Linear Regression Model: AverageIQ ~ LiteracyRate + HDI + GNI + MeanYearsSchooling\n\n")
print(summary(lm_model))
sink()

# 9️⃣ Logistic Regression Model (Above/Below Median IQ) (saved as TXT)
median_iq <- median(df$AverageIQ, na.rm = TRUE)
df$IQ_level <- ifelse(df$AverageIQ >= median_iq, "Above", "Below")
df$IQ_level <- factor(df$IQ_level)

logit_model <- glm(IQ_level ~ LiteracyRate + HDI + GNI + MeanYearsSchooling,
                   data = df, family = binomial)

sink("results/logistic_regression_summary.txt")
cat("Logistic Regression Model: IQ_level ~ LiteracyRate + HDI + GNI + MeanYearsSchooling\n\n")
print(summary(logit_model))
sink()

# 🔚 Done
cat("All plots and model summaries have been saved in the 'results' folder.\n")
