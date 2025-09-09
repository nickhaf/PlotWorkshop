library(tidyverse)
source(here::here("src", "functions.R"))

gapminder_dat_full <- get_gapminder(repo = "https://github.com/open-numbers/ddf--gapminder--fasttrack",
                                    keywords = c("pop--", "co2", "--geo--country", "--lex", "--hapi", "demox", "--gini", "employ", "--gdp"))

part_time_total <- read.csv(here::here("data", "sl_tlf_part_zs.csv")) %>% 
  pivot_longer(cols = contains("X"), names_to = "time", values_to = "part_time_employ_total")
part_time_fe <- read.csv(here::here("data", "sl_tlf_part_fe_zs.csv")) %>% 
  pivot_longer(cols = contains("X"), names_to = "time", values_to = "part_time_employ_fe")
part_time_ma <- read.csv(here::here("data", "sl_tlf_part_ma_zs.csv")) %>% 
  pivot_longer(cols = contains("X"), names_to = "time", values_to = "part_time_employ_ma")
working_hours <- read.csv(here::here("data", "working_hours_per_week.csv")) %>% 
  pivot_longer(cols = contains("X"), names_to = "time", values_to = "working_hours_week")

gapminder_merged <- part_time_total%>% 
  left_join(part_time_fe) %>%
  left_join(part_time_ma) %>%
  left_join(working_hours) %>%
  mutate(time = as.numeric(str_remove(time, "X"))) %>%
  rename(name = "country") %>% 
  right_join(gapminder_dat_full) %>% 
  drop_na(country)



#, "--mincpcap", "--geo",)
# life expectancy, gdp, minimum income per capita, employment, geography, happiness, democraty index, gini index 

saveRDS(gapminder_merged, here::here("data", "gapminder_dat.rds"))

