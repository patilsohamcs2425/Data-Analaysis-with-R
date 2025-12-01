# ==============================================================================
# 1. IMPORT DATASET
# ==============================================================================
library(dplyr) # select() is part of the dplyr package

# Import the new CSV file
disease <- read.csv("disease_diagnosis.csv")

print("--- Original Dataset (First 3 rows) ---")
print(head(disease, 3))

# ==============================================================================
# 2. SELECTING VARIABLES (Keeping Columns)
# ==============================================================================

# Method A: Select specific columns by name
# Scenario: We only want the Patient_ID, Age, and Diagnosis
selected_cols <- disease %>%
  select(Patient_ID, Age, Diagnosis)

print("--- Selected Specific Columns ---")
print(head(selected_cols, 3))

# Method B: Select a range of adjacent columns
# Scenario: Select everything from 'Patient_ID' to 'Symptom_3'
range_cols <- disease %>%
  select(Patient_ID:Symptom_3)

print("--- Selected Range of Columns ---")
print(head(range_cols, 3))

# Method C: Select using helper functions (e.g., starts_with)
# Scenario: Select columns that start with "S" (Symptom_1, Symptom_2, Symptom_3, Severity)
starts_with_S <- disease %>%
  select(starts_with("S"))

print("--- Selected columns starting with 'S' ---")
print(head(starts_with_S, 3))

# ==============================================================================
# 3. DROPPING VARIABLES (Removing Columns)
# ==============================================================================
# We use the minus sign (-) to remove variables

# Method A: Drop a single specific column
# Scenario: Remove the 'Gender' column
dropped_one <- disease %>%
  select(-Gender)

print("--- Dataset with 'Gender' dropped ---")
print(names(dropped_one)) # Printing names to verify it's gone

# Method B: Drop multiple columns
# Scenario: Remove 'Symptom_1' and 'Symptom_2'
dropped_multiple <- disease %>%
  select(-Symptom_1, -Symptom_2)

print("--- Dataset with 'Symptom_1' and 'Symptom_2' dropped ---")
print(names(dropped_multiple))

# Method C: Drop a range of columns
# Scenario: Remove everything from 'Heart_Rate_bpm' to 'Body_Temperature_C'
dropped_range <- disease %>%
  select(-(Heart_Rate_bpm:Body_Temperature_C))

print("--- Dataset with range 'Heart_Rate_bpm' to 'Body_Temperature_C' dropped ---")
print(names(dropped_range))
