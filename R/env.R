#' Get the environment
#' 
#' @param x object to get environoment from 
#' 
#' @details 
#' S3 returns the environment associated with an object. 
#' 
#' @return 
#' Environment
#' 
#' @export 

env <- function(x) UseMethod('env')


#' @details 
#' 
#' For a formula object, `env` returns the environment in the `.Environment` 
#' attribute. 
#' 
#' @examples 
#' 
#' env( lhs ~ rhs ) 
#' 
#' @rdname env
#' @export

env.formula <- function(x) 
  attr( x, ".Environment")
