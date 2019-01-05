#' @title Retrieve your account's remaining request limit - for the day
#' @description tbd.
#' @details tbd.
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

get_requests_count <- function() {

  request <- modify_url(url = "http://tiny.cc/",
                              query = list(
                                "c" = "rest_api",
                                "m" = "get_requests_count",
                                "version" = "2.0.3",
                                "format" = "json",
                                "login" = Sys.getenv("TINYCC_LOGIN"),
                                "apiKey" = Sys.getenv("TINYCC_API_KEY")
                              )
  )

  result <- GET(request)

  stop_for_status(result)

  content <- fromJSON(content(result, as = "text"))

  return(content)
}
