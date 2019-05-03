context("binomial")

test_that("bin_choose works properly with proper input", {
  expect_equal(bin_choose(5,3), 10)
  expect_equal(bin_choose(10, 4), 210)
  expect_is(bin_choose(5, 2), 'numeric')
  expect_error(bin_choose(3, 5))
})

test_that("bin_probability works properly with proper output", {
  expect_equal(bin_probability(1, 1, 0.5), 0.5)
  expect_equal(bin_probability(3, 5, 0.5), 0.3125)
  expect_is(bin_probability(5, 10, 0.3), 'numeric')
  expect_error(bin_choose(10, 6, 0.5))
})

test_that("bin_distribution works properly with proper input", {
  expect_is(bin_distribution(10, 0.5), 'bindis')
  expect_is(bin_distribution(10, 0.5), 'data.frame')
  expect_error(bin_distribution(10, 5))
  expect_equal(bin_distribution(10, 0.5)[3,2], bin_probability(2, 10, 0.5))
})

test_that("bin_cumulative works properly with proper input", {
  expect_is(bin_cumulative(10, 0.5), 'bincum')
  expect_is(bin_cumulative(10, 0.5), 'data.frame')
  expect_error(bin_cumulative(10, 5))
  expect_equal(bin_cumulative(10, 0.5)[3,2], bin_probability(2, 10, 0.5))
})
