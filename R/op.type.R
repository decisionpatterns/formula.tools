# -----------------------------------------------------------------------------
# op.type
#   extract and manipulate the operator type of a call, expression, or rule
#
#   n.b.
#     - No replacement methods available for op.type.
#     - similar to operator.tools::operator.type which is applied directly to
#       the operator
# -----------------------------------------------------------------------------

# OP.TYPE
setGeneric( 'op.type', function(x) standardGeneric( 'op.type' ) )


# SINGULAR METHODS
setMethod(  'op.type', 'call' , function (x) operator.type( (op(x) )  ) )
setMethod(  'op.type', 'formula' , function (x) operator.type( op(x) ) )


# PLURAL METHODS
setMethod(  'op.type', 'expression', 
  function(x) lapply( x, function(x) operator.type( op(x) )  )  
)
setMethod( 'op.type', 'list',
  function(x) lapply( x, function(x) operator.type( op(x) )  )  
)
                           
