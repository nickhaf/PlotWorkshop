
theme_bg <- function() {
  theme_classic() +
    theme(
      strip.background = element_rect(fill="#F8F8F8", colour = '#01364C'), 
      panel.background = element_rect(fill = '#F8F8F8', colour = '#F8F8F8'),
          plot.background = element_rect(fill = '#F8F8F8', colour = '#F8F8F8'),
          text = element_text(colour = '#01364C'), 
          axis.line = element_line(colour = '#01364C'), 
          axis.ticks = element_line(colour = '#01364C'), 
          axis.text = element_text(colour = '#01364C'))
}
