## -------------------------------------------------------------------------------------------------------------------
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggthemes)
library(gganimate)
library(plotly)
library(htmlwidgets)


## -------------------------------------------------------------------------------------------------------------------
gapminder <- readRDS(url("https://github.com/nickhaf/PlotWorkshop/raw/refs/heads/main/data/gapminder_dat.rds"))


## -------------------------------------------------------------------------------------------------------------------
#| label: static-plot
#| fig-width: 15
#| fig-height: 6
#| fig-align: "center"
#| echo: false

gapminder_line_g7 <- gapminder %>%
  filter(country %in% c("can", "fra", "deu", "ita", "jpn", "gbr", "usa"), time >=1900, time <= 2024) %>%
  drop_na(gini)

labels_g7 <- c(
  "can" = "Kanada",
  "fra" = "Frankreich",
  "deu" = "Deutschland",
  "ita" = "Italien",
  "jpn" = "Japan",
  "gbr" = "Vereinigtes Königreich",
  "usa" = "USA"
)

gapminder_line_g7$country_de <- labels_g7[gapminder_line_g7$country]
gapminder_line_g7$country_de <- factor(gapminder_line_g7$country_de,
                        levels = sort(unique(gapminder_line_g7$country_de)))

p_line_g7 <- ggplot(data = gapminder_line_g7, aes(x = time, y = gini)) +
  geom_line(aes(col = country_de)) +  
  labs(title = "Ungleichheit On the Rise", 
     subtitle = "Gini-Koeffizient in den G7-Staaten von 1900 bis 2024",
     x = "Jahr",
     y = "Gini-Koeffizient", 
     col = "G7-Staat") +
  scale_color_discrete(labels = labels_g7) +
  theme_solarized() 

p_line_g7


## -------------------------------------------------------------------------------------------------------------------
#| label: static-code
#| eval: false

# gapminder_line_g7 <- gapminder %>%
#   filter(country %in% c("can", "fra", "deu", "ita", "jpn", "gbr", "usa"), time >=1900, time <= 2024) %>%
#   drop_na(gini)
# 
# labels_g7 <- c(
#   "can" = "Kanada",
#   "fra" = "Frankreich",
#   "deu" = "Deutschland",
#   "ita" = "Italien",
#   "jpn" = "Japan",
#   "gbr" = "Vereinigtes Königreich",
#   "usa" = "USA"
# )
# 
# gapminder_line_g7$country_de <- labels_g7[gapminder_line_g7$country]
# gapminder_line_g7$country_de <- factor(gapminder_line_g7$country_de,
#                         levels = sort(unique(gapminder_line_g7$country_de)))
# 
# p_line_g7 <- ggplot(data = gapminder_line_g7, aes(x = time, y = gini)) +
#   geom_line(aes(col = country_de)) +
#   labs(title = "Ungleichheit On the Rise",
#      subtitle = "Gini-Koeffizient in den G7-Staaten von 1900 bis 2024",
#      x = "Jahr",
#      y = "Gini-Koeffizient",
#      col = "G7-Staat") +
#   scale_color_discrete(labels = labels_g7) +
#   theme_solarized()
# 
# p_line_g7


## -------------------------------------------------------------------------------------------------------------------
#| label: anim-plot
#| fig-width: 15
#| fig-height: 6
#| fig-align: "center"
#| echo: false

p_line_g7 + 
  transition_reveal(along = time) + # Linien werden über die Zeit "enthüllt"
  ease_aes("linear")  


## -------------------------------------------------------------------------------------------------------------------
#| label: anim-code
#| eval: false

# p_line_g7 +
#   transition_reveal(along = time) +# Linien werden über die Zeit "enthüllt"
#   ease_aes("linear")


## -------------------------------------------------------------------------------------------------------------------
#| label: static-bubble-plot
#| fig-width: 15
#| fig-height: 7
#| echo: false

options(scipen=10)

# Farben der vier Weltregionen 
tuerkis <- rgb(0,213,233, max=255)
gruen <- rgb(127,235,0, max=255)
rot <- rgb(255,88,114, max=255)
gelb <- rgb(255,231,0, max=255)

