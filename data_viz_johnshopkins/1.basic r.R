####Do Basic Math

2+2
2-2
2/2
2*2

a <- 2+2

####Run each line by either (1) setting the cursor at the end of the line and hitting control+enter on a PC or cmd+enter on Mac or click in the run button in the menu bar above or (2) selecting the line(s) of code you want to execute and then using the keyboard short cut or clicking run

##### You can use pound signs/hashtags to tell R to ignore lines of code

#2+2
2+2



#############

#START FOLLOWING ALONG WITH THE VIDEO HERE

#############

##### If you tell R to do something it doesn't understand, it will throw an error. R is very picky about punctuation, spelling etc. 

######these commands will not do anything
2234r*S&F(SD&F234)
c(c))

#### R can also act do logical tests using logical operators.

####Is equal?
2==2
2==3

#####Is not equal?
2!=2
2!=3

####Greater than and less than
2>1
2<1

####Greater than or equal to, less than or equal to
3>=1
3<=1


#### R can work with character strings
"apple"


#### It is ok to use spaces in character strings. 
"an apple"

###You can use logical operators to see whether character strings exactly match each other

"apple"=="apple"
"apple"=="appla"
"apple"=="orange"
"apple"!="orange"

#### If you try to use inequalities with characters, R will compare how long the character string is

"apple" < "apples"

"apple" > "apples"

####save the output of a command to an object

a <- 2+2
my_a <- 2+2
my.a <- 2+2

######## Don't do this. It won't work
9a <- 2+2
my object <- 2+2

#### See what is in the object by "running" the object
a


####you can save series of numbers or strings and put them into vectors using the combine function, c().

numbers <- c(1,2,3)
numbers
fruits <- c("apple","orange")
fruits
numbers2 <- c(4:6)
numbers2

true_false <- c(TRUE,FALSE,TRUE)
true_false

#### You can combine vectors together

numbers3 <- c(7:9)

all_numbers <- c(numbers,numbers2,numbers3)

all_numbers


#####You can select certain elements of a vector

x <- c(-1,10,11,12,13,14,15,16,17,18,19)

### By position in the vector
x[4] #The fourth element.
x[-4] #All but the fourth.
x[2:4] #Elements two to four.
x[-(2:4)] #All elements except two to four.
x[c(1, 5)] #Elements one and five.

### By Value
x[x == 10] # Elements which are equal to 10.
x[x < 0] #all elements less than zero.
x[x %in% c(10, 12, 15)] #Elements in the set 1, 2, 5.





#### When you save different kinds of data, that data is given a "class" that describes what kind of data are in the vector

class(numbers)
class(fruits)
class(true_false)



#### If you combine numbers and character vectors together, the numbers will convert to characters

fruits_numbers <- c(numbers,fruits)
fruits_numbers

#### Generally for data visualization purposes, it is good to not mix characters and numbers in the same vector.

##### You can change the class of a vector using as.logical,as.numeric,as.character, and as.factor

####here's an example with 1s and 0s

my_vector <- c(1,0,1,0)

my_vector_character <- as.character(my_vector)
my_vector_character
class(my_vector_character)

my_vector_logical <- as.logical(my_vector)
my_vector_logical
class(my_vector_logical)

my_vector_factor<-as.factor(my_vector)
my_vector_factor
class(my_vector_factor)

my_vector_numeric_again <- as.numeric(my_vector_character)
my_vector_numeric_again
class(my_vector_numeric_again)




