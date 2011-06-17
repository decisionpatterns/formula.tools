# -----------------------------------------------------------------------------
# METHOD: get.vars
#
#   Retrieves the variable names from various types of R objects such as calls, 
#   expressions, names and formulas.
#   
#   This method is similar to all.vars except it will expand '.' and other
#   special characters in model formula
#   
#   Returns the variables in order of appearance
# -----------------------------------------------------------------------------

setGeneric( 
  'get.vars', function(x, data=NULL, ...) standardGeneric( 'get.vars' ) 
)


# ---------------------------------------------------------------------
# SIGNATURE: formula
#   For this to work correctly we need to treat the lhs and rhs distinctly
#   and merge the results.
#
#   Some edge cases may not work.
#  
# ---------------------------------------------------------------------
setMethod( 'get.vars', c( 'formula', 'ANY' ) ,
  # get.vars.form <- 
  function(x, data=NULL, ... ) {
    
    vars.lhs <- get.vars( lhs(x), data=data, ... )

    term.rhs <- terms.formula( x, data=data, ... )
    labels   <- attr( term.rhs, 'term.labels' )
    order    <- attr( term.rhs, 'order' )
    vars.rhs <- labels[ order == 1 ]

    unique( c(vars.lhs, vars.rhs)  )
    
  }
)


# ---------------------------------------------------------------------
# SIGNATURE: call
# ---------------------------------------------------------------------
setMethod( 'get.vars', c( 'call', 'ANY' ), 
  #  get.vars.call <- function(x,data,...) {
  function( x, data=NULL, ... ) {

    term <- terms( x, data=data, ... )
    return(term)
  
  }
)


# ---------------------------------------------------------------------
#  SIGNATURE: expression, missing
# ---------------------------------------------------------------------
setMethod( 'get.vars', c( 'expression', 'missing' ) ,
  function( x, ... ) all.vars( x, ... ) 
)


# ---------------------------------------------------------------------
# SIGNATURE: name
#   Simply returns itself
# ---------------------------------------------------------------------
setMethod( 'get.vars', c( 'name', 'ANY' ) ,
  function( x, data, ... ) as.character(x) 
)



# ---------------------------------------------------------------------
# ANY
# ---------------------------------------------------------------------
setMethod( 'get.vars', c( 'ANY', 'ANY' ), 
  function( x, data, ... ) NULL
)


