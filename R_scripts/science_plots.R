## -------------------------------------------------------------------------------------------------------------------
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggview)
library(scales)


## -------------------------------------------------------------------------------------------------------------------
gapminder <- readRDS(url("https://github.com/nickhaf/PlotWorkshop/raw/refs/heads/main/data/gapminder_dat.rds"))


## -------------------------------------------------------------------------------------------------------------------
gapminder_line <- gapminder %>% 
  filter(country %in% c("deu"), time >=1900, time <= 2024) %>% 
  drop_na(gini)

p_line <- ggplot(data = gapminder_line, aes(x = time, y = gini)) +
  geom_line() 


## -------------------------------------------------------------------------------------------------------------------
ggsave("lineplot.png", plot = p_line, 
       width = 20, height = 10, units = "cm", dpi = 300)


## -------------------------------------------------------------------------------------------------------------------
#| eval: false
#| code-line-numbers: "7"

# gapminder_line <- gapminder %>%
#   filter(country %in% c("deu"), time >=1900, time <= 2024) %>%
#   drop_na(gini)
# 
# ggplot(data = gapminder_line, aes(x = time, y = gini)) +
#   geom_line()  +
#   canvas(width = 1200, height = 600, units = "px", dpi = 300)


## -------------------------------------------------------------------------------------------------------------------
#| eval: false
#| code-line-numbers: "5"

# p_line <- ggplot(data = gapminder_line, aes(x = time, y = gini)) +
#   geom_line()  +
#   canvas(width = 1200, height = 600, units = "px", dpi = 300)
# 
# save_ggplot(p_line, "my_plot.png")


## -------------------------------------------------------------------------------------------------------------------
#| eval: false
#| code-line-numbers: "5,6"

# ggplot(data = gapminder_line, aes(x = time, y = gini)) +
#   geom_line()  +
#   canvas(width = 1200, height = 600, units = "px", dpi = 300)
# 
# ggsave("my_plot.png",
#        width = 1200, height = 600, units = "px", dpi = 300)


## -------------------------------------------------------------------------------------------------------------------
#| eval: false

# library(scales)
# ggplot(data) +
#   ... +
#   scale_x_continuous(labels = scales::comma)
# 

