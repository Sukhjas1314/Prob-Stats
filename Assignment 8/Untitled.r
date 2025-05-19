# Assignment 8


# Q1.
df <- read.csv(file.choose()) #(a)
summary(df)

dim(df) #(b)
head(df,10)

m <- mean(df$Wall.Thickness) #(c)
print(m)
hist(df$Wall.Thickness)

abline(v=m,col = "red", lty = 2, lwd = 2) #(d)

#if max on mean line then it's standard normal distribution else it's normal distribution

#(a)
par(mfrow = c(1,4))
s10 <- c() 

for(i in 1:10){
  s10[i] <- mean(sample(df$Wall.Thickness, 10, TRUE))
}

hist(s10)
abline(v=mean(s10), col = "red", lty = 2, lwd = 2)

#(b)
s50 <- c();
for(i in 1:50){
  s50[i] <- mean(sample(df$Wall.Thickness,50,TRUE))
}

hist(s50)
abline(v=mean(s50), col = "red", lty = 2, lwd = 2)

s500 <- c();
for(i in 1:500){
  s500[i] <- mean(sample(df$Wall.Thickness,500,TRUE))
}

hist(s500)
abline(v=mean(s500), col = "blue", lty = 2, lwd = 2)

s9000 <- c();
for(i in 1:9000){
  s9000[i] <- mean(sample(df$Wall.Thickness,9000,TRUE))
}

hist(s9000)
abline(v=mean(s9000), col = "yellow", lty = 2, lwd = 2)


# Q2.
# Given data
age <- c(58, 69, 43, 39, 63, 52, 47, 31, 74, 36)
cholesterol <- c(189, 235, 193, 177, 154, 191, 213, 165, 198, 181)

# Create a data frame
data <- data.frame(age, cholesterol)

# (1) Scatter plot with regression line
plot(data$age, data$cholesterol,
     main = "Scatter Plot: Age vs Cholesterol",
     xlab = "Age",
     ylab = "Cholesterol Level",
     pch = 16,
     col = "blue")

# (2) Fit linear regression model
model <- lm(cholesterol ~ age, data = data)

# (3) Add regression line to plot
abline(model, col = "red", lwd = 2)

# (4) Predict cholesterol for a 60-year-old man
new_age <- data.frame(age = 60)
predicted_chol <- predict(model, newdata = new_age)
cat("Estimated cholesterol level for a 60-year-old man:", round(predicted_chol, 2), "\n")


# Q3.
# Marks before and after the course 
before <- c(145, 173, 158, 141, 167, 159, 154, 167, 145, 153) 
after <- c(155, 167, 156, 149, 168, 162, 158, 169, 157, 161)

# Perform paired t-test 
t_test_result <- t.test(after, before, paired = TRUE, alternative = "greater", conf.level = 0.95) 

# Display the result 
print(t_test_result)
 