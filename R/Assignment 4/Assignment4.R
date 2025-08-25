# Assignment 4

# Q1.
# •
a = seq(1.3,4.9,0.3)
a
# b = seq(1.3,4.9,length.out=10)
# b
# •
vec = c(1,2,3,4)
b = rep(vec,times=5)
b

# •
vec2 = c(5,12,13,20)
c = rep(vec2,each=2)
c


# Q2.
data(iris)
# (A)
class(iris)

# (B)
dim(iris)

# (C)
str(iris)
levels(iris$Species)


# Q3.
# (a)
aggregate(cbind(Sepal.Length,Sepal.Width)~Species,data=iris,FUN=mean)

aggregate(iris$Sepal.Length ~ iris$Sepal.Width,data=iris,FUN=mean)

# (b)
iris.class = iris

iris.class$Calyx.Width = NA

for(i in 1:nrow(iris.class)){
  iris.class$Calyx.Width[i] = ifelse(iris.class$Sepal.Length[i] < 5, "short","long")
}

head(iris.class)


# Q4.
data(mtcars)
head(mtcars)
str(mtcars)
names(mtcars)

# A.
subset(mtcars,cyl >= 5)

# B.
mtcars[1:10,]

# C.
mtcars[grep("Honda",rownames(mtcars)),]
