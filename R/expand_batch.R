#' @title Accepts multiple tiny.cc short urls and returns the long urls
#' @description Accepts array of tiny.cc short urls and returns the array of pairs of long url and short url.
#' @details Maximum number of results requested in each call - 30.
#' @param shortURLs vector, the vector of short urls to expand.
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

expand_batch <- function(shortURLs) {

  request <- httr::modify_url(url = "http://tiny.cc/",
                              query = list(
                                "c" = "rest_api",
                                "m" = "expand_batch",
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
