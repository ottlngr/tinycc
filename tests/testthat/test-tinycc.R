context("test-tinycc")

login <- "tinycc-r-package"
token <- "c28670f3-a359-4a10-9b2f-6588ec52b901"

tinycc::auth(login, token)

test_that("Credentials are stored in global variables", {
  expect_equal(login, Sys.getenv("TINYCC_LOGIN"))
  expect_equal(token, Sys.getenv("TINYCC_API_KEY"))
})

hash <- paste0(sample(c(LETTERS, letters, 0:9), 18, TRUE), collapse = "")
longURL <- "https://www.r-project.org/"

s <- tinycc::shorten(longURL, hash)

test_that("longURL is shortened to shortURL", {
  expect_is(s, "list")
  expect_equal(s$results$hash, hash)
  expect_true(!is.null(s$results$short_url))
})

e <- tinycc::expand(s$results$short_url)

test_that("shortURL can be expanded to longURL", {
  expect_is(e, "list")
  expect_equal(e$results$longUrl, longURL)
})

v <- tinycc::total_visits(s$results$short_url)

test_that("Get total visits for shortURL", {
  expect_is(v, "list")
  expect_is(v$results$clicks, "integer")
})

d <- tinycc::delete(s$results$short_url)

test_that("Delete shortURL", {
  expect_is(d, "list")
  expect_equal(d$results$success, "true")
})
