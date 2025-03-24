# (1)
a = 0
b = 60
#(a)
p1 = punif(45,min = a,max = b,lower.tail = FALSE)
cat("P(X > 45) : ",p1)

#(b)
p2 = punif(30,min = a,max = b) - punif(20,min = a,max = b)
cat("P(20 <= X <= 30) : ",p2)


# (2)
l = 1/2
#(a)
f1 = l * exp(-l * 3)
cat("Density function at x = 3 : ",f1)

#(b)
x_val = seq(0,5,length.out = 100)
y_val = l * exp(-l * x_val)
plot(x_val,y_val,type = "l",lwd = 4,col = "blue",main ="Exponential Distribution (l = 1/2)",xlab = "Time",ylab = "Density")

#(c)
p3 = 1 - exp(-l * 3)
cat("Probability that repair time takes at most 3 hours : ",p3)

#(d)
s_data = rexp(1000,rate = l)
hist(s_data,breaks = 30,probability = TRUE,col = "lightblue",main = "histogram of simulated exponential data",xlab = "Repair time")
lines(density(s_data),col = "red",lwd = 2)


# (3)
#(a)
a = 2
b = 1/3
p_3 = dgamma(3,shape = a,scale = b)
cat("Probability that lifetime is 3 units of time : ",p_3)

#(b)
p_atleast_1 = 1 - pgamma(1,shape = a,scale = b)
cat("Probability that lifetime is atleast 1 unit of time : ",p_atleast_1)

c = qgamma(0.7,shape = a,scale = b)
cat("Value of c such that p(X <= c) >= 0.70 : ",c)






