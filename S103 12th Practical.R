
students_df <- read.csv("Student.csv")

# 1.2 Load the Heart Disease dataset
heart_df <- read.csv("heart_disease_uci.csv")

print("--- Data Structure Before Transformation ---")
print(names(students_df))   # StudentID, Age, Gender, GPA, etc.
print(names(heart_df))      # id, age, sex, chol, etc.


# rbind() will FAIL if column names don't match.
# We must standardize them. Let's create a common structure:
# Common Columns: "Dataset" and "Value"
# Dataset = Student / Heart
# Value = GPA (students) or Cholesterol (heart)


students_clean <- data.frame(
  Dataset = "Student",
  Value = students_df$GPA   # GPA column
)

heart_clean <- data.frame(
  Dataset = "Heart",
  Value = heart_df$chol     # cholesterol column
)

# Ensure both 'Value' columns are numeric (Good practice)
students_clean$Value <- as.numeric(students_clean$Value)
heart_clean$Value <- as.numeric(heart_clean$Value)

combined_data <- rbind(students_clean, heart_clean)


print("--- Combined Data Summary ---")
print(paste("Student rows:", nrow(students_clean)))
print(paste("Heart rows:", nrow(heart_clean)))
print(paste("Total rows (Expected):",
            nrow(students_clean) + nrow(heart_clean)))
print(paste("Total rows (Actual):", nrow(combined_data)))

print("--- Preview of Combined Data (Top and Bottom) ---")
print(head(combined_data))   # Shows Student GPA values
print(tail(combined_data))   # Shows Heart chol values

