# Q1.
# (a)
install.packages("pracma")
library(pracma)
f = function(x,y){
	ifelse(x>=0 & x<=1 & y>=0 & y<=1,2*(2*x + 3*y)/5,0)
} 
integral2(f,0,1,0,1)$Q


# (b)
gx = function(x){
	integrate(function(y) f(1,y),0,1)
}
gx(1)$value


# (c)
hy = function(y){
	integrate(function(x) f(x,0),0,1)
}
hy(0)$value


# (d)
expected_xy = integral2(function(x,y) x*y*f(x,y),0,1,0,1)
expected_xy$Q



# Q2.
# (a)
x = 0:3
y = 0:2
joint_matrix = outer(x,y,function(x,y) (x+y)/30)
rownames(joint_matrix) = paste("x = ",x)
colnames(joint_matrix) = paste("y = ",y)
print(joint_matrix)


# (b)
sum(joint_matrix)


# (c)
gx = apply(joint_matrix,1,sum)
names(gx) = paste("x = ",x)
gx


# (d)
hy = apply(joint_matrix,2,sum)
names(hy) = paste("y = ",y)
hy


# (e)
num = joint_matrix[1,2]
den = hy[2]
px1 = num/den
print(px1)


# (f)
grid = expand.grid(x = x,y = y)
grid$p = mapply(function(x,y) (x+y)/30,grid$x,grid$y)
EX = sum(grid$x * grid$p)
EY = sum(grid$y * grid$p)
EXY = sum(grid$x * grid$y * grid$p)
varX = sum((grid$x^2) * grid$p) - EX^2
varY = sum((grid$y^2) * grid$p) - EY^2
covXY = EXY - EX * EY
correlation = covXY / (sqrt(varX) * sqrt(varY))
list(
	E_X = EX,
	E_Y = EY,
	E_XY = EXY,
	var_X = varX,
	var_Y = varY,
	cov_XY = covXY,
	corr = correlation
)












