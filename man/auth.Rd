% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/auth.R
\name{auth}
\alias{auth}
\title{Store the tiny.cc credentials as global variables}
\usage{
auth(tinycc_login, tinycc_api_key)
}
\arguments{
\item{tinycc_login}{character, the login to tiny.cc.}

\item{tinycc_api_key}{character, the API key provided by tiny.cc.}
}
\value{
Nothing. Sets global variables.
}
\description{
\code{\link{auth}} stores the tiny.cc API credentials as global variables. All other functions that need these credentials rely on the global variables.
}
\examples{
# Store the credentials as global variables
auth(tinycc_login = "foo", tinycc_api_key = "bar")

# Just to be sure
Sys.getenv("TINYCC_LOGIN")
Sys.getenv("TINYCC_API_KEY")
}
\author{
Philipp Ottolinger
}
