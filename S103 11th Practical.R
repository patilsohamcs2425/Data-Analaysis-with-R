library(dplyr)
library(tidyr)

# Read data and add a GameID for tracking rows
df <- read.csv("Vgsales.csv", na.strings = c("", "NA")) %>% 
  mutate(GameID = row_number()) %>% 
  select(GameID, Name, Genre, NA_Sales, EU_Sales, JP_Sales, Other_Sales)

print("--- 1. Original Wide Data ---")
print(head(df))
####PIVOT_LONGER — Convert Sales Columns Into Long Format####
long_df <- df %>% 
  pivot_longer(
    cols = c(NA_Sales, EU_Sales, JP_Sales, Other_Sales),
    names_to = "Region",
    values_to = "Sales"
  )

print("--- 2. Long Format (pivot_longer) ---")
print(head(long_df, 8))
####PIVOT_WIDER — Convert Long Data Back to Wide Format####
wide_df <- long_df %>% 
  pivot_wider(
    names_from = Region, 
    values_from = Sales
  )

print("--- 3. Wide Format (pivot_wider) ---")
print(head(wide_df))
####Genre as Columns####
df_clean <- df %>% 
  mutate(Genre = ifelse(is.na(Genre), "Unknown", Genre))

genre_pivot <- df_clean %>% 
  select(GameID, Genre, NA_Sales) %>% 
  pivot_wider(
    names_from = Genre,
    values_from = NA_Sales
  )

print("--- 4. Genre Pivot (Spreading Genres) ---")
print(head(genre_pivot))
