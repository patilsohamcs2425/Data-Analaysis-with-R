# Load necessary library to read CSV
library(readr)

# 1. LOAD DATA
titanic_df <- read_csv("test.csv") # replace with your csv file path
print("--- Data Loaded ---")

# 2. USING str() (Structure)
print("--- OUTPUT OF str() ---")
str(titanic_df)

# 3. USING summary() (Statistical Summary)
print("--- OUTPUT OF summary() [Before Factor Conversion] ---")
summary(titanic_df)

# 4. IMPROVING summary() WITH FACTORS
# Convert some character columns to factor for better summary
titanic_df$Pclass <- as.factor(titanic_df$Pclass)
titanic_df$Sex <- as.factor(titanic_df$Sex)
titanic_df$Embarked <- as.factor(titanic_df$Embarked)

print("--- OUTPUT OF summary() [After Factor Conversion] ---")
summary(titanic_df)

# 5. Accessing Specific Summaries
avg_age <- mean(titanic_df$Age, na.rm = TRUE)
max_fare <- max(titanic_df$Fare, na.rm = TRUE)

print(paste("Average Age:", round(avg_age, 2)))
print(paste("Highest Fare:", max_fare))
