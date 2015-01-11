## Put comments here that give an overall description of what your
## functions do

## Below are two functions that are used to create a
## special object that stores a numeric matrix and
## caches its inverse.

## Write a short comment describing this function
##
## The first function, makeCacheMatrix creates a
## special "matrix", which is really a list containing
## a function to set and get the matrix, and to set and
## get the matrix inverse.

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


## Write a short comment describing this function
##
## This function returns the inverse of a cached
## matrix.  If the matrix already has
## an inverse stored, it returns the inverse.
##
## Otherwise the function calculates the inverse
## of the matrix and sets the value of the
## inverse in the cache via the setInverse function.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInv()
  if(!is.null(inv)) {
    #message("getting cached inverse")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setInv(inv)
  return(inv)
}
