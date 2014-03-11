# -----------------------------------------------------------------------------
# rhs
#   extract and manipulate the right-hand side of R objects
# -----------------------------------------------------------------------------

#' @name rhs
#' @rdname parts 
#' @export rhs
setGeneric( 'rhs', function(x, ...) standardGeneric( 'rhs' ) )

# -------------------------------------
# SINGULAR
# -------------------------------------

#' @rdname parts
.rhs.singular <- function(x) {

  if( ! is.operator( x[[1]] ) ) stop( x[[1]], " does not appear to be an operator." )
  
  if( is.two.sided(x) ) 
    x[[3]] else 
    if( is.one.sided(x) ) 
      x[[2]]
}   
 
#' @rdname parts
#' @aliases rhs,call-methods
setMethod( 'rhs', 'call', .rhs.singular ) 

#' @rdname parts
#' @aliases rhs,formula-method
setMethod( 'rhs', 'formula', .rhs.singular )


#' @rdname parts
#' @aliases rhs,<--method
setMethod( 'rhs', '<-', function(x) x[[3]] )


# -------------------------------------
# PLURAL    
# -------------------------------------

#' @rdname parts
#' @aliases rhs,expression-method
setMethod( 'rhs', 'expression', 
  function(x,...) { 
    ret <- vector( 'expression', length(x) )
    for( i in 1:length(x) ) {
      rh <- rhs( x[[i]] )
      if( ! is.null( rh ) ) ret[[i]] <- rh
    }
    ret
  }
)

#' @rdname parts
#' @aliases rhs,list-method

setMethod( 'rhs', 'list', function(x,...) lapply( x, rhs, ... ) )
 