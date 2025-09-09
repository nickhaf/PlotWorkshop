
### Hex-Logo for workshop 


# Setup ----

library(ggplot2)
library(sysfonts)
library(showtext)
# install_github("idmn/ggview")
library(ggview)
library(ggimage)


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


# Schriften

sysfonts::font_add_google(name = "Fascinate Inline", family = "fascinate")
sysfonts::font_add_google(name = "Nosifer", family = "nosifer")
sysfonts::font_add_google(name = "Bungee Shade", family = "bungee")
showtext::showtext_auto()


# Logo ----

## Logo 1 ----

### 1a ----

ws_col <- c('#01364C', '#00e0e0', '#abe338', '#F4BA02', '#9B1B34', '#E1E8EB', '#F8F8F8')

p_col  <- colorRampPalette(c('#abe338','#00e0e0'))(6) # point color
l_col  <- '#01364C'  # line color
bg_col <- '#F8F8F8'  # background color
g_col  <- '#E1E8EB'  # grid color
f1_col <- '#9B1B34'  # font color
f2_col <- '#9B1B34'  # font color

ggplot(hex, aes(x, y)) +
  geom_line(aes(x = Ipx, y = Ipy), data = line_points, lwd = 3, color = l_col) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 28, pch = 21, col = l_col, fill = '#F8F8F8', stroke = 4) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 24, color = p_col) +
  geom_path(size = 15, color = l_col, lineend = "square") +
  scale_y_continuous(breaks = seq(-2.5, 2.5, by = 1)) +
  geom_path(aes(x,y), data = hex2, size = 80, color = "white", lineend = "square") +
  coord_cartesian(xlim = c(-2.2, 2.2), ylim = c(-2.5, 2.5)) +
  geom_text(x = 0, y = -0.68, label = "WoMepS", size = 32, color = f1_col, family = "fascinate") +
  geom_text(x = 0, y = -1.25, label = "Datenvisualisierung in R", size = 12, color = f2_col) +
  geom_text(x = -2.05, y = 1.2, angle = 30, hjust = 0,
            color = l_col, size = 4, label = "Nicklas Hafiz & Dr. Janine Buchholz - Mai 2025") +
  geom_text(x = 0.1, y = -2.25, angle = 30, hjust = 0,
            color = l_col, size = 4, label = "nickhaf.github.io/PlotWorkshop/") +
  theme(aspect.ratio = 1.2,
        panel.background = element_rect(fill = bg_col),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(size = 1, colour = g_col),
        legend.position = "none",
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.margin = margin(0,0,0,0, "cm")
  ) +
  canvas(width = 20, height = 20, units = "cm", dpi = 100)

ggsave('./logo/logo1a.png', width = 20, height = 20, units = "cm", dpi = 100)


### 1b ----

p_col  <- colorRampPalette(c('#abe338','#00e0e0'))(6) # point color
l_col  <- '#01364C'  # line color
bg_col <- '#E1E8EB'  # background color
g_col  <- '#F8F8F8'  # grid color
f1_col <- '#9B1B34'  # font color
f2_col <- '#9B1B34'  # font color

ggplot(hex, aes(x, y)) +
  geom_line(aes(x = Ipx, y = Ipy), data = line_points, lwd = 3, color = l_col) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 28, pch = 21, col = l_col, fill = '#F8F8F8', stroke = 4) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 24, color = p_col) +
  geom_path(size = 15, color = l_col, lineend = "square") +
  scale_y_continuous(breaks = seq(-2.5, 2.5, by = 1)) +
  geom_path(aes(x,y), data = hex2, size = 80, color = "white", lineend = "square") +
  coord_cartesian(xlim = c(-2.2, 2.2), ylim = c(-2.5, 2.5)) +
  geom_text(x = 0, y = -0.68, label = "WoMepS", size = 32, color = f1_col, family = "fascinate") +
  geom_text(x = 0, y = -1.25, label = "Datenvisualisierung in R", size = 12, color = f2_col) +
  geom_text(x = -2.05, y = 1.2, angle = 30, hjust = 0,
            color = l_col, size = 4, label = "Nicklas Hafiz & Dr. Janine Buchholz - Mai 2025") +
  geom_text(x = 0.1, y = -2.25, angle = 30, hjust = 0,
            color = l_col, size = 4, label = "nickhaf.github.io/PlotWorkshop/") +
  theme(aspect.ratio = 1.2,
        panel.background = element_rect(fill = bg_col),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(size = 1, colour = g_col),
        legend.position = "none",
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.margin = margin(0,0,0,0, "cm")
  ) +
  canvas(width = 20, height = 20, units = "cm", dpi = 100)

