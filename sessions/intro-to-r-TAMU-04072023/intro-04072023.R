# Howdy! Welcome to introduction to R


3 + 4

2349078/54

x <- 5
# new r object named "juice"
juice <- 4+4

# Over write x, set it equal to a series of numbers
x <- c(1, 7, 9)
x
?c()



apples <- 5
oranges <- 6
fruit <- apples + oranges
fruit


6389/fruit
  
fruit

x
View(x)
head(x)


# Calculate volume of sphere, where diameter is 20 meters
# 4188.79

d <- 20
v <- (4/3)*pi*((d/2)^3)
v
# Code --> rainbow
v <- (4/3)*pi*((d/2)^3)

# To nest (), use first/front (



# Data classes and data frames
# ?class()
# ?str()

v
juice <- 4 + 4

class(juice)
class(v)
v

class(4)
class(8.3)
class(-2)
class(4L)
str(4L)
##
# To denote an integer, use "L"
x <- c(4L, 30L)
class(x)
4L + 50L

x <- c(1, 7, 9)
class(x)

x <- c("1", "7", "9")
class(x)

numeric_vector <- c(1, 10, 49, 5)
character_vector <- c("a", "b", "c", "d")
str(numeric_vector)
str(character_vector)

names(numeric_vector) <- character_vector
# [rows, columns]
numeric_vector[4]
numeric_vector
class(numeric_vector)
## Lists
list_example <- list(2^4, "cabbage", TRUE, 1+5i)
list_example2 <- list(2E2, "lettuce", VALUES = 1:25, VALUES_BINARY = FALSE)

str(list_example)
str(list_example2)
##

list_example2$VALUES
typeof(list_example2$VALUES_BINARY)

# Matrices
matrix(1:9, byrow = FALSE, nrow = 3)

q <- c(460, 314)
r <- c(290, 24)
w <- c(390, 165)
c(q, r, w)
# Put into a matrix

mydata <- matrix(c(q, r, w), byrow = TRUE)
mydata

mydata <- matrix(c(q, r, w), nrow = 3)
mydata
# ?matrix()
region <- c("one", "two")
category <- c("A", "B", "C")

rownames(mydata) <- category
colnames(mydata) <- region
# [row, columns]
mydata[2,2]
mydata[2,]
#

totals <- rowSums(mydata)
totals
# View(mydata)
mydata_better <- cbind(mydata, totals)
View(mydata_better)

# Data frame
greetings <- c("hey", "hi", "howdy", "hello", "morning")
n <- c(99, 15, 324, 54, 23)
class(n)
df <- data.frame(greetings, n)
# View(df)

head(df)
df
# [row, col]
df[3,] #Isolate 3rd row
df[2] #2nd column

addition <- c("afternoon", 18)
?cbind()
df <- rbind(df, addition)
head(df)

names(df)
colnames(df)[1:2] <- c("Greeting", "Observed")
df
rownames(df)[1:2] <- c("hey2", "hi2")
df

# Isolate columns
df[,2]

df$Observed
class(df$Observed)


# Activity 4.4
# n was changed to character after it was added to my dataframe. How can I change it back to a numeric data class?
# as.numeric

df$Observed

df$Observed_NUM <- as.numeric(df$Observed)
str(df)

# Install R packages
# is.numeric()
# install.packages("vegan")
# install.packages("tidyverse")

library(vegan)
library(tidyverse)
# ?filter()
# stats::filter()
# dplyr::filter()

sessionInfo()

# data import
greetings

# re-create greetings
greetings <- c("Hey", "Hi", "Howdy", "Hello", "Morning")
n <- c(99, 15, 324, 54, 23)
df <- data.frame(greetings, n)
addition <- c("Afternoon", 18)
df

#Path and working directories
getwd()
write.csv(df, file = "r-intro-docs/greetings.csv")
write.csv(df, file = "/Users/skhu/Desktop/Projects/introduction-to-R/r-intro-docs/greetings.csv")
setwd("r-intro-docs/")
getwd()
setwd("/Users/skhu/Desktop/Projects/introduction-to-R/")
getwd()

# Import pizza
pizza <- read.csv("r-intro-docs/pizza.csv")

library(tidyverse)
data("starwars")
View(starwars)

