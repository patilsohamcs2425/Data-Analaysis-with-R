# Load required library
library(dplyr)

# Import dataset
titanic <- read.csv("tested.csv")

# View structure and data
str(titanic)
head(titanic)

# Convert variables to factors
titanic$Sex <- as.factor(titanic$Sex)
titanic$Survived <- as.factor(titanic$Survived)

# Create contingency table
table_data <- table(titanic$Sex, titanic$Survived)

# Display contingency table
table_data

# Perform Chi-square test
chi_result <- chisq.test(table_data)

# Display test result
chi_result
