context("test-auth")

test_that("Credentials are stored in global variables", {
  login <- "foo"
  token <- "bar"
  tinycc::auth(login, token)
  expect_equal(login, Sys.getenv("TINYCC_LOGIN"))
  expect_equal(token, Sys.getenv("TINYCC_API_KEY"))
})
