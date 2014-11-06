
context( "as.character.formula")

  as.character( y ~ mx +  b ) %>% expect_identical( "y ~ mx + b" )
   