p_static <- gapminder %>%
  subset(time == 2019) %>% 
  mutate(pop = pop/1000000) %>%
  ggplot(aes(x=gini, y=hapiscore_whr)) +
  annotate("text", x=45, y=50, label="2019", size=85, colour ="grey90", family="mono", fontface=1) +
  theme_classic() + 
  geom_point(aes(fill = world_4region, size = pop), shape=21, alpha=.7) +
  scale_size(range = c(1, 30)) +
  labs(x="Gini-Index", y="Happiness Score") +
  scale_y_continuous(limits = c(15, 85), 
                     breaks = seq(20,80, by=10),
                     labels = paste0(seq(20,80, by=10), "%")) +
  scale_x_continuous(limits = c(18,75),
                     breaks = seq(20,70, by= 5)) +
  scale_fill_manual(
    values = c(tuerkis, gruen, rot, gelb),
    breaks = c("africa", "americas", "asia", "europe")) +
  theme(text = element_text(size=12),
        axis.text = element_text(size=rel(.8)),
        axis.title = element_text(size=rel(1.2)),
        panel.grid.major = element_line(colour = "azure2")) +
  labs(title="Bubble Chart im Gapminder-Look",
       subtitle="Jahr: 2023",
       x="Gini-Index",
       y="Happiness Score (WHR)",
       fill="Weltregion",
       size="Einwohnerzahl\n(in Mio.)") +
  guides(fill = guide_legend(override.aes = list(size = 5), order=1)) 

p_static


## -------------------------------------------------------------------------------------------------------------------
#| label: static-bubble-code
#| eval: false

# options(scipen=10)
# 
# # Farben der vier Weltregionen
# tuerkis <- rgb(0,213,233, max=255)
# gruen <- rgb(127,235,0, max=255)
# rot <- rgb(255,88,114, max=255)
# gelb <- rgb(255,231,0, max=255)
# 
# p_static <- gapminder %>%
#   subset(time == 2019) %>%
#   mutate(pop = pop/1000000) %>%
#   ggplot(aes(x=gini, y=hapiscore_whr)) +
#   annotate("text", x=45, y=50, label="2019", size=85, colour ="grey90", family="mono", fontface=1) +
#   theme_classic() +
#   geom_point(aes(fill = world_4region, size = pop), shape=21, alpha=.7) +
#   scale_size(range = c(1, 30)) +
#   labs(x="Gini-Index", y="Happiness Score") +
#   scale_y_continuous(limits = c(15, 85),
#                      breaks = seq(20,80, by=10),
#                      labels = paste0(seq(20,80, by=10), "%")) +
#   scale_x_continuous(limits = c(18,75),
#                      breaks = seq(20,70, by= 5)) +
#   scale_fill_manual(
#     values = c(tuerkis, gruen, rot, gelb),
#     breaks = c("africa", "americas", "asia", "europe")) +
#   theme(text = element_text(size=12),
#         axis.text = element_text(size=rel(.8)),
#         axis.title = element_text(size=rel(1.2)),
#         panel.grid.major = element_line(colour = "azure2")) +
#   labs(title="Bubble Chart im Gapminder-Look",
#        subtitle="Jahr: 2023",
#        x="Gini-Index",
#        y="Happiness Score (WHR)",
#        fill="Weltregion",
#        size="Einwohnerzahl\n(in Mio.)") +
#   guides(fill = guide_legend(override.aes = list(size = 5), order=1))
# 
# p_static


## -------------------------------------------------------------------------------------------------------------------
#| label: anim-bubble-plot
#| fig-width: 15
#| fig-height: 7
#| echo: false

options(scipen=10)

# Farben der vier Weltregionen 
tuerkis <- rgb(0,213,233, max=255)
gruen <- rgb(127,235,0, max=255)
rot <- rgb(255,88,114, max=255)
gelb <- rgb(255,231,0, max=255)

p_static <- gapminder %>%
  subset(time >= 2005 & time <= 2023) %>% 
  mutate(pop = pop/1000000) %>%
  ggplot(aes(x=gini, y=hapiscore_whr)) +
  theme_classic() + 
  geom_point(aes(fill = world_4region, size = pop), shape=21, alpha=.7) +
  scale_size(range = c(1, 30)) +
  labs(x="Gini-Index", y="Happiness Score") +
  scale_y_continuous(limits = c(15, 85), 
                     breaks = seq(20,80, by=10),
                     labels = paste0(seq(20,80, by=10), "%")) +
  scale_x_continuous(limits = c(18,75),
                     breaks = seq(20,70, by= 5)) +
  scale_fill_manual(
    values = c(tuerkis, gruen, rot, gelb),
    breaks = c("africa", "americas", "asia", "europe")) +
  theme(text = element_text(size=12),
        axis.text = element_text(size=rel(.8)),
        axis.title = element_text(size=rel(1.2)),
        panel.grid.major = element_line(colour = "azure2")) +
  labs(title="Bubble Chart im Gapminder-Look",
       subtitle = "Jahr: {floor(frame_time)}",
       x="Gini-Index",
       y="Happiness Score (WHR)",
       fill="Weltregion",
       size="Einwohnerzahl\n(in Mio.)") +
  guides(fill = guide_legend(override.aes = list(size = 5), order=1)) 

p_static + transition_time(time) +
  ease_aes("linear")



## -------------------------------------------------------------------------------------------------------------------
#| label: anim-bubble-code
#| eval: false

# options(scipen=10)
# 
# # Farben der vier Weltregionen
# tuerkis <- rgb(0,213,233, max=255)
# gruen <- rgb(127,235,0, max=255)
# rot <- rgb(255,88,114, max=255)
# gelb <- rgb(255,231,0, max=255)
# 
# p_static <- gapminder %>%
#   subset(time >= 2005 & time <= 2023) %>%
#   mutate(pop = pop/1000000) %>%
#   ggplot(aes(x=gini, y=hapiscore_whr)) +
#   theme_classic() +
#   geom_point(aes(fill = world_4region, size = pop), shape=21, alpha=.7) +
#   scale_size(range = c(1, 30)) +
#   labs(x="Gini-Index", y="Happiness Score") +
#   scale_y_continuous(limits = c(15, 85),
#                      breaks = seq(20,80, by=10),
#                      labels = paste0(seq(20,80, by=10), "%")) +
#   scale_x_continuous(limits = c(18,75),
#                      breaks = seq(20,70, by= 5)) +
#   scale_fill_manual(
#     values = c(tuerkis, gruen, rot, gelb),
#     breaks = c("africa", "americas", "asia", "europe")) +
#   theme(text = element_text(size=12),
#         axis.text = element_text(size=rel(.8)),
#         axis.title = element_text(size=rel(1.2)),
#         panel.grid.major = element_line(colour = "azure2")) +
#   labs(title="Bubble Chart im Gapminder-Look",
#        subtitle = "Jahr: {floor(frame_time)}",
#        x="Gini-Index",
#        y="Happiness Score (WHR)",
#        fill="Weltregion",
#        size="Einwohnerzahl\n(in Mio.)") +
#   guides(fill = guide_legend(override.aes = list(size = 5), order=1))
# 
# p_static + transition_time(time) +
#   ease_aes("linear")


## -------------------------------------------------------------------------------------------------------------------
#| label: anim-save
#| eval: false

# p_anim <- p_static + transition_time(time) +
#   ease_aes("linear")
# 
# anim_save("bubbles.gif", animation = p_anim)


## -------------------------------------------------------------------------------------------------------------------
#| label: anim-save2
#| eval: false

# animate(p_anim, height = 10, width = 20, units = "cm", res = 150)
# anim_save("bubbles_wide.gif")


## -------------------------------------------------------------------------------------------------------------------
#| label: example-bubble-plot
#| fig-width: 15
#| fig-height: 7
#| echo: false

gapminder <- readRDS(here::here("data", "gapminder_dat.rds"))

options(scipen=10)

# Farben der vier Weltregionen 
tuerkis <- rgb(0,213,233, max=255)
gruen <- rgb(127,235,0, max=255)
rot <- rgb(255,88,114, max=255)
gelb <- rgb(255,231,0, max=255)

