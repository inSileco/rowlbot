context("Basic unit tests")
rq1 <- "owl"
res1 <- rowlbot(rq1)

test_that("Check one known entry", {
  expect_equal(class(res1), "rob_def")
  expect_equal(res1$definitions[[1L]]$type, "noun")
  expect_equal(res1$word, rq1)
  expect_equal(res1$pronunciation, "oul")
})
  