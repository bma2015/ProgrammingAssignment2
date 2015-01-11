x <- matrix(rnorm(160000),400,400)
x_ <- makeCacheMatrix(x)
x__ <- cacheSolve(x_)
print(identical(x__,solve(x)))