p_bubble <- gapminder %>%
  subset(time == 2023) %>% 
  mutate(pop = pop/1000000) %>%
  ggplot(aes(x=gini, y=hapiscore_whr)) +
  annotate("text", x=45, y=50, label="2023", size=85, colour ="grey90", family="mono", fontface=1) +
  theme_classic() + 
  geom_point(aes(fill = world_4region, size = pop), shape=21, alpha=.7) +
  scale_size(range = c(1, 30)) +
  labs(x="Gini-Index", y="Happiness Score") +
  scale_y_continuous(limits = c(15, 85), 
                     breaks = seq(20,80, by=10),
                     labels = paste0(seq(20,80, by=10), "%")) +
  scale_x_continuous(limits = c(18,75),
                     breaks = seq(20,70, by= 5)) +
  scale_fill_manual(
    values = c(tuerkis, gruen, rot, gelb),
    breaks = c("africa", "americas", "asia", "europe")) +
  theme(text = element_text(size=12),
        axis.text = element_text(size=rel(.8)),
        axis.title = element_text(size=rel(1.2)),
        panel.grid.major = element_line(colour = "azure2")) +
  labs(title="Bubble Chart im Gapminder-Look",
       subtitle="Jahr: 2023",
       x="Gini-Index",
       y="Happiness Score (WHR)",
       fill="Weltregion",
       size="Einwohnerzahl\n(in Mio.)") +
  guides(fill = guide_legend(override.aes = list(size = 5), order=1)) 

p_bubble


## -------------------------------------------------------------------------------------------------------------------
#| label: example-bubble-code
#| fig-width: 15
#| fig-height: 7
#| eval: false

# gapminder <- readRDS(here::here("data", "gapminder_dat.rds"))
# 
# options(scipen=10)
# # Farben der vier Weltregionen
# tuerkis <- rgb(0,213,233, max=255)
# gruen <- rgb(127,235,0, max=255)
# rot <- rgb(255,88,114, max=255)
# gelb <- rgb(255,231,0, max=255)
# 
# p_bubble <- gapminder %>%
#   subset(time == 2023) %>%
#   mutate(pop = pop/1000000) %>%
#   ggplot(aes(x=gini, y=hapiscore_whr)) +
#   annotate("text", x=45, y=50, label="2023", size=85, colour ="grey90", family="mono", fontface=1) +
#   theme_classic() +
#   geom_point(aes(fill = world_4region, size = pop), shape=21, alpha=.7) +
#   scale_size(range = c(1, 30)) +
#   labs(x="Gini-Index", y="Happiness Score") +
#   scale_y_continuous(limits = c(15, 85),
#                      breaks = seq(20,80, by=10),
#                      labels = paste0(seq(20,80, by=10), "%")) +
#   scale_x_continuous(limits = c(18,75),
#                      breaks = seq(20,70, by= 5)) +
#   scale_fill_manual(
#     values = c(tuerkis, gruen, rot, gelb),
#     breaks = c("africa", "americas", "asia", "europe")) +
#   theme(text = element_text(size=12),
#         axis.text = element_text(size=rel(.8)),
#         axis.title = element_text(size=rel(1.2)),
#         panel.grid.major = element_line(colour = "azure2")) +
#   labs(title="Bubble Chart im Gapminder-Look",
#        subtitle="Jahr: 2023",
#        x="Gini-Index",
#        y="Happiness Score (WHR)",
#        fill="Weltregion",
#        size="Einwohnerzahl\n(in Mio.)") +
#   guides(fill = guide_legend(override.aes = list(size = 5), order=1))
# 
# p_bubble


## -------------------------------------------------------------------------------------------------------------------
#| label: plotly-plot
#| echo: false

ggplotly(p_bubble) %>%
  layout(width = 1000, height = 450)


## -------------------------------------------------------------------------------------------------------------------
#| label: plotly-code
#| eval: false

# ggplotly(p_bubble)


## -------------------------------------------------------------------------------------------------------------------
#| label: plotly-save
#| eval: false

# p_plotly <- ggplotly(p_bubble)
# saveWidget(p_plotly, file = "bubbles.html")


## -------------------------------------------------------------------------------------------------------------------
#| label: plotly-save2
#| eval: false

# p_plotly <- ggplotly(p_bubble) %>%
#   layout(width = 1200, height = 400)
# 
# saveWidget(p_plotly, file = "bubbles_wide.html")

