Writing Functions
================
ak5357
2024-11-12

Load key packages.

``` r
knitr::opts_chunk$set(
  echo = TRUE,
  warning = FALSE,
  fig.width = 6,
  fig.asp = .6,
  out.width = "90%"
)

theme_set(
  theme_minimal()+
  theme(legend.position = "bottom")  
)

options(
  ggplot2.continuous.colour = "viridis",
  ggplot2.continuous.fill = "viridis"
)

scale_colour_discrete = scale_colour_viridis_d
scale_fill_discrete = scale_fill_viridis_d
```

## Writing my first function!!

As an example, here’s a z-score computation.

``` r
x_vec = rnorm(n = 25, mean = 10, sd = 3.5)

# z-score computation
(x_vec - mean(x_vec)) / sd(x_vec)
```

    ##  [1] -1.403001030 -0.957250662 -0.056962882 -0.818150329  0.432701044
    ##  [6] -1.215878822 -0.784486732 -0.460423167  0.521726705  0.970765591
    ## [11] -1.991588749 -0.496032348 -0.680038403  1.756444632  0.742689931
    ## [16]  0.961387199 -0.007501406 -0.439767403 -0.009434565  1.660866305
    ## [21]  0.741278188  0.893527507 -0.677539647 -0.309500971  1.626170017

Now I’ll write a function to do this.

``` r
# Define the function
z_scores = function(x){
  z = (x - mean(x)) / sd(x)
  return(z)
}
```

``` r
# Call the function
z_scores(x = x_vec)
```

    ##  [1] -1.403001030 -0.957250662 -0.056962882 -0.818150329  0.432701044
    ##  [6] -1.215878822 -0.784486732 -0.460423167  0.521726705  0.970765591
    ## [11] -1.991588749 -0.496032348 -0.680038403  1.756444632  0.742689931
    ## [16]  0.961387199 -0.007501406 -0.439767403 -0.009434565  1.660866305
    ## [21]  0.741278188  0.893527507 -0.677539647 -0.309500971  1.626170017

Does this always work?

``` r
# Cases where it doesn't work
z_scores(x = 3)
```

    ## [1] NA

``` r
z_scores(x = c("my", "name", "is", "arghya"))
```

    ## Error in x - mean(x): non-numeric argument to binary operator

``` r
# Add checks into the function
z_scores = function(x){
  # Conditional execution --> check whether it'll break the function
  if(!is.numeric(x)){
    stop("x needs to be numeric")
  } else if (length(x) < 5){
    stop("you need at least 5 numbers to compute the z-score")
  }
  
  # Create and return output
  z = (x - mean(x)) / sd(x)
  return(z)
}
```

Check again.

``` r
# Cases where it doesn't work
z_scores(x = 3)
```

    ## Error in z_scores(x = 3): you need at least 5 numbers to compute the z-score

``` r
z_scores(x = c("my", "name", "is", "arghya"))
```

    ## Error in z_scores(x = c("my", "name", "is", "arghya")): x needs to be numeric

## A new function!

``` r
mean_and_sd = function(x){
  mean_x = mean(x)
  sd_x = sd(x)
  
  out_df = 
    tibble(
      mean = mean_x,
      sd = sd_x
    )
  
  return(out_df)
}
```

``` r
mean_and_sd(x_vec)
```

    ## # A tibble: 1 × 2
    ##    mean    sd
    ##   <dbl> <dbl>
    ## 1  10.4  3.58
