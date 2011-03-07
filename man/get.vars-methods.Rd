\name{get.vars-methods}
\docType{methods}

\alias{get.vars-methods}
\alias{get.vars,ANY,ANY-method}
\alias{get.vars,call,ANY-method}
\alias{get.vars,expression,missing-method}
\alias{get.vars,formula,ANY-method}
\alias{get.vars,name,ANY-method}
\alias{get.vars}


\title{ Get variable (names) from various R objects }

\description{
  \code{get.vars} extracts variable names from various R objects such as formulas, expressions, calls, symbols, etc.  It is very similar to \code{\link{all.vars}} except that all symbols, etc. are interpolated to the names of variables.  
}

\section{Methods}{
\describe{

\item{x = "call", data = "ANY"}{ from calls }

\item{x = "expression", data = "missing"}{ from expressions }

\item{x = "formula", data = "ANY"}{ from formulas }

\item{x = "name", data = "ANY"}{ from names and symbols }

\item{x = "ANY", data = "ANY"}{ from all other objects, returns NULL. Only the above classes can contain variable names. }

}}



\keyword{methods}
\keyword{symbolmath}
