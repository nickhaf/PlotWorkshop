library(tidyverse)
library(here)
library(janitor)
library(ggwordcloud)


# could use the imbd data for season/episode popularity. 
# Or some network plot with the actors, maybe which combinations have the best ratings. 
# Return of investment by categorie, with naming outliers!
#   Life expectancy by country, with looking at outliers for example. 


# Imbd data ---------------------------------------------------------------

## Prepare to filter some genres
ggplot(data = movies_metadat, 
       mapping = aes(x = budget, 
                     y = revenue)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(vars(genres_clean)) +
  theme_bw()

# Movies_metadat (Movies from Kaggle) -------------------------------------

## Not current, but clean and well prepared. Can distribute, and API if I want more current data

movies_metadat <- read.csv(here::here("data", "movies_metadata.csv")) %>% 
  mutate(budget = as.numeric(budget), 
         vote_average = as.numeric(vote_average), 
         popularity = as.numeric(popularity)) %>% 
  filter(revenue > 0, budget > 0)

library(rjson)

extract_genres <- function(json_string) {
  json_string %>%
    str_replace_all("'", "\"") %>%   # Replace single quotes with double quotes
    fromJSON() %>%                   # Convert JSON string to list
    map_chr("name") %>%               # Extract "name" field
    paste(collapse = ", ")            # Combine into a single string
}

movies_metadat <- movies_metadat %>% 
  mutate(genres_clean = map_chr(genres, extract_genres)) %>% 
  separate_rows(genres_clean, sep = ", ")  # Split the column into multiple rows

## Popularity over seasons


## Which movie to watch next
library(ggwordcloud)

ggplot(data = movies_metadat %>% filter(vote_average > 7, vote_count > 100), 
       mapping = aes(label = title, size = popularity)) +
  geom_text_wordcloud()


# Astronauts --------------------------------------------------------------

tuesdata <- tidytuesdayR::tt_load('2020-07-14')

astro <- tuesdata$astronauts

ggplot(data = astro, 
       aes(x = year_of_mission, 
           y = hours_mission)) +
  geom_point() +
  geom_smooth() 

ggplot(data = astro %>% arrange(year_of_mission),
       aes(x = hours_mission, 
           y = id, 
           colour = year_of_mission)) +
  geom_jitter(aes(size = eva_hrs_mission)) +
  geom_segment(aes(x = 0, xend = hours_mission, y = id, yend = id), alpha = 0.3) +
  coord_polar() +
  theme_minimal()

ggplot(data = astro, 
       aes(x = eva_hrs_mission, 
           y = hours_mission, 
           colour = sex)) +
  geom_point() 

## space travelling during cold war?
## Where do astronauts come from? -> Map
## Age


# Nobel Price Winners -----------------------------------------------------


# read in the specific category/field datasets and the overall winners

nobel_winners <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2019/2019-05-14/nobel_winners.csv")
nobel_winner_all_pubs <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2019/2019-05-14/nobel_winner_all_pubs.csv")

## Something like increasing number of women over the years. 

journal_count <- nobel_winner_all_pubs %>% 
  group_by(journal) %>% 
  count 

ggplot(data = journal_count %>% filter(n >100), 
       aes(size = n, label = journal)) +
  geom_text_wordcloud()


nobel_winners <- nobel_winners %>% 
  mutate(age_at_price = prize_year - year(birth_date))

nobel_winners %>%
  group_by(gender) %>% 
  summarize(mean_age = median(age_at_price, na.rm = TRUE))

ggplot(nobel_winners, aes(
  x = prize_year,
  y = age_at_price, colour = gender)) +
  geom_point() +
  geom_segment(aes(x = prize_year, xend = prize_year, y = 0, yend = age_at_price), alpha = 0.3) +
  facet_wrap(vars(category)) +
  scale_colour_manual(values = c(Male = "lightgrey", Female = "red")) +
  theme_classic()

## Nobel Prize universities. 
## Where do the winners come from?



# Gapminder ---------------------------------------------------------------
pop_world <- read.csv(here::here("raw_data", "pop.csv"))
co2_world <- read.csv(here::here("raw_data", "co2_pcap_cons.csv"))

colnames(co2_world) <- gsub("^X", "", colnames(co2_world)) 
co2_world[, 2:ncol(co2_world)] <- co2_world[, 2:ncol(co2_world)] %>% 
  mutate(across(everything(), ~ gsub("−", "-", as.character(.)))) %>% 
mutate_if(is.character, as.numeric) 

co2_world <- co2_world %>% 
  pivot_longer(cols = -country, 
               names_to = "year", 
               values_to = "co2")


co2_top <- co2_world %>% 
  group_by(country) %>% 
  summarize(total_co2 = mean(co2, na.rm = TRUE)) %>% 
  top_n(10, total_co2) %>% 
  pull(country)

co2_world_top <- co2_world %>% 
  filter(country %in% co2_top)

ggplot(co2_world_top, 
       aes(x = year, 
           y = co2,
           group = country, 
           colour = country)) +
  geom_point() +
  geom_line()
  
