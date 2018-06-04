#' Get total visits for tiny.cc short URLs
#'
#' @export total_visits_batch
#' @importFrom httr modify_url
#' @importFrom httr GET
#' @importFrom httr stop_for_status
#' @importFrom httr content
#' @importFrom jsonlite fromJSON

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
