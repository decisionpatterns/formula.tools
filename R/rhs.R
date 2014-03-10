# -----------------------------------------------------------------------------
# rhs
#   extract and manipulate the right-hand side of R objects
# -----------------------------------------------------------------------------

#' @name rhs
#' @rdname formula.parts 
#' @export 
setGeneric( 'rhs', function(x, ...) standardGeneric( 'rhs' ) )

# -------------------------------------
# SINGULAR
# -------------------------------------

#' @rdname formula.parts
.rhs.singular <- function(x) {

  if( ! is.operator( x[[1]] ) ) stop( x[[1]], " does not appear to be an operator." )
  
  if( is.two.sided(x) ) 
    x[[3]] else 
    if( is.one.sided(x) ) 
      x[[2]]
}   
 
#' @rdname formula.parts
#' @aliases rhs,call-methods
setMethod( 'rhs', 'call', .rhs.singular ) 

#' @rdname formula.parts
#' @aliases rhs,formula-method
setMethod( 'rhs', 'formula', .rhs.singular )


#' @rdname formula.parts
#' @aliases rhs,set-method
setMethod( 'rhs', '<-', function(x) x[[3]] )

# #' @rdname formula.parts
# #' @aliases rhs,ANY-method
# setMethod( 'rhs', 'ANY', .rhs.singular )



# -------------------------------------
# PLURAL    
# -------------------------------------
# setMethod( 'rhs', 'expression', function(x,...) lapply( x, rhs, ... ) )       

#' @rdname formula.parts
#' @aliases rhs,expresion-method

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

#' @rdname formula.parts
#' @aliases rhs,list-method

setMethod( 'rhs', 'list', function(x,...) lapply( x, rhs, ... ) )
 


# -----------------------------------------------------------------------------
# REPLACEMENT METHOD 
# -----------------------------------------------------------------------------


#' @name rhs<-
#' @aliases rhs<-
#' @rdname formula.parts
#' @export
setGeneric( 'rhs<-', function(x,value) standardGeneric('rhs<-') )

# -------------------------------------
# SINGULAR: call, formula
# -------------------------------------

#' @rdname formula.parts
#' @aliases .replace.rhs.singular
.replace.rhs.singular <-  function( x, value ) {
    x[[3]] <- value 
    x 
}                                                    

#' @rdname formula.parts
#' @name rhs<- 
#' @aliases rhs<-,call-method
setReplaceMethod( 'rhs', 'call' , .replace.rhs.singular )

#' @rdname formula.parts
#' @name rhs<- 
#' @aliases rhs<-,formula-method
setReplaceMethod( 'rhs', 'formula' , .replace.rhs.singular )



# -------------------------------------
# PLURAL: LIST AND VECTORS: expression, list
# 
#  Note: 
#   - It is possible to have the rhs contain more than
#     one value, e.g. rhs(e) <- 1:3.  Because of the 
#     ambiguity, we do not do multiple replaces.
# -------------------------------------
# .replace.rhs.plural <- function( x, value ) {
# 
#     if( length(value) == 1 ) {
#       for( i in 1:length(x) ) rhs( x[[i]] ) <- value 
# 
#     } else {  
# 
#       if( length(x) != length(value) ) 
#         stop( "Cannot change the rhs. Arguments have different lengths." )
# 
#       for( i in 1:length(x) ) rhs( x[[i]] ) <- value[[i]]
# 
#     }
# 
#     x
# }        

#' @rdname formula.parts
#' @aliases .replace.ths.plural
.replace.rhs.plural <- function( x, value ) {

  if( length(value) == 1 ) { 
    for( i in 1:length(x) ) rhs( x[[i]] ) <- value 
 
  } else if( length(x) == length(value) ) {
    for( i in 1:length(x) ) rhs( x[[i]] ) <- value[[i]]

  } else { 
    warning( "length of object != length of rhs replacement" )
  }

  x     

}

#' @name rhs<-
#' @rdname formula.parts
#' @aliases rhs<-,expression-method
setReplaceMethod( 'rhs', 'expression' , .replace.rhs.plural )

#' @name rhs<-
#' @rdname formula.parts
#' @aliases rhs<-,list-method
setReplaceMethod( 'rhs', 'list' , .replace.rhs.plural )

