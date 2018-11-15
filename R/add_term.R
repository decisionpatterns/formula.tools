#' add_term
#' 
#' Add term to an existing object
#'
#' @param x object to have term appended
#' @param term unquoted term
#' 
#' @details 
#' 
#' Adds a term to a an object.  
#' 
#' When `x` is a formula, the term is added to the RHS of the 
#' formula.
#' 
#' @examples 
#' 
#' x <- call( '+', as.name('x1'), as.name('x2'))
#' 
#' add_term(x, x3)
#' add_term(x, -x3)
#' 
#' add_term(x, 'x3')
#' # add_term(x, "-x3")
#' add_term(x, x3+x4 )
#' add_term( y ~ x1 + x2, x3 )
#' 
#' @export

add_term <- function(x,term) UseMethod('add_term')


add_term.call <- function(x,term) {
  term <- substitute(term)
  # browser()
  if( is_string(term) ) term <- as.name(term)

  # term <- rlang::enquo(term)
  if( is.call(term) && length(term) > 1 && term[[1]] == '-' ) {  
    call( '-', x, term[[2]] ) 
  } else { 
    call( '+', x, term )
  }
  
}
  

add_term.formula <- function(x,term) { 
  term <- as.name(substitute(term))
  rhs(x) <- call('+', rhs(x), term )
  x
}  
