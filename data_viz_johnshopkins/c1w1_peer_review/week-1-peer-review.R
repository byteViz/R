# Week 1 Practice Code

# ArunAkchutha M Ma

# Problem 1 

# Create a data frame that includes two columns, one named "Animals" and the other named "Foods". The first column should be this vector (note the intentional repeated values): Dog, Cat, Fish, Fish, Lizard


#The second column should be this vector: Bread, Orange, Chocolate, Carrots, Milk


#### Write your code below:

df <- data.frame (Animals  = c("Dog", "Cat", "Fish", "Fish", "Lizard"),
                  Foods = c("Bread", "Orange", "Chocolate", "Carrots","Milk")
)

View(df)

# Problem 2

# Using the data frame created in Problem 2, use the table() command to create a frequency table for the column called "Animals".

#### Write your code below:

table(df$Animals)
# Problem 3

# Use read.csv() to import the survey data included in this assignment. Using that data, make a histogram of the column called "pid7".

#### Write your code below:

getwd()

data_survey <- read.csv(file = "cces_sample_coursera.csv")

hist(data_survey$pid7)

