\name{which.class}
\Rdversion{1.1}


\alias{is.cat}
\alias{is.cat-methods}
\alias{is.cat,ANY-method}
\alias{is.cat,character-method}
\alias{is.cat,factor-method}
\alias{is.cat,logical-method}

\alias{is.cont}
\alias{is.cont-methods}
\alias{is.cont,ANY-method}
\alias{is.cont,complex-method}
\alias{is.cont,Date-method}
\alias{is.cont,factor-method}
\alias{is.cont,integer-method}
\alias{is.cont,numeric-method}

\alias{which.cat}
\alias{which.cont}

\title{
  Identify variables by there variable type: categorical or continuous
}

\description{
   These functions are used to identify variables types whether they are
   categorical or contibuus.
}

\usage{
    is.cat(x, ...)
    is.cont(x, ...)

    which.cat(x, ..., names = FALSE )
    which.cont(x, ..., names = FALSE )
}

\arguments{
  \item{x}{ an object such as a vector or data.frame }

  \item{names}{ logical.  Whether to return names or indices }

  \item{...}{ Arguments passed to other functions }
}

\details{
   These functions are used to identify which/if a variable or variables 
   are categorical or continuos. 

   \code{is.cat} and \code{is.cont} take single variable arguments.

   \code{which.cat} and \code{which.cont} take a list or data.frame or any
   structures whose elements have a class method.  

}

\value{
   For \code{is.cat} and \code{cont} a logical vector.

   For \code{which.cat} and \code{which.cont} a vector of indices or a vector
   of names.

}

\author{
  Christopher Brown
}

\seealso{
  \code{\link{which}}, \code{\link{is}} 
}

\examples{
  
  is.cat( factor( "a", "b", "c" ) )
  is.cat( c( "A", "B", "C" ) )
  is.cat( c( TRUE, TRUE, FALSE ) )

  is.cont( 1:10 )
  is.cont( seq( 0, 1, .1 ) )

  data(iris)
  which.cat( iris )
  which.cat( iris, names = TRUE )

  which.cont( iris )
  which.cont( iris, names = TRUE )

}

\keyword{symbolmath}
\keyword{manip}

