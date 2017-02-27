# formula.tools: Utilities for Formulas, Expressions, Calls and Other Objects


[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/formula.tools)](https://cran.r-project.org/package=formula.tools)
[![License](https://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](https://www.gnu.org/licenses/gpl-2.0.html) 
[![Downloads](https://cranlogs.r-pkg.org/badges/formula.tools?color=brightgreen)](https://www.r-pkg.org/pkg/formula.tools)


The package provides for programatic access to formula, expression, calls
and other R objects. These objects all share the same structure: a left-hand side operator and right-hand side. This packages provides methods for accessing and modifying the structures as well as extracting names and symbols from these objects.

It is easiest to understand through the [#Examples].

(Sorry, recursive access has not been developed yet.)

## Installation 

### Stable Version 

    install.packages('formula.tools')

### Development Verison 

    devtools::install_github("decisionpatterns/formula.tools")
    
## Important Functions 

- **lhs**: get/set the left-hand side of an object
- **rhs**: get/set the right-hand side of an object
- **op**: get/set the operator of an object
- **get.vars**: like `base::all.vars` except all symbols, etc. can be
  interpolated on data, so that things like `y ~ .` can return the correct 
  values.
  - **lhs.vars**: `get.vars` on lhs of the object 
  - **rhs.vars**: `get.vars` on rhs of the object
- **terms**: get the terms from an object enterpolating on the data  

## Examples 

    -tk
    
