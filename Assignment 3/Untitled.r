# Q1.
n = 12
a = 9
b = 6
p = 1/6
print(pbinom(a,n,p) - pbinom(b,n,p))


# Q2.
mean = 72
sd = 15.2
print((1 - pnorm(83,mean,sd))*100)


# Q3.
l = 5
print(ppois(0,1))
print(ppois(50,50) - ppois(47,50))


# Q4.
k = 5
m = 17
n = 233
x = 3
print(dhyper(x,m,n,k))


# Q5.
x = seq(0:30)
plot(dbinom(x,31,0.447),type='l')

plot(pbinom(x,31,0.447),type='l')

cat('Mean : ',0.447*31)
cat('Variance : ',0.447*31*(1-0.447))
cat('SD : ',sqrt(0.447*31*(1-0.447)))