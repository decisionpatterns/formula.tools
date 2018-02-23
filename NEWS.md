# 2018-02-22 Version 1.7.0 
 - Add split_terms function
 - Add toggle.sign method
 - `catcont` functions removed.  Use the **catcont** package instead. 

# 2017-09-21 Version 1.6.8
 - Fix issue with Rd files causing a rejection by CRAN 
 - Update docs, README.md

# 2017-07-20 Version 1.6.4
 - Fixes doc problems with '<-' methods
 - Fixes #6

 
# 2017-02-26 Version 1.6.0 
 - Improve documentation 
 - Import stats
 - Fix tests


# 2015-06-23 Version 1.5.4
 - Fix issue with CRAN blocking 
 - Expand tests for get.vars, lhs.vars, rhs.vars, lhs, rhs

 
# 2015-06-22 Version 1.5.3
 - Fix issue #5, get.vars(NULL, NULL) throws an error ... 
   Thanks to Paul Bailey for poinint out the problem.


# 2014-03-11 Version 1.4.0
 - Fix documentaion for roxygen-4.0.0+ (#1)
 - No other functional fixes


# 2014-02-25 Version 1.3.3 
 - Fix to prevent breakage from new testthat
 - Documentation moved to Roxygen2 format


# 2012-11-30 Version 1.3.1
 - Fixes documentation
 - Adds Namespace


# 2011-10-03 Version 1.3.0
  Added: as.character.formula


# 2011-08-08 Version 1.2.2

[Modified]
Added methods lhs, rhs, op, op.type for '<-' assignment class.  Previosly it 
did not handle this and produced an error. 

* n.b. statements with '->' return '<-' 


# 2010-06-16 Version 1.2.1
[Modified]
- Fixed problem with NAMESPACE file


# 2010-03
 - Change maintainer info


# 2010-09-29:
 - R/which.class.R: Changed is.cat and is.cont to be based on S4 Methods. This 
   could have been done with S3, however the whole package uses S4.


# 2010-08-24 
 - R/zzz.R: simplified 


# 2010-08-24 Version 1.1.0
COMPLETE REFACTOR!!!
 - Now dependent on oeprator.tools-1.1.0
 - R/is.one.sided.R: is.two.sided is fixed
 - R/lhs.R: 
 - R/rhs.R:
 - R/op.R:
   - fun( expression ) now returns an expression
   - replacement handles multiple values for replacing on expressions.
