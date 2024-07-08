# Code club 4-19-2024

## Setting and checking our working directory
setwd("/Users/skhu/Desktop/Projects/introduction-to-R/")
getwd()

# CTRL + Enter (PC) #

# Episodes 4 - data structures
# https://swcarpentry.github.io/r-novice-gapminder/04-data-structures-part1.html

cats <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1, 0, 1))
# View(cats)
str(cats)

write.csv(x = cats, file = "data/feline-data.csv", row.names = FALSE)

# rm(cats)

cats <- read.csv(file = "data/feline-data.csv")

cats$weight
cats$coat

cats$weight + 2
paste("My cat is", cats$coat)

# Data types
str(cats)
typeof(cats$weight)
cats$coat + 2

typeof(1L)
typeof(3.14)

typeof(1 + 1i)
typeof(TRUE)
typeof(FALSE)

typeof('banana')
typeof("banana")
# typeof(banana)


# Vectors and type coercion
my_vector <- vector(length = 3)
my_vector
str(my_vector)

another_vector <- vector(mode = "character", length = 3)
another_vector
str(another_vector)


str(cats$weight)
# What will the output of str() be from the vector below?
combine_vector <- c(2, 6, 3)
# ?c()
str(combine_vector)

quiz_vector <- c(2, 5, "3")
str(quiz_vector)

coervion_vector <- c("a", TRUE)
str(coervion_vector)

another_coercion_vector <- c(0, TRUE)
str(another_coercion_vector)

# 0 and 1 can be a binary for TRUE vs FALSE, which is "logical"
str(cats$likes_string)

#
cats$likes_string <- as.logical(cats$likes_string)
str(cats)
###

# Data frames section
## Re-set up my cats R object
cats <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1, 0, 1))

cats <- read.csv(file = "data/feline-data.csv")

# change likes_string to a logical
cats$likes_string <- as.logical(cats$likes_string)
# Three ways to dissect your R object
str(cats)
typeof(cats)
class(cats)

# Select different variables inside cats.
# [rows, columns]
cats[1,]
cats[1,1]
cats[2,1]
# Play around with the placement of the comma

typeof(cats[,1])

?names()
names(cats)

names(cats)[2] <- "weight_kg"

names(cats)

# Matrices
matrix_example <- matrix(0, ncol = 6, nrow = 3)
matrix_example

typeof(matrix_example)
class(matrix_example)

dim(matrix_example)
dim(cats)

# Continue through matrix examples and Exploring Data frames


# Goals in R:

# Access Database Darkly - Cleaning it up - data wrangling
# Plot composition of the database

## You should only need to install once.
# install.packages("tidyverse")

library(tidyverse)
data("starwars")
View(starwars)

###
