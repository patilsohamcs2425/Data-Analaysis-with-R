install.packages("dplyr")

library(dplyr)
library(readr)

data <- read_csv("Cleaned_data.csv")

head(data)


# Example 1: Single Condition
# Filter for people with income > 100000

high_income_subset <- subset(data, income > 100000)

cat("Number of people with income > 100000:", nrow(high_income_subset), "\n")
summary(high_income_subset$income)

# Example 2: Multiple Conditions (AND)
# income > 100000 AND credit_score > 700

high_income_good_credit <- subset(data, income > 100000 & credit_score > 700)

cat("High income AND good credit:", nrow(high_income_good_credit), "\n")
head(high_income_good_credit)

# Example 3: Multiple Conditions (OR)
# loan_amount > 40000 OR loan_approved == TRUE

special_cases_subset <- subset(data, loan_amount > 40000 | loan_approved == TRUE)

cat("Number of special cases:", nrow(special_cases_subset), "\n")
head(special_cases_subset)

# Method 2: Using dplyr::filter()#

# Example 1: Single Condition
# credit_score < 500

low_credit_filter <- data |>
  filter(credit_score < 500)

cat("Low credit (<500):", nrow(low_credit_filter), "\n")
summary(low_credit_filter$credit_score)

# Example 2: Multiple Conditions (AND)
# loan_approved == FALSE AND years_employed < 5

not_approved_short_exp <- data |>
  filter(loan_approved == FALSE, years_employed < 5)

cat("Not approved + short experience:", nrow(not_approved_short_exp), "\n")
head(not_approved_short_exp)

# Example 3: Using %in%


points_filter <- data |>
  filter(points %in% c(25, 50, 55))

cat("People with points 25, 50, or 55:", nrow(points_filter), "\n")
table(points_filter$points)

