> 
  > # --- Part 1: Load required libraries ---
  > # These packages help us read data, manipulate it, and make tables
  > 
  > library(readr)      # for reading CSV files
> library(dplyr)      # for data manipulation
> library(knitr)      # for neat tables
> library(kableExtra) # for styled tables
> 
  > # --- Part 2: Read the dataset ---
  > # Make sure avgIQpercountry.csv is in your working directory
  > 
  > data <- read_csv("avgIQpercountry.csv")
  Rows: 193 Columns: 10                                                                            
  ── Column specification ───────────────────────────────────────────────────────────────────────────
  Delimiter: ","
  chr (3): Country, Continent, Population - 2023
  dbl (7): Rank, Average IQ, Literacy Rate, Nobel Prices, HDI (2021), Mean years of schooling - 2...
  
  ℹ Use `spec()` to retrieve the full column specification for this data.
  ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
  > 
    > # Quick check: show first 6 rows
    > head(data)
  # A tibble: 6 × 10
  Rank Country     `Average IQ` Continent `Literacy Rate` `Nobel Prices` `HDI (2021)`
  <dbl> <chr>              <dbl> <chr>               <dbl>          <dbl>        <dbl>
    1     1 Japan               106. Asia                 0.99             29        0.925
  2     2 Taiwan              106. Asia                 0.96              4       NA    
  3     3 Singapore           106. Asia                 0.97              0        0.939
  4     4 Hong Kong           105. Asia                 0.94              1        0.952
  5     5 China               104. Asia                 0.96              8        0.768
  6     6 South Korea         102. Asia                 0.98              0        0.925
  # ℹ 3 more variables: `Mean years of schooling - 2021` <dbl>, `GNI - 2021` <dbl>,
  #   `Population - 2023` <chr>