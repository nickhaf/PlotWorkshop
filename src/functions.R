gray_hex <- function(hex) {
  rgb <- col2rgb(hex) / 255
  lum <- 0.2126 * rgb[1, ] + 0.7152 * rgb[2, ] + 0.0722 * rgb[3, ]
  gray <- rgb(lum, lum, lum)
  return(gray)
}

get_gapminder <- function(repo = "https://github.com/open-numbers/ddf--gapminder--fasttrack",
                          keywords = "co2") {
  ## Get json
  ## Filter paths there
  ## use them for download directly
  
  path_json <- "/refs/heads/master/datapackage.json"
  raw_url <- gsub("github.com", "raw.githubusercontent.com", "https://raw.githubusercontent.com/open-numbers/ddf--gapminder--fasttrack")
  download.file(url = paste0(raw_url, path_json), destfile = "datapackage.json")
  
  json_data <- jsonlite::fromJSON("datapackage.json")
  
  csv_paths <- json_data$resources$path
  matched_paths <- csv_paths[str_detect(csv_paths, str_c(keywords, collapse = "|"))]
  
  if (length(matched_paths) == 0) {
    stop("No files matched the specified keywords.")
  }
  
  matched_paths_url <- paste0(raw_url, "/refs/heads/master/", matched_paths)
  
  merged_df <- read.csv(matched_paths_url[1])
  
  # Loop through and merge the rest
  if (length(matched_paths) > 1) {
    for (i in 2:length(matched_paths)) {
      message("Reading file: ", matched_paths_url[i])
      temp_df <- read_csv(matched_paths_url[i])
      
      merged_df <- full_join(merged_df, temp_df)
      rm(temp_df)
      gc()
    }
  }
  
  if (file.exists("datapackage.json")) {
    file.remove("datapackage.json")
  }
  
  return(merged_df)
}
