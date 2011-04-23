# -----------------------------------------------------------------------------
# which.class
#   Make assesments about classes for objects.
#
#  TODO: 
#   - alias & for intersect of numerical types. 
#   - vector.tools
# -----------------------------------------------------------------------------
  
## IS ##
setGeneric( 'is.cat', function(x, ...) standardGeneric( 'is.cat' ) )

setMethod( 'is.cat', 'character', function(x) TRUE )
setMethod( 'is.cat', 'factor',    function(x) TRUE )
setMethod( 'is.cat', 'logical',   function(x) TRUE )

setMethod( 'is.cat', 'ANY', function(x) FALSE ) 


# is.cat.default  <- function(x, classes = c( 'character', 'factor', 'logical' ) ) 
#   class( x ) %in% classes       
  
setGeneric( 'is.cont', function(x, ...) standardGeneric( 'is.cont' ) )

setMethod( 'is.cont', 'numeric', function(x) TRUE ) 
setMethod( 'is.cont', 'integer', function(x) TRUE ) 
setMethod( 'is.cont', 'complex', function(x) TRUE ) 
setMethod( 'is.cont', 'Date'   , function(x) TRUE ) 
  
setMethod( 'is.cont', 'factor',  function(x) FALSE )  # REQUIRED
setMethod( 'is.cont', 'ANY', function(x) FALSE ) 

# is.cont.default <- function(x, classes = c( 'numeric', 'integer', 'Date' ) )
#   class( x ) %in% classes 



## WHICH ## 

which.cat  <- function(x, ..., names = FALSE ) 
{ 
  ret <- which( unlist( lapply( x, is.cat, ... ) ) )
  return( if( names ) names(ret) else ret  )
}

# which.cat(iris)
# which.cat(iris,names=T)
    

which.cont  <- function(x, ..., names = FALSE ) 
{ 
  ret <- which( unlist( lapply( x, is.cont, ... ) ) )
  return( if( names ) names(ret) else ret  )
}    

# which.cont(iris)
# which.cont(iris,names=T)
                           


