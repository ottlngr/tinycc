#' @title Accepts a long url and returns a tiny.cc short url
#' @description Use this function to shorten an arbitrary URL to a tiny.cc short URL. The received short URL will be of the kind \code{http://tiny.cc/[YOUR_HASH]}.
#' @details \code{\link{auth}} must be used preliminary to store your tiny.cc credentials.
#' @param longURL character, the URL to be shortened
#' @param shortURL character, the desired short URL. If NULL, tiny.cc will create a hash. Default: NULL.
#' @return A list, representing the response from the tiny.cc API.
#' @author Philipp Ottolinger
#' @seealso \code{<https://tiny.cc/api-docs>}
#' @importFrom httr modify_url
#' @importFrom httr GET
#' @importFrom httr stop_for_status
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @importFrom utils URLencode
#' @examples
#'
#' @export

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
