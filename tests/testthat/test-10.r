# test-10 
# 
# Test for issue 10

# library(testthat)
# library(formula.tools)
# library(magrittr)


context( 'issue-10' )

data(trees)



# FORMULA

test_that( "issue_10" , {
  
  ans <- c('Girth', 'Volume')
  
  f <- Girth ~ Volume 
  get.vars( f, trees ) %>% expect_identical( ans )
  lhs.vars( f, trees ) %>% expect_identical( ans[[1]] )
  rhs.vars( f, trees ) %>% expect_identical( ans[[2]] )
  
  f <- log(Girth) ~ Volume
  get.vars( f, trees ) %>% expect_identical( ans )
  lhs.vars( f, trees ) %>% expect_identical( ans[[1]] )
  rhs.vars( f, trees ) %>% expect_identical( ans[[2]] )
  
} )



