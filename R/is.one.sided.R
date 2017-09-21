# ---------------------------------------------------------------------
# is.one.sided
#  This function identifies unary operators/functions.  
#  - AFAIK, the only unary operators are the one-sided version of '~' 
#    and the logical negation operator '!'
#
# ---------------------------------------------------------------------

# Internal Function (non-exported)

.is.one.sided <- function(x, ...) 
    is.name(x[[1]])  && 
    deparse(x[[1]]) %in% c( '~', '!') && 
     length(x) == 2 


#' Determine if an object is one- or two-sided.
#'  
#' Test whether a object (typically formula, call or expression) is one- (e.g. 
#' \code{~x}) or two-sided (e.g. \code{x~y}). 
#'
#' @param x object to test for one-sidedness.  
#' @param ... arguments passed to called functions
#'
#' @details 
#' 
#' These functions detect whether the formula is single- (unary) or double-
#' sided. They work on formulas, expression, calls, assignments, etc.
#' 
#' \code{is.single.sided} and \code{is.unary} are alias for 
#' \code{is.single.sided}. \code{is.double.sided} and \code{is.binary} are 
#' aliases for \code{is.two.sided}.
#' 
#' @note 
#' Methods for the "\code{<-}" class exist and are not included in the usage 
#' documentation because CRAN does not support S4 documentation for this class.
#' 
#' @return 
#'   logical; whether \code{x} is an object is one-sided or two-sided formula. 
#'   
#' @examples 
#' 
#' form <- y ~ x 
#' 
#' is.one.sided(form)
#' # is.single.sided(form)
#' # is.unary(form) 
#' 
#' is.two.sided(form)
#' # is.double.sided(form)
#' # is.binary(form)
#'                 
# @docType methods 
#' @rdname is.one.sided
#' @export 

setGeneric( 'is.one.sided', function(x, ...) standardGeneric( 'is.one.sided' ) )


# @rdname is.one.sided
#' @aliases is.single.sided
#' @export 

is.single.sided <- is.one.sided 

# @rdname is.one.sided 
#' @aliases is.unary
#' @export 

is.unary <- is.one.sided


#' @rdname is.one.sided
# @aliases is.one.sided,formula-method
setMethod( 'is.one.sided', 'formula', .is.one.sided )

#' @rdname is.one.sided
# @aliases is.one.sided,call-method
setMethod( 'is.one.sided', 'call', .is.one.sided )


# Note: This is not a replacement method, but rather a method that
# dispatches on the non-standard class '<-'
# @usage \S4method{lhs}{`<-`}(x). 
# This appears to fail CRAN checks an is therefore not documented
#
#' @rdname is.one.sided
#' @aliases is.one.sided,<--method

setMethod( 'is.one.sided', '<-', .is.one.sided )


# RECURSIVE METHODS
# @rdname is.one.sided
# @aliases .is.one.sided.plural

# Internal function (non-exported)
.is.one.sided.plural <- function(x,...) sapply(x, is.one.sided) 

#' @rdname is.one.sided
# @aliases is.one.sided,expression-method
setMethod( 'is.one.sided', 'expression', .is.one.sided.plural ) 

#' @rdname is.one.sided
# @aliases is.one.sided,list-method
setMethod( 'is.one.sided', 'list', .is.one.sided.plural )

#' @rdname is.one.sided
# @aliases is.one.sided,ANY-method

setMethod( 'is.one.sided', 'ANY', 
  function(x, ...) {
    warning( "'is.one.sided' is not defined for object of class: ", class(x) )
    return(NA)
  }
)
