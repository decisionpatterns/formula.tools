## Version 1.7.0

### check_man() 

check_man() reports:
 
     Objects in \usage without \alias in documentation object 'formula.parts':
      ‘\S4method{lhs}{<-}<-’ ‘\S4method{op}{<-}<-’ ‘\S4method{rhs}{<-}<-’

This is a known problem with the checker as these aliases are in the documentation
for `formula.parts`:

   \alias{lhs<-,<--method}
   \alias{rhs<-,<--method}
   \alias{op<-,<--method}
   
### Reverse Dependency check performed no errors reported   
   

## Summary

* Fixed:

  > Found the following (possibly) invalid URLs:
  > URL: http://cran.r-project.org/package=formula.tools
  > From: README.md
  > CRAN URL not in canonical form
  >
  > Canonical CRAN.R-project.org URLs use https.
  
* This package is in response to maintainers to fix a bug that required 
  explicitly importing the `stats` package.  Fixed.


## Test environments

* local OS X install, R 3.3.2
* ubuntu 12.04 (on travis-ci), R 3.3.2
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.

## Reverse dependencies

This is a new release, so there are no reverse dependencies.

---

* I have run R CMD check on the NUMBER downstream dependencies.
  (Summary at ...). 
  
* FAILURE SUMMARY

* All revdep maintainers were notified of the release on RELEASE DATE.
