#' @export shorten
#' @importFrom httr modify_url
#' @importFrom httr GET
#' @importFrom httr stop_for_status
#' @importFrom httr content
#' @importFrom jsonlite fromJSON

shorten <- function(longURL, shortURL = NULL) {

  if (is.null(shortURL)) {
    request <- httr::modify_url(url = "http://tiny.cc/",
                                query = list(
                                  "c" = "rest_api",
                                  "m" = "shorten",
                                  "version" = "2.0.3",
                                  "format" = "json",
                                  "longUrl" = URLencode(longURL),
                                  "login" = Sys.getenv("TINYCC_LOGIN"),
                                  "apiKey" = Sys.getenv("TINYCC_API_KEY")
                                )
    )
  } else {
    request <- httr::modify_url(url = "http://tiny.cc/",
                                query = list(
                                  "c" = "rest_api",
                                  "m" = "shorten",
                                  "version" = "2.0.3",
                                  "format" = "json",
                                  "longUrl" = URLencode(longURL),
                                  "shortUrl" = shortURL,
                                  "login" = Sys.getenv("TINYCC_LOGIN"),
                                  "apiKey" = Sys.getenv("TINYCC_API_KEY")
                                )
    )
  }

  result <- httr::GET(request)
  httr::stop_for_status(result)
  content <- jsonlite::fromJSON(httr::content(result, as = "text"))
  return(content)

}
