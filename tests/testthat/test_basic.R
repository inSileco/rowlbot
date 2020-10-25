context("Basic unit tests")
library(vcr)

test_that("Check one known entry", {
  vcr::use_cassette(name = "owl", {
    rq1 <- "owl"
    res1 <- rowlbot::rowlbot(rq1)
  })
  
  expect_equal(class(res1), "rob_def")
  expect_equal(res1$definitions[[1L]]$type, "noun")
  expect_equal(res1$word, rq1)
  expect_equal(res1$pronunciation, "oul")
})
