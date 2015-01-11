## Test solve

x <- matrix(rnorm(160000),400,400)
for (i in 1:1000) {
     x_ <- solve(x)
}