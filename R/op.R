# -----------------------------------------------------------------------------
# op
#   extract and manipulate the operator of a call, expression or rule
#   generics are provided in the expressions package
# -----------------------------------------------------------------------------
setGeneric( 'op', function(x) standardGeneric( 'op' ) )

setMethod( 'op', 'formula', function(x) x[[1]] )
setMethod( 'op', 'call', function(x) x[[1]] )
setMethod( 'op', 'name', function(x) if( as.character(x) %in% operators( "ALL" ) ) return(x) )

setMethod( 'op', 'expression', 
  function(x) {
    ret <- vector( 'expression', length(x) )
    for( i in 1:length(x) ) {
      o <- op( x[[i]] ) 
      if( ! is.null(op) ) ret[[i]] <- o
    }
    ret
  }
)


setMethod( 'op', 'list', function(x) lapply(x,op) )
setMethod( 'op', '<-', function(x) x[[1]] ) 

# -----------------------------------------------------------------------------
# REPLACEMENT : OP<-
# -----------------------------------------------------------------------------
setGeneric( 'op<-', function(this,value) standardGeneric('op<-') )

# -------------------------------------
# SINGLE: call, formula
#  - Note: if value == '~' should we eval this to return a formula?
# -------------------------------------   
setReplaceMethod( 'op', 'call', 
  function( this, value ) {
    this[[1]] <- as.name(value)
    this
  }
)


# EXPERIMENTAL!!!
#   Unsure of the proper behavior. Should changing of the operator for
#   a formula produce an error or should it ERROR.
# ----------------------------------------------------------------------
# METHOD: op<-,formula
#   This is a bit strange since the formula is dependent upon
#   the operator type. So if the operator is changed, we 
#   no longer have a formula, but a call object.  
#   That is, a formula appears to inherit a call.  
# ----------------------------------------------------------------------
setReplaceMethod( 'op', 'formula', 
  function(this,value) {
    new.op <- as.name(value) 

    # THIS CATCHES THAT WE DON"T CHANGE THE TILDE~:
    if ( new.op == op(this) ) return(this)  

    # When we change from a tilde the operator type gets degraded.
    if( as.character(value) %in% operators( "ALL" ) ) {
      c <- quote( x == y )  # generic call object
      lhs(c) <- lhs(this) 
      op(c)  <- new.op
      rhs(c) <- rhs(this) 
    } else {
      stop( value, " was not found as an operator." )
    }

    return(c) 
  }
)
 


# -------------------------------------
# LIST AND VECTORS: expression, list
# -------------------------------------
.replace.op.plural <- function( this, value ) {

  if( length(value) == 1  ) { 
    for( i in 1:length(this) ) op( this[[i]] ) <- as.name(value) 

  } else if( length(this) == length(value) ) {
    for( i in 1:length(this) ) op( this[[i]] ) <- as.name( value[[i]] )

  } else { 
    warning( "length of object != length of op replacement" )

  }
    
  this
  
}


setReplaceMethod( 'op', 'expression' , .replace.op.plural )
setReplaceMethod( 'op', 'list' , .replace.op.plural ) 


