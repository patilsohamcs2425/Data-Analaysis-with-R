# Install required libraries
install.packages("dplyr")
install.packages("psych")

library(dplyr)
library(psych)   # required for describe()

wine_data <- read.csv("WineQT.csv")

# View the dataset

head(wine_data)
str(wine_data)

# Descriptive statistics using summary()

summary(wine_data)

# Descriptive statistics using describe()

describe(wine_data)


# Using dplyr: descriptive stats for numeric variables only
-
wine_numeric <- wine_data %>%
  select(where(is.numeric))

describe(wine_numeric)

