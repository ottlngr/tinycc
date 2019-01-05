#' @title Store the tiny.cc credentials as global variables
#' @description \code{\link{auth}} stores the tiny.cc API credentials as global variables. All other functions that need these credentials rely on the global variables.
#' @param tinycc_login character, the login to tiny.cc.
#' @param tinycc_api_key character, the API key provided by tiny.cc.
#' @return Nothing. Sets global variables.
#' @author Philipp Ottolinger
#' @examples
#' # Store the credentials as global variables
#' auth(tinycc_login = "foo", tinycc_api_key = "bar")
#'
#' # Just to be sure
#' Sys.getenv("TINYCC_LOGIN")
#' Sys.getenv("TINYCC_API_KEY")
#' @export
auth <- function(tinycc_login, tinycc_api_key) {
  Sys.setenv("TINYCC_LOGIN" = tinycc_login)
  Sys.setenv("TINYCC_API_KEY" = tinycc_api_key)
}
