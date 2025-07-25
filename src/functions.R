gray_hex <- function(hex) {
  rgb <- col2rgb(hex) / 255
  lum <- 0.2126 * rgb[1, ] + 0.7152 * rgb[2, ] + 0.0722 * rgb[3, ]
  gray <- rgb(lum, lum, lum)
  return(gray)
}
