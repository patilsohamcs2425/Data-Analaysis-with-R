install.packages("readr")

# Load your data from the CSV file
data <- read.csv("weight-height.csv")  

# Check the first few rows of the data
head(data)

# For example, let's test the mean height to see if it is significantly different from 70 inches
t_test_height <- t.test(data$Height, mu = 70) 
print(t_test_height)

#assuming you'd like to test if average weight is different from a given value, say 180 lbs
t_test_weight <- t.test(data$Weight, mu = 180)  
print(t_test_weight)
