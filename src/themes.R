
theme_bg <- function() {
  theme_minimal() +
    theme(
      strip.background = element_rect(fill="#F8F8F8", colour = '#01364C'), 
      panel.background = element_rect(fill = '#F8F8F8', colour = '#F8F8F8'),
          plot.background = element_rect(fill = '#F8F8F8', colour = '#F8F8F8'),
          text = element_text(colour = '#01364C', size = 14), 
          axis.line = element_line(colour = '#01364C'), 
          axis.ticks = element_line(colour = '#01364C'), 
          axis.text = element_text(colour = '#01364C', size = 14), 
      panel.grid.major = element_line(colour = "grey92", size = 0.5), 
      panel.grid.minor = element_blank())
}
