# Assignment 3

# Q1.
a = c(12,13,14,15,16);
a


# Q2.
sum(a);


# Q3.
prod(a);


# Q4.
max(a);
min(a);


# Q5.
range(a);


# Q6.
mean(a);
var(a);
sd(a);
median(a);


# Q7.
sort(a,decreasing=FALSE);
sort(a,decreasing=TRUE);


# Q8.
mat = matrix(1:12,ncol=3,nrow=4,byrow=TRUE);
mat


# Q9.
A = c(1,2,3);
B = c(4,5,6);
C = c(7,8,9);

row_mat = rbind(A,B,C);
row_mat;

col_mat = cbind(A,B,C);
col_mat;


# Q10.
row_mat[2:3,];


# Q11.
col_mat[,c(1,3)];


# Q12.
row_mat[row_mat %in% c(2,3)];
col_mat[col_mat %in% c(2,3)];

row_mat[row_mat %in% c(2,4)];
col_mat[col_mat %in% c(2,4)];