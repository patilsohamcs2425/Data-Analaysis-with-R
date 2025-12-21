library(dplyr) 
students <- read.csv("StudentsPerformance.csv")
# Rename column for easy usage
colnames(students)[7] <- "reading_score"

# Convert test preparation course to factor
students$test.preparation.course <- as.factor(students$test.preparation.course)
anova_result <- aov(reading_score ~ test.preparation.course, data = students)

# ANOVA table
summary(anova_result)