ggsave('./logo/logo1b.png', width = 20, height = 20, units = "cm", dpi = 100)


## Logo 2 ----

ws_col <- c('#01364C', '#00e0e0', '#abe338', '#F4BA02', '#9B1B34', '#E1E8EB', '#F8F8F8')

p_col  <- colorRampPalette(c('#F4BA02','#00e0e0'))(6) # point color
l_col  <- '#9B1B34'  # line color
bg_col <- '#F8F8F8'  # background color
g_col  <- '#E1E8EB'  # grid color
f1_col <- '#9B1B34'  # font color
f2_col <- '#9B1B34'  # font color

### 2a ----

ggplot(hex, aes(x, y)) +
  geom_line(aes(x = Ipx, y = Ipy), data = line_points, lwd = 3, color = l_col) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 28, pch = 21, col = l_col, fill = '#F8F8F8', stroke = 4) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 24, color = p_col) +
  geom_path(size = 15, color = l_col, lineend = "square") +
  scale_y_continuous(breaks = seq(-2.5, 2.5, by = 1)) +
  geom_path(aes(x,y), data = hex2, size = 80, color = "white", lineend = "square") +
  coord_cartesian(xlim = c(-2.2, 2.2), ylim = c(-2.5, 2.5)) +
  geom_text(x = 0, y = -0.65, label = "WoMepS", size = 22, color = f1_col, family = "nosifer") +
  geom_text(x = 0, y = -1.15, label = "Datenvisualisierung in R", size = 12, color = f2_col) +
  geom_text(x = -2.05, y = 1.2, angle = 30, hjust = 0,
            color = l_col, size = 4, label = "Nicklas Hafiz & Dr. Janine Buchholz - Mai 2025") +
  geom_text(x = 0.1, y = -2.25, angle = 30, hjust = 0,
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

ggsave('./logo/logo2a.png', width = 20, height = 20, units = "cm", dpi = 100)


### 2b -----

ggplot(hex, aes(x, y)) +
  geom_line(aes(x = Ipx, y = Ipy), data = line_points, lwd = 3, color = l_col) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 28, pch = 21, col = l_col, fill = '#F8F8F8', stroke = 4) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 24, color = p_col) +
  geom_path(size = 15, color = l_col, lineend = "square") +
  scale_y_continuous(breaks = seq(-2.5, 2.5, by = 1)) +
  geom_path(aes(x,y), data = hex2, size = 80, color = "white", lineend = "square") +
  coord_cartesian(xlim = c(-2.2, 2.2), ylim = c(-2.5, 2.5)) +
  geom_text(x = 0, y = -0.70, label = "WoMepS", size = 45, color = f1_col, family = "nosifer") +
  geom_text(x = 0, y = -1.15, label = "Datenvisualisierung in R", size = 25, color = f2_col) +
  geom_text(x = -2.05, y = 1.2, angle = 30, hjust = 0,
            color = l_col, size = 8, label = "Nicklas Hafiz & Dr. Janine Buchholz - Mai 2025") +
  geom_text(x = 0.1, y = -2.25, angle = 30, hjust = 0,
            color = l_col, size = 8, label = "nickhaf.github.io/PlotWorkshop/") +
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
  geom_point(x = 1.5, y = 0, data = line_points, size = 28, pch = 21, col = l_col, fill = '#F8F8F8', stroke = 4) +
  geom_image(x = 1.5, y = 0, 
             image = "./logo/img/goethe_trans_9B1B34.png", size = .11) +
  canvas(width = 20, height = 20, units = "cm", dpi = 200)

ggsave('./logo/logo2b.png', width = 20, height = 20, units = "cm", dpi = 200)

