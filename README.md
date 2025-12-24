#📘 Country IQ, Development Indicators & Statistical Analysis  
### **Team Research & Development Project (R Programming Coursework)**  

This repository contains a full statistical analysis of global IQ data and its relationship with key development indicators such as:  
- **Literacy Rate**  
- **Human Development Index (HDI)**  
- **Gross National Income (GNI)**  
- **Mean Years of Schooling**  
- **Nobel Prizes**  

The project includes **data cleaning, descriptive statistics, visualisations, correlation analysis, linear regression, logistic regression**, and classification of IQ levels.

---

# 📂 Project Structure

```
Team-Research-and-Development-Project/
│
├── avgIQpercountry.csv                     # Main dataset
│
├── readdataset.R                           # Load & inspect dataset
├── DESCRIPTIVE STATISTICS.R                # Summary statistics
├── Team-Research-and-Development-Project.R # Exploratory visualisations
├── average Global IQ.R                     # Histogram of global IQ
├── Linearregression.R                      # Linear regression modelling
├── correlationheatmap Logisticregression.R # Correlation + logistic regression
├── scatterplot GNIvsHDI.R                  # GNI vs HDI scatter plot
├── Correlation matrix                      # Correlation matrix visualisation
│
├── README.md (this file)
└── Team-Research-and-Development-Project.Rproj
```

---

# 🧾 Dataset Description

### **📌 avgIQpercountry.csv Columns**
| Column | Description |
|--------|-------------|
| Rank | IQ ranking of the country |
| Country | Country name |
| Average IQ | Estimated national average IQ |
| Continent | Continent of the country |
| Literacy Rate | Literacy proportion (0–1 scale) |
| Nobel Prices | Nobel Prize count/indicator |
| HDI (2021) | Human Development Index |
| Mean years of schooling - 2021 | Avg. schooling years |
| GNI - 2021 | Gross National Income per capita |
| Population - 2023 | Population size |

### **📌 iq_classification.csv**
Contains IQ ranges mapped to:
- IQ category (e.g., "Genius", "Above Average", etc.)  
- Approximate population percentile  

---

# 🎯 Objectives

This research project aims to:

1. Analyse global differences in IQ across countries and continents.  
2. Explore relationships between IQ and development factors:
   - Literacy rate  
   - HDI  
   - GNI  
   - Education  
3. Visualise the data using appropriate statistical plots.  
4. Build **linear regression** models predicting IQ.  
5. Build **logistic regression** models predicting whether a country is above or below median IQ.  
6. Provide interpretations suitable for academic submission.

---

# 📊 Full Statistical Analysis Overview

---

## **1️⃣ Data Loading & Cleaning**

Scripts:  
`readdataset.R`, `DESCRIPTIVE STATISTICS.R`, `correlationheatmap Logisticregression.R`

Includes:
- Reading CSV files with `read_csv()`
- Displaying structure (`str()`) and summaries (`summary()`)
- Cleaning column names (removing spaces, renaming)
- Converting relevant columns to numeric
- Handling missing values

Example cleaning snippet:

```r
df <- df %>%
  rename(
    AverageIQ = `Average IQ`,
    LiteracyRate = `Literacy Rate`,
    NobelPrizes = `Nobel Prices`,
    HDI = `HDI (2021)`,
    MeanYearsSchooling = `Mean years of schooling - 2021`,
    GNI = ` GNI - 2021`
  )
```

---

## **2️⃣ Descriptive Statistics**

Includes:
- Mean, median, quartiles
- Variance & standard deviation
- Min and max values
- Printouts of summary statistics for all numeric columns

Example:

```r
summary(df$AverageIQ)
summary(df$LiteracyRate)
summary(df$HDI)
```

---

## **3️⃣ Visualisations**

Scripts:  
`Team-Research-and-Development-Project.R`, `average Global IQ.R`, `Histogram of IQ score`, `scatterplot GNIvsHDI.R`

### Key Plots:
### ✔ Histogram of Global IQ  
Shows distribution of IQ scores across 193 countries.

### ✔ Top 10 Countries by IQ  
Bar chart ranking highest-IQ nations.

### ✔ Scatter Plots  
- IQ vs Literacy  
- HDI vs GNI (log scale)  
- IQ vs Education  

### ✔ Correlation Heatmap  
Generated using `corrplot()`:

```r
corrplot(cor(df_numeric), method = "color", tl.cex = 0.8)
```

---

## **4️⃣ Correlation Analysis**

- Select only numeric variables.
- Compute Pearson correlation matrix.
- Visual interpretation of relationships:
  - Higher HDI tends to correlate with higher IQ.
  - Greater schooling years → higher IQ.
  - Literacy and GNI positively correlate with IQ.

---

## **5️⃣ Linear Regression Modelling**

Script: `Linearregression.R`

### Model Example:

```r
model <- lm(AverageIQ ~ LiteracyRate + HDI + GNI + MeanYearsSchooling, data = df)
summary(model)
```

### Interpretation Includes:
- Which variables significantly predict IQ  
- Model accuracy (R² value)  
- Influence of education and development indicators  

---

## **6️⃣ Logistic Regression (IQ Classification)**

### Steps:
1. Compute median IQ
2. Create a binary variable:

```r
df$IQ_level <- ifelse(df$AverageIQ >= median(df$AverageIQ), "Above", "Below")
```

3. Logistic regression:

```r
logit_model <- glm(IQ_level ~ LiteracyRate + HDI + GNI + MeanYearsSchooling,
                   data = df, family = "binomial")
```

4. Model outputs include:
- Odds ratios  
- Confidence intervals  
- Key predictors  

---

# 🛠 Required R Packages

Install all required packages:

```r
install.packages(c(
  "readr", "tibble", "dplyr", "ggplot2", "tidyverse",
  "knitr", "kableExtra", "corrplot"
))
```

---

# ▶️ How to Run the Project

### ⭐ Step 1 — Open the Project
- Open **RStudio**
- Go to **File → Open Project…**
- Select **Team-Research-and-Development-Project.Rproj**

---

### ⭐ Step 2 — Install Required Packages (Run Once)
install.packages(c(
  "readr", "tibble", "dplyr", "ggplot2",
  "tidyverse", "knitr", "kableExtra", "corrplot"
))

---

### ⭐ Step 3 — Load the Dataset
Ensure **avgIQpercountry.csv** is inside the project folder  
so all scripts can access it automatically.

---

### ⭐ Step 4 — Run the Main Code File
Open and run the **main analysis script**:

**`main.R`**

This file generates:
- Top 10 IQ countries plot  
- IQ histogram  
- Scatter plots  
- IQ classification  
- Data exploration  

You may also run additional scripts for specific tasks:
- Descriptive statistics  
- Correlation heatmap  
- Linear regression  
- Logistic regression  
- GNI vs HDI plot  

---

### ⭐ Step 5 — View Results
- All **plots** appear in the **Plots** panel  
- All **model outputs** appear in the **Console**

---

# 📚 Research Summary 

### **Key Findings**
- IQ varies significantly across continents.
- Literacy, HDI, and education strongly correlate with IQ.
- Linear regression shows:
  - HDI and schooling years are strong predictors.
- Logistic regression successfully classifies countries above/below median IQ with measurable accuracy.

### **Limitations**
- IQ estimates by country are debated.
- Nobel Prize data has high variance.
- GNI may require log transformation for proper analysis.

### **Future Improvements**
- Add machine learning models  
- Include time-series HDI/GNI trends  
- Compare with other datasets  

---

# 👥 Authors

- **Jahid Hasan Aoni (24145100)**
- **Md Jamilur Rahaman (24135539)**
- **Nusrat Jahan (24146373)**
- **Fahmida Khanom (24153498)**
- **Rafi Ahmad (24153138)**


