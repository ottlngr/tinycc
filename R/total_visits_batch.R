#' @title Accepts multiple tiny.cc short urls and returns their total visits
#' @description Accepts array of tiny.cc short urls and returns the total visits for each short url.
#' @details Maximum number of results requested in each call - 30.
#' @param shortURLs vector, the vector of short urls to get visits for.
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

total_visits_batch <- function(shortURLs) {

  request <- httr::modify_url(url = "http://tiny.cc/",
                              query = list(
                                "c" = "rest_api",
                                "m" = "total_visits_batch",
                                "version" = "2.0.3",
                                "format" = "json",
                                "login" = Sys.getenv("TINYCC_LOGIN"),
                                "apiKey" = Sys.getenv("TINYCC_API_KEY")
                              )
  )

  request <- paste(request, paste("&", paste0(paste("shortUrls[]=", shortURLs, sep = ""), collapse = "&"), sep = ""), sep = "")

  result <- httr::GET(request)

  httr::stop_for_status(result)

  content <- jsonlite::fromJSON(httr::content(result, as = "text"))

  return(content)
}
