# Country IQ, Literacy, Nobel Prizes and HDI Analysis

This project performs an exploratory data analysis (EDA) on the
relationship between **Average IQ**, **Literacy Rate**, **Nobel
Prizes**, and **Human Development Index (HDI)** across countries.\
The analysis uses R for data manipulation, visualisation, and summary
statistics.

------------------------------------------------------------------------

## 📁 Dataset

The dataset used in this project is:

**`avgIQpercountry.csv`**

It must contain the following columns:

-   `Country`
-   `Average IQ`
-   `Literacy Rate`
-   `Nobel Prices`
-   `Continent`
-   `HDI (2021)`

Ensure that the column names match exactly (including spaces and
capitalisation).

------------------------------------------------------------------------

## 📦 Required R Packages

``` r
library(readr)
library(tibble)
```

Install them if needed:

``` r
install.packages("readr")
install.packages("tibble")
```

------------------------------------------------------------------------

## ▶️ How to Run the Script

1.  Place `avgIQpercountry.csv` in your project folder.
2.  Open RStudio.
3.  Open the script containing the analysis code.
4.  Run the script using **Source** or line-by-line execution.
5.  Plots will appear in the **Plots** pane, and results in the
    **Console**.

------------------------------------------------------------------------

## 📊 Analysis Performed

### 1. **Top 10 Countries by IQ**

-   Sorts countries in descending IQ order.
-   Displays a bar plot of the highest IQ values.

### 2. **IQ vs Literacy Rate**

-   Scatter plot with regression line.
-   Shows potential correlation patterns.

### 3. **IQ vs Nobel Prizes**

-   Scatter plot with regression line.
-   Highlights whether more Nobel Prizes correlate with higher IQ.

### 4. **Highest and Lowest IQ**

-   Prints the maximum and minimum IQ values found in the dataset.

### 5. **IQ Grouping**

Countries are grouped into: - Low (0--50) - Average (50--100) - High
(100--150)

A bar plot displays how many countries fall into each group.

### 6. **Boxplots by Continent**

Two boxplots are generated: - Average IQ by continent - Literacy Rate by
continent

### 7. **IQ vs HDI (Human Development Index)**

-   Scatter plot comparing HDI (2021) with Average IQ.

### 8. **Continent-Level Statistics**

Using `aggregate()`, the script computes: - Mean IQ per continent\
- Mean literacy rate per continent\
- Total Nobel Prizes per continent

### 9. **Median-Based IQ Classification**

Countries are labelled: - **Above Median IQ** - **Below Median IQ**

A frequency table is created.

------------------------------------------------------------------------

## 👥 Authors

-   Jahid Hasan Aoni-24145100

------------------------------------------------------------------------

## ✔️ Version Control Instructions

If using RStudio + Git:

1.  Create a new file **README.md**\
2.  Paste this content\
3.  Save\
4.  Go to the **Git** pane → select `README.md`\
5.  Commit → Push
