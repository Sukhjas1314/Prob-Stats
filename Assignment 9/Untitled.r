# Assignment 9

# Q1.
n = 10
p = 0.4

mean = n*p
variance = n*p*(1-p)
sample_size = 5

cat("The mean is : ",mean)
cat("The variance is : ",variance/sample_size)


# Q2.
install.packages("moments")
library(moments)

simulate_binomial = function(p){
	samples = replicate(10000,mean(rbinom(30,size = 10,prob = p)))
	
	hist(samples,col = "cyan",main = paste("Binomial(10,",p,") Sampling Mean"),xlab = "Sample Mean",breaks = 30,probability = TRUE)

	lines(density(samples),col = "red",lwd = 2)
	
	cat("Skewness for p : ",p," is",skewness(samples),"\n")	
}

par(mfrow = c(1,3))
simulate_binomial(0.2)
simulate_binomial(0.5)
simulate_binomial(0.8)


# Q3.
l = 4
n = 50
num_samples= 10000

sample_means = replicate(num_samples,mean(rpois(n,l)))

theo_mean = l
theo_var = l/n

emp_mean = mean(sample_means)
emp_var = var(sample_means)

cat("Theotrical mean : ",theo_mean)
cat("Theotrical variance : ",theo_var)

cat("Empirical mean : ",emp_mean)
cat("Empirical variance : ",emp_var)

hist(sample_means,breaks = 30,probability = TRUE,col = "cyan",main = "Sampling Distribution of the Mean (Poisson λ = 4)",xlab = "Sample Mean")
lines(density(sample_means),col = "red",lwd = 2)


# Q4.
simulate_poisson = function(l){
	sample_means = replicate(1000,mean(rpois(50,l)))
	hist(sample_means,breaks = 30,probability = TRUE,col = "cyan",main = paste("Sample Mean Distribution (λ =", l, ")"),xlab = "Sample mean")
	lines(density(sample_means),col = "red",lwd = 2)
}
par(mfrow = c(1,3))
simulate_poisson(2)
simulate_poisson(10)
simulate_poisson(50)


# Q5.
set.seed(123)
l = 1.5
n1 = 10
n2 = 50
reps = 10000

means_10 = replicate(reps,mean(rexp(n1,rate = l)))
means_50 = replicate(reps,mean(rexp(n2,l)))

par(mfrow = c(1,4))

hist(means_10,probability = TRUE,col = "cyan",breaks = 30, main = "Sample Means (n = 10)",xlab = "Mean",lwd = 2)
lines(density(means_10),col = "red",lwd = 2)

hist(means_50,probability = TRUE,col = "blue",breaks = 30, main = "Sample Means (n = 50)",xlab = "Mean",lwd = 2)
lines(density(means_50),col = "red",lwd = 2)

qqnorm(means_10,main = "Q-Q plot (n = 10)")
qqline(means_10,col = "red")

qqnorm(means_50,main = "Q-Q plot (n = 50)")
qqline(means_50,col = "red")


# Q6.
#Yes, CLT applies here.
#As sample size increases, the distribution of the sample mean becomes more normal, even if the original distribution (Exponential, in this case) is not normal at all.
#This is why large samples are powerful in statistics — they allow us to use normal distribution-based inference even with skewed populations


# Q7.
set.seed(123)
reps = 1000
mean = 70
sd = 10
n_values = c(5,30,100)

par(mfrow = c(1,3))

for(n in n_values){
	sample_means = replicate(reps,mean(rnorm(n,mean,sd)))
	
	hist(sample_means,main = paste("n =", n),xlab = "Sample Mean",col = "blue",breaks = 30,probability = TRUE)
	curve(dnorm(x,mean,sd = sd/sqrt(n)),col = "red",lwd = 2,add = TRUE)
}


# Q8.
set.seed(123)
shape = 2
rate = 1
n_small = 10
n_large = 100

sample_small = replicate(1000,mean(rgamma(n_small,shape,rate)))
sample_large = replicate(1000,mean(rgamma(n_large,shape,rate)))

par(mfrow = c(1,2))

# Histogram for n = 10
hist(sample_small, breaks = 30, probability = TRUE, col = "skyblue",
     main = paste("Sampling Distribution\nn =", n_small),
     xlab = "Sample Mean")

# Add normal curve
curve(dnorm(x, mean = mean(sample_small), sd = sd(sample_small)), 
      add = TRUE, col = "red", lwd = 2)

# Histogram for n = 100
hist(sample_large, breaks = 30, probability = TRUE, col = "lightgreen",
     main = paste("Sampling Distribution\nn =", n_large),
     xlab = "Sample Mean")

# Add normal curve
curve(dnorm(x, mean = mean(sample_large), sd = sd(sample_large)), 
      add = TRUE, col = "red", lwd = 2)


# Q9.
# Original Distribution                   Small n (e.g., 10)    Large n (e.g., 100 or more)
#     Normal                                Normal                    Normal
# Skewed (e.g., exponential, gamma)       Skewed sampling mean      Normal sampling mean
# Uniform                                  Uniform-like                  Normal