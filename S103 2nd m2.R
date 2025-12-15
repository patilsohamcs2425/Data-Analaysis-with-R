library(dplyr)
# Read the CSV file
data <- read.csv("PhilipineStudents.csv", stringsAsFactors = TRUE)

# Frequency tables using table()
print("Frequency Table: Gender")
print(table(data$Gender))

print("Frequency Table: Region")
print(table(data$Region))

print("Frequency Table: Degree Program")
print(table(data$Degree.Program))

print("Frequency Table: Lunch Type")
print(table(data$Lunch.Type))

print("Frequency Table: Test Preparation")
print(table(data$Test.Prep))

print("Two-way Frequency Table: Gender vs Test Preparation")
print(table(data$Gender, data$Test.Prep))


# Frequency tables using count() from dplyr
print("Count using dplyr::count - Gender")
print(data %>% count(Gender))

print("Count using dplyr::count - Region")
print(data %>% count(Region))

print("Count using dplyr::count - Degree Program")
print(data %>% count(Degree.Program))

print("Count using dplyr::count - Lunch Type")
print(data %>% count(Lunch.Type))

print("Count using dplyr::count - Test Preparation")
print(data %>% count(Test.Prep))
