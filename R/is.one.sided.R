# ---------------------------------------------------------------------
# is.one.sided
#  This function identifies unary operators/functions.  
#  - AFAIK, the only unary operators are the one-sided version of '~' 
#    and the logical negation operator '!'
#
# ---------------------------------------------------------------------
.is.one.sided <- function(x) 
    is.name(x[[1]])  && 
    deparse(x[[1]]) %in% c( '~', '!') && 
     length(x) == 2 

setGeneric( 'is.one.sided', function(x, ...) standardGeneric( 'is.one.sided' ) )
setMethod( 'is.one.sided', 'formula', .is.one.sided )
setMethod( 'is.one.sided', 'call', .is.one.sided )

# PLURAL METHODS
.is.one.sided.plural <- function(x,...) sapply(x, is.one.sided) 

setMethod( 'is.one.sided', 'expression', .is.one.sided.plural ) 
setMethod( 'is.one.sided', 'list', .is.one.sided.plural )

# DEFAULT 
setMethod( 'is.one.sided', 'ANY', 
  function(x,...) {
    warning( "'is.one.sided' is not defined for object of class: ", class(x) )
    return(NA)
  }
)


# ---------------------------------------------------------------------
# is.two.sided
# ---------------------------------------------------------------------
.is.two.sided <- function(x) 
  is.name(x[[1]]) &&
  deparse(x[[1]]) %in% operators() &&
  length(x) == 3

setGeneric( 'is.two.sided', function(x,...) standardGeneric( 'is.two.sided' ) )
setMethod( 'is.two.sided', 'formula', .is.two.sided )
setMethod( 'is.two.sided', 'call', .is.two.sided )

# PLURAL
.is.two.sided.plural <- function(x,...) sapply(x, .is.two.sided ) 
setMethod( 'is.two.sided', 'expression', .is.two.sided.plural  )
setMethod( 'is.two.sided', 'list', .is.two.sided.plural )

# DEFAULT
setMethod( 'is.two.sided', 'ANY', 
  function(x) {
    warning( "'is.two.sided' is not defined for object of class: ", class(x) )
    return(NA)
  }
)
      
  


