# -----------------------------------------------------------------------------
# rhs
#   extract and manipulate the right-hand side of R objects
# -----------------------------------------------------------------------------
setGeneric( 'rhs', function(x, ...) standardGeneric( 'rhs' ) )

# -------------------------------------
# SINGULAR
# -------------------------------------
.rhs.singular <- function(x) {

  if( ! is.operator( x[[1]] ) ) stop( x[[1]], " does not appear to be an operator." )
  
  if( is.two.sided(x) ) 
    x[[3]] else 
    if( is.one.sided(x) ) 
      x[[2]]
}   
 
setMethod( 'rhs', 'call', .rhs.singular ) 
setMethod( 'rhs', 'formula', .rhs.singular )


# -------------------------------------
# PLURAL    
# -------------------------------------
# setMethod( 'rhs', 'expression', function(x,...) lapply( x, rhs, ... ) )       
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

setMethod( 'rhs', 'list', function(x,...) lapply( x, rhs, ... ) )
 


# -----------------------------------------------------------------------------
# REPLACEMENT METHOD 
# -----------------------------------------------------------------------------
setGeneric( 'rhs<-', function(this,value) standardGeneric('rhs<-') )

# -------------------------------------
# SINGULAR: call, formula
# -------------------------------------
.replace.rhs.singular <-  function(this,value) {

    this[[3]] <- value 
    this 
}                                                    

setReplaceMethod( 'rhs', 'call' , .replace.rhs.singular )
setReplaceMethod( 'rhs', 'formula' , .replace.rhs.singular )


# -------------------------------------
# PLURAL: LIST AND VECTORS: expression, list
# 
#  Note: 
#   - It is possible to have the rhs contain more than
#     one value, e.g. rhs(e) <- 1:3.  Because of the 
#     ambiguity, we do not do multiple replaces.
# -------------------------------------
# .replace.rhs.plural <- function( this, value ) {
# 
#     if( length(value) == 1 ) {
#       for( i in 1:length(this) ) rhs( this[[i]] ) <- value 
# 
#     } else {  
# 
#       if( length(this) != length(value) ) 
#         stop( "Cannot change the rhs. Arguments have different lengths." )
# 
#       for( i in 1:length(this) ) rhs( this[[i]] ) <- value[[i]]
# 
#     }
# 
#     this
# }        

.replace.rhs.plural <- function( this, value ) {

  if( length(value) == 1 ) { 
    for( i in 1:length(this) ) rhs( this[[i]] ) <- value 
 
  } else if( length(this) == length(value) ) {
    for( i in 1:length(this) ) rhs( this[[i]] ) <- value[[i]]

  } else { 
    warning( "length of object != length of rhs replacement" )
  }

  this     

}


setReplaceMethod( 'rhs', 'expression' , .replace.rhs.plural )
setReplaceMethod( 'rhs', 'list' , .replace.rhs.plural )

