# Code Club July 19,2024
library(tidyverse)
# asv_table <- read.table()
asv_table <- read_delim("r-intro-docs/asv-table.txt", delim = "\t", col_names = TRUE)
# ?read_delim()
glimpse(asv_table)

metadata <- read_delim(file = "r-intro-docs/metadata.txt", delim = "\t")


# View(asv_table)
# dim(asv_table)

# Compare these two approaches
asv_long <- asv_table %>% 
  pivot_longer(cols = 3:20)
# dim(asv_table)
# colnames(asv_table)

glimpse(asv_long)
glimpse(metadata)

unique(asv_long$SAMPLE)
unique(metadata$SITE)

## Compile ASV table and metadata

#Annotate pivot longer, join with metadata
asv_long <- asv_table %>% 
  pivot_longer(starts_with("Gorda"), names_to = "SAMPLE", values_to = "SEQUENCE_COUNT") %>% 
  left_join(metadata, by = "SAMPLE")

## Temperature select
# View(asv_long)

asv_long_temp15 <- asv_long %>%  
  filter(temp >= 15 & SEQUENCE_COUNT > 0) # AND try | for OR
  # filter(temp >= 15) %>% # just one
  # filter(SEQUENCE_COUNT > 0) #And the second

asv_long %>%  
  filter(temp >= 15 & SEQUENCE_COUNT > 0)

## Parse Taxon names
## Went back to asv_long
plot_ready_df <- asv_long %>% 
  separate(col = Taxon, into = c("Domain", "Supergroup", "Family", "ELSE")) %>% 
  filter(SEQUENCE_COUNT > 0) %>% 
  group_by(Domain, SAMPLE) %>% 
    summarise(NUM_OF_SEQUENCE = sum(SEQUENCE_COUNT))

# View(plot_ready_df)
glimpse(plot_ready_df)  

# Make bar plot
ggplot(plot_ready_df, aes(x = SAMPLE, y = NUM_OF_SEQUENCE, fill = Domain)) +
  geom_bar(stat = "identity", position = "stack", color = "black") +
  # geom_bar(stat = "identity", position = "fill", color = "black") + #I don't like this one as much.
  # theme_linedraw() + 
  theme_grey() +
  theme(axis.text.x = element_text(color = "black", angle = 90, face = "bold", hjust = 1, vjust = 0.5, size = 4)) +
  labs(x = "Sample IDs", y = "Total number of sequences")











