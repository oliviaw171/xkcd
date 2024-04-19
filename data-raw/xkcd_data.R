## code to prepare `xkcd_data` dataset goes here

for (i in 1:10) {
  url <- file.path("https://xkcd.com", i, "info.0.json")
  json_objects[[1]] <- jsonlite::read_json(url)
  Sys.sleep(1)
}

xkcd <- do.call(rbind, json_objects)
xkcd_data <- as.data.frame(xkcd)

usethis::use_data(xkcd_data, overwrite = TRUE)

