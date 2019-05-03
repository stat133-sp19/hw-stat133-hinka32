context("summary measures")

test_that("aux_mean calculates mean properly", {
  expect_equal(aux_mean(10, 0.5), 5)
  expect_equal(aux_mean(5, 0.7), 3.5)
  expect_equal(aux_mean(10, 0.25), 2.5)
})

test_that("aux_variance calcualtes mean properly", {
  expect_equal(aux_variance(10, 0.5), 2.5)
  expect_equal(aux_variance(5, 0.7), 1.05)
  expect_equal(aux_variance(10, 0.25), 1.875)
})

test_that("aux_mode calculates mode properly", {
  expect_equal(aux_mode(10, 0.5), 5)
  expect_equal(aux_mode(5, 0.7), 4)
  expect_equal(aux_mode(10, 0.25), 2)
})

test_that("aux_skewness calculates skewness properly", {
  expect_is(aux_skewness(5, 0.4), 'numeric')
  expect_equal(aux_skewness(10, 0.5), 0)
  expect_equal(aux_skewness(5, 0.7), (1 - 2*0.7) / sqrt(5 * 0.7 * (1-0.7)))
})

test_that("aux_kurtosis calculates kurtosis properly", {
  expect_is(aux_skewness(5, 0.4), 'numeric')
  expect_equal(aux_kurtosis(10, 0.5), -0.2)
  expect_equal(aux_kurtosis(5, 0.7), (1 - 6 * 0.7 *(1 - 0.7)) / (5 * 0.7 * (1-0.7)))
})
