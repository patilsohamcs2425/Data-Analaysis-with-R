# Load required library
library(dplyr)

cacao_data <- read.csv("flavors_of_cacao.csv", stringsAsFactors = FALSE)

# 1. View the original data
print("--- 1. Original Cacao Dataset ---")
print(head(cacao_data))

# 2. Identify exact duplicates (all columns identical)
duplicates_all <- cacao_data %>%
  group_by_all() %>%
  tally() %>%
  filter(n > 1)

print("--- 2. Exact Duplicates ---")
print(duplicates_all)

# 3. Remove exact duplicates
cacao_clean <- cacao_data %>%
  distinct()

print("--- 3. Dataset after Removing Exact Duplicates ---")
print(head(cacao_clean))

# 4. Identify duplicates based on subset of columns - say, "Company" and "Specific"
duplicates_subset <- cacao_data %>%
  group_by(Company, Specific) %>%
  tally() %>%
  filter(n > 1)

print("--- 4. Duplicates Based on Company and Specific ---")
print(duplicates_subset)

# 5. Keep only unique Company entries (first occurrence only), keep all columns
unique_companies <- cacao_data %>%
  distinct(Company, .keep_all = TRUE)

print("--- 5. Unique Companies Only ---")
print(unique_companies)

