###Private Checker Functions

##checks if prob is between 0 and 1
check_prob <- function(prob) {
  if (prob <= 1 & prob >= 0) {
    return(TRUE)
  }
  else {
    stop('invalid prob value')
  }
}
##checks if trials is a non negative integer
check_trials <- function(trials) {
  if (trials > 0 & trials%%1 == 0) {
    return(TRUE)
  }
  else {
    stop('invalid trials value')
  }
}
##checks if success a vector of non negative integers less than or equal to trials
check_success <- function(success, trials) {
  if (sum(success%%1) != 0) {
    stop('invalid success value')
  }
  if (FALSE %in% (success <= trials)) {
    stop('success cannot be greater than trials')
  }
  else {
    return(TRUE)
  }
}

###Private Auxiliary Functions

##computes mean
aux_mean <- function(trials, prob) {return(trials*prob)}

##computes variance
aux_variance <- function(trials, prob) {
  return(trials * prob * (1-prob))
}
##computes mode
aux_mode <- function(trials, prob) {
  temp_mode = (trials * prob) + prob
  if (temp_mode%%1 == 0) {
    return(c(temp_mode, temp_mode - 1))
  }
  else {
    return(floor(temp_mode))
  }
}
##computes skewness
aux_skewness <- function(trials, prob) {
  return((1 - 2*prob) / sqrt(trials * prob * (1-prob)))
}
##computes kurtosis
aux_kurtosis <- function(trials, prob) {
  return((1 - 6 * prob *(1 - prob)) / (trials * prob * (1-prob)))
}
