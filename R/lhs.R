# -----------------------------------------------------------------------------
# lhs
#   extract and manipulate the left-hand side of R objects.
# -----------------------------------------------------------------------------
setGeneric( 'lhs', function(x, ...) standardGeneric( 'lhs' ) )

# -------------------------------------
# SINGULAR
# -------------------------------------
.lhs.singular <- 
  function(x) 
    if( is.two.sided(x) ) x[[2]] else 
      if( is.one.sided(x) ) NULL   else
        warning( "Could not extract lhs of ", x ) 


setMethod( 'lhs', 'call', .lhs.singular ) 
setMethod( 'lhs', 'formula', .lhs.singular )  
setMethod( 'lhs', '<-', function(x) x[[2]] )



# -------------------------------------
# PLURAL
#   Since the 
# -------------------------------------
# setMethod(  'lhs', 'expression', function(x, ... ) lapply( x, lhs, ... ) )
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

setMethod(  'lhs', 'list', function(x, ...) lapply( x, lhs, ... ) )



# -----------------------------------------------------------------------------
# REPLACEMENT : lhs<-
# -----------------------------------------------------------------------------
setGeneric( 'lhs<-', function(this,value) standardGeneric('lhs<-') )


# -------------------------------------
# SINGLULAR: call, formula
# -------------------------------------
.replace.lhs.singular <-  function(this,value) {
    this[[2]] <- value 
    this 
}

setReplaceMethod( 'lhs', 'call' , .replace.lhs.singular )
setReplaceMethod( 'lhs', 'formula' , .replace.lhs.singular )


# -------------------------------------
# LIST AND VECTORS: expression, list
# -------------------------------------
# .replace.lhs.plural <- function( this, value ) {
# 
#     if( length(value) == 1 ) {
#       for( i in 1:length(this) ) lhs( this[[i]] ) <- value 
#     } else {  
#       if( length(this) != length(value) ) 
#         stop( "Cannot change the lhs.  Arguments have different lengths" )
# 
#       for( i in 1:length(this) ) lhs(this[[i]] ) <- value[[i]]
#     }
# 
#     this
# }        

.replace.lhs.plural <- function( this, value ) { 

  if( length(value) == 1 ) { 
    for( i in 1:length(this) ) lhs( this[[i]] ) <- value 
 
  } else if( length(this) == length(value) ) {
    for( i in 1:length(this) ) lhs( this[[i]] ) <- value[[i]]

  } else { 
    warning( "length of object != length of lhs replacement" )
  }

  this 

}

  

setReplaceMethod( 'lhs', 'expression' , .replace.lhs.plural )
setReplaceMethod( 'lhs', 'list' , .replace.lhs.plural )


