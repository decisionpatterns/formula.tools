\name{as.character.formula}


\alias{as.character.formula}
\alias{as.character}

\title{
  Converts   a formula to character representation 
}

\description{
  Convers a formula to character representaion 

}

\usage{
\method{as.character}{formula}(x, ...)
}
\arguments{
  \item{x}{ A formula object. }
  \item{...}{ further arguments passed to or from other methods.}
}

\details{
  Coerces formula to a character by deparsing.
}

\value{
  A character vector
}

\author{
  Christopher Brown
}



\seealso{
  \code{\link[base]{deparse}} 
}

\examples{
  as.character( y ~ mx + b ) 

## The function is currently defined as
function(x)
  Reduce( paste, deparse(x) )
}

\keyword{ utilities }
\keyword{ manip }
