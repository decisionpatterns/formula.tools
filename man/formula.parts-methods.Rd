\name{formula.terms-methods}

\docType{methods}

\alias{lhs-methods}
\alias{lhs,call-method}
\alias{lhs,expression-method}
\alias{lhs,formula-method}
\alias{lhs,list-method}
\alias{lhs,<--method}
\alias{lhs}

\alias{lhs.vars}
\alias{lhs.vars,call-method}
\alias{lhs.vars,expression-method}
\alias{lhs.vars,formula-method}

\alias{lhs<--methods}
\alias{lhs<-,call-method}
\alias{lhs<-,formula-method}
\alias{lhs<-,expression-method}
\alias{lhs<-,list-method}
\alias{lhs<-}


\alias{rhs-methods}
\alias{rhs,call-method}
\alias{rhs,expression-method}
\alias{rhs,formula-method}
\alias{rhs,list-method}     
\alias{rhs,<--method}
\alias{rhs}

\alias{rhs.vars}
\alias{rhs.vars,call-method}
\alias{rhs.vars,expression-method}
\alias{rhs.vars,formula-method}

\alias{rhs<--methods}
\alias{rhs<-,call-method}
\alias{rhs<-,formula-method}
\alias{rhs<-,expression-method}
\alias{rhs<-,list-method}
\alias{rhs<-}


\alias{op-methods}
\alias{op,call-method}
\alias{op,expression-method}
\alias{op,formula-method}
\alias{op,list-method}
\alias{op,name-method}
\alias{op,<--method}
\alias{op}

\alias{op<--methods}
\alias{op<-,call-method}
\alias{op<-,formula-method}
\alias{op<-,expression-method}
\alias{op<-,list-method}
\alias{op<-}  


\alias{op.type-methods}
\alias{op.type,call-method}
\alias{op.type,expression-method}
\alias{op.type,formula-method}
\alias{op.type,list-method}
\alias{op.type,<--method}
\alias{op.type}


\alias{op.types}


\title{ 
  Manipulate the component parts of formulas, expressions, calls, name/symbols
  and list and vectors of such objects.
}

\description{                                                                 
  \code{lhs, rhs, op, and op.type } retrieve the various parts of R formulas, 
  calls, expressions, names/symbols.  These functions were designed to 
  greatly facilitate symbolic manupulation using native R objects.  Also 
  provided are methods to handle list of these objects. 

  \tabular{ll}{ 
    lhs \tab retrieves the left-hand side \cr
    rhs \tab retrieves the right-hand side \cr
    op \tab  retrieves the operation \cr
    op.type \tab returns the type operator
  }
                                   
  There are also functions \code{lhs.vars} and \code{rhs.vars}.  Like 
  \code{ \link{all.vars} }, these functions interpret the variables on the 
  left-hand and right-hand sides respectively.

}

\section{Methods}{

  \describe{

    \item{x = "call"}{ For call objects  }

    \item{x = "expression"}{ For expression objects }

    \item{x = "formula"}{ For formula objects }

    \item{x = "list"}{  For list objects }

  }
}

\usage{ 

  lhs(x, ...)
  rhs(x, ...)
  op(x)
  op.type(x) 

  lhs.vars( x, ... )
  rhs.vars( x, ... )


}

\arguments{ 

  \item{x}{ A formula, expression, call or name/symbols }
  \item{...}{ Arguments passed to succeeding functions }

}

\details{

  These are simple functions for extracting the left-hand side, right-hand 
  side, operator and operator type from formulas, expressions, calls, 
  names/symbols and list containing these objects.  

  lhs, rhs are only defined for formulas and calls ( and list and expressions )
  that are defined with either one of the relational or tilde ('~') operators.
  If the object does not contain one of these operators, it will fail with a 
  warning.

  The defined operator types are defined by the operator.tools package: 
  See \code{\link[operator.tools]{operators}} and \code{\link[operator.tools]{setOperator}}

  The \code{lhs.vars} and \code{rhs.vars} methods, return the variables used
  on the lhs and rhs, respectively.  If special formula variables are used, 
  such as '.', a data.frame or environment must also be provided such that
  the variable list may be properly infered.

}

\value{ 
  Value depends on the argument.
}

\author{ Christopher Brown }

\seealso{ terms, all.vars, all.names, \code{\link[operator.tools]{operators}} }

\examples{

  # FORMULA
  f <- A + B ~ C + D
  lhs(f)
  lhs(f) <- quote( E / F )

  rhs(f)
  rhs(f) <- quote( G + H ) 
  op(f)
  op(rhs(f))
  op( quote(A) )  # NULL: 
  op.type(f)

  # ONE-SIDED FORMULA
  f <- ~ A   # 
  lhs(f)     # NULL
  rhs(f)     # A


  # EXPRESSION
  e <- expression( A + B == C + D )
  lhs(e)
  rhs(e)
  op(e)
  op.type(e)


  # CALL
  c <- quote( A + B > C + D )
  lhs(c)
  lhs(c) <- quote(E)
  rhs(c)

  op(c)
  op.type(c)

  # ASSIGNMENT 
  a <- quote( A <- B ) 
  lhs(a)
  rhs(a) 
  op(a)
  op.type(a) 




}

\keyword{methods}
\keyword{symbolmath}
