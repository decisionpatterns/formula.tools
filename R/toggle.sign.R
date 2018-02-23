#' toggle the sign of an expression 
#' 
#' @param x expression 
#' 
#' @details 
#' 
#' `toggle.sign` changes the sign of an expression for `+` tp `-` and 
#' visa-versa.
#' 
#' @examples 
#' 
#'   toggle.sign(1:3)
#'   toggle.sign( quote(a) )
#'   toggle.sign( quote(-a) )
#'   
#'   exp <- expression( a, -b, -(a-b) )
#'   toggle.sign(exp)
#'   
#' @export   

toggle.sign <- function(x) UseMethod('toggle.sign')
       
#' @export                  
toggle.sign.default <- function(x) -x                                               


#' @export 
`toggle.sign.(` <- function(x) 
    toggle.sign( x[[2]] )
  


#' @export     
toggle.sign.call <- function(x) {
  elem.deparsed <- deparse(x)
  if( substr(elem.deparsed, 1,1 ) == "-" ) 
      substr( elem.deparsed, 1,1) <- " " else 
      elem.deparsed <- paste0( "-", elem.deparsed )
      
  parse( text=elem.deparsed )[[1]]
}

#' @export     
toggle.sign.name <- function(x) {
  elem.deparsed <- deparse(x)
  if( substr(elem.deparsed, 1,1 ) == "-" ) 
      substr( elem.deparsed, 1,1) <- " " else 
      elem.deparsed <- paste0( "-", elem.deparsed )
      
  parse( text=elem.deparsed )[[1]]
}



#' @export   
toggle.sign.expression <- function(x) { 

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
