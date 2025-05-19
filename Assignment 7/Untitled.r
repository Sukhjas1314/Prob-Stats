# Assignment 7

# Q1.
n = 100
df = n - 1
t_values = rt(n,df)

hist(t_values,breaks = 10,main = paste("Histogram of t-distribution (n = ",n," ,df = ",df,")"),xlab = "t_values",col = "skyblue",border = "white")


# Q2.
n = 100
dfs = c(2,10,25)
par(mfrow = c(1,3))

for(df in dfs){
	chi_values = rchisq(n,df)
	
	hist(chi_values,breaks = 10,main = paste("Chi-square distribution with (df =  ",df," )"),xlab = "Values",col = "red",border = "white")
}


# Q3.
x <- seq(-6, 6, length = 100)
d1 <- dt(x,1)
d2 <- dt(x,4)
d3 <- dt(x,10)
d4 <- dt(x,30)

plot(x,d4,col="red")
lines(x,d2,col="yellow")
lines(x,d3,col="blue")
lines(x,d1,col="green")


# Q4.
v1 = 10
v2 = 20

# (i)
percentile_95 = qf(0.95,df1=v1,df2=v2)
cat("95th percentile : ", percentile_95,"\n")

# (ii)
area_0_1.5 = pf(1.5,df1=v1,df2=v2)
area_1.5_inf = 1 - area_0_1.5
cat("Area [0, 1.5]:", area_0_1.5, "\n")
cat("Area [1.5, ∞):", area_1.5_inf, "\n")

# (iii)
f5 <- qf(c(0.25,0.5,0.75,0.999), 10, 20)
print(f5)

# (iv)
set.seed(123)
f_values = rf(1000,df1=v1,df2=v2)
hist(f_values,breaks=30,xlab="F values",main="Histogram of F-distribution (v1=10,v2=20)",col="cyan",border="white")