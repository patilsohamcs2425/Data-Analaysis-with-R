# Pract 6.  Merge and Append
# ==========================================

library(dplyr) # Load the library for bind_rows

# ------------------------------------------
# 1. SETUP: Load Your CSV File
# ------------------------------------------
# Your CSV contains: 
# Patient_ID, Age, Gender, Symptom_1, Symptom_2, Symptom_3,
# Heart_Rate_bpm, Body_Temperature_C, Blood_Pressure_mmHg,
# Oxygen_Saturation_%, Diagnosis, Severity, Treatment_Plan

# Replace with your own file path if needed
data_all <- read.csv("disease_diagnosis.csv")

print("--- Original Dataset ---")
print(head(data_all))

# ------------------------------------------
# Create Two Sample Subsets (Like Jan / Feb)
# ------------------------------------------
# Example: Split dataset into first half and second half
# (You can modify this to match your real need)

data_part1 <- data_all[1:10, ]      # First 10 rows
data_part2 <- data_all[11:20, ]     # Next 10 rows

# New rows to append (simulate new patients)
data_new_patients <- data_all[21:25, ]

print("--- Part 1 Data ---")
print(data_part1)

print("--- Part 2 Data ---")
print(data_part2)

# ------------------------------------------
# 2. MERGE (Joining Columns)
# ------------------------------------------
# Example: Merge part1 and part2 by Patient_ID and Gender
# (Change keys if needed)

merged_data <- merge(
  data_part1,
  data_part2,
  by = c("Patient_ID", "Gender")
)

print("--- Merged Data (Columns Added) ---")
print(merged_data)

# ------------------------------------------
# 3. APPEND (Stacking Rows)
# ------------------------------------------
# Add new patients to the dataset

final_list <- bind_rows(data_all, data_new_patients)

print("--- Appended Data (Rows Added) ---")
print(final_list)
