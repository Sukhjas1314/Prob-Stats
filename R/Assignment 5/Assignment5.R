# Assignment 5

# install.packages("dplyr")
# install.packages("pillar")
library(dplyr)

# Q1.
data = read.csv('/Users/sukhmanpreetsingh/Desktop/SEM - 5/Data Science/R/Assignment 5/daily_show_guests.csv')
head(data,10)


# Q2.
colnames(data)

colnames(data) = c(
  'year','job','date','category','guest_name'
)

colnames(data)