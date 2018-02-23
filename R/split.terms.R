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
#' Unlike the [terms()] function, `split_terms` does not use [stats::terms()]
#' and instead just splits `x` into an **expression vector** of terms. (Terms 
#' are the mathematical notion of terms). The signs of the terms are preserved.
#'    
#' If `recursive` is `TRUE`, splitting occurs recursively, i.e. parsing of the 
#' input descends into parenthetical expressions `(...)`.  
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
#'  * [terms()]
#'  
#' @examples 
#'   
#'   split_terms(1)                   # 1
#'   split_terms( quote(a) )          # a     
#'   split_terms( quote(-a) )         # -a   
#'   split_terms( quote(a+1) )        # a, 1
#'   split_terms( quote(1+a) )        # 1, a
#'   split_terms( quote(-1+a) )       # -1, a
#'   split_terms( quote(-1-a) )
#'   
#'   split_terms( quote(a+b+c) )      # a,b,c
#'   split_terms( quote((a+b)+1) )    # (a+b),1
#'   split_terms( quote((a+b)+1), recursive=TRUE )    # a,b,1
#'   split_terms( quote((a-b)+1), recursive=TRUE )    # a,-b,1
#'   split_terms( quote(-a) )         # -a
#'   
#'   split_terms( quote(a-1) )        # a, -1
#'   split_terms( quote(-a-1))        # -a, -1
#'   split_terms( quote( -(a+1) ) )   # -(a+1)
#'   split_terms( quote( -(a+1) ), recursive=TRUE )  # -a,-1
#'   
#'   split_terms( quote( ---a ))
#'   split_terms( quote( -(a+(b-(c+d)))), recursive=TRUE )
#'   
#' @export   

split_terms <- function(x, recursive=FALSE) UseMethod("split_terms")

#' @export   
split_terms.default <- function(x, recursive=FALSE) return( as.expression(x) )

#' @export   
split_terms.name <- function(x, recursive=FALSE) return( as.expression(x) )

#' @export   
`split_terms.(` <- function(x, recursive=FALSE ) { 

  if(recursive) 
    ret <- split_terms( x[[2]], recursive ) else 
    ret <- as.expression(x)
    
  ret
}

split_terms.call <- function(x, recursive=FALSE) {
  
  # Needed for length-1 expression
  if( length(x)==1 ) return(as.expression(x))

  if( ! as.character(op(x)) %in% c('+','-','(') ) return(as.expression(x))  

  if( length(x)==2 & as.character(x[[1]]) %in% c('+','-') ) { 
    e <- split_terms( x[[2]], recursive = recursive )
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
      
      e <- split_terms( x[[i]][[2]], recursive = recursive )
      if( x[[1]] == '-' ) e <- toggle.sign(e)
      expr <- append( expr,  e ) 

    } else { 
      e <- x[[i]] 
      if( i==3 && op(x) == '-' ) e <- toggle.sign(e)
      if( recursive==TRUE || x[[i]] != '(')  e <- split_terms(e, recursive = recursive) 
      expr <- append( expr, e )
    }

  }
  expr
  
}