str(numeric_vector)
tmp <- data.frame(numeric_vector)
tmp

# Import larger data frames
asv_table <- read.table(file = "r-intro-docs/asv-table.txt", sep = "\t", header = TRUE)
# \t == TAB
# ?read_table

asv_table <- read_table(file = "r-intro-docs/asv-table.txt", col_names = TRUE)

head(asv_table)

?read.table
asv_table <- read.delim(file = "r-intro-docs/asv-table.txt")

metadata <- read_delim(file = "r-intro-docs/metadata.txt")
# View(metadata)

metadata <- read.table(file = "r-intro-docs/metadata.txt", sep = "\t", header = TRUE)

# Exporting data.
head(pizza)
# View(pizza)

?write_delim()

write_delim(pizza, file = "pizza-plain.txt")
write_delim(pizza, file = "pizza-withtab.txt", delim = "\t")
write_delim(pizza, file = "pizza_nocols.txt", quote = "all", col_names = FALSE)

write.csv(pizza, file = "pizza.csv", row.names = TRUE) # FALSE

# Tidyverse
head(pizza)

pizza %>% select(type)
types_of_pizza <- pizza %>% select(type)
types_of_pizza
types_of_pizza_char <- as.character(pizza %>% select(type))
types_of_pizza_char

# Filter()
pizza %>% 
  select(style = type, everything(), -X) %>% 
  filter(num_toppings >= 2) %>%  # select 2 or more toppings
  filter(red_sauce == TRUE) # red sauce only

str(pizza)
#
# | or
# & and
# 2.0.1 activity
pizza %>% 
  select(style = type, everything(), -X) %>%
  filter(num_toppings > 2 | red_sauce == TRUE)

# mutate() # Add a column
pizza$cost

totalcost <- pizza %>%
  select(style = type, everything(), -X) %>%
  mutate(TOTAL_COST = (cost * num_order))

sum(totalcost$TOTAL_COST)

write.csv(totalcost, file = "totalcost.csv")
# wide vs. long format

df_wide <- data.frame(Meal = c("Morning", "Mid-morning", 'Lunch', 'Mid-afternoon', 'Dinner'),
                      Weight = c(9, 0, 12, 10, 6),
                      Dishes = c(3, 0, 1, 1, 4))
df_wide

# tomorrow "morning"
df_long <- df_wide %>%
  pivot_longer(cols = c('Weight', 'Dishes'), names_to = "Attribute", values_to = "Value")
# View(df_wide)
# View(df_long)

# convert to long format
names(asv_table)
asv_long <- asv_table %>% 
  pivot_longer(cols = 3:20)

asv_long <- asv_table %>% 
  pivot_longer(starts_with("GordaRidge"))
# head(asv_long)

# 5.1
## Subset ASV table so that ASVs have more than 100 sequences
asv_long_100plus <- asv_long %>% 
  filter(value >= 100)

head(asv_long_100plus)

dim(asv_long)
dim(asv_long_100plus)

# Star wars
head(starwars)
# View(starwars)

tatooine <- starwars %>%
  filter(homeworld == "Tatooine")

length(unique(starwars$species))
unique(starwars$species)
length(unique(starwars$species))
length(unique(tatooine$species))

# 2.0.2
## Table of droids that are equal to or greater than 96 inches in height

droids_tall <- starwars %>% 
  filter(species == "Droid") %>% 
  filter(height >= 96)
# View(droids_tall)

# Summarizing data
# mutate() == adds a column
# summarize() == subsets, applys function

## What are the average masses of humans versus ewoks?
# group_by() summarise()
starwars %>% 
  filter(species == "Human" | species == "Ewok") %>%
  # filter(species == "Human") %>% 
  # filter(species == "Ewok") %>% 
  filter(!is.na(mass)) %>% 
  group_by(species) %>% 
    summarise(MEAN_MASS = mean(mass),
              MIN = min(mass),
              MAX = max(mass))

# is.na(starwars$mass)

starwars %>% 
  filter(species == "Human" | species == "Ewok") %>%
  filter(!is.na(mass)) %>% 
  group_by(species, homeworld) %>% 
  summarise(MEAN_MASS = mean(mass),
            MIN = min(mass),
            MAX = max(mass))

