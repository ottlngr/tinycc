
<!-- README.md is generated from README.Rmd. Please edit that file -->
tinycc
======

[![Travis-CI Build Status](https://travis-ci.org/ottlngr/tinycc.svg?branch=master)](https://travis-ci.org/ottlngr/tinycc)

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

# shorten https://ropensci.org/blog/2018/05/10/onboarding-social-weather/ to http:/tiny.cc/ros002

shorten(longURL = "https://ropensci.org/blog/2018/05/10/onboarding-social-weather/", shortURL = "ros002")
#> No encoding supplied: defaulting to UTF-8.
#> $errorCode
#> [1] 1215
#> 
#> $errorMessage
#> [1] "Short URL is not correct or existed."
#> 
#> $results
#> [1] ""
#> 
#> $statusCode
#> [1] "ERROR"
```
