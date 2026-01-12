
install.packages("ggplot2")   
library(ggplot2)
library(dplyr)
#  Load the dataset
pokemon <- read.csv("pokemon.csv")
# View dataset
head(pokemon)
str(pokemon)
# Step 3: Scatter Plot
# Attack vs Defense
ggplot(pokemon, aes(x = Attack, y = Defense)) +
  geom_point() +
  ggtitle("Attack vs Defense of Pokemon") +
  xlab("Attack") +
  ylab("Defense")
# Create summary data
gen_count <- pokemon %>%
  group_by(Generation) %>%
  summarise(Count = n())

# Pie chart
gen3_data <- pokemon %>%
  filter(Generation %in% c(1, 2, 3)) %>%
  group_by(Generation) %>%
  summarise(Count = n())
ggplot(gen3_data, aes(x = "", y = Count, fill = factor(Generation))) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y") +
  ggtitle("Pokemon Distribution (Generation 1–3)") +
  theme_void() +
  scale_fill_manual(
    values = c("#8DA0CB", "#66C2A5", "#FC8D62"),
    name = "Generation"
  )

# Create High-Low data
hp_range <- pokemon %>%
  group_by(Type.1) %>%
  summarise(
    HP_Min = min(HP, na.rm = TRUE),
    HP_Max = max(HP, na.rm = TRUE)
  )

# High-Low chart
ggplot(hp_range, aes(x = Type.1)) +
  geom_linerange(aes(ymin = HP_Min, ymax = HP_Max), color = "red", size = 1.2) +
  ggtitle("HP High-Low Range by Pokemon Type") +
  xlab("Pokemon Type") +
  ylab("HP") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))




