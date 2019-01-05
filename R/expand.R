#' @title Accepts a tiny.cc short url and returns the long url
#' @description tbd.
#' @details tbd.
#' @param shortURL character, the tiny.cc short URL to expand.
#' @return A list, representing the response from the tiny.cc API.
#' @author Philipp Ottolinger
#' @seealso \code{<https://tiny.cc/api-docs>}
#' @importFrom httr modify_url
#' @importFrom httr GET
#' @importFrom httr stop_for_status
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @examples
#'
#' @export

expand <- function(shortURL) {

  request <- httr::modify_url(url = "http://tiny.cc/",
                              query = list(
                                "c" = "rest_api",
                                "m" = "expand",
                                "version" = "2.0.3",
                                "format" = "json",
                                "shortUrl" = shortURL,
                                "login" = Sys.getenv("TINYCC_LOGIN"),
                                "apiKey" = Sys.getenv("TINYCC_API_KEY")
                              )
  )

  result <- httr::GET(request)

  httr::stop_for_status(result)

  content <- jsonlite::fromJSON(httr::content(result, as = "text"))

  return(content)

}
