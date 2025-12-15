 print("--- 5. Independent Two-Sample t-test ---")
# Read the dataset
df <- read.csv("heart_disease_uci.csv")
# Independent two-sample t-test
t_test_two <- t.test(age ~ sex, data = df)
#Print result
print(t_test_two)