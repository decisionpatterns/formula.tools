# -----------------------------------------------------------------------------
# lhs.vars
# -----------------------------------------------------------------------------

setGeneric( 'lhs.vars', function(x, ... ) standardGeneric( 'lhs.vars' ) )

.lhs.vars <- function(x, ..., data=NULL) 
{
  if( 
      class( x[[1]] )   == 'name' &&
      deparse( x[[1]] ) %in% operators() 
  ) {
    get.vars( lhs(x), ..., data=data ) 
  } else {
    warning( "There is no relational operator defined for ", deparse(x)  )
  }

}



setMethod( 'lhs.vars' , 'formula', .lhs.vars )
setMethod( 'lhs.vars' , 'call'   , .lhs.vars )
setMethod( 'lhs.vars' , 'expression', function(x,...) lapply(x, .lhs.vars, ...))