# 3.0.1 activity
## Add column that classifies tall vs. short based on the height of each species
height_class <- starwars %>% 
  mutate(HEIGHT_BIN = case_when(
    height > 100 ~ "tall",
    height <= 100 ~ "short"
  ))
# View(height_class)

hist(starwars$height)

height_distributed <- starwars %>% 
  filter(!is.na(height)) %>% 
  group_by(species) %>% 
  mutate(MEAN_SPECIES = mean(height)) %>% 
  # mutate(MEAN_50 = (MEAN_SPECIES)*.5) %>% 
  mutate(HEIGHT_BIN = case_when(
    height > MEAN_SPECIES ~ "tall",
    height <= MEAN_SPECIES ~ "short"
  ))
# View(tmp)

sort(unique(starwars$homeworld))
planets <- c("Alderaan", "Naboo", "Endor", "Kamino", "Coruscant")
# class(planets)
# ?sort()

nondroids <- starwars %>% 
  filter(homeworld %in% planets) %>% 
  filter(species != "Droid")

ggplot(nondroids, 
       aes(x = species, y = height, fill = sex)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_grid(homeworld ~ .) +
  theme_bw()
# try with "fill = sex and without
# stat = "count" works when you don't have a y value, it counts occurrences 
# position = "stack" stack and add values to one another
# position = "fill"
# position = "dodge"


# Microbial ecology
asv_table <- read.table(file = "r-intro-docs/asv-table.txt", sep = "\t", header = TRUE)

asv_long <- asv_table %>%
  pivot_longer(starts_with("GordaRidge"))

head(asv_long)
head(metadata)
View(asv_long)
# Combine with metadata
asv_withmetadata <- asv_long %>% 
  filter(value > 0)  %>% 
  left_join(metadata %>% 
              select(name = SAMPLE, everything())) %>% 
  select(value, everything())

View(asv_withmetadata)
# metadata %>% 
  # select(name = SAMPLE, everything())

?left_join
# parse taxon names

asv_withmetadata_tax <- asv_withmetadata %>% 
  separate(Taxon, into = c("DOMAIN", "SUPERGROUP", "PHYLUM", "CLASS", "else"), sep = ";")
# View(asv_withmetadata_tax)
# ?separate()
#Eukaryota;Stramenopiles;Sagenista
# barplot to supergroup

unique(asv_withmetadata_tax$SUPERGROUP)
asv_withmetadata_tax %>% 
  filter(SUPERGROUP != "Bacteria_X") %>% 
  filter(!is.na(SUPERGROUP)) %>% 
  group_by(name, SUPERGROUP) %>% 
    summarise(SUM_SUPERGROUP = sum(value)) %>% 
  ggplot(aes(x = name, y = SUM_SUPERGROUP, fill = SUPERGROUP)) +
  geom_bar(stat = "identity", position = "fill", color = "black") +
  theme(axis.text.x = element_text(angle = 90))
# color == outline
# fill == inside color

# PCA plot
head(asv_withmetadata_tax)
# need matrix
asv_matrix <- asv_withmetadata_tax %>% 
  select(name, value, SAMPLETYPE, FeatureID) %>% 
  unite(SAMPLENAME, name, SAMPLETYPE, sep = ";") %>% 
  pivot_wider(names_from = FeatureID, values_fill = 0) %>% 
  column_to_rownames(var = "SAMPLENAME") %>% 
  as.matrix()
class(asv_matrix)

asv_matrix <- as.matrix(asv_matrix)
# ?pivot_wider
install.packages("compositions")
library(compositions)

asv_clr <- clr(asv_matrix)
# ?clr()
?prcomp
View(asv_clr)
View(t(asv_clr))

pca_output <- prcomp(asv_clr)
head(pca_output$x)
class(pca_output)
# summary(pca_output)
# plot(pca_output)
# biplot(pca_output)

data.frame(pca_output$x, SAMPLE = rownames(pca_output$x)) %>% 
  separate(SAMPLE, into = c("samplenames", "sampletype"), sep = ";") %>% 
  ggplot(aes(x = PC1, y = PC2, shape = sampletype, color = sampletype)) +
  geom_point()
