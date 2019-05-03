Workout03: Binomial Package
===========================

This package "binomial" allows the user to create a binomial
distribution under a constant probability, with a fixed number of
trials. It also allows the user to visualize such distributions through
plotting functions.

Overview
--------

Here is a quick explanation of the functions in this package.

-   bin\_choose() : gives the number of combinations possible when
    choosing k items from n items.
-   bin\_probability() : gives the probability that one gets the given
    number of successes in the given number of trials, assuming a
    costant probability.
-   bin\_distribution() : creates a binomial probability distribution
    with class "bindis"
-   bin\_cumulative() : creates a cumulative probability distribution
    with class "bincum"
-   bin\_variable() : creates a binomial variable of clas "binvar",
    shows the number of trials and probability of success

The following functions compute statistics of measure. What they measure
should be apparent from the name.

-   bin\_mean()
-   bin\_variance()
-   bin\_mode()
-   bin\_skewness()
-   bin\_kurtosis()

Usage
-----

    var1 <- bin_variable(trials = 10, prob = 0.5)
    var1

    ## "Binomial variable" 
    ## 
    ##  Parameters 
    ##  - number of trials: 10 
    ##  - prob of success: 0.5

    summary(var1)

    ## "Summary Binomial" 
    ## 
    ##  Parameters 
    ##  - number of trials: 10 
    ##  - prob of success: 0.5 
    ## 
    ##  Measures 
    ##  - mean    : 5 
    ##  - variance: 2.5 
    ##  - mode    : 5 
    ##  - skewness: 0 
    ##  - kurtosis: -0.2

    var2 <- bin_distribution(trials = 10, prob = 0.5)
    var2

    ##    success  probability
    ## 1        0 0.0009765625
    ## 2        1 0.0097656250
    ## 3        2 0.0439453125
    ## 4        3 0.1171875000
    ## 5        4 0.2050781250
    ## 6        5 0.2460937500
    ## 7        6 0.2050781250
    ## 8        7 0.1171875000
    ## 9        8 0.0439453125
    ## 10       9 0.0097656250
    ## 11      10 0.0009765625

    var3 <- bin_cumulative(trials = 10, prob = 0.5)
    var3

    ##    success  probability   cumulative
    ## 1        0 0.0009765625 0.0009765625
    ## 2        1 0.0097656250 0.0107421875
    ## 3        2 0.0439453125 0.0546875000
    ## 4        3 0.1171875000 0.1718750000
    ## 5        4 0.2050781250 0.3769531250
    ## 6        5 0.2460937500 0.6230468750
    ## 7        6 0.2050781250 0.8281250000
    ## 8        7 0.1171875000 0.9453125000
    ## 9        8 0.0439453125 0.9892578125
    ## 10       9 0.0097656250 0.9990234375
    ## 11      10 0.0009765625 1.0000000000

For a more complete guide to the pacakge, see the vignette,
binomial\_intro.Rmd
