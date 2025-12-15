library(dplyr)
library(psych)

data <- read.csv("test.csv")

# Example of creating a cross-tabulation of 'Pclass' and 'Embarked'
cross_tab <- table(data$Pclass, data$Embarked)

# Print the cross-tabulation
print(cross_tab)

