
<!-- README.md is generated from README.Rmd. Please edit that file -->
tinycc
======

[![Travis-CI Build Status](https://travis-ci.org/ottlngr/tinycc.svg?branch=master)](https://travis-ci.org/ottlngr/tinycc) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/ottlngr/tinycc?branch=master&svg=true)](https://ci.appveyor.com/project/ottlngr/tinycc) [![Coverage status](https://codecov.io/gh/ottlngr/tinycc/branch/master/graph/badge.svg)](https://codecov.io/github/ottlngr/tinycc?branch=master)

Use the tiny.cc API to shorten URLs!

API Key
-------

You will need to use an API Key in order to access the tiny.cc API. You will receive an API Key after signing up at tiny.cc.

Rate Limiting
-------------

> Development requests are limited to 50 per day, and no more than 5 concurrent requests from a single IP address at a time.

API Methods
-----------

-   `shorten`
-   `shorten with custum hash`
-   `expand`
-   `expand_batch`
-   `total_visits`
-   `total_visits_batch`
-   `edit` (not implemented in `tinycc`, yet)
-   `delete`
-   `get_requests_count`

Examples
--------

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
#> [1] "FB4tmS"

# shorten https://ropensci.org/

shorten(longURL = "https://ropensci.org/", shortURL = hash)
#> No encoding supplied: defaulting to UTF-8.
#> $errorCode
#> [1] "0"
#> 
#> $errorMessage
#> [1] ""
#> 
#> $results
#> $results$short_url
#> [1] "http://tiny.cc/FB4tmS"
#> 
#> $results$userHash
#> [1] "FB4tmS"
#> 
#> $results$hash
#> [1] "FB4tmS"
#> 
#> 
#> $statusCode
#> [1] "OK"
```

See also
--------

[https://tiny.cc/api-docs]()
