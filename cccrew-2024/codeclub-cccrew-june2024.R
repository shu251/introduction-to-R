# Code Club June 27, 2024

# Where is RStudio currently importing from?
getwd()

# Import a csv file
greeting <- read.csv(file = "r-intro-docs/greetings.csv")

# Basic syntax
apples <- 5
oranges <- 6

fruit <- apples + oranges

# (1.2) Data classes & Data frames
juice <- 4 + 4
class(juice)
class(4)
class(8.3)
class(4L)


x <- c(1, 7, 9)
class(x)

x <- c("1", "7", "9")
class(x)

y <- c(1, "7", 9)
class(y)
str(y)
# dim(y)

# names()
numeric_vector <- c(1, 10, 49, 5)
character_vector <- c("a", "b", "c", "d")
# ?names()
names(numeric_vector) <- character_vector
str(numeric_vector)
str(character_vector)
numeric_vector[2]

class(numeric_vector)
head(numeric_vector)


list_ex <- list(2^7, "cabbage", FALSE, 67L)
class(list_ex)
str(list_ex)

list_ex <- list(2^7, "cabbage", FALSE, 67L, VALUES = 1:12)
str(list_ex)
head(list_ex)

# Commands to dissect your data types
?str()
?head()
?class()
?typeof()
?dim()

typeof(list_ex)


list_ex$VALUES
typeof(list_ex$VALUES)


# Matrix
matrix(1:9, byrow = FALSE, nrow = 3)
# [row, column]

q <- c(460, 314)
r <- c(290, 247)
w <- c(309, 165)

c(q, r, w)

mydataset <- matrix(c(q, r, w), byrow = TRUE, nrow = 3)
mydataset
class(mydataset)
dim(mydataset)
region <- c("one", "two")
category <- c("A", "B", "C")

rownames(mydataset) <- category
colnames(mydataset) <- region

mydataset
mydataset[2,2]

totals <- rowSums(mydataset)
totals
# ?colSums()


# 4. Data frames

greetings <- c("Hey", "Hi", "Howdy", "Hello", "Morning")
n <- c(99, 15, 324, 54, 23)

df <- data.frame(greetings, n)
head(df)
class(df)
str(df)
# View(df)


addition <- c("Afternoon", 18)

df <- rbind(df, addition)

head(df)
colnames(df)
colnames(df) <- c("Greeting", "Observed")
colnames(df)[1:2] <- c("Greeting", "Observed")

colnames(df)[2] <- c("Number of times observed")
colnames(df)[3]

###
# Import packages
install.packages("tidyverse")
install.packages("vegan")

library(tidyverse)

# Importing data
pizza <- read.csv(file = "r-intro-docs/pizza.csv")

