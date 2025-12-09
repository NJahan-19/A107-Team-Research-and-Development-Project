library(readr)
library(tibble)
df <- read_csv("avgIQpercountry.csv", col_names = TRUE)
print(colnames(df))

df_top10 <- df[order(-df$`Average IQ`), ][1:10, ]
barplot(df_top10$`Average IQ`,
        names = df_top10$Country,
        main = "Top 10 Countries by Average IQ",
        col = "skyblue",
        las = 2,
        ylab = "Average IQ")

plot(df$`Literacy Rate`, df$`Average IQ`,
     main = "IQ vs Literacy Rate",
     xlab = "Literacy Rate",
     ylab = "Average IQ",
     pch = 19, col = "darkgreen")
abline(lm(df$`Average IQ` ~ df$`Literacy Rate`), col = "red", lwd = 3)


plot(df$`Nobel Prices`, df$`Average IQ`,
     main = "IQ vs Nobel Prices",
     xlab = "Nobel Prices",
     ylab = "Average IQ",
     pch = 19, col = "purple")

abline(lm(df$`Average IQ` ~ df$`Nobel Prices`), col = "blue",lwd = 3)

max_iq <- max(df$`Average IQ`, na.rm = TRUE)
min_iq <- min(df$`Average IQ`, na.rm = TRUE)
print(paste("Highest IQ:", max_iq))
print(paste("Lowest IQ:", min_iq))

df$IQ_group <- cut(df$`Average IQ`,
                   breaks = c(0, 50, 100, 150),
                   labels = c("Low", "Average", "High"))
iq_counts <- table(df$IQ_group)
barplot(iq_counts,
        main = "Number of Countries by IQ Group",
        xlab = "IQ Group",
        ylab = "Number of Countries",
        col = c("yellow", "blue", "darkgreen"),
        las = 1)
table(df$IQ_group)

boxplot(df$`Average IQ` ~ df$Continent,
        main = "Average IQ by Continent",
        xlab = "Continent",
        ylab = "Average IQ",
        col = rainbow(length(unique(df$Continent))),
        las = 2)

boxplot(df$`Literacy Rate` ~ df$Continent,
        main = "Literacy Rate by Continent",
        xlab = "Continent",
        ylab = "Literacy Rate",
        col = rainbow(length(unique(df$Continent))),
        las = 2)

plot(df$`HDI (2021)`, df$`Average IQ`,
     main = "IQ vs Human Development Index (2021)",
     xlab = "HDI (2021)",
     ylab = "Average IQ",
     col = "darkgreen",
     pch = 19)

aggregate(`Average IQ` ~ Continent, df, mean)
aggregate(`Literacy Rate` ~ Continent, df, mean)
aggregate(`Nobel Prices` ~ Continent, df, sum)

median_iq <- median(df$`Average IQ`, na.rm = TRUE)
df$IQ_level <- ifelse(df$`Average IQ` >= median_iq, "Above Median", "Below Median")
table(df$IQ_level)

hist(df$`Average IQ`,
     col="lightgreen",
     breaks=20,
     main="Distribution of Global IQ",
     xlab="Average IQ")

table(df$Continent)

summary(df$`Average IQ`)