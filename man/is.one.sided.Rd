\name{is.one.sided-methods}
\docType{methods}

\alias{is.one.sided}
\alias{is.one.sided-methods}
\alias{is.one.sided,formula-method}
\alias{is.one.sided,call-method}
\alias{is.one.sided,ANY-method}
\alias{is.one.sided,expression-method}
\alias{is.one.sided,list-method}

\alias{is.two.sided}
\alias{is.two.sided-methods}
\alias{is.two.sided,ANY-method}
\alias{is.two.sided,call-method}
\alias{is.two.sided,formula-method}
\alias{is.two.sided,expression-method}
\alias{is.two.sided,list-method}


\title{ is.one.sided, is.two.sided }
\description{

 Methods, \code{is.one.sided} and \code{is.two.sided} test for the
 objects "sidedness". "Sideness" describes the number and location of 
 operands in a formula, call, expression.

 Two-sided objects have two arguments seperated by an operator, either
 relational or the tilde, \code{~}. Examples of two-sided objects are:
 
   \code{ 
      y ~ x                       # formula
      quote( x > 5 )              # call
      expression( x > 1 , y > 2 ) # expression (vector)
   }

 Calls, formula and expressions can be two-sided.

 One-side objects lack a left-hand side and are characterised by the 
 tilde operator and a right-hand side.

   \code{ 
      ~ x          # formula
      quote( ~x )  # call containing a formula
      quote( x )    
      quote( x+y )
   }

 Formulas and calls( containing formulas ) can be one-sided.


}


\section{Methods}{

  \describe{
  
    \item{\code{signature(x = "formula")}}{ for folmulas }
    \item{\code{signature(x = "call")}}{ for calls }
    \item{\code{signature(x = "expression")}}{ for expressions }
    \item{\code{signature(x = "lists")}}{ for lists }
    \item{\code{signature(x = "ANY")}}{ 
      for all other objects. Warns and returns NA 
    }
  
  }
}

\usage{

  is.one.sided(x, ... )
  is.two.sided(x, ... )

}      

\arguments{

  \item{x}{ Object to test sided.ness }
  \item{...}{ Arguments passed to \code{sapply} for vector/list methods }

}


\details{ 

  These functions are test the sided-ness of objects logical. 

  \code{ is.one.sided } is defined for \code{formula}, \code{call}, 
  \code{expression} and \code{list} objects. A one-sided \bold{formula} 
  has length 2. 
  
  By default, \bold{call} objects are one-sided. One-sided calls begin 
  with the tilde operator and have length 2. 
  
  For \bold{expresision} and \bold{list} objects. each element
  is tested for its sidedness. A logical vector is returned.

  \code{is.two.sided} is the logical negation of \code{is.one.sided}
  and is defined as \code{ ! is.one.sided(x,...) },

}

\value{ logical. }

\examples{ 

  is.one.sided( ~ x )
  is.one.sided( quote( ~x ) )
  is.one.sided( quote( x+y ) )

  is.one.sided( y ~ x )           # FALSE
  is.one.sided( quote( y == x ) ) # FALSE

  is.one.sided( expression( ~x, x+y ) )   # TRUE, TRUE
  is.one.sided( expression( x~y, y==x ) ) # FALSE, FALSE
  
  is.two.sided( y ~ x ) 
  is.two.sided( quote( y == x ) ) 

}


\keyword{methods}
\keyword{manip}
