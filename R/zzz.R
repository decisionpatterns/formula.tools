.pack.banner <- function(pkgname) {

  cat(
    pkgname ,
    "-" ,
    installed.packages()[ pkgname , "Version"],
    " provided by Decision Patterns.\n\n" ,
    sep = ""
  )

}

.onLoad <- function( libname, pkgname ) {

  # .odg.logo() 
  .pack.banner( pkgname )
  
}


