# ---------------------------------------------------------------------
# is.two.sided
# ---------------------------------------------------------------------

# Internal function (non-exported)

.is.two.sided <- function(x, ...) 
  is.name(x[[1]]) &&
  deparse(x[[1]]) %in% operators() &&
  length(x) == 3


#' @rdname is.one.sided
# @aliases is.two.sided, is.two.sided-methods
#' @export 
setGeneric( 'is.two.sided', function(x,...) standardGeneric( 'is.two.sided' ) )


# @rdname is.one.sided 
#' @export 

is.double.sided <- is.two.sided 

# @rdname is.one.sided 
#' @export 

is.binary <- is.two.sided



#' @rdname is.one.sided
# @aliases is.two.sided,formula-method

setMethod( 'is.two.sided', 'formula', .is.two.sided )

#' @rdname is.one.sided
# @aliases is.two.sided,call-method
setMethod( 'is.two.sided', 'call', .is.two.sided )

# Note: This is not a replacement method, but rather a method that
# dispatches on the non-standard class '<-'
# @usage \S4method{lhs}{`<-`}(x). 
# This appears to fail CRAN checks an is therefore not documented
#
#' @rdname is.one.sided
#' @aliases is.two.sided,<--method
setMethod( 'is.two.sided', '<-', .is.two.sided )


# PLURAL

# Internal function (non-exported)
.is.two.sided.plural <- function(x,...) sapply(x, .is.two.sided ) 



#' @rdname is.one.sided
# @aliases is.two.sided,expression-method
setMethod( 'is.two.sided', 'expression', .is.two.sided.plural  )

#' @rdname is.one.sided
# @aliases is.two.sided,list-method 
setMethod( 'is.two.sided', 'list', .is.two.sided.plural )

# DEFAULT
#' @rdname is.one.sided
# @aliases is.two.sided,ANY-method
setMethod( 'is.two.sided', 'ANY', 
           function(x, ...) {
             warning( "'is.two.sided' is not defined for object of class: ", class(x) )
             return(NA)
           }
)
