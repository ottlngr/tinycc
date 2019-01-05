
<!-- README.md is generated from README.Rmd. Please edit that file -->
tinycc
======

[![Travis-CI Build Status](https://travis-ci.org/ottlngr/tinycc.svg?branch=master)](https://travis-ci.org/ottlngr/tinycc) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/ottlngr/tinycc?branch=master&svg=true)](https://ci.appveyor.com/project/ottlngr/tinycc) [![Coverage status](https://codecov.io/gh/ottlngr/tinycc/branch/master/graph/badge.svg)](https://codecov.io/github/ottlngr/tinycc?branch=master)

The goal of tinycc is to ... use the `tinycc` API.

<https://tiny.cc/api-docs>

What is ...
-----------

### ... done

-   `shorten()`
-   `expand()`
-   `expand_batch()`
-   `delete()`
-   `total_visits()`
-   `total_visits_batch()`
-   `get_requests_count()`

### ... to do

-   `edit()`

Example
-------

### Sign up and store credentials

``` r

# After creating an account at https://tiny.cc/, you can store your credentials using auth()
library(tinycc)

auth("your_login", "your_api_key")
```

### Use the API

``` r
library(tinycc)

hash <- paste0(sample(c(LETTERS, letters, 0:9), 6, TRUE), collapse = "")
hash
#> [1] "vFY5BJ"

# shorten https://ropensci.org/blog/2018/05/10/onboarding-social-weather/

shorten(longURL = "https://ropensci.org/blog/2018/05/10/onboarding-social-weather/", shortURL = hash)
#> No encoding supplied: defaulting to UTF-8.
#> $errorCode
#> [1] 205
#> 
#> $errorMessage
#> [1] "You tried to login with an invalid username/password."
#> 
#> $results
#> [1] ""
#> 
#> $statusCode
#> [1] "ERROR"
```
