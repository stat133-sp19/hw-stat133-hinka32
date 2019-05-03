##' @title binomial choose
##' @description computes the number of combinations in which k successes can occur in n trials
##' @param n number of trials (numeric)
##' @param k number of succeses (numeric)
##' @return computed number of combinations
##' @examples
##' bin_choose(5, 2)
##' bin_choose(5, 1:3)
##' @export
bin_choose <- function(n, k) {
  if (sum(k > n) != 0) {
    stop('k cannot be greater than n')
  }
  else {
    return(factorial(n) / (factorial(k) * factorial(n-k)))
  }
}

##' @title binomial probability
##' @description computes probability of getting successes in trials
##' @param success number of successes (numeric)
##' @param trials number of trials (numeric)
##' @param prob probabililty of success (numeric)
##' @return computed probability
##' @examples
##' bin_probability(2, 5, 0.5)
##' bin_probability(0:2, 5, 0.5)
##' @export
bin_probability <- function(success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  return(bin_choose(trials, success) * (prob^success) * (1-prob)^(trials-success))
}


##' @title binomial distribution
##' @description computes the binomial distribution for the given number of trials and probability
##' @param trials number of trials (numeric)
##' @param prob probabililty of success (numeric)
##' @return data frame with number of successes and respective probabilities (class bindis)
##' @examples
##' bin_distribution(5, 0.5)
##' @export
bin_distribution <- function(trials, prob) {
  success = 0:trials
  probability = bin_probability(success, trials, prob)
  distribution <-  data.frame(success = success, probability = probability)
  class(distribution) <- c('bindis', 'data.frame')
  return(distribution)
}

##' @export
plot.bindis <- function(bindis) {
  barplot(bindis$probability, names.arg = bindis$success, xlab ='successes', ylab = 'probability')
}

##' @title binomial cumulative distribution
##' @description computes the binomial cumulative distribution for the given number of trials and probability
##' @param trials number of trials (numeric)
##' @param prob probabililty of success (numeric)
##' @return data frame with number of successes, respective probabilities, and cumulative probabilities (class bincum)
##' @examples
##' bin_cumulative(5, 0.5)
##' @export
bin_cumulative <- function(trials, prob) {
  distribution <- bin_distribution(trials, prob)
  distribution$cumulative <- c(distribution$probability[1], 1:trials)
  for (i in 1:trials) {
    distribution$cumulative[i+1] <- distribution$probability[i+1] + distribution$cumulative[i]
  }
  class(distribution) <- c('bincum', 'data.frame')
  return(distribution)
}

##' @export
plot.bincum <- function(bincum) {
  plot(bincum$success, bincum$cumulative, xlab ='successes', ylab = 'probability')
  lines(bincum$success, bincum$cumulative)
}

##' @title binomial variable
##' @description prints parameters of the binomial variable
##' @param trials number of trials (numeric)
##' @param prob probabililty of success (numeric)
##' @return list with trials and prob
##' @examples
##' bin_variable(10, 0.3)
##' @export
bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  var_list <- list(trials = trials, prob = prob)
  class(var_list) <- 'binvar'
  return(var_list)
}

##' @export
print.binvar <- function(binvar) {
  cat('"Binomial variable"', "\n\n", "Parameters", "\n",
      paste("- number of trials:", binvar[[1]]), "\n",
      paste("- prob of success:", binvar[[2]]))
}

##' @export
summary.binvar <- function(binvar) {
  trials <- binvar[[1]]
  prob <- binvar[[2]]
  mean <- aux_mean(trials, prob)
  variance <- aux_variance(trials, prob)
  mode <- aux_mode(trials, prob)
  skewness <- aux_skewness(trials, prob)
  kurtosis <- aux_kurtosis(trials, prob)
  summary_list <- list(trials = trials,
                       prob = prob,
                       mean = mean,
                       variance = variance,
                       mode = mode,
                       skewness = skewness,
                       kurtosis = kurtosis)
  class(summary_list) <- "summary.binvar"
  return(summary_list)
}

##' @export
print.summary.binvar <- function(summary.binvar) {
  cat('"Summary Binomial"', "\n\n",
      "Parameters", "\n",
      "- number of trials:", summary.binvar[[1]], "\n",
      "- prob of success:", summary.binvar[[2]], "\n\n",
      "Measures", "\n",
      "- mean    :", summary.binvar[[3]], "\n",
      "- variance:", summary.binvar[[4]], "\n",
      "- mode    :", summary.binvar[[5]], "\n",
      "- skewness:", summary.binvar[[6]], "\n",
      "- kurtosis:", summary.binvar[[7]])
}
