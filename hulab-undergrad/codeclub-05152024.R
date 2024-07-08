# Code club - May 15th, 2024
library(tidyverse)

# (1) Import water column information, plot a variable with depth
## Two ways to do the same thing.
# cruise_raw <- read.csv("../../../Downloads/Schade2023-samplelist-Hu - Sheet2.csv")
cruise_raw <- read.csv("/Users/skhu/Downloads/Schade2023-samplelist-Hu - Sheet2.csv")

# View(cruise_raw)

## Add a column for Sample ID associated with DNA extractions
# Example of what we want: SCHADE23_S1N1_DNA

colnames(cruise_raw)
str(cruise_raw)


# Plot depth and temperatrure
cruise_raw %>% 
  filter(Station == 4) %>% 
  # unite(col = SAMPLE_ID, Station, Niskin, sep = "_")
  mutate(SAMPLE_ID = paste("SCHADE23_S", Station, "N", Niskin, "_DNA", sep = "")) %>% 
  ggplot(aes(x = `CTD.temp`, y = `Bottle.Depth..m.`)) + geom_line() +
  scale_y_reverse() +
  labs(x = "Temperature", y = "Depth (m)")

# DIY
## Put Temperature on the top
## Add some color and modify to however you like
## Plot an additional variable and/or station





# ?ggplot()
# ?paste()
# ?unite()  
# summarise() - will make df smaller
# mutate() - not make df smaller



# (2) Import database, look at contents

db_raw <- read.csv("/Users/skhu/Downloads/taxonomic-assignments.csv")


# How many alveolata are there?
alveolata_only <- db_raw %>% 
  filter(Supergroup == "Alveolata")

table(db_raw$Supergroup)

# Composition of alveolata phyla
alveolata_only %>% 
  add_column(COUNT = 1) %>% 
  ggplot(aes(x = Phylum)) +
  geom_bar(stat = "count", color = "black", fill = "pink")


# 5-22-2024
library(tidyverse)
db_raw <- read.csv("/Users/skhu/Downloads/taxonomic-assignments.csv")

# Look up R package "janitor"

colnames(db_raw)

# How many trophic strategies do we have?
unique(db_raw$Trophic.strategy)

heterotrophy <- c("Predaceous", "Predation", "Phagotrophic", "Graze on other ciliates, flagellates, small metazoa", "predatory flagellates")

db_raw_revised <- db_raw %>% 
  mutate(TROPHIC_STRATEGY = case_when(
    # `Trophic.strategy` == "Predaceous" ~ "Heterotrophic",
    # `Trophic.strategy` == "Predation" ~ "Heterotrophic",
    `Trophic.strategy` %in% heterotrophy ~ "Heterotrophic",
    .default = `Trophic.strategy`
  ))

unique(db_raw_revised$Ingestion)
unique(db_raw_revised$Behavior)

# %in%

db_raw_revised %>% 
  filter(Ingestion == "Myzocytotic")

unique(db_raw_revised$Ingestion)
unique(db_raw_revised$Behavior)
# View(db_raw_revised)
unique(db_raw_revised$TROPHIC_STRATEGY)

# What taxa are capable of myzocytosis?
# Change instances of myzocytosis in trophic strategy, to be reflected in the Ingestion category

db_raw_revised <- db_raw %>% 
  mutate(TROPHIC_STRATEGY = case_when(
    `Trophic.strategy` %in% heterotrophy ~ "Heterotrophic",
    grepl("myzocytosis", `Trophic.strategy`) ~ "Heterotrophic",
    .default = `Trophic.strategy`
  ),
  INGESTION = case_when(
    grepl("myzocytosis", `Trophic.strategy`) ~ "Myzocytotic",
    .default = Ingestion
  )) %>% 
  # != ""

ggplot(db_raw_revised, aes(x = Supergroup, fill = TROPHIC_STRATEGY)) +
  geom_bar(stat = "count")

unique(db_raw_revised$INGESTION)

# Supergroup by trophic strategy
# Make a bar plot with all supergroups as the x axis and content of the bar will be NA vs. not NA.

# Example from case_when() command
x <- 1:70
x
# str(x)
case_when(
  x < 16 ~ "strawberry",
  x >= 19 ~ "mango",
  .default = as.character(x)
)

  