## Test cacheSolve

x <- matrix(rnorm(160000),400,400)
x_ <- makeCacheMatrix(x)
for (i in 1:1000) {
     x__ <- cacheSolve(x_)
}