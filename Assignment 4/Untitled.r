# Q1.
x = c(0,1,2,3,4)
p = c(0.41,0.37,0.16,0.05,0.01)
res = sum(x*p)
print(res)

res2 = weighted.mean(x,p)
print(res2)

res3 = c(x %*% p)
print(res3)


# Q2.
fx = function(t){
	0.1*exp(-0.1*t)
}
integrand = function(t){
	t * fx(t)
}
result = integrate(integrand,lower=0,upper=Inf)
print(result$value)


# Q3.
x = c(0,1,2,3)
p = c(0.1,0.2,0.2,0.5)
y = 10*x - 12
res4 = sum(y*p)
print(res4)


# Q4.
fx = function(x){
	0.5*exp(-abs(x))
}
integrand1 = function(x){
	x * fx(x)
}
ans1 = integrate(integrand1,lower=1,upper=10)
print(ans1$value)
integrand2 = function(x){
	x^2 * fx(x)
}
ans2 = integrate(integrand2,lower=1,upper=10)
print(ans2$value)

var = ans2$value - ans1$value^2
print(var)


# Q5.
fx = function(x){
	(3/4)*(1/4)^(x-1) 
}
x_val = 3
print(fx(x_val))

fy = function(t){
	(3/4)*(1/4)^(sqrt(t)-1) 
}
x = c(1,2,3,4,5)
y = x^2
ans5 = sum(y * fy(y))
print(ans5)

ans6 = sum(y^2 * fy(y))
print(ans6)

variance = ans6 - ans5^2
print(variance)