### 2c ----

p_col  <- colorRampPalette(c('#abe338','#00e0e0'))(6) # point color
l_col  <- '#01364C'  # line color
bg_col <- '#F8F8F8'  # background color
g_col  <- '#E1E8EB'  # grid color
f1_col <- '#9B1B34'  # font color
f2_col <- '#9B1B34'  # font color

ggplot(hex, aes(x, y)) +
  geom_line(aes(x = Ipx, y = Ipy), data = line_points, lwd = 3, color = l_col) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 28, pch = 21, col = l_col, fill = '#F8F8F8', stroke = 4) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 24, color = p_col) +
  geom_path(size = 15, color = l_col, lineend = "square") +
  scale_y_continuous(breaks = seq(-2.5, 2.5, by = 1)) +
  geom_path(aes(x,y), data = hex2, size = 80, color = "white", lineend = "square") +
  coord_cartesian(xlim = c(-2.2, 2.2), ylim = c(-2.5, 2.5)) +
  geom_text(x = 0, y = -0.70, label = "WoMepS", size = 45, color = f1_col, family = "nosifer") +
  geom_text(x = 0, y = -1.15, label = "Datenvisualisierung in R", size = 25, color = f2_col) +
  geom_text(x = -2.05, y = 1.2, angle = 30, hjust = 0,
            color = l_col, size = 8, label = "Nicklas Hafiz & Dr. Janine Buchholz - Mai 2025") +
  geom_text(x = 0.1, y = -2.25, angle = 30, hjust = 0,
            color = l_col, size = 8, label = "nickhaf.github.io/PlotWorkshop/") +
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
  geom_point(x = 1.5, y = 0, data = line_points, size = 28, pch = 21, col = l_col, fill = '#F8F8F8', stroke = 4) +
  geom_image(x = 1.5, y = 0, 
             image = "./logo/img/goethe_trans_9B1B34.png", size = .1) +
  canvas(width = 20, height = 20, units = "cm", dpi = 200)

ggsave('./logo/logo2c.png', width = 20, height = 20, units = "cm", dpi = 200)

## Logo 3 ----

ws_col <- c('#01364C', '#00e0e0', '#abe338', '#F4BA02', '#9B1B34', '#E1E8EB', '#F8F8F8')

p_col  <- colorRampPalette(c('#00e0e0', '#9B1B34'))(6) # point color
l_col  <- '#01364C'  # line color
bg_col <- '#F8F8F8'  # background color
g_col  <- '#E1E8EB'  # grid color
f1_col <- '#01364C'  # font color
f2_col <- '#01364C'  # font color

ggplot(hex, aes(x, y)) +
  geom_line(aes(x = Ipx, y = Ipy), data = line_points, lwd = 3, color = l_col) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 28, pch = 21, col = l_col, fill = '#F8F8F8', stroke = 4) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 24, color = p_col) +
  geom_path(size = 15, color = l_col, lineend = "square") +
  scale_y_continuous(breaks = seq(-2.5, 2.5, by = 1)) +
  geom_path(aes(x,y), data = hex2, size = 80, color = "white", lineend = "square") +
  coord_cartesian(xlim = c(-2.2, 2.2), ylim = c(-2.5, 2.5)) +
  geom_text(x = 0, y = -0.76, label = "WoMepS", size = 50, color = f1_col, family = "bungee") +
  geom_text(x = 0, y = -1.24, label = "Datenvisualisierung in R", size = 23, color = f2_col) +
  geom_text(x = -2.05, y = 1.2, angle = 30, hjust = 0,
            color = l_col, size = 8, label = "Nicklas Hafiz & Dr. Janine Buchholz - Mai 2025") +
  geom_text(x = 0.05, y = -2.3, angle = 30, hjust = 0,
            color = l_col, size = 8, label = "nickhaf.github.io/PlotWorkshop/") +
  theme(aspect.ratio = 1.2,
        panel.background = element_rect(fill = bg_col),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(size = 1, colour = g_col),
        legend.position = "none",
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.margin = margin(0,0,0,0, "cm")
  ) +
  canvas(width = 20, height = 20, units = "cm", dpi = 200)

