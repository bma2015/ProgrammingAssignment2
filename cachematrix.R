## -------------------------------------------------
## Below are two functions that are used to create a
## special "matrix" that stores a numeric matrix and
## caches its inverse.
## -------------------------------------------------

## This function creates a list containing
## functions to set and get the matrix, and to set
## and get the matrix inverse.
makeCacheMatrix <- function(x = matrix()) {
     inv <- NULL
     set <- function(y) {
          x <<- y
          inv <<- NULL
     }
     
     get <- function() x
     setInv <- function(inverse) inv <<- inverse
     getInv <- function() inv
     return(list(set = set, get = get,
                 setInv = setInv,
                 getInv = getInv))
}

## This function returns the inverse of a cached
## matrix.  If the matrix already has
## an inverse stored, it returns that inverse.
##
## Otherwise the function calculates the inverse
## of the matrix and sets the value of the
## inverse in the cache via the setInverse function.
cacheSolve <- function(x, ...) {
     inv <- x$getInv()
     if(!is.null(inv)) {
          return(inv)
     }
     
     data <- x$get()
     inv <- solve(data, ...)
     x$setInv(inv)
     return(inv)
}
