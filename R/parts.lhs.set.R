# -----------------------------------------------------------------------------
# REPLACEMENT : lhs<-
# -----------------------------------------------------------------------------

#' @rdname formula.parts
#' @name lhs<-
#' @export lhs<-
#' @include parts.lhs.get.R

setGeneric( 'lhs<-', function( x, value ) standardGeneric('lhs<-') )


# -------------------------------------
# SINGLULAR: call, formula
# -------------------------------------

# @rdname formula.parts
# @aliases .replace.lhs.singular

.replace.lhs.singular <-  function( x, value ) {

  if( is.two.sided(x) ) {
    x[[2]] <- value 
  } else {  
    x[[3]] <- x[[2]]
    x[[2]] <- value
  } 
  
  x 
}


#' @rdname formula.parts
#' @name lhs<-
#' @aliases lhs<-,call-method

setReplaceMethod( 'lhs', 'call', .replace.lhs.singular )


#' @name lhs<-
#' @rdname formula.parts
#' @aliases lhs<-,formula-method

setReplaceMethod( 'lhs', 'formula' , .replace.lhs.singular )


# **Note:** 
# This is not a replacement method, but rather a method that dispatches on the 
# non-standard class '<-'. roxygen2 produces the following documentation:
#
#      @usage \S4method{lhs}{`<-`}(x). 
#
# But this fails for the non-standard class `<-`, so documentation is omitted.
#
#
#' @rdname formula.parts
#' @aliases `lhs<-`,<--method
setReplaceMethod( 'lhs', '<-', .replace.lhs.singular )


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

