install.packages("tidyr")
library(dplyr)
library(tidyr)

# 1. CREATE AND IMPORT DATASET

retail_df <- read.csv("student_admission_record_dirty.csv", na.strings = c("", "NA"))

print("--- 1. Original Data (First 6 Rows) ---")
print(head(retail_df))

# Check how many NAs are in each column
print("--- Count of Missing Values per Column ---")
print(colSums(is.na(retail_df)))

# 2. METHOD A: REMOVE MISSING VALUES (na.omit)

clean_omit <- na.omit(retail_df)

print("--- 2. Data after na.omit() ---")
print(paste("Original rows:", nrow(retail_df)))
print(paste("Rows remaining:", nrow(clean_omit)))
print(head(clean_omit))

# 3. METHOD B: REPLACE MISSING VALUES (replace_na)

# Calculate average percentage (ignoring NAs)
avg_percentage <- mean(retail_df$High.School.Percentage, na.rm = TRUE)

clean_replace <- retail_df %>%
  replace_na(list(
    Gender = "Unknown",
    Admission.Test.Score = 0,
    High.School.Percentage = avg_percentage,
    City = "Unknown",
    Admission.Status = "Pending"
  ))

print("--- 3. Data after replace_na() ---")
print(clean_replace[3, ])  # Check row 3 for replacements
print(head(clean_replace))

# Verify remaining NAs
print("--- Remaining NAs after replacement ---")
print(colSums(is.na(clean_replace)))
