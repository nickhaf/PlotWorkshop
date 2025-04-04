
### Hex-Logo for workshop 


# Setup ----

library(ggplot2)
library(sysfonts)
library(showtext)
# install_github("idmn/ggview")
library(ggview)

# Daten 

hex <- data.frame(
  x <- c( 0,   -2.2, -2.2,   0, 2.2,  2.2,    0) * 1.05,
  y <- c(-2.5, -1.3,  1.3, 2.5, 1.3, -1.3, -2.5) * 1.05)
hex2 <- data.frame(
  x = 1.4*hex$x, 
  y = 1.4*hex$y)
line_points <- data.frame(
  Ipx = c(-2.1, -1.2, -0.3, 0.3, 1.1, 1.9),
  Ipy = c(0,     0.6,  1.2, 0.4, 0.95, 1.5))


# Farben 

## workshop color scheme
# theme_darkblue  <- '#01364C'
# theme_blue      <- '#00e0e0'
# theme_green     <- '#abe338'  # [JB] Farbe habe ich aus dem gehighlighteten Code gepickt
# theme_yellow    <- '#F4BA02'
# theme_red       <- '#9B1B34'
# theme_white     <- '#E1E8EB'
# theme_timberwolf<- '#F8F8F8'

ws_col <- c('#01364C', '#00e0e0', '#abe338', '#F4BA02', '#9B1B34', '#E1E8EB', '#F8F8F8')
names(ws_col) <- c('.darkblue', '.blue', '.green', '.yellow', '.red', '.white', '.timberwolf')
bg_col <- ws_col[7]
l_col <- ws_col[1]


# Schriften

sysfonts::font_add_google(name = "Fascinate Inline", family = "fascinate")
sysfonts::font_add_google(name = "Nosifer", family = "nosifer")
sysfonts::font_add_google(name = "Bungee Shade", family = "bungee")
showtext::showtext_auto()


# Logo ----

## Logo 1 ----

ggplot(hex, aes(x, y)) +
  geom_line(aes(x = Ipx, y = Ipy), data = line_points, size = 3, color = l_col) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 28, pch = 21, col = l_col, fill = ws_col[".timberwolf"], stroke = 4) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 24, color = colorRampPalette(ws_col[3:2])(6)) +
  geom_path(size = 15, color = l_col, lineend = "square") +
  scale_y_continuous(breaks = seq(-2.5, 2.5, by = 1)) +
  geom_path(aes(x,y), data = hex2, size = 80, color = "white", lineend = "square") +
  coord_cartesian(xlim = c(-2.2, 2.2), ylim = c(-2.5, 2.5)) +
  geom_text(x = 0, y = -0.68, label = "WoMepS", size = 32, color = ws_col[5], family = "fascinate") +
  geom_text(x = 0, y = -1.26, label = "Datenvisualisierung in R", size = 12, color = ws_col[5]) +
  geom_text(x = 0.1, y = -2.3, angle = 30, hjust = 0,
            color = l_col, size = 4, label = "nickhaf.github.io/PlotWorkshop/") +
  theme(aspect.ratio = 1.2,
        panel.background = element_rect(fill = bg_col),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(size = 1, colour = ws_col[6]),
        legend.position = "none",
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.margin = margin(0,0,0,0, "cm")
        ) +
  canvas(width = 20, height = 20, units = "cm", dpi = 100)

ggsave('./logo/logo1.png', width = 20, height = 20, units = "cm", dpi = 100)


## Logo 2 ----

ggplot(hex, aes(x, y)) +
  geom_line(aes(x = Ipx, y = Ipy), data = line_points, size = 3, color = l_col) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 28, pch = 21, col = l_col, fill = ws_col[".timberwolf"], stroke = 4) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 24, color = colorRampPalette(ws_col[3:2])(6)) +
  geom_path(size = 15, color = l_col, lineend = "square") +
  scale_y_continuous(breaks = seq(-2.5, 2.5, by = 1)) +
  geom_path(aes(x,y), data = hex2, size = 80, color = "white", lineend = "square") +
  coord_cartesian(xlim = c(-2.2, 2.2), ylim = c(-2.5, 2.5)) +
  geom_text(x = 0, y = -0.68, label = "WoMepS", size = 22, color = ws_col[5], family = "nosifer") +
  geom_text(x = 0, y = -1.2, label = "Datenvisualisierung in R", size = 12, color = ws_col[5]) +
  geom_text(x = 0.1, y = -2.3, angle = 30, hjust = 0,
            color = l_col, size = 4, label = "nickhaf.github.io/PlotWorkshop/") +
  theme(aspect.ratio = 1.2,
        panel.background = element_rect(fill = bg_col),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(size = 1, colour = ws_col[6]),
        legend.position = "none",
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.margin = margin(0,0,0,0, "cm")
  ) +
  canvas(width = 20, height = 20, units = "cm", dpi = 100)

ggsave('./logo/logo2.png', width = 20, height = 20, units = "cm", dpi = 100)


## Logo 3 ----

ggplot(hex, aes(x, y)) +
  geom_line(aes(x = Ipx, y = Ipy), data = line_points, size = 3, color = l_col) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 28, pch = 21, col = l_col, fill = ws_col[".timberwolf"], stroke = 4) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 24, color = colorRampPalette(ws_col[3:2])(6)) +
  geom_path(size = 15, color = l_col, lineend = "square") +
  scale_y_continuous(breaks = seq(-2.5, 2.5, by = 1)) +
  geom_path(aes(x,y), data = hex2, size = 80, color = "white", lineend = "square") +
  coord_cartesian(xlim = c(-2.2, 2.2), ylim = c(-2.5, 2.5)) +
  geom_text(x = 0, y = -0.68, label = "WoMepS", size = 28, color = ws_col[5], family = "bungee") +
  geom_text(x = 0, y = -1.26, label = "Datenvisualisierung in R", size = 12, color = ws_col[5]) +
  geom_text(x = 0.1, y = -2.3, angle = 30, hjust = 0,
            color = l_col, size = 4, label = "nickhaf.github.io/PlotWorkshop/") +
  theme(aspect.ratio = 1.2,
        panel.background = element_rect(fill = bg_col),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(size = 1, colour = ws_col[6]),
        legend.position = "none",
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.margin = margin(0,0,0,0, "cm")
  ) +
  canvas(width = 20, height = 20, units = "cm", dpi = 100)

ggsave('./logo/logo3.png', width = 20, height = 20, units = "cm", dpi = 100)