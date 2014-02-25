\docType{methods}
\name{lhs}
\alias{.lhs.singular}
\alias{.replace.lhs.plural}
\alias{.replace.lhs.singular}
\alias{lhs}
\alias{lhs,}
\alias{lhs,<--method}
\alias{lhs,call-method}
\alias{lhs,expression-method}
\alias{lhs,formula-method}
\alias{lhs,list-method}
\alias{lhs<-}
\alias{lhs<-,call,ANY-method}
\alias{lhs<-,expression-method}
\alias{lhs<-,formula,ANY-method}
\alias{lhs<-,list-method}
\title{Get/set left- or right- hand side of a formula, call, expression, etc.}
\usage{
lhs(x, ...)

.lhs.singular(x)

\S4method{lhs}{call}(x)

\S4method{lhs}{formula}(x)

\S4method{lhs}{<-}(x)

\S4method{lhs}{expression}(x, ...)

\S4method{lhs}{list}(x, ...)

lhs(x) <- value

.replace.lhs.singular(x, value)

.replace.lhs.plural(x, value)
}
\value{
the left- or right- hand side of \code{x}
}
\description{
Get/set left- or right- hand side of a formula, call,
expression, etc.
}
\examples{
#' -tk
}

