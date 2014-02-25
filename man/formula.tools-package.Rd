\docType{package}
\name{formula.tools-package}
\alias{formula.tools}
\alias{formula.tools-package}
\alias{formula.tools-package,}
\title{Tools for working with formulas, expressions, calls and other R
objects}
\description{
This packages provides a number of useful utilities for
working with formulas, expressions, calls, names/symbols
and other R objects. These utilities can be used for
symbolic manupulation of these objects.
}
\examples{
e <- expression( A > 5, B == 10, C + D >= E )
  get.vars(e)
  lhs(e)
  rhs(e)
  op(e)
}
\author{
Christopher Brown
}

