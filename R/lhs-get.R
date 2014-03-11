# -----------------------------------------------------------------------------
# lhs
#   extract and manipulate the left-hand side of R objects.
# -----------------------------------------------------------------------------

 
# Get/set left- or right- hand side of a formula, call, expression, etc.
# 

# @return the left- or right- hand side of \code{x}
#
# @examples
#   #' -tk
# @name lhs
#' @rdname parts
#' @docType methods
#' @export lhs
#' @include parts.R

setGeneric( 'lhs', function(x, ...) standardGeneric( 'lhs' ) )

# -------------------------------------
# SINGULAR
# -------------------------------------

#' @rdname parts
#' @aliases .lhs.singular

.lhs.singular <- 
  function(x) 
    if( is.two.sided(x) ) x[[2]] else 
      if( is.one.sided(x) ) NULL   else
        warning( "Could not extract lhs of ", x ) 


# @rdname parts
# @aliases lhs
 
#' @rdname parts
#' @aliases lhs,call-method
setMethod( 'lhs', 'call', .lhs.singular ) 


#' @rdname parts
#' @aliases lhs,formula-method
setMethod( 'lhs', 'formula', .lhs.singular )  

# Note: This is not a replacement method, but rather a method that
# dispatches on the non-standard class '<-'
# @usage \S4method{lhs}{`<-`}(x)

#' @rdname parts
#' @aliases lhs,<--method
setMethod( 'lhs', '<-', function(x) x[[2]] )



# -------------------------------------
# PLURAL
#   Since the 
# -------------------------------------
# setMethod(  'lhs', 'expression', function(x, ... ) lapply( x, lhs, ... ) )

#' @rdname parts
#' @aliases lhs,expression-method
setMethod(  'lhs', 'expression', 
  function(x, ... ) {
    ret <- vector( "expression", length(x) )
    for( i in 1:length(x) ) { 
      lh <- lhs( x[[i]] ) 
      if( ! is.null(lh) )  ret[[i]] <- lh   
    } 
    ret
  }
)

#' @rdname parts
#' @aliases lhs,list-method
setMethod(  'lhs', 'list', function(x, ...) lapply( x, lhs, ... ) )
