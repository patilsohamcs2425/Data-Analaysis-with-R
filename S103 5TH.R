library(dplyr)
library(readr)

# Load your dataset
data <- read_csv("flavors_of_cacao.csv", show_col_types = FALSE)

# Convert Cocoa Percent into numeric (e.g., "70%" -> 70)
data$CocoaPercentNum <- as.numeric(gsub("%", "", data$`Cocoa\nPercent`))

# Quick view
head(data)

# Example 1: Sorting by a Single Variable (Ascending)
# Sort chocolates by Rating (lowest to highest)

sorted_rating <- data %>%
  arrange(Rating)

head(sorted_rating, 5)

# Example 2: Sorting by a Single Variable (Descending)
# Sort chocolates by Cocoa Percent (highest to lowest)

sorted_cocoa_desc <- data %>%
  arrange(desc(CocoaPercentNum))

head(sorted_cocoa_desc, 5)


# Example 3: Sorting by Two Variables
# 1. First sort by Company Location (alphabetical)
# 2. Then within each location sort by Rating (highest first)

multi_sorted <- data %>%
  arrange(`Company\nLocation`, desc(Rating))

head(multi_sorted, 10)

# Example 4: Combined Filter + Sort
# Filter bars with Cocoa% > 80, then sort by Rating (low to high)

high_cocoa_sorted <- data %>%
  filter(CocoaPercentNum > 80) %>%
  arrange(Rating)

head(high_cocoa_sorted %>% 
       select(`Cocoa\nPercent`, Rating, `Company\nLocation`), 5)

