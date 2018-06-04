
<!-- README.md is generated from README.Rmd. Please edit that file -->
tinycc
======

[![Travis-CI Build Status](https://travis-ci.org/ottlngr/tinycc.svg?branch=master)](https://travis-ci.org/ottlngr/tinycc) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/ottlngr/tinycc?branch=master&svg=true)](https://ci.appveyor.com/project/ottlngr/tinycc)

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
#> [1] "gM8km7"

# shorten https://ropensci.org/blog/2018/05/10/onboarding-social-weather/

shorten(longURL = "https://ropensci.org/blog/2018/05/10/onboarding-social-weather/", shortURL = hash)
#> No encoding supplied: defaulting to UTF-8.
#> $errorCode
#> [1] "0"
#> 
#> $errorMessage
#> [1] ""
#> 
#> $results
#> $results$short_url
#> [1] "http://tiny.cc/gM8km7"
#> 
#> $results$userHash
#> [1] "gM8km7"
#> 
#> $results$hash
#> [1] "gM8km7"
#> 
#> 
#> $statusCode
#> [1] "OK"
```
