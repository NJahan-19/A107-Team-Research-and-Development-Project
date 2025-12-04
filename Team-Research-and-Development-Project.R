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
print(paste("Highest IQ:", max_iq))

min_iq <- min(df$`Average IQ`, na.rm = TRUE)
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