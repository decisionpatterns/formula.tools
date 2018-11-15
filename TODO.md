# TODO.md 

- [ ] Refactor `rhs.vars()` and `lhs.vars()` to be more similar.

- [ ] Refactor to '_' syntax.    

- Ensure that magrittr operators are supported

- Does [x] catcont and [ ] invert belong somewhere else?
  - Should invert be called `flip` or `flip_op` and be part of the 
    operator.tools package
  
- [x] Create add_term
- Create methods for `append` for signatures:
  - expression, expression
  - call, call
  - expression, call
  - call, expression
  - "<-"

- Do these belong in vector.tools package?
  - R/which.class
  - test/is-cat.R

- expression.tools package(?)
  - This should probably be called expression.tools rather than formula tool
  - This packages handles calls and expression and assignments (only <- so far).
  - A formula is also a call: 
      is.call( a ~ b )  # [1] TRUE
  - split.terms

- implement over custom operators. 
  ? testing for %.+% on the first element
  ? test for name 

- See if rhs, lhs, op, op.type are needed for other assignment operators: <<- ->

- Methods of class "<-" Break CRAN checks 
  class( quote( A <- B) ) = "<-" 
  
- Since so many of the function dispatch on single arguments, it might be 
  worthwhile to redefine methods as S3 classes: `is.one.sided`; then again, it might
  be nice to allow multiple dispatch for replacement functions.
  
  