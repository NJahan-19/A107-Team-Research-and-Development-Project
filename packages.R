# ======================================================================
# packages.R
# Install all required R packages for the IQ Analysis Project
# ======================================================================

install.packages(c(
  "readr",        # CSV reading and data import
  "tibble",       # Enhanced data frame handling
  "dplyr",        # Data manipulation and cleaning
  "ggplot2",      # Data visualisation
  "tidyverse",    # Core R data science libraries
  "knitr",        # Report generation support
  "kableExtra",   # Stylish tables in reports
  "corrplot"      # Correlation heatmaps
))
