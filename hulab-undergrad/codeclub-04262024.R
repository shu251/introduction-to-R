# code club 4-26-2024

# making plots in R with star wars data
library(tidyverse, warn.conflicts = FALSE)

data("starwars")

# View(starwars)

glimpse(starwars)
colnames(starwars)

starwars_long <- starwars %>% 
  select(character_name = name, height, gender, age = birth_year, species, homeworld) %>% 
  pivot_longer(cols = c(height, age), names_to = "VARIABLE", values_to = "VALUE")

str(starwars_long)


# Height by gender
# Height by species
head(starwars_long)


# Plot of height by gender and age by gender
starwars_long %>% 
  # filter(VARIABLE == "height") %>% 
  ggplot(aes(y = VALUE, x = gender)) +
  geom_boxplot() +
  facet_grid(rows = vars(VARIABLE),
             scales = "free") +
  theme_bw() +
  labs(x = "Gender", y = "cm or years") +
    theme(axis.text.x = element_text(face = "bold", size = 12, color = "darkred"),
          axis.text.y = element_text(face = "bold", size = 11, color = "black"),
          strip.background = element_blank(),
          strip.text = element_text(color = "black"))

?geom_boxplot

# Plot of height by species
starwars_long %>% 
  filter(VARIABLE == "height") %>%
  ggplot(aes(y = VALUE, x = species)) +
  # geom_boxplot() +
  geom_violin() +
  facet_grid(rows = vars(VARIABLE),
             scales = "free") +
  coord_flip() +
  # scale_y_reverse() +
  theme_bw() +
  labs(x = "Character name", y = "Height (cm)",
       title = "Height distribution by character") +
  theme(axis.text.x = element_text(face = "bold", size = 10, color = "darkred"),
        axis.text.y = element_text(face = "bold", size = 8, color = "black"),
        strip.background = element_blank(),
        strip.text = element_blank())

# Age by character
hist(starwars$birth_year)


head(starwars_long)

starwars_long %>% 
  filter(VARIABLE == "age") %>%
  filter(!is.na(VALUE)) %>% 
  ggplot(aes(y = VALUE, x = character_name, fill = gender)) +
  geom_bar(stat = "identity", color = "black") +
  scale_y_continuous(expand = c(0,0), limits = c(0,910)) +
  theme_bw() +
  labs(x = "", y = "Age",
       title = "") +
  scale_fill_manual(values = c("#CEBD6A", "#ACA1D6")) +
  theme(axis.text.x = element_text(face = "bold", size = 7, color = "black", angle = 45, hjust =1 , vjust = 1),
        axis.text.y = element_text(face = "bold", size = 8, color = "black"),
        strip.background = element_blank(),
        strip.text = element_blank(),
        panel.grid.minor = element_blank())


# Homeworld vs. species
# Homeworld by height
head(starwars)
summary_homeworld <- starwars %>% 
  select(homeworld, species) %>% 
  drop_na() %>% 
  add_column(COUNT = 1) %>% 
  group_by(homeworld, species) %>% 
    summarise(TOTAL = sum(COUNT))

head(summary_homeworld)

favs <- c("Human", "Ewok", "Wookiee")
str(favs)
favs_colors <- c("pink", "lightblue", "forestgreen")

summary_homeworld %>% 
  filter(species %in% favs) %>% 
ggplot(aes(x = homeworld, y = TOTAL, fill = species)) +
  geom_bar(stat = "identity", color = "black") +
  scale_fill_manual(values = favs_colors) +
  theme(axis.text.x = element_text(angle = 45))



