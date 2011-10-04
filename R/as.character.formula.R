
as.character.formula <- function(x, ...)
  Reduce( paste, deparse(x) )

