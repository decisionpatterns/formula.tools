# -----------------------------------------------------------------------------
# FUNCTION : terms.call 
#   a terms method for call and expression objects.
# -----------------------------------------------------------------------------

terms.call <- function( x , ...  ) 
{

  if( deparse( x[[1]] ) %in% c( operators() ) ) 
  { 
    all.vars(x) 
  } else {  
    form <- formula( paste( '~', as.expression( x ) ) )
    terms( form, ... )
  }

}
   
terms.expression <- function(x,...) lapply(x, terms, ... )  
