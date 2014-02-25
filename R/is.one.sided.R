# ---------------------------------------------------------------------
# is.one.sided
#  This function identifies unary operators/functions.  
#  - AFAIK, the only unary operators are the one-sided version of '~' 
#    and the logical negation operator '!'
#
# ---------------------------------------------------------------------

#' Determine if an object is one- or two- sided.
#'  
#' Test whether a object (typically formula, call or expression) is one-, e.g. 
#' \code{ ~ RHS } or two-sided, e.g. \code{LHS = RHS} 
#'
#' @param x object to test for one-sidedness.  
#' @param ... arguments passed to called functions
#'
#' \code{.is.one.sided} and \code{.is.one.sided.plural} are not exported and 
#' should not be relied upon. This may change in the near future.
#' 
#' @return logical; whether \code{x} is one sided or 
#' @aliases .is.one.sided
#' @rdname is.one.sided 

.is.one.sided <- function(x) 
    is.name(x[[1]])  && 
    deparse(x[[1]]) %in% c( '~', '!') && 
     length(x) == 2 


#' @docType methods 
#' @rdname is.one.sided
#' @export
setGeneric( 'is.one.sided', function(x, ...) standardGeneric( 'is.one.sided' ) )


#' @rdname is.one.sided
#' @aliases is.one.sided,formula-method
setMethod( 'is.one.sided', 'formula', .is.one.sided )

#' @rdname is.one.sided
#' @aliases is.one.sided,formula-method
setMethod( 'is.one.sided', 'call', .is.one.sided )


# PLURAL METHODS
#' @rdname is.one.sided
#' @aliases .is.one.sided.plural
.is.one.sided.plural <- function(x,...) sapply(x, is.one.sided) 

#' @rdname is.one.sided
#' @aliases is.one.sided,expression-method
setMethod( 'is.one.sided', 'expression', .is.one.sided.plural ) 

#' @rdname is.one.sided
#' @aliases is.one.sided,list-method
setMethod( 'is.one.sided', 'list', .is.one.sided.plural )

#' @rdname is.one.sided
#' @aliases is.one.sided,ANY-method
setMethod( 'is.one.sided', 'ANY', 
  function(x,...) {
    warning( "'is.one.sided' is not defined for object of class: ", class(x) )
    return(NA)
  }
)


# ---------------------------------------------------------------------
# is.two.sided
# ---------------------------------------------------------------------

#' @rdname is.one.sided
#' @aliases .is.two.sided 

.is.two.sided <- function(x) 
  is.name(x[[1]]) &&
  deparse(x[[1]]) %in% operators() &&
  length(x) == 3

#' @rdname is.one.sided
#' @aliases is.two.sided, is.two.sided-methods
#' @export 
setGeneric( 'is.two.sided', function(x,...) standardGeneric( 'is.two.sided' ) )

#' @rdname is.one.sided
#' @aliases is.two.sided,formula-method
setMethod( 'is.two.sided', 'formula', .is.two.sided )

#' @rdname is.one.sided
#' @aliases is.two.sided,call-method
setMethod( 'is.two.sided', 'call', .is.two.sided )


# PLURAL
#' @rdname is.one.sided
#' @aliases .is.two.sided.plural
.is.two.sided.plural <- function(x,...) sapply(x, .is.two.sided ) 

#' @rdname is.one.sided
#' @aliases is.one.sided, expression-method
setMethod( 'is.two.sided', 'expression', .is.two.sided.plural  )

#' @rdname is.one.sided
#' @aliases is.two.sided,list-method 
setMethod( 'is.two.sided', 'list', .is.two.sided.plural )

# DEFAULT
#' @rdname is.one.sided
#' @aliases is.two.sided,ANY-method
setMethod( 'is.two.sided', 'ANY', 
  function(x) {
    warning( "'is.two.sided' is not defined for object of class: ", class(x) )
    return(NA)
  }
)
