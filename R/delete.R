#' @title Delete a tiny.cc url
#' @description Delete a tiny.cc short URL once created using the same tiny.cc API credentials.
#' @param shortURL character, the short URL to be deleted. Can be a full tiny.cc short URL (like \code{http://tiny.cc/foobar}) or just the hash (like \code{foobar}).
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

delete <- function(shortURL) {

  request <- httr::modify_url(url = "http://tiny.cc/",
                              query = list(
                                "c" = "rest_api",
                                "m" = "delete",
                                "version" = "2.0.3",
                                "format" = "json",
                                "hash" = gsub("http://tiny.cc/", "", shortURL),
                                "login" = Sys.getenv("TINYCC_LOGIN"),
                                "apiKey" = Sys.getenv("TINYCC_API_KEY")
                              )
  )

  result <- httr::GET(request)

  httr::stop_for_status(result)

  content <- jsonlite::fromJSON(httr::content(result, as = "text"))

  return(content)
}
