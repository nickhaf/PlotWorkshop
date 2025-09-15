## -------------------------------------------------------------------------------------------------------------------
# install.packages(c("ggimage", "here", "tidyverse", "ggtext", "glue", "patchwork", "ggrepel"))

library(ggimage)
library(here)
library(patchwork)
library(tidyverse)
library(ggtext)
library(glue)
library(ggrepel)


## -------------------------------------------------------------------------------------------------------------------
#| eval: false

# characters <- readRDS(url("https://github.com/nickhaf/PlotWorkshop/raw/refs/heads/main/data/characters.rds"))
# 
# ## Optional: Abspeichern
# saveRDS(characters, here::here("data", "characters.rds"))


## -------------------------------------------------------------------------------------------------------------------
#| eval: false

# gapminder <- readRDS(url("https://github.com/nickhaf/PlotWorkshop/raw/refs/heads/main/data/gapminder_dat.rds"))
# 
# ## Optional: Abspeichern
# saveRDS(gapminder, here::here("data", "characters.rds"))


## -------------------------------------------------------------------------------------------------------------------
#| echo: false

characters <- readRDS(url("https://github.com/nickhaf/PlotWorkshop/raw/refs/heads/main/data/characters.rds"))

gapminder <- readRDS(url("https://github.com/nickhaf/PlotWorkshop/raw/refs/heads/main/data/gapminder_dat.rds"))


## -------------------------------------------------------------------------------------------------------------------
shows <- c("How I Met Your Mother", "Friends")
quest_vec <- c(
  "doer/thinker",
  "jock/nerd",
  "dispassionate/romantic",
  "funny/humorless",
  "chaotic/orderly"
)

## Filtern von TV-Shows und Fragen

char_prepped <- characters %>%
  filter(uni_name %in% shows) %>%
  filter(question %in% quest_vec)


## -------------------------------------------------------------------------------------------------------------------
#| echo: false
#| fig-width: 14
#| fig-height: 6

ggplot(char_prepped, aes(x = top_trait, y = avg_rating, colour = char_name)) +
  geom_point() +
  theme_bw() +
  geom_segment(
    aes(
      x = top_trait, xend = top_trait,
      y = 0, yend = avg_rating,
      group = interaction(char_name, uni_name)
    ),
    linewidth = 0.5,
    alpha = 0.5
  )


## -------------------------------------------------------------------------------------------------------------------
#| eval: false

# ggplot(char_prepped, aes(x = top_trait, y = avg_rating, colour = char_name)) +
#   geom_point() +
#   theme_bw() +
#   geom_segment(
#     aes(
#       x = top_trait, xend = top_trait,
#       y = 0, yend = avg_rating,
#       group = interaction(char_name, uni_name)
#     ),
#     linewidth = 0.5,
#     alpha = 0.5
#   )


## -------------------------------------------------------------------------------------------------------------------
#| label: barplot_solution
#| echo: false
#| fig-width: 12


shows <- c("How I Met Your Mother", "Friends")
quest_vec <- c(
  "doer/thinker", "jock/nerd", "cold/warm", "main character/side character",
  "crazy/sane",
  "dispassionate/romantic",
  "high IQ/low IQ",
  "heroic/villainous",
  "funny/humorless",
  "chaotic/orderly",
  "plays hard/works hard",
  "cocky/timid",
  "old/young"
)

## Filtern von weiteren TV-Shows und Fragen
char_prepped <- characters %>%
  filter(uni_name %in% shows) %>%
  filter(question %in% quest_vec)

ggplot(char_prepped, aes(x = avg_rating, y = top_trait, fill = avg_rating)) +
  facet_grid(. ~ char_name) +
  geom_col(position = "identity", color = "black") +
  theme_bw() +
  xlim(c(0, 100)) +
  scale_fill_viridis_c(option = "D") 


## -------------------------------------------------------------------------------------------------------------------
#| label: barplot_solution
#| eval: false
# 
# shows <- c("How I Met Your Mother", "Friends")
# quest_vec <- c(
#   "doer/thinker", "jock/nerd", "cold/warm", "main character/side character",
#   "crazy/sane",
#   "dispassionate/romantic",
#   "high IQ/low IQ",
#   "heroic/villainous",
#   "funny/humorless",
#   "chaotic/orderly",
#   "plays hard/works hard",
#   "cocky/timid",
#   "old/young"
# )
# 
# ## Filtern von weiteren TV-Shows und Fragen
# char_prepped <- characters %>%
#   filter(uni_name %in% shows) %>%
#   filter(question %in% quest_vec)
# 
# ggplot(char_prepped, aes(x = avg_rating, y = top_trait, fill = avg_rating)) +
#   facet_grid(. ~ char_name) +
#   geom_col(position = "identity", color = "black") +
#   theme_bw() +
#   xlim(c(0, 100)) +
#   scale_fill_viridis_c(option = "D")


## -------------------------------------------------------------------------------------------------------------------
#| eval: false

# ggplot(gapminder, aes(x = gini, y=hapiscore_whr)) +
#   geom_point()


## -------------------------------------------------------------------------------------------------------------------
#| echo: false

ggplot(gapminder, aes(x = gini, y=hapiscore_whr)) +
  geom_point()


## -------------------------------------------------------------------------------------------------------------------
#| echo: false
#| fig-width: 14
#| fig-height: 7

options(scipen=10)

# Farben der vier Weltregionen 
tuerkis <- rgb(0,213,233, max=255)
gruen <- rgb(127,235,0, max=255)
rot <- rgb(255,88,114, max=255)
gelb <- rgb(255,231,0, max=255)

