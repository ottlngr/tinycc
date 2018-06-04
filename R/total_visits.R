#' Get total visits for a tiny.cc short URL
#'
#' @export total_visits
#' @importFrom httr modify_url
#' @importFrom httr GET
#' @importFrom httr stop_for_status
#' @importFrom httr content
#' @importFrom jsonlite fromJSON

total_visits <- function(shortURL) {

  request <- httr::modify_url(url = "http://tiny.cc/",
                              query = list(
                                "c" = "rest_api",
                                "m" = "total_visits",
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
