# Load packages

library(tidyverse)


#Load dataset
titanic <- read.csv("C:/Users/User/Downloads/Titanic-Dataset.csv")

# View structure
str(titanic)

# Data Cleaning


# Convert variables to factors
titanic$Survived <- factor(titanic$Survived, labels = c("No", "Yes"))
titanic$Sex <- factor(titanic$Sex)
titanic$Pclass <- factor(titanic$Pclass)
titanic$Embarked <- factor(titanic$Embarked)