gapminder |>
  # Auswahl der Daten von 2019:
  subset(time == 2019) |> 
  # Angabe der Einwohnerzahl in Millionen
  mutate(pop = pop/1000000) |>
  # Grund-Grafik anfordern:
  ggplot(aes(x=gini, y=hapiscore_whr)) +
  # Text für die Jahreszahl ("2019") einfügen, sodass diese ganz im Hintergrund steht
  annotate("text", x=45, y=50, label="2019", size=85, colour ="grey90", family="mono", fontface=1) +
  # Farbthema: heller Hintergrund, schwarze Linien an x- und y-Achse
  theme_classic() + 
  # Wie bisher: Punkte einzeichnen --> Streu-Punkt-Diagramm,
  # Neu: Unterscheidung der Punkte nach Farbe (Weltegion) und Größe (Population);  
  # Transparenz der Datenpunkte (alpha), Rand um die Punkte (shape) 
  geom_point(aes(fill = world_4region, size = pop), shape=21, alpha=.7) +
  # Skalieren der Größe der Punkte, sodass die Unterschiede deutlicher sind
  scale_size(range = c(1, 30)) +
  # Beschriftung der Achsen
  labs(x="Gini-Index", y="Happiness Score") +
  # Neu: manuelle Spezifikation der y-Achse: Wertebereich, Position der Beschriftungen (10er-Schritte)
  scale_y_continuous(limits = c(15, 85), 
                     breaks = seq(20,80, by=10),
                     labels = paste0(seq(20,80, by=10), "%")) +
  #  manuelle Spezifikation der x-Achse: Wertebereich, log-Transformation, Position und Name der Beschriftungen
  scale_x_continuous(limits = c(18,75),
                     breaks = seq(20,70, by= 5)) +
  # manuelle Spezifikation der Farben
  scale_fill_manual(
    values = c(tuerkis, gruen, rot, gelb),
    breaks = c("africa", "americas", "asia", "europe")) +
  # Theme (Anpassung der Schriftgroesse, relativ zur Groesse 12, blaues Raster im Hintergrund, Rand für die Legende)
  theme(text = element_text(size=12),
        axis.text = element_text(size=rel(.8)),
        axis.title = element_text(size=rel(1.2)),
        panel.grid.major = element_line(colour = "azure2")) +
  # Titel, Beschriftungen der Achse und Legende
  labs(x="Inequality index (Gini)",
       y="Happiness Score (WHR)",
       fill="Weltregion",
       size="Einwohnerzahl\n(in Mio.)") +
  # Vergroessern der Punkte fuer die Farb-Legende fuer die Kontinente
  guides(fill = guide_legend(override.aes = list(size = 5), order=1)) 


## -------------------------------------------------------------------------------------------------------------------
#| eval: false

# options(scipen=10)
# 
# # Farben der vier Weltregionen
# tuerkis <- rgb(0,213,233, max=255)
# gruen <- rgb(127,235,0, max=255)
# rot <- rgb(255,88,114, max=255)
# gelb <- rgb(255,231,0, max=255)
# 
# gapminder |>
#   # Auswahl der Daten von 2019:
#   subset(time == 2019) |>
#   # Angabe der Einwohnerzahl in Millionen
#   mutate(pop = pop/1000000) |>
#   # Grund-Grafik anfordern:
#   ggplot(aes(x=gini, y=hapiscore_whr)) +
#   # Text für die Jahreszahl ("2019") einfügen, sodass diese ganz im Hintergrund steht
#   annotate("text", x=45, y=50, label="2019", size=85, colour ="grey90", family="mono", fontface=1) +
#   # Farbthema: heller Hintergrund, schwarze Linien an x- und y-Achse
#   theme_classic() +
#   # Wie bisher: Punkte einzeichnen --> Streu-Punkt-Diagramm,
#   # Neu: Unterscheidung der Punkte nach Farbe (Weltegion) und Größe (Population);
#   # Transparenz der Datenpunkte (alpha), Rand um die Punkte (shape)
#   geom_point(aes(fill = world_4region, size = pop), shape=21, alpha=.7) +
#   # Skalieren der Größe der Punkte, sodass die Unterschiede deutlicher sind
#   scale_size(range = c(1, 30)) +
#   # Beschriftung der Achsen
#   labs(x="Gini-Index", y="Happiness Score") +
#   # Neu: manuelle Spezifikation der y-Achse: Wertebereich, Position der Beschriftungen (10er-Schritte)
#   scale_y_continuous(limits = c(15, 85),
#                      breaks = seq(20,80, by=10),
#                      labels = paste0(seq(20,80, by=10), "%")) +
#   #  manuelle Spezifikation der x-Achse: Wertebereich, log-Transformation, Position und Name der Beschriftungen
#   scale_x_continuous(limits = c(18,75),
#                      breaks = seq(20,70, by= 5)) +
#   # manuelle Spezifikation der Farben
#   scale_fill_manual(
#     values = c(tuerkis, gruen, rot, gelb),
#     breaks = c("africa", "americas", "asia", "europe")) +
#   # Theme (Anpassung der Schriftgroesse, relativ zur Groesse 12, blaues Raster im Hintergrund, Rand für die Legende)
#   theme(text = element_text(size=12),
#         axis.text = element_text(size=rel(.8)),
#         axis.title = element_text(size=rel(1.2)),
#         panel.grid.major = element_line(colour = "azure2")) +
#   # Titel, Beschriftungen der Achse und Legende
#   labs(x="Inequality index (Gini)",
#        y="Happiness Score (WHR)",
#        fill="Weltregion",
#        size="Einwohnerzahl\n(in Mio.)") +
#   # Vergroessern der Punkte fuer die Farb-Legende fuer die Kontinente
#   guides(fill = guide_legend(override.aes = list(size = 5), order=1))

