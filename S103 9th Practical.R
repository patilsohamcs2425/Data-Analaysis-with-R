
# Install necessary packages if not installed
if (!require(stringr)) install.packages("stringr")
if (!require(tidyr)) install.packages("tidyr")
if (!require(dplyr)) install.packages("dplyr")

library(stringr)
library(tidyr)
library(dplyr)

data <- read.csv("_counterfeit_transactions.csv", stringsAsFactors = FALSE)

print("--- Original Imported Data ---")
print(head(data))

# 2. USING str_sub() ON REAL COLUMNS

# Example A: Extract first 6 characters of transaction_id
data$Trans_Prefix <- str_sub(data$transaction_id, 1, 6)

# Example B: Extract year from transaction_date (YYYY-MM-DD)
data$Trans_Year <- str_sub(data$transaction_date, 1, 4)

print("--- After str_sub() ---")
print(data %>% select(transaction_id, transaction_date, Trans_Prefix, Trans_Year) %>% head())

# 3. SAFE SPLIT OF customer_location

split_loc <- str_split_fixed(data$customer_location, " - ", 2)

data$Location_City    <- split_loc[, 1]
data$Location_Country <- ifelse(split_loc[, 2] == "", NA, split_loc[, 2])

print("--- After Safe Split of customer_location ---")
print(data %>% select(customer_location, Location_City, Location_Country) %>% head())

# 4. BONUS: Using separate() on payment_method
# Only split if it contains a delimiter
if (any(grepl("-", data$payment_method))) {
  
  data <- data %>%
    separate(payment_method, into = c("Payment_Type", "Payment_Subtype"), sep = "-", fill = "right")
  
  print("--- After separate() on payment_method ---")
  print(data %>% select(payment_method, Payment_Type, Payment_Subtype) %>% head())
}


print("--- Final Dataset Preview ---")
print(head(data))

