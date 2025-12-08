#==============================================================================
# R Script: Vertical Concatenation using rbind()
# Datasets: Student_performance_data.csv & heart_disease_uci.csv
#==============================================================================

#==============================================================================
# 1. SETUP: Load and Inspect Data
#==============================================================================

# 1.1 Load the Student Performance dataset
students_df <- read.csv("Student.csv")

# 1.2 Load the Heart Disease dataset
heart_df <- read.csv("heart_disease_uci.csv")

print("--- Data Structure Before Transformation ---")
print(names(students_df))   # StudentID, Age, Gender, GPA, etc.
print(names(heart_df))      # id, age, sex, chol, etc.

#==============================================================================
# 2. DATA PREPARATION (Aligning Columns)
#==============================================================================

# rbind() will FAIL if column names don't match.
# We must standardize them. Let's create a common structure:
# Common Columns: "Dataset" and "Value"
# Dataset = Student / Heart
# Value = GPA (students) or Cholesterol (heart)

#-----------------------------------------------------------
# 2.1 Prepare Student Data
# Use 'GPA' as the numeric value
#-----------------------------------------------------------
students_clean <- data.frame(
  Dataset = "Student",
  Value = students_df$GPA   # GPA column
)

#-----------------------------------------------------------
# 2.2 Prepare Heart Disease Data
# Use 'chol' as the numeric value
#-----------------------------------------------------------
heart_clean <- data.frame(
  Dataset = "Heart",
  Value = heart_df$chol     # cholesterol column
)

# Ensure both 'Value' columns are numeric (Good practice)
students_clean$Value <- as.numeric(students_clean$Value)
heart_clean$Value <- as.numeric(heart_clean$Value)

#==============================================================================
# 3. CONCATENATE USING rbind()
#==============================================================================

combined_data <- rbind(students_clean, heart_clean)

#==============================================================================
# 4. OUTPUT SUMMARY
#==============================================================================

print("--- Combined Data Summary ---")
print(paste("Student rows:", nrow(students_clean)))
print(paste("Heart rows:", nrow(heart_clean)))
print(paste("Total rows (Expected):",
            nrow(students_clean) + nrow(heart_clean)))
print(paste("Total rows (Actual):", nrow(combined_data)))

print("--- Preview of Combined Data (Top and Bottom) ---")
print(head(combined_data))   # Shows Student GPA values
print(tail(combined_data))   # Shows Heart chol values
