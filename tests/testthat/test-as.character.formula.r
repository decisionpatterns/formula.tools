library(testthat)
library(formula.tools)
library(magrittr)

context( "as.character.formula")

test_that( "as.character.formula", {
  as.character( y ~ mx +  b ) %>% expect_identical( "y ~ mx + b" )
})