# code club for 4/24/2024

# Set up tidyverse and data sets we want to use.
library(tidyverse)
data("starwars")


## Check out your data frame
typeof(starwars)
View(starwars)
class(starwars)
glimpse(starwars)

# summary(starwars)
head(starwars)

# Droids versus humans
unique(starwars$species)

droids_only <- starwars %>% 
  # filter(species == "Droid" & eye_color == "red") %>% 
  filter(species == "Droid" | species == "Human") %>% 
  # filter(species != "Droid" & species != "Human") #%>% # filter out these
  # filter(!is.na(hair_color))
  filter(mass >= 60) %>% 
  select(name, height, mass, sex, species, homeworld)

droids_only

hist(droids_only$mass)

## Wide vs. long data
df_wide <- data.frame(Meal = c('Morning', 'Mid-morning', 'Lunch', 'Mid-afternoon', 'Dinner'),
                      Weight = c(9, 0, 12, 10, 6),
                      Dishes = c(3, 0, 1, 1, 4))
View(df_wide)

?pivot_longer()

df_long <- df_wide %>% 
  pivot_longer(cols = c("Weight", "Dishes"), names_to = "Attribute", values_to = "Value")

View(df_long)

# try taking df_long --> make df_wide_2
?pivot_wider()

df_wide_2 <- df_long %>% 
  pivot_wider(names_from = "Attribute",
              values_from = "Value")
df_wide_2

###
head(df_long)
?ggplot()

# ggplot(data = df_long, mapping = aes())

ggplot(df_long, aes(x = Meal, y = Value)) + 
  geom_bar(stat = "identity", 
           aes(fill = Attribute),
           position = "dodge",
           color = "black") +
  facet_grid(cols = vars(Attribute))



# ?geom_bar()


## Homework:
head(droids_only)
# Make a doodle of a star wars plot and then plot it!
# 1) wide -> long
# 2) ggplot()



##