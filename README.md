# formula.tools 

** Utilities for Formulas, Expressions, Calls, Assignments and Other R Objects**

[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/formula.tools)](https://cran.r-project.org/package=formula.tools)
[![License](https://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](https://www.gnu.org/licenses/gpl-2.0.html) 
[![Downloads](https://cranlogs.r-pkg.org/badges/formula.tools?color=brightgreen)](https://www.r-pkg.org/pkg/formula.tools)
[![](https://cranlogs.r-pkg.org/badges/grand-total/formula.tools)](https://CRAN.R-project.org/package=formula.tools)
[![software impact](http://depsy.org/api/package/r/formula.tools/badge.svg)](http://depsy.org/package/r/formula.tools)

These utilities facilitate the programmatic manipulations of formulas, 
expressions, calls, names, symbols and other R language objects. These objects 
all share the same structure: a left-hand side (lhs), an operator (op) and 
right-hand side (rhs). This packages provides methods for accessing and 
modifying this structures as well as extracting and replacing names and 
symbols from these objects.

It is easiest to understand through the [#Examples].


## Installation 

### Stable Version 

    install.packages('formula.tools')

### Development Verison 

    devtools::install_github("decisionpatterns/formula.tools")
    
    
    
## Overview

### Manipulate parts of a formula/expression/call/assignment:

 - **`lhs`**: get/set the left-hand side of an object
 - **`rhs`**: get/set the right-hand side of an object
 - **`op`**: get/set the operator of an object
 

### Get variables (names) in a formula/expression/call/assignment: 

 - **`get.vars`**: like `base::all.vars` except all symbols (e.g. `.`) can be
   interpolated from data, so that things like `y ~ .` can return the correct 
   values.
   - **`lhs.vars`**: `get.vars` on lhs of the object 
   - **`rhs.vars`**: `get.vars` on rhs of the object
   
   
### Get terms from formula or expression:

 - **`terms`**: get the terms from an object by interpolating special symbols 
       (e.g. `.`) using a data set data.  Extends `stats::terms()` 
       
 - **`split_terms`**: split (mathematical) terms into an expression vector without
   interpolating special symbols (e.g. `.`)

 
## Examples 

Formula terms and operators can be accessed or changed. 

```r

## Get parts of formula 

form <- y ~ x 

lhs(form)                # y
lhs(form) <- quote(t)
form                     # t ~ x

rhs(form)                # x
rhs(form) <- 1
form                     # t ~ 1


## Get variables (names)

form <- y ~ m*x + b

get.vars(form)           # "y" "m" "x" "b"
lhs.vars(form)           # "y"
rhs.vars(form)           # "m" "x" "b"


## Split terms

terms(form)

split_terms(form)        # expression(Species ~ . - Sepal.Length)
split_terms( quote(a+(b+(c+d))), recursive=TRUE )   # expression(a, b, c, d)

```
    
