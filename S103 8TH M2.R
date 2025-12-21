# Load required libraries
library(dplyr)
# Import dataset
insurance <- read.csv("insurance.csv")
# View structure and data
str(insurance)
head(insurance)
# Convert categorical variables to factors
insurance$sex <- as.factor(insurance$sex)
insurance$smoker <- as.factor(insurance$smoker)
# Perform Two-Way ANOVA
anova_result <- aov(charges ~ sex * smoker, data = insurance)
# Display ANOVA table
summary(anova_result)


