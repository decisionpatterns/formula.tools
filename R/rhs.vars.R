# -----------------------------------------------------------------------------
# rhs.vars
# -----------------------------------------------------------------------------

setGeneric( 'rhs.vars', function(x, ... ) standardGeneric( 'rhs.vars' ) )

.rhs.vars <- 
  function(x, ..., data=NULL) 
  {
    if( 
        class( x[[1]] )   == 'name' &&
        deparse( x[[1]] ) %in% operators()  
    ) {
  
      term.rhs <- terms( x, data=data, ... ) 
      labels   <- attr( term.rhs, 'term.labels' )
      order    <- attr( term.rhs, 'order' )
      vars.rhs <- labels[ order == 1 ]
  
      vars.rhs
  
    } else {
      warning( "There is no relational operator defined for ", deparse(x)  )
    }
  
  }






setMethod( 'rhs.vars' , 'formula', .rhs.vars )
setMethod( 'rhs.vars' , 'call'   , .rhs.vars )
setMethod( 'rhs.vars' , 'expression', function(x,...) lapply(x, rhs.vars, ...))



