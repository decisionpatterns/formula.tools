context("split_terms")

test_that("split_terms", {
  
  expect_equal( split_terms(1), expression(1) )
  expect_equal( split_terms( quote(a) ), expression(a) )        
  expect_equal( split_terms( quote(-a) ), expression(-a) )
  expect_equal( split_terms( quote(a+1) ), expression(a,1) )
  expect_equal( split_terms( quote(1+a) ), expression(1,a) )

  expect_equal( split_terms( quote(a+b+c) ), expression(a,b,c) ) 
  
  expect_equal( split_terms( quote((a+b)+1) ), expression((a+b),1)  )    
  
  expect_equal( split_terms( quote((a+b)+1) , recursive=TRUE ), expression(a,b,1) )
  expect_equal( split_terms( quote((a-b)+1) , recursive=TRUE ), expression(a,-b,1) )
  expect_equal( split_terms( quote(-a) ), expression(-a) )

  # expect_equal( split_terms( quote(a-1) ), expression(a, -1) )         
  # expect_equal( split_terms( quote(-a-1)), expression(-a,-1) )       
  expect_equal( split_terms( quote( -(a+1)) ), expression( -(a+1) ) )    
  expect_equal( split_terms( quote( -(a+1) ), recursive=TRUE ), expression(-a,-1) )

    expect_equal( split_terms( quote( -(a+(b-(c+d)))), recursive=TRUE ), expression(-a,-b,c,d) )
})
