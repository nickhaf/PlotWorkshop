#| eval: false

library(tidyverse)

characters <- tidytuesdayR::tt_load("2022-08-16")

## Mergen
char_dat <- characters$characters
psych_dat <- characters$psych_stats

dat_merged <- char_dat %>%
  rename(char_name = name) %>%
  left_join(psych_dat) %>% 
  ## Rating always between 50 and 100. Use the personality trait for correct scaling
  mutate(
    top_trait = str_split_i(question, pattern = "/", i = 2),
    bottom_trait = str_split_i(question, pattern = "/", i = 1)
  ) %>%
  mutate(avg_rating = case_when(
    personality == top_trait ~ avg_rating,
    personality == bottom_trait ~ 100 - avg_rating
  ))

saveRDS(dat_merged, "data/characters.rds")