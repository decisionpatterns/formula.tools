#' Split object into terms 
#' 
#' Split formulas, call and expressions into terms.
#' 
#' @param x object to split terms from 
#' @param recursive logical; whether to split terms recursively in parenthetical
#'    enclosed terms  (depth-first).  (Default: FALSE)
#' 
#' @details 
#' 
#' Unlike the [terms()] function, `split.terms` does not use [stats::terms()]
#' and instead just splits `x` into an expression vector of terms.  This can 
#' be optionally performed recursively.
#' 
#' 
#' See **examples**.  
#' 
#' @return 
#'   experession vector of terms 
#' 
#' @references 
#'  * [SO: How to split a formula](https://stackoverflow.com/questions/39155701/how-to-split-a-formula-in-r)
#' 
#' @seealso 
#' @examples 
#'   
#'   split.terms(1)                   # 1
#'   split.terms( quote(a) )          # a     
#'   split.terms( quote(-a) )         # -a   
#'   split.terms( quote(a+1) )        # a, 1
#'   split.terms( quote(1+a) )        # 1, a
#'   split.terms( quote(-1+a) )       # -1, a
#'   split.terms( quote(-1-a) )
#'   
#'   split.terms( quote(a+b+c) )      # a,b,c
#'   split.terms( quote((a+b)+1) )    # (a+b),1
#'   split.terms( quote((a+b)+1), recursive=TRUE )    # a,b,1
#'   split.terms( quote((a-b)+1), recursive=TRUE )    # a,-b,1
#'   split.terms( quote(-a) )         # -a
#'   
#'   split.terms( quote(a-1) )        # a, -1
#'   split.terms( quote(-a-1))        # -a, -1
#'   split.terms( quote( -(a+1) ) )   # -(a+1)
#'   split.terms( quote( -(a+1) ), recursive=TRUE )  # -a,-1
#'   
#'   split.terms( quote( ---a ))
#'   split.terms( quote( -(a+(b-(c+d)))), recursive=TRUE )
#'   
#' @export   

split.terms <- function(x, recursive=FALSE) UseMethod("split.terms")

#' @export   
split.terms.default <- function(x, recursive=FALSE) return( as.expression(x) )

#' @export   
split.terms.name <- function(x, recursive=FALSE) return( as.expression(x) )

#' @export   
`split.terms.(` <- function(x, recursive=FALSE ) { 

  if(recursive) 
    ret <- split.terms( x[[2]], recursive ) else 
    ret <- as.expression(x)
    
  ret
}

split.terms.call <- function(x, recursive=FALSE) {
  
  # Needed for length-1 expression
  if( length(x)==1 ) return(as.expression(x))

  if( ! as.character(op(x)) %in% c('+','-','(') ) return(as.expression(x))  

  if( length(x)==2 & as.character(x[[1]]) %in% c('+','-') ) { 
    e <- split.terms( x[[2]], recursive = recursive )
    if( op(x) == '-' ) e <- toggle.sign(e)
    return(e)
  }  
  

  expr <- expression()
  for( i in 2:length(x) ) {
    
    # Parentheticals must be handled, possibly recursively
    if( recursive==TRUE &&
        length( x[[i]] ) > 1 &&
        x[[i]][[1]] == '('         
    ) {
      
      e <- split.terms( x[[i]][[2]], recursive = recursive )
      if( x[[1]] == '-' ) e <- toggle.sign(e)
      expr <- append( expr,  e ) 

    } else { 
      e <- x[[i]] 
      if( i==3 && op(x) == '-' ) e <- toggle.sign(e)
      if( recursive==TRUE || x[[i]] != '(')  e <- split.terms(e, recursive = recursive) 
      expr <- append( expr, e )
    }

  }
  expr
  
}
