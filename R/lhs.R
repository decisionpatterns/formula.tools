# -----------------------------------------------------------------------------
# lhs
#   extract and manipulate the left-hand side of R objects.
# -----------------------------------------------------------------------------

 
#' Get/set left- or right- hand side of a formula, call, expression, etc.
#' 

#' @return the left- or right- hand side of \code{x}
#'
#' @examples
#'   #' -tk
#' @name lhs
#' @rdname formula.parts
#' @docType methods
#' @export

setGeneric( 'lhs', function(x, ...) standardGeneric( 'lhs' ) )

# -------------------------------------
# SINGULAR
# -------------------------------------

#' @rdname formula.parts
#' @aliases .lhs.singular
.lhs.singular <- 
  function(x) 
    if( is.two.sided(x) ) x[[2]] else 
      if( is.one.sided(x) ) NULL   else
        warning( "Could not extract lhs of ", x ) 


#' @rdname formula.parts
#' @aliases lhs,
 
#' @rdname formula.parts
#' @aliases lhs,call-method
setMethod( 'lhs', 'call', .lhs.singular ) 

#' @rdname formula.parts
#' @aliases lhs,formula-method
setMethod( 'lhs', 'formula', .lhs.singular )  

# @rdname formula.parts
# @aliases lhs,assignment-method
# @name lhs-assign
setMethod( 'lhs', '<-', function(x) x[[2]] )



# -------------------------------------
# PLURAL
#   Since the 
# -------------------------------------
# setMethod(  'lhs', 'expression', function(x, ... ) lapply( x, lhs, ... ) )

#' @rdname formula.parts
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

#' @rdname formula.parts
#' @aliases lhs,list-method
setMethod(  'lhs', 'list', function(x, ...) lapply( x, lhs, ... ) )



# -----------------------------------------------------------------------------
# REPLACEMENT : lhs<-
# -----------------------------------------------------------------------------
#' @rdname formula.parts
#' @aliases lhs<-
#' @export  
setGeneric( 'lhs<-', function( x, value ) standardGeneric('lhs<-') )


# -------------------------------------
# SINGLULAR: call, formula
# -------------------------------------

#' @rdname formula.parts
#' @aliases .replace.lhs.singular

.replace.lhs.singular <-  function(x,value) {
    x[[2]] <- value 
    x 
}

#' @rdname formula.parts
#' @name lhs<-
#' @aliases lhs<-,call,ANY-method
setReplaceMethod( 'lhs', c('call','ANY'), .replace.lhs.singular )

#' @name lhs<-
#' @rdname formula.parts
#' @aliases lhs<-,formula,ANY-method
setReplaceMethod( 'lhs', c('formula','ANY') , .replace.lhs.singular )




# -------------------------------------
# LIST AND VECTORS: expression, list
# -------------------------------------
# .replace.lhs.plural <- function( x, value ) {
# 
#     if( length(value) == 1 ) {
#       for( i in 1:length(x) ) lhs( x[[i]] ) <- value 
#     } else {  
#       if( length(x) != length(value) ) 
#         stop( "Cannot change the lhs.  Arguments have different lengths" )
# 
#       for( i in 1:length(x) ) lhs(x[[i]] ) <- value[[i]]
#     }
# 
#     x
# }        


#' @rdname formula.parts
#' @aliases .replace.lhs.plural

.replace.lhs.plural <- function( x, value ) { 

  if( length(value) == 1 ) { 
    for( i in 1:length(x) ) lhs( x[[i]] ) <- value 
 
  } else if( length(x) == length(value) ) {
    for( i in 1:length(x) ) lhs( x[[i]] ) <- value[[i]]

  } else { 
    warning( "length of object != length of lhs replacement" )
  }

  x 

}

#' @name lhs<-  
#' @rdname formula.parts 
#' @aliases lhs<-,expression-method
setReplaceMethod( 'lhs', c('expression','ANY') , .replace.lhs.plural )

#' @name lhs<-
#' @rdname formula.parts
#' @aliases lhs<-,list-method 
setReplaceMethod( 'lhs', 'list' , .replace.lhs.plural )