ggsave('./logo/logo3.png', width = 20, height = 20, units = "cm", dpi = 200)

### 3a ----

ggplot(hex, aes(x, y)) +
  geom_line(aes(x = Ipx, y = Ipy), data = line_points, lwd = 3, color = l_col) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 28, pch = 21, col = l_col, fill = '#F8F8F8', stroke = 4) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 24, color = p_col) +
  geom_path(size = 15, color = l_col, lineend = "square") +
  scale_y_continuous(breaks = seq(-2.5, 2.5, by = 1)) +
  geom_path(aes(x,y), data = hex2, size = 80, color = "white", lineend = "square") +
  coord_cartesian(xlim = c(-2.2, 2.2), ylim = c(-2.5, 2.5)) +
  geom_text(x = 0, y = -0.76, label = "WoMepS", size = 50, color = f1_col, family = "bungee") +
  geom_text(x = 0, y = -1.24, label = "Datenvisualisierung in R", size = 23, color = f2_col) +
  geom_text(x = -2.05, y = 1.2, angle = 30, hjust = 0,
            color = l_col, size = 8, label = "Nicklas Hafiz & Dr. Janine Buchholz - Mai 2025") +
  geom_text(x = 0.05, y = -2.3, angle = 30, hjust = 0,
            color = l_col, size = 8, label = "nickhaf.github.io/PlotWorkshop/") +
  theme(aspect.ratio = 1.2,
        panel.background = element_rect(fill = bg_col),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(size = 1, colour = g_col),
        legend.position = "none",
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.margin = margin(0,0,0,0, "cm")
  ) +
  geom_point(x = 1.5, y = 0, data = line_points, size = 28, pch = 21, col = l_col, fill = '#F8F8F8', stroke = 4) +
  geom_image(x = 1.5, y = 0, 
             image = "./logo/img/goethe_trans_9B1B34.png", size = .09) +
  canvas(width = 20, height = 20, units = "cm", dpi = 200)

ggsave('./logo/logo3a.png', width = 20, height = 20, units = "cm", dpi = 200)

### 3b ----

ggplot(hex, aes(x, y)) +
  geom_line(aes(x = Ipx, y = Ipy), data = line_points, lwd = 3, color = l_col) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 28, pch = 21, col = l_col, fill = '#F8F8F8', stroke = 4) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 24, color = p_col) +
  geom_path(size = 15, color = l_col, lineend = "square") +
  scale_y_continuous(breaks = seq(-2.5, 2.5, by = 1)) +
  geom_path(aes(x,y), data = hex2, size = 80, color = "white", lineend = "square") +
  coord_cartesian(xlim = c(-2.2, 2.2), ylim = c(-2.5, 2.5)) +
  geom_text(x = 0, y = -0.76, label = "WoMepS", size = 50, color = f1_col, family = "bungee") +
  geom_text(x = 0, y = -1.24, label = "Datenvisualisierung in R", size = 23, color = f2_col) +
  geom_text(x = -2.05, y = 1.2, angle = 30, hjust = 0,
            color = l_col, size = 8, label = "Nicklas Hafiz & Dr. Janine Buchholz - Mai 2025") +
  geom_text(x = 0.05, y = -2.3, angle = 30, hjust = 0,
            color = l_col, size = 8, label = "nickhaf.github.io/PlotWorkshop/") +
  theme(aspect.ratio = 1.2,
        panel.background = element_rect(fill = bg_col),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(size = 1, colour = g_col),
        legend.position = "none",
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.margin = margin(0,0,0,0, "cm")
  ) +
  geom_point(x = 1.5, y = 0, data = line_points, size = 28, pch = 21, col = l_col, fill = '#F8F8F8', stroke = 4) +
  geom_image(x = 1.5, y = 0, 
             image = "./logo/img/goethe_trans_01364C.png", size = .11) +
  canvas(width = 20, height = 20, units = "cm", dpi = 200)

ggsave('./logo/logo3b.png', width = 20, height = 20, units = "cm", dpi = 200)

### 3c ----

