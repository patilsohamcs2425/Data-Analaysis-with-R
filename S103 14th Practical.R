library(lubridate)
library(dplyr)

data <- read.csv("london_merged.csv", stringsAsFactors = FALSE)

processed_data <- data %>%
  mutate(
    Actual_DateTime = ymd_hms(timestamp),
    Year = year(Actual_DateTime),
    Month = month(Actual_DateTime),
    Month_Name = month(Actual_DateTime, label = TRUE, abbr = TRUE),
    Day = day(Actual_DateTime),
    Hour = hour(Actual_DateTime),
    Minute = minute(Actual_DateTime),
    Weekday_Num = wday(Actual_DateTime),
    Weekday_Name = wday(Actual_DateTime, label = TRUE, abbr = FALSE),
    Quarter = quarter(Actual_DateTime),
    Day_of_Year = yday(Actual_DateTime)
  )

print(processed_data)
