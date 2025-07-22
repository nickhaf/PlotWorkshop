theme_bg <- function() {
  theme_minimal() +
    theme(
      strip.background = element_rect(fill = "#F8F8F8", colour = "#01364C"),
      panel.background = element_rect(fill = "#F8F8F8", colour = "#F8F8F8"),
      plot.background = element_rect(fill = "#F8F8F8", colour = "#F8F8F8"),
      text = element_text(colour = "#01364C", size = 14),
      axis.line = element_line(colour = "#01364C"),
      axis.ticks = element_line(colour = "#01364C"),
      axis.text = element_text(colour = "#01364C", size = 14),
      panel.grid.major = element_line(colour = "grey92", size = 0.5),
      panel.grid.minor = element_blank()
    )
}

theme_minimal_bg <- function() {
  theme_minimal() +
    theme(
      strip.background = element_rect(fill = "#F8F8F8", colour = "#01364C"),
      panel.background = element_rect(fill = "#F8F8F8", colour = "#F8F8F8"),
      plot.background = element_rect(fill = "#F8F8F8", colour = "#F8F8F8"),
      legend.background = element_rect(fill="#F8F8F8"), #transparent legend bg
      legend.box.background = element_rect(fill="#F8F8F8"),  #transparent legend panel
      text = element_text(colour = "#01364C", size = 14),
      axis.title = element_blank(),
      axis.text = element_blank(),
      axis.ticks = element_blank(),
      panel.grid = element_blank()
    )
}


theme_colors <- c(
  "#208C7A",   # darkened green (#269b88 darkened by 5%)
  "#F4BA02",  # yellow
  "#9B1B34",  # red
  "#01364C",  # darkblue
  "#472120",  # brown
  "#C97E10",  # warm orange-brown — goes well with yellow and brown
  "#476A92",  # steel blue — distinct from darkblue and cyan
  "#6A9E76",  # muted olive green — distinguishable from teal (#208C7A)
  "#B47EB3",  # muted purple — contrasts nicely with yellow and green
  "#A7A9AC"   # medium cool gray — a stable, neutral tone
)

