#' toggle the sign of an expression 
#' 
#' @param x expression 
#' 
#' @details 
#' 
#' `toggle_sign` changes the sign of an expression for `+` tp `-` and 
#' visa-versa.
#' 
#' @examples 
#' 
#'   toggle_sign(1:3)
#'   toggle_sign( quote(a) )
#'   toggle_sign( quote(-a) )
#'   
#'   exp <- expression( a, -b, -(a-b) )
#'   toggle_sign(exp)
#'   
#' @export   


toggle_sign <- function(x) UseMethod("toggle_sign")
       
#' @export                  
toggle_sign.default <- function(x) -x                                               


#' @export 
`toggle_sign.(` <- function(x) 
    toggle_sign( x[[2]] )
  


#' @export     
toggle_sign.call <- function(x) {
  elem.deparsed <- deparse(x)
  if( substr(elem.deparsed, 1,1 ) == "-" ) 
      substr( elem.deparsed, 1,1) <- " " else 
      elem.deparsed <- paste0( "-", elem.deparsed )
      
  parse( text=elem.deparsed )[[1]]
}

#' @export     
toggle_sign.name <- function(x) {
  elem.deparsed <- deparse(x)
  if( substr(elem.deparsed, 1,1 ) == "-" ) 
      substr( elem.deparsed, 1,1) <- " " else 
      elem.deparsed <- paste0( "-", elem.deparsed )
      
  parse( text=elem.deparsed )[[1]]
}



#' @export   
toggle_sign.expression <- function(x) { 

  for( i in 1:length(x) )  {
    
    elem.deparsed <- deparse( x[[i]] ) 
  
    # Alrea
    if( substr(elem.deparsed, 1,1 ) == "-" ) 
      substr( elem.deparsed, 1,1) <- " " else 
      elem.deparsed <- paste0( "-", elem.deparsed )
    
    x[[i]] <- parse( text=elem.deparsed )[[1]]
      
  }
    
 x  
 
}

toggle.sign <- function(x) { 
  .Deprecated('toggle_sign', 'formula.tools'
    , "`toggle.sign()` is deprecated. Use `toggle_sign()` instead."
  )
 
  toggle_sign(x) 
}
 