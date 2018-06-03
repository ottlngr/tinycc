
<!-- README.md is generated from README.Rmd. Please edit that file -->
tinycc
======

The goal of tinycc is to ... use the `tinycc` API.

<https://tiny.cc/api-docs>

What is ...
-----------

### ... done

-   `shorten()`
-   `expand()`
-   `delete()`
-   `total_visits()`
-   `get_requests_count()`

### ... to do

-   `expand_batch()`
-   `total_visits_batch()`
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

# shorten https://ropensci.org/blog/2018/05/10/onboarding-social-weather/ to http:/tiny.cc/ros002

shorten(longURL = "https://ropensci.org/blog/2018/05/10/onboarding-social-weather/", shortURL = "ros002")
#> No encoding supplied: defaulting to UTF-8.
#> $errorCode
#> [1] "0"
#> 
#> $errorMessage
#> [1] ""
#> 
#> $results
#> $results$short_url
#> [1] "http://tiny.cc/ros002"
#> 
#> $results$userHash
#> [1] "ros002"
#> 
#> $results$hash
#> [1] "ros002"
#> 
#> 
#> $statusCode
#> [1] "OK"
```
