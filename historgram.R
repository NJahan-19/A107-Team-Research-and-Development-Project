
R version 4.5.2 (2025-10-31) -- "[Not] Part in a Rumble"
Copyright (C) 2025 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin20

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> library(readr)
> avgIQpercountry <- read_csv("avgIQpercountry.csv")
Rows: 193 Columns: 10                                                          
── Column specification ─────────────────────────────────────────────────────────
Delimiter: ","
chr (3): Country, Continent, Population - 2023
dbl (7): Rank, Average IQ, Literacy Rate, Nobel Prices, HDI (2021), Mean year...

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
> View(avgIQpercountry)
> # Load necessary library
  > # (No extra libraries required for a basic histogram)
  > 
  > # Read the dataset
  > df <- read.csv("avgIQpercountry.csv")
> 
  > # Histogram of Average IQ
  > hist(
    +   df$Average.IQ,
    +   main = "Distribution of Average IQ",
    +   xlab = "Average IQ",
    +   ylab = "Frequency",
    +   col = "orange",
    +   border = "black"
    + )
> 
  > # Load dataset
  > df <- read.csv("avgIQpercountry.csv")
> 
  > # View first rows
  > head(df)
Rank     Country Average.IQ Continent Literacy.Rate Nobel.Prices HDI..2021.
1    1       Japan     106.48      Asia          0.99           29      0.925
2    2      Taiwan     106.47      Asia          0.96            4         NA
3    3   Singapore     105.89      Asia          0.97            0      0.939
4    4   Hong Kong     105.37      Asia          0.94            1      0.952
5    5       China     104.10      Asia          0.96            8      0.768
6    6 South Korea     102.35      Asia          0.98            0      0.925
Mean.years.of.schooling...2021 GNI...2021 Population...2023
1                           13.4      42274         123294513
2                             NA         NA          10143543
3                           11.9      90919           6014723
4                           12.2      62607           7491609
5                            7.6      17504        1425671352
6                           12.5      44501          51784059
> 
  > # Check structure
  > str(df)
'data.frame':	193 obs. of  10 variables:
  $ Rank                          : int  1 2 3 4 5 6 7 8 9 10 ...
$ Country                       : chr  "Japan" "Taiwan" "Singapore" "Hong Kong" ...
$ Average.IQ                    : num  106 106 106 105 104 ...
$ Continent                     : chr  "Asia" "Asia" "Asia" "Asia" ...
$ Literacy.Rate                 : num  0.99 0.96 0.97 0.94 0.96 0.98 1 1 1 0.99 ...
$ Nobel.Prices                  : int  29 4 0 1 8 0 2 5 0 111 ...
$ HDI..2021.                    : num  0.925 NA 0.939 0.952 0.768 0.925 0.808 0.94 0.935 0.942 ...
$ Mean.years.of.schooling...2021: num  13.4 NA 11.9 12.2 7.6 12.5 12.1 12.9 12.5 14.1 ...
$ GNI...2021                    : int  42274 NA 90919 62607 17504 44501 18849 49452 146830 54534 ...
$ Population...2023             : chr  "123294513" "10143543" "6014723" "7491609" ...
> 
  > # Summary of all numeric columns
  > summary(df)
Rank       Country            Average.IQ      Continent        
Min.   :  1   Length:193         Min.   : 42.99   Length:193        
1st Qu.: 49   Class :character   1st Qu.: 74.33   Class :character  
Median : 97   Mode  :character   Median : 82.24   Mode  :character  
Mean   : 97                      Mean   : 82.05                     
3rd Qu.:145                      3rd Qu.: 91.60                     
Max.   :193                      Max.   :106.48                     

Literacy.Rate     Nobel.Prices       HDI..2021.    
Min.   :0.1900   Min.   :  0.000   Min.   :0.3850  
1st Qu.:0.8000   1st Qu.:  0.000   1st Qu.:0.5995  
Median :0.9500   Median :  0.000   Median :0.7450  
Mean   :0.8642   Mean   :  5.922   Mean   :0.7241  
3rd Qu.:0.9900   3rd Qu.:  1.000   3rd Qu.:0.8440  
Max.   :1.0000   Max.   :400.000   Max.   :0.9620  
NA's   :14      
 Mean.years.of.schooling...2021   GNI...2021     Population...2023 
 Min.   : 2.100                 Min.   :   732   Length:193        
 1st Qu.: 6.400                 1st Qu.:  4593   Class :character  
 Median : 9.400                 Median : 12672   Mode  :character  
 Mean   : 9.028                 Mean   : 20812                     
 3rd Qu.:11.600                 3rd Qu.: 30588                     
 Max.   :14.100                 Max.   :146830                     
 NA's   :14                     NA's   :14                         
> 
> # Mean Average IQ
> mean(df$Average.IQ, na.rm = TRUE)
[1] 82.04793
> 
> # Highest IQ country
> df[which.max(df$Average.IQ), ]
  Rank Country Average.IQ Continent Literacy.Rate Nobel.Prices HDI..2021.
1    1   Japan     106.48      Asia          0.99           29      0.925
  Mean.years.of.schooling...2021 GNI...2021 Population...2023
1                           13.4      42274         123294513
> 
> hist(
+     df$Average.IQ,
+     main = "Distribution of Average IQ",
+     xlab = "Average IQ",
+     ylab = "Frequency",
+     col = "skyblue",
+     border = "black"
+ )
> 
> savehistory("my_code.R")
> 