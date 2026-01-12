library(ggplot2)

airbnb <- read.csv("Airbnb_Open_Data.csv", stringsAsFactors = FALSE)

# Rename column
colnames(airbnb)[colnames(airbnb) == "room.type"] <- "room_type"

# Clean price
airbnb$price <- as.numeric(gsub("[$,]", "", airbnb$price))

# Histogram
ggplot(airbnb, aes(x = price)) +
  geom_histogram(binwidth = 50) +
  ggtitle("Histogram of Airbnb Prices")

# Boxplot
ggplot(airbnb, aes(x = room_type, y = price)) +
  geom_boxplot() +
  ggtitle("Boxplot of Airbnb Prices by Room Type")