ggplot(hex, aes(x, y)) +
  geom_line(aes(x = Ipx, y = Ipy), data = line_points, lwd = 3, color = l_col) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 28, pch = 21, col = l_col, fill = '#F8F8F8', stroke = 4) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 24, color = p_col) +
  geom_path(size = 15, color = l_col, lineend = "square") +
  scale_y_continuous(breaks = seq(-2.5, 2.5, by = 1)) +
  geom_path(aes(x,y), data = hex2, size = 80, color = "white", lineend = "square") +
  coord_cartesian(xlim = c(-2.2, 2.2), ylim = c(-2.5, 2.5)) +
  geom_text(x = 0, y = -0.76, label = "WoMepS", size = 50, color = f1_col, family = "bungee") +
  geom_text(x = 0, y = -1.24, label = "Datenvisualisierung in R", size = 23, color = f2_col) +
  geom_text(x = -2.05, y = 1.2, angle = 30, hjust = 0,
            color = l_col, size = 8, label = "Nicklas Hafiz & Dr. Janine Buchholz - Mai 2025") +
  geom_text(x = 0.05, y = -2.3, angle = 30, hjust = 0,
            color = l_col, size = 8, label = "nickhaf.github.io/PlotWorkshop/") +
  theme(aspect.ratio = 1.2,
        panel.background = element_rect(fill = bg_col),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(size = 1, colour = g_col),
        legend.position = "none",
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.margin = margin(0,0,0,0, "cm")
  ) +
  geom_point(x = 1.5, y = 0, data = line_points, size = 28, pch = 21, col = l_col, fill = '#F8F8F8', stroke = 4) +
  geom_image(x = 1.5, y = 0, 
             image = "./logo/img/goethe_trans_01364C.png", size = .1) +
  canvas(width = 20, height = 20, units = "cm", dpi = 200)

ggsave('./logo/logo3c.png', width = 20, height = 20, units = "cm", dpi = 200)

### 3d ----

ggplot(hex, aes(x, y)) +
  geom_line(aes(x = Ipx, y = Ipy), data = line_points, lwd = 3, color = l_col) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 28, pch = 21, col = l_col, fill = '#F8F8F8', stroke = 4) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 24, color = p_col) +
  geom_path(size = 15, color = l_col, lineend = "square") +
  scale_y_continuous(breaks = seq(-2.5, 2.5, by = 1)) +
  geom_path(aes(x,y), data = hex2, size = 80, color = "white", lineend = "square") +
  coord_cartesian(xlim = c(-2.2, 2.2), ylim = c(-2.5, 2.5)) +
  geom_text(x = 0, y = -0.76, label = "WoMepS", size = 50, color = f1_col, family = "bungee") +
  geom_text(x = 0, y = -1.24, label = "Datenvisualisierung in R", size = 23, color = f2_col) +
  geom_text(x = -2.05, y = 1.2, angle = 30, hjust = 0,
            color = l_col, size = 8, label = "Nicklas Hafiz & Dr. Janine Buchholz - Mai 2025") +
  geom_text(x = 0.05, y = -2.3, angle = 30, hjust = 0,
            color = l_col, size = 8, label = "nickhaf.github.io/PlotWorkshop/") +
  theme(aspect.ratio = 1.2,
        panel.background = element_rect(fill = bg_col),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(size = 1, colour = g_col),
        legend.position = "none",
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.margin = margin(0,0,0,0, "cm")
  ) +
  geom_image(x = line_points$Ipx[5], y = line_points$Ipy[5], nudge_y=.025, 
             image = "./logo/img/goethe_trans_7C4256.png", size = .135) +
  canvas(width = 20, height = 20, units = "cm", dpi = 200)

ggsave('./logo/logo3d.png', width = 20, height = 20, units = "cm", dpi = 200)

## Logo 4 ----

ws_col <- c('#01364C', '#00e0e0', '#abe338', '#F4BA02', '#9B1B34', '#E1E8EB', '#F8F8F8')

p_col  <- colorRampPalette(c('#00e0e0', '#01364C'))(6) # point color
l_col  <- '#01364C'  # line color
bg_col <- '#F8F8F8'  # background color
g_col  <- '#E1E8EB'  # grid color
f1_col <- '#9B1B34'  # font color
f2_col <- '#9B1B34'  # font color

