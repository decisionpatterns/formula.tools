#' @name formula.tools-package
#'
#' @aliases formula.tools-package, formula.tools
#' @rdname formula.tools-package
#' 
#' @docType package
#' 
#' @title Tools for working with formulas, expressions, calls and other R 
#' objects
#'
#' @description
#' This packages provides a number of useful utilities for working with 
#' formulas, expressions, calls, names/symbols and other R objects. These 
#' utilities can be used for symbolic manupulation of these objects. 
#'
#' @author Christopher Brown
#'
#' @examples
#'   e <- expression( A > 5, B == 10, C + D >= E )
#'   get.vars(e)
#'   lhs(e)
#'   rhs(e)
#'   op(e) 
  
NULL
