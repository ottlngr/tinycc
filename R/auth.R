#' Sore tiny.cc credentials as global variables
#'
#' @export auth
auth <- function(tinycc_login, tinycc_api_key) {
  Sys.setenv("TINYCC_LOGIN" = tinycc_login)
  Sys.setenv("TINYCC_API_KEY" = tinycc_api_key)
}
