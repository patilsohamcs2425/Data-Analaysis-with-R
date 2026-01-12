# PRACTICAL 12: CORRELATION MATRIX USING cor()

# Load dataset
cars <- read.csv("data.csv", stringsAsFactors = FALSE)

# Select numeric columns
cars_numeric <- cars[, sapply(cars, is.numeric)]

# Generate correlation matrix
cor_matrix <- cor(cars_numeric, use = "complete.obs")

# Display matrix
round(cor_matrix, 2)
