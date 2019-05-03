context("checkers")

test_that("check_prob works with probability between 0 and 1, fails otherwise", {
  expect_true(check_prob(0.5))
  expect_true(check_prob(0))
  expect_error(check_prob(-5))
  expect_error(check_prob(10))
  expect_error(check_prob('a'))
})

test_that("check_trials works for non negative integers, fails otherwise", {
  expect_true(check_trials(5))
  expect_true(check_trials(100))
  expect_error(check_trials(-1))
  expect_error(check_trials(0.5))
  expect_error(check_trials('a'))
})

test_that("check_success works if success is less than trials, fails otherwise", {
  expect_true(check_success(1, 5))
  expect_true(check_success(1:4, 5))
  expect_error(check_success(6, 4))
  expect_error(check_success(1:8, 6))
  expect_error(check_success('a', 5))
})
