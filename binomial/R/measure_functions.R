###Functions of measures

#' @title binomial mean
#' @description computes the mean of the binomial variable
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return computed binomial mean
#' @export
#' @examples
#' bin_mean(trials = 10, prob = 0.5)
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_mean(trials, prob)
}

#' @title binomial variance
#' @description computes the variance of the binomial variable
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return computed binomial variance
#' @export
#' @examples
#' bin_variance(trials = 10, prob = 0.5)
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_variance(trials, prob)
}

#' @title binomial mode
#' @description computes the mode of the binomial variable
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return computed binomial mode
#' @export
#' @examples
#' bin_mode(trials = 10, prob = 0.5)
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_mode(trials, prob)
}

#' @title binomial skewness
#' @description computes the skewness of the binomial variable
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return computed binomial skewness
#' @export
#' @examples
#' bin_skewness(trials = 10, prob = 0.5)
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_skewness(trials, prob)
}

#' @title binomial kurtosis
#' @description computes the kurtosis of the binomial variable
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return computed binomial kurtosis
#' @export
#' @examples
#' bin_kurtosis(trials = 10, prob = 0.5)
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_kurtosis(trials, prob)
}
