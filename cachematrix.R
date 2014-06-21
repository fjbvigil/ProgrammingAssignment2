## Functions to compute the inverse of a matrix and catching it if it
## has been computed before

## The function gives you a list of functions
## to set & get the values of matrix and his inverse

makeCacheMatrix <- function(x = matrix()) {
    matriu <- NULL
    set <- function(y) {
        x <<- y
        matriu <<- NULL
    }
    get <- function() x
    setmatrix <- function(solve) matriu <<- solve
    getmatrix <- function() matriu
    list(set = set, get = get,
         setmatrix = setmatrix,
         getmatrix = getmatrix)
}

## Function that returns the inverse of one matrix
## first it tries to retrieve the inverse from the cache
## if it doesn't exist at the cache then it computes the inverse

cacheSolve <- function(x, ...) {
    matriu <- x$getmatrix()
    if(!is.null(matriu)) {
        message("getting cached data")
        return(matriu)
    }
    data <- x$get()
    matriu <- solve(data, ...)
    x$setmatrix(matriu)
    return (matriu)
}