

library(readr)
library(tibble)
df <- read_csv("avgIQpercountry.csv", col_names = TRUE)
print(colnames(df))

hist(df$`Average IQ`,
     col="purple",
     breaks=20,
     main="Distribution of Global IQ",
     xlab="Average IQ")