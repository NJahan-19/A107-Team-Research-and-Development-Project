library(readr)
library(tibble)
df <- read_csv("avgIQpercountry.csv", col_names = TRUE)
print(colnames(df))