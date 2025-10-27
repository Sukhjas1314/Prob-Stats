# Assignment 6
# Commands used commonly : 
  # (1) Select
  # (2) filter
  # (3) distinct
  # (4) arrange
  # (5) group by
  # (6) mutate
  # (7) correlation
  # (8) standard deviation

# Q1.
# (1)
library(dplyr)
df1 <- read.csv("/Users/sukhmanpreetsingh/Desktop/SEM - 5/Data Science/R/Assignment 6/Continent_data.csv")

q1_1 <- df1 %>%
  group_by(Continent) %>%
  summarise(UniqueCountries = n_distinct(Country))
print("Unique countries per continent :")
print(q1_1)


# (2)
q1_2 <- df1 %>%
  filter(Continent == "Europe") %>%
  arrange(gdpPerc_K) %>%
  select(Country, Year, gdpPerc_K) %>%
  head(1)
print("European nation with lowest GDP per capita : ")
print(q1_2)


# (3)
q1_3 <- df1 %>%
  group_by(Continent, Year) %>%
  summarise(AverageLifeExp = mean(LifeExp), .groups = 'drop')
print("Average life expectancy by continent and year : ")
print(q1_3)


# (4)
df1 <- df1 %>%
  mutate(
    Pop = as.numeric(gsub("M", "", Pop_M)) * 1000000
  )
q1_4 <- df1 %>%
  mutate(TotalGDP = gdpPerc_K * Pop) %>%
  group_by(Country) %>%
  summarise(OverallTotalGDP = sum(TotalGDP)) %>%
  arrange(desc(OverallTotalGDP)) %>%
  head(5)
print("Top 5 countries by total combined GDP : ")
print(q1_4)


# (5)
q1_5 <- df1 %>%
  filter(LifeExp >= 80) %>%
  select(Country, Year, LifeExp)
print("--- Q1.5: Life expectancy >= 80 years ---")
print(q1_5)


# (6)
q1_6 <- df1 %>%
  group_by(Country) %>%
  summarise(Correlation = cor(LifeExp, gdpPerc_K, use = "complete.obs")) %>%
  mutate(AbsCorrelation = abs(Correlation)) %>%
  arrange(desc(AbsCorrelation)) %>%
  head(10)
print("Top 10 strongest correlations (LifeExp vs. gdpPerc) : ")
print(q1_6)


# (7)
q1_7 <- df1 %>%
  filter(Continent != "Asia") %>%
  group_by(Continent, Year) %>%
  summarise(AveragePopulation = mean(Pop), .groups = 'drop') %>%
  arrange(desc(AveragePopulation)) %>%
  head(5)
print("Highest average population (excluding Asia) : ")
print(q1_7)


# (8)
q1_8 <- df1 %>%
  group_by(Country) %>%
  summarise(PopulationSD = sd(Pop)) %>%
  arrange(PopulationSD) %>%
  head(3)
print("Three most consistent populations (lowest SD) : ")
print(q1_8)


# (9)
given_year_to_exclude <- 1957

q1_9 <- df1 %>%
  group_by(Country) %>%
  arrange(Year) %>%
  mutate(
    Prev_Pop = lag(Pop),
    Prev_LifeExp = lag(LifeExp)
  ) %>%
  filter(Year != given_year_to_exclude) %>%
  filter(Pop < Prev_Pop & LifeExp > Prev_LifeExp) %>%
  select(Country, Year, Pop, Prev_Pop, LifeExp, Prev_LifeExp)

print(paste("Pop decrease and LifeExp increase (excluding", given_year_to_exclude, ") : "))
print(q1_9)


# Q2.
# (1)
med_data <- data.frame(
  MedID = paste0("M", 101:110),
  Med_Name = c("Paracetamol", "Aspirin", "Ibuprofen", "Amoxicillin", "Atorvastatin", "Metformin", "Amlodipine", "Omeprazole", "Losartan", "Paracetamol"),
  Company = c("Apex", "Sun", "Cipla", "Apex", "Sun", "Cipla", "Dr. Reddy", "Apex", "Sun", "Cipla"),
  Manf_year = sample(2020:2023, 10, replace = TRUE),
  Exp_date = sample(seq(as.Date('2024-01-01'), as.Date('2026-12-31'), by="day"), 10),
  Quantity_in_stock = sample(100:1000, 10, replace = TRUE),
  Sales = sample(500:5000, 10, replace = TRUE)
)
write.csv(med_data, "DataSet.csv", row.names = FALSE)
print("DataSet.csv' created successfully : ")


# (2)
df2 <- read.csv("DataSet.csv")
print("First 4 records : ")
print(head(df2, 4))


# (3)
print("--- Q2.3: Last 4 records ---")
print(tail(df2, 4))


# (4)
df2$Exp_date_numeric <- as.numeric(as.Date(df2$Exp_date))
q2_4_cor <- cor(df2$Quantity_in_stock, df2$Exp_date_numeric)
print(paste("Correlation (Stock vs Exp_date):", q2_4_cor))


# (5)
# sum
# rm(sum)
sales_by_year <- aggregate(Sales ~ Manf_year, data = df2, FUN = sum)

print("Generating bar plot...")
barplot(
  height = sales_by_year$Sales,
  names.arg = sales_by_year$Manf_year,
  main = "Total Sales by Manufacturing Year",
  xlab = "Manufacturing Year",
  ylab = "Total Sales",
  col = "skyblue"
)


# (6)
med_counts_by_company <- aggregate(Med_Name ~ Company, data = df2, FUN = function(x) length(unique(x)))

names(med_counts_by_company)[2] <- "UniqueMedicineTypes"

q2_6_result <- med_counts_by_company[med_counts_by_company$UniqueMedicineTypes > 1, ]

print("Companies with > 1 medicine type : ")
print(q2_6_result)


# (7)
q2_7_result <- unique(df2$Med_Name)
print("Unique medicine types available : ")
print(q2_7_result)


# (8)
df2$Exp_date <- as.Date(df2$Exp_date)

print("Generating box plot...")
boxplot(
  Exp_date ~ Med_Name,
  data = df2,
  main = "Expiration Date Distribution by Medicine",
  xlab = "Medicine Name",
  ylab = "Expiration Date",
  las = 2 
)


# (9)
q2_9_result <- mean(df2$Quantity_in_stock)
print(paste("Average stock in store:", q2_9_result))


# (10)
print("Generating scatter plot with regression line... : ")

plot(
  df2$Manf_year,
  df2$Sales,
  main = "Sales vs. Manufacturing Year",
  xlab = "Manufacturing Year",
  ylab = "Sales",
  pch = 19 
)

model <- lm(Sales ~ Manf_year, data = df2)

abline(model, col = "red", lwd = 2)