ggplot(hex, aes(x, y)) +
  geom_line(aes(x = Ipx, y = Ipy), data = line_points, lwd = 3, color = l_col) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 28, pch = 21, col = l_col, fill = '#F8F8F8', stroke = 4) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 24, color = p_col) +
  geom_path(size = 15, color = l_col, lineend = "square") +
  scale_y_continuous(breaks = seq(-2.5, 2.5, by = 1)) +
  geom_path(aes(x,y), data = hex2, size = 80, color = "white", lineend = "square") +
  coord_cartesian(xlim = c(-2.2, 2.2), ylim = c(-2.5, 2.5)) +
  geom_text(x = 0, y = -0.76, label = "WoMepS", size = 50, color = f1_col, family = "bungee") +
  geom_text(x = 0, y = -1.24, label = "Datenvisualisierung in R", size = 23, color = f2_col) +
  geom_text(x = -2.05, y = 1.2, angle = 30, hjust = 0,
            color = l_col, size = 8, label = "Nicklas Hafiz & Dr. Janine Buchholz - Mai 2025") +
  geom_text(x = 0.05, y = -2.3, angle = 30, hjust = 0,
            color = l_col, size = 8, label = "nickhaf.github.io/PlotWorkshop/") +
  theme(aspect.ratio = 1.2,
        panel.background = element_rect(fill = bg_col),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(size = 1, colour = g_col),
        legend.position = "none",
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.margin = margin(0,0,0,0, "cm")
  ) +
  geom_image(x = line_points$Ipx[5], y = line_points$Ipy[5], nudge_y=.025, 
             image = "./logo/img/goethe_trans_7C4256.png", size = .135) +
  canvas(width = 20, height = 20, units = "cm", dpi = 200)

ggsave('./logo/logo4.png', width = 20, height = 20, units = "cm", dpi = 200)


## Logo 5 ----

ws_col <- c('#01364C', '#00e0e0', '#abe338', '#F4BA02', '#9B1B34', '#E1E8EB', '#F8F8F8')

p_col  <- colorRampPalette(c('#00e0e0', '#01364C'))(6) # point color
l_col  <- '#01364C'  # line color
bg_col <- '#F8F8F8'  # background color
g_col  <- '#E1E8EB'  # grid color
f1_col <- '#9B1B34'  # font color
f2_col <- '#9B1B34'  # font color

ggplot(hex, aes(x, y)) +
  geom_line(aes(x = Ipx, y = Ipy), data = line_points, lwd = 3, color = l_col) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 28, pch = 21, col = l_col, fill = '#F8F8F8', stroke = 4) +
  geom_point(aes(x = Ipx, y = Ipy), data = line_points, size = 24, color = p_col) +
  geom_image(x = line_points$Ipx[5], y = line_points$Ipy[5], 
             image = "./logo/img/goethe_trans_9B1B34.png", size = .1) +
  geom_path(size = 15, color = l_col, lineend = "square") +
  scale_y_continuous(breaks = seq(-2.5, 2.5, by = 1)) +
  geom_path(aes(x,y), data = hex2, size = 80, color = "white", lineend = "square") +
  coord_cartesian(xlim = c(-2.2, 2.2), ylim = c(-2.5, 2.5)) +
  geom_text(x = 0, y = -0.62, label = "WoMepS", size = 55, color = f1_col, family = "bungee") +
  geom_text(x = 0, y = -1.2, label = "Datenvisualisierung in R", size = 25, color = f2_col) +
  geom_text(x = -2.05, y = 1.2, angle = 30, hjust = 0,
            color = l_col, size = 8, label = "Nicklas Hafiz & Dr. Janine Buchholz - Mai 2025") +
  geom_text(x = 0.1, y = -2.25, angle = 30, hjust = 0,
            color = l_col, size = 8, label = "nickhaf.github.io/PlotWorkshop/") +
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
  canvas(width = 20, height = 20, units = "cm", dpi = 200)

ggsave('./logo/logo5.png', width = 20, height = 20, units = "cm", dpi = 200)
