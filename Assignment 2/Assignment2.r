# Q1.
# (a)
chest = c(rep("Gold",20),rep("Silver",30),rep("Bronze",50))
sample(chest,10)

# (b)
surgery = c("Success","Failure")
sample(surgery,10,replace = TRUE,prob = c(0.9,0.1))



# Q2.
y <- function(n) {
  prob_no_match = 1
  for(i in 0 : (n - 1)) {
    prob_no_match = prob_no_match * (365 - i) / 365
  }
  return(1 - prob_no_match) 
}
n = c(10, 20, 30, 40, 50, 60)
x = sapply(n, y) 
x

n = 1
while(y(n) <= 0.5){
	n = n + 1
}
cat("The smallest value of n where probability > 0.5 is", n, "with probability", y(n), "\n")



# Q3.
y = function(a,b,c){
	y = a * b / c
}

a = 0.85
b = 0.2
c = 0.4
x = y(a,b,c)
x



# Q4.
iris
(a)
head(iris,10)

(b)
str(iris)

(c)
range(iris[,1])

(d)
mean(iris[,1])

(e)
median(iris[,1])

(f)
quantile(iris[,1],0.25)
quantile(iris[,1],0.75)
IQR(iris[,1])

(g)
sd(iris[,1])
var(iris[,1])

(h)
range(iris[,2])
mean(iris[,2])
median(iris[,2])
quantile(iris[,2],0.25)
quantile(iris[,2],0.75)
IQR(iris[,2])
sd(iris[,2])
var(iris[,2])

range(iris[,3])
mean(iris[,3])
median(iris[,3])
quantile(iris[,3],0.25)
quantile(iris[,3],0.75)
IQR(iris[,3])
sd(iris[,3])
var(iris[,3])

range(iris[,4])
mean(iris[,4])
median(iris[,4])
quantile(iris[,4],0.25)
quantile(iris[,4],0.75)
IQR(iris[,4])
sd(iris[,4])
var(iris[,4])

(i)
summary(iris)



# Q5.
y = function(v){
	u = unique(v)
	u[which.max(tabulate(match(v,u)))]
}
vec = c(15,16,15,14,15,14)
x = y(vec)
x




































