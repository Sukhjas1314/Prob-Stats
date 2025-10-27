# Assignment 4.1

# Q1.
PatientID = c(1,2,3,4)
AdmDate = as.Date(c('2009-10-15','2009-11-01','2009-10-21','2009-10-28'))
Age = c(25,34,28,52)
Diabetes = c('Type1','Type2','Type1','Type1')
Status = c('Poor','Improved','Excellent','Poor')

df = data.frame(PatientID,AdmDate,Age,Diabetes,Status)
df


# Q2.
# (a)
subset1 = df[,c('PatientID','Age')]
subset1

# (b)
Type1_patients = df[df$Diabetes == 'Type1',]
Type1_patients

# (c)
Poor_count = sum(df$Status == 'Poor')
Poor_count

# (d)
summary(df)

# (e)
AvgAge = mean(df$Age)
AvgAge

# (f)
new_data = data.frame(PatientID=5, AdmDate=as.Date("2009-11-05"),
                       Age=45, Diabetes="Type2", Status="Improved")
df = rbind(df,new_data)
df


# Q3.
a = c(12, 14, 16, 20)
m = matrix(1:10,nrow=5,ncol=2)
s = c('First','Second','Third')

MyList = list(title='My First List',criteria=list(age=a,matrix=m,score=s))
MyList
MyList$criteria
a

