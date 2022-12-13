####Functions

add <- function(x,y){
  x+y
  }

add(2,3)

####The last expression is returned

add_and_multiply_version1 <- function(x,y){
   x+y 
   x*y
}

add_and_multiply_version1(2,3)

####you can force R to return a specific object

add_and_multiply_version2 <- function(x,y){
  total <- x+y
  product <- x*y
  total_and_product <- c(total,product)
  
  subtract<- x-y
  
  return(total_and_product)
}

add_and_multiply_version2(2,3)


##### R has many basic mathematical functions already built in that can be applied to numbers and vectors of numbers

###add two or more numbers
sum(c(2,3,5))

####add all the numbers in two vectors
sum(c(1,2,3),c(4,5))

#####this does the same thing, just saving the vector to an object
my_vector <- c(1,2,3,4,5)
sum(my_vector)

##### There are many other functions for doing basic math and descriptive statistics

max(my_vector)
min(my_vector)
median(my_vector)
mean(my_vector)
sd(my_vector) ###standard deviation
summary(my_vector) ### a five number summary

##### Other functions will sort vectors or tell you information about the vector

my_vector<-c(2,2,1,3,5)

sort(my_vector)
rev(my_vector)
table(my_vector)
unique(my_vector)
length(my_vector)

####create data fast
seq(1,5)
seq(1,9,by=2)

rep("a",5)
rep(10,5)




