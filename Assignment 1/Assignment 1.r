# Q1.
# x = c(5,10,15,20,25,30)
# which.min(x)
# which.max(x)


# Q2.
# n = as.integer(readline(prompt = "Enter a number : "))
# fact = 1

# if(n > 0){
# 	for(i in 1:n){
# 		fact = fact * i
# 	}
# 	cat("The factorial of ",n," : ",fact)
# }else if(n == 0){
# 	cat("The factorial of 0 : 1")
# }else{
# 	cat("Invalid input")
# }


# # Q3.
# a = 0
# b = 1
# n = as.integer(readline(prompt = "Enter the number of terms (n): "))

# if (n < 0) {
#   print("Invalid input! Please enter a positive integer.")
# } else if (n == 0) {
#   print("No terms to display.")
# } else {
#   cat("Fibonacci Sequence: ", a)
#   if (n > 1) {
#     cat(" ", b)
#   }
#   for (i in 3:n) {
#     sum = a + b
#     cat(" ", sum)
#     a = b
#     b = sum
#   }
#   cat("\n")
# }


# # Q4.
# a = as.integer(readline(prompt = "Enter 1st operand : "))
# b = as.integer(readline(prompt = "Enter 2nd operand : "))
# x = as.character(readline(prompt = "Enter the operator('1','2','3','4') : "))

# result = switch(
# 	x,
# 	'1' = cat(a," + ",b," = ",a+b),
# 	'2' = cat(a," - ",b," = ",a-b),
# 	'3' = cat(a," * ",b," = ",a*b),
# 	'4' = cat(a," / ",b," = ",a/b)
# 	)


# # Q5.
# x = c(1,2,3,4,5)
# y = c(2,4,9,16,25)
# plot(x,y,xlab="Density",ylab="Volume",main="Plot Graph",col="blue",type="o",pch=20)


# x = c(20,10,30,15,25)
# label = c('Eng','Maths','Sci','SST','French')
# pie(x,label,col=c('red','pink','black','green','cyan'),main="Pie Chart",radius=1) 


#y = c(2,4,9,16,25)
#barplot(y,xlab="Density",ylab="Volume",main="Plot Graph",col="blue")









