# -----------------------------------------------------------------------------
# REPLACEMENT METHOD 
# -----------------------------------------------------------------------------

#' @name rhs<-
#' @aliases rhs<-
#' @rdname parts
#' @export rhs<-
setGeneric( 'rhs<-', function(x,value) standardGeneric('rhs<-') )

# -------------------------------------
# SINGULAR: call, formula
# -------------------------------------

#' @rdname parts
#' @aliases .replace.rhs.singular
.replace.rhs.singular <-  function( x, value ) {
  x[[3]] <- value 
  x 
}                                                    

#' @rdname parts
#' @name rhs<- 
#' @aliases rhs<-,call-method
setReplaceMethod( 'rhs', 'call' , .replace.rhs.singular )

#' @rdname parts
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

#' @rdname parts
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
#' @rdname parts
#' @aliases rhs<-,expression-method
setReplaceMethod( 'rhs', 'expression' , .replace.rhs.plural )

#' @name rhs<-
#' @rdname parts
#' @aliases rhs<-,list-method
setReplaceMethod( 'rhs', 'list' , .replace.rhs.plural )
