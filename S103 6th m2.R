library(readr)   
library(dplyr)

data <- read.csv("heart_rate_data.csv")

# Perform paired t-tests on the relevant columns. Assuming the following columns: 
# Resting Heart Rate Before (D), Resting Heart Rate After (E), Max Heart Rate During Exercise (F)

# Paired t-test between Resting Heart Rate Before and After
t_test_before_after <- t.test(data$Resting.Heart.Rate.Before, data$Resting.Heart.Rate.After, paired = TRUE)

# Paired t-test between Resting Heart Rate After and Max Heart Rate During Exercise
t_test_after_max <- t.test(data$Resting.Heart.Rate.After, data$Max.Heart.Rate.During.Exercise, paired = TRUE)

# Output the results
print("T-test for Resting Heart Rate Before vs After")
print(t_test_before_after)

print("T-test for Resting Heart Rate After vs Max Heart Rate During Exercise")
print(t_test_after_max)