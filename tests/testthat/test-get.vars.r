library(testthat)
library(formula.tools)
library(magrittr)

context('get.vars')

# NA, NULL, constants, name, symbols, list, formula, call, expression 


# FORMULAS

context( '  one-sided formula') 

  ( ~ NA )    %>%  get.vars %>% expect_error 
  ( ~ NULL )  %>%  get.vars %>% expect_equivalent( character(0) ) 
  ( ~ 1 )     %>%  get.vars %>% expect_equivalent( character(0) )
  ( ~ a )     %>%  get.vars %>% expect_equivalent( 'a' ) 
  ( ~ a + a ) %>%  get.vars %>% expect_equivalent( 'a' ) 
  ( ~ a + b ) %>%  get.vars %>% expect_equivalent( c('a','b'))   


context( '  two-sided formula' )   

  ( NA ~ 1  )     %>% get.vars %>% expect_error 
  ( NULL ~ NULL ) %>% get.vars %>% expect_equivalent( character(0) )
  ( 1 ~ 1 )       %>% get.vars %>% expect_equivalent( character(0) )
  ( y ~ 1 )       %>% get.vars %>% expect_equivalent( 'y' )
  ( y ~ y )       %>% get.vars %>% expect_equivalent( 'y' )
  ( y ~ x )       %>% get.vars %>% expect_equivalent( c('y','x') )
  ( y ~ x + 1 )   %>% get.vars %>% expect_equivalent( c('y','x') )
  ( y ~ x + a + 1 )   %>% get.vars %>% expect_equivalent( c('y','x','a') )  


# EXPRESSIONS
  
  
# CALLS
  
  