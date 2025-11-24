
install.packages(c("readr", "psych"))

# Load packages
library(readr)
library(psych)

my_data <- read.csv("vgsales.csv")

head(my_data)


tail(my_data)


str(my_data)


summary(my_data)

cat("Column Names: ", names(my_data), "\n")


describe(my_data)

