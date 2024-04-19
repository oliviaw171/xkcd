#' @title Retrieve metadata about an xkcd comic
#'
#' @description
#' Given an xkcd comic number, this function retrieves a JSON object descriving
#' that comic from the official xkcd API
#'
#' @importFrom jsonlite read_json
#'
#' @param number A scalar numeric vector identifying an xkcd comic number
#'
#' @return A list of class xkcd with the following elements
#' * month: A scalar character vector identifying the month of the year the comic was published
#' * num: A scalar numeric vector identifying the comic by number
#' * link: A scalar character vector which links to relevant context, source of information
#' * year
#' * safe_title
#' * transcript
#' * alt
#' * img
#' * day
#'
#' Note that many of these elements may hold missing data
#'
#' @examples
#' first_comic <- xkcd(1)
#' print(first_comic)
#'
#' @export
#'
#'
xkcd <- function(number) {
  url <- file.path("https://xkcd.com", number, "info.0.json")
  results <- jsonlite::read_json(url)
#  x <- new_xkcd(results)
#  x <- validate_xkcd(x)
  return(results)
}

# new_xkcd <-


#' @title Visualize xkcd comics
#'
#' @description
#' Given an [`xkcd`] object, this [`base::plot`] method retrieves the image file
#' associated with this comic from the xkcd website and displays it in the
#' currently active graphic device
#'
#' @importFrom httr GET
#' @importFrom png readPNG
#' @importFrom png readJPEG
#' @importFrom grid grid.raster
#'
#' @param x an xkcd object
#' @param ... currently ignored
#'
#' @examples
#' first_comic <- xkcd(1)
#' plot(first_comic)
#'
#'
#' @exportS3Method
plot.xkcd <- function(x, ...) {

  img_type <- tools::file_ext(x$img)

  tmp <- httr::GET(url = x$img)

  if (img_type == "png") {
    p <- png::readPNG(tmp$content)
  } else if (img_type == "jpg" || img_type == "jpeg") {


  }

}
