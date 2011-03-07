\name{invert-methods}
\docType{methods}

\alias{invert-methods}
\alias{invert,call-method}
\alias{invert,expression-method}
\alias{invert}

\title{ Invert relative operators }

\description{
 \code{invert} is a S4 generic method for inverting the sense of relational
 operators, i.e. changing '>' to '<=' and '%in%' to '%!in%' etc. 
}

\section{Methods}{
  \describe{

    \item{x = "call"}{ A \code{\link{call}} object. }
    \item{x = "expression"}{ An \code{\link{expression}} object. }

  }
}

\arguments{
  \item{x}{ A object such as an call or expression }
}

\details{
    Does a hash look-up and returns the object with any relational operators
    inverted.  It does not do a depth search.
}

\value{
   The operand is returned with the relational operators inverted.
}

\author{
  Christopher Brown 
}


\seealso{ \code{\link{op}}, \code{\link{op.type}} }

\examples{ 

  invert( quote( A >  5 ) )
  invert( quote( A >= 5 ) )
  invert( quote( A <  5 ) )
  invert( quote( A <= 5 ) )
  invert( quote( A == 5 ) )
  invert( quote( A != 5 ) )

  # invert( expression( A>1, B<2, c %in% letters ) )
}

\keyword{methods}
\keyword{symbolmath}
