library(tidyverse)
source(here::here("src", "functions.R"))

gapminder_dat_full <- get_gapminder(keywords = c("pop--", "co2", "--geo--country", "--lex"))
#, "--lex", "--gdp", "--mincpcap", "employ", "--geo", "--hapi", "demox", "--gini"))
# life expectancy, gdp, minimum income per capita, employment, geography, happiness, democraty index, gini index 

saveRDS(gapminder_dat_full, here::here("data", "gapminder_dat.rds"))

