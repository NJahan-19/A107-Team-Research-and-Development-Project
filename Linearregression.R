> View(avgIQpercountry)
> 
  > # install.packages("tidyverse")
  > # install.packages("corrplot")
  > 
  > library(tidyverse)
── Attaching core tidyverse packages ─────────────────────────────────────────── tidyverse 2.0.0 ──
✔ dplyr     1.1.4     ✔ purrr     1.2.0
✔ forcats   1.0.1     ✔ stringr   1.6.0
✔ ggplot2   4.0.1     ✔ tibble    3.3.0
✔ lubridate 1.9.4     ✔ tidyr     1.3.1
── Conflicts ───────────────────────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package to force all conflicts to become errors
> library(corrplot)
corrplot 0.95 loaded
> theme_set(theme_minimal())
> 
  > df <- read_csv("avgIQpercountry.csv")
Rows: 193 Columns: 10                                                                            
── Column specification ───────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr (3): Country, Continent, Population - 2023
dbl (7): Rank, Average IQ, Literacy Rate, Nobel Prices, HDI (2021), Mean years of schooling - 2...

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
> 
  > # Check column names
  > print(names(df))
[1] "Rank"                           "Country"                       
[3] "Average IQ"                     "Continent"                     
[5] "Literacy Rate"                  "Nobel Prices"                  
[7] "HDI (2021)"                     "Mean years of schooling - 2021"
[9] "GNI - 2021"                     "Population - 2023"             
> 
  > df <- df %>%
  +     rename(
    +         AverageIQ = `Average IQ`,
    +         HDI = `HDI (2021)`,
    +         LiteracyRate = `Literacy Rate`,
    +         NobelPrizes = `Nobel Prices`,
    +         MeanYearsSchooling = `Mean years of schooling - 2021`,
    +         GNI = `GNI - 2021`,
    +         Population = `Population - 2023`
    +     ) %>%
  +     mutate(Continent = factor(Continent))
> 
  > # Keep rows with valid IQ and HDI
  > df_main <- df %>% filter(!is.na(AverageIQ), !is.na(HDI))
> cat("Rows in df_main:", nrow(df_main), "\n")
Rows in df_main: 179 
> 
  > print(summary(df_main))
Rank          Country            AverageIQ                Continent   LiteracyRate  
Min.   :  1.00   Length:179         Min.   : 42.99   Africa         :49   Min.   :0.190  
1st Qu.: 50.50   Class :character   1st Qu.: 74.17   Asia           :44   1st Qu.:0.795  
Median : 96.00   Mode  :character   Median : 82.99   Europe         :41   Median :0.950  
Mean   : 97.38                      Mean   : 81.92   Central America:19   Mean   :0.864  
3rd Qu.:145.50                      3rd Qu.: 91.22   South America  :12   3rd Qu.:0.990  
Max.   :193.00                      Max.   :106.48   Oceania        : 8   Max.   :1.000  
(Other)        : 6                  
NobelPrizes           HDI         MeanYearsSchooling      GNI          Population       
Min.   :  0.000   Min.   :0.3850   Min.   : 2.100     Min.   :   732   Length:179        
1st Qu.:  0.000   1st Qu.:0.5995   1st Qu.: 6.400     1st Qu.:  4593   Class :character  
Median :  0.000   Median :0.7450   Median : 9.400     Median : 12672   Mode  :character  
Mean   :  6.363   Mean   :0.7241   Mean   : 9.028     Mean   : 20812                     
3rd Qu.:  2.000   3rd Qu.:0.8440   3rd Qu.:11.600     3rd Qu.: 30588                     
Max.   :400.000   Max.   :0.9620   Max.   :14.100     Max.   :146830                     

> 
  > by_continent <- df_main %>%
  +     group_by(Continent) %>%
  +     summarise(
    +         mean_IQ = mean(AverageIQ),
    +         mean_HDI = mean(HDI),
    +         mean_schooling = mean(MeanYearsSchooling, na.rm = TRUE),
    +         mean_literacy = mean(LiteracyRate, na.rm = TRUE),
    +         total_population = sum(as.numeric(Population), na.rm = TRUE)
    +     )
> print(by_continent)
# A tibble: 8 × 6
Continent       mean_IQ mean_HDI mean_schooling mean_literacy total_population
<fct>             <dbl>    <dbl>          <dbl>         <dbl>            <dbl>
  1 Africa             68.8    0.558           5.81         0.676      1405900413.
2 Asia               84.9    0.740           9.12         0.894      4608035834.
3 Central America    73.8    0.729           9.03         0.908        90391688.
4 Europe             94.9    0.881          12.2          0.988       594738650.
5 Europe/Asia        89.2    0.821          11.4          0.987       233988840 
6 North America      94.9    0.872          12.2          0.977       507233423 
7 Oceania            88.3    0.702           9.09         0.889        41999312.
8 South America      83.8    0.755           9.57         0.95        437967431.
> 
  > lm_model <- lm(AverageIQ ~ HDI + MeanYearsSchooling + LiteracyRate, data = df_main)
> print(summary(lm_model))

Call:
  lm(formula = AverageIQ ~ HDI + MeanYearsSchooling + LiteracyRate, 
     data = df_main)

Residuals:
  Min       1Q   Median       3Q      Max 
-30.1551  -3.6635   0.8793   4.4750  26.8070 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)         35.1347     4.5809   7.670 1.15e-12 ***
  HDI                 57.9705    11.0210   5.260 4.17e-07 ***
  MeanYearsSchooling   0.2968     0.5504   0.539    0.590    
LiteracyRate         2.4588     6.8922   0.357    0.722    
---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 8.799 on 175 degrees of freedom
Multiple R-squared:  0.5723,	Adjusted R-squared:  0.565 
F-statistic: 78.05 on 3 and 175 DF,  p-value: < 2.2e-16

> 
  > par(mfrow = c(2,2))
> plot(lm_model)
> par(mfrow = c(1,1))
> 
  > 