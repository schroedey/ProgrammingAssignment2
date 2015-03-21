## makeCacheMatrix and cacheSolve are are a pair of functions that enable the
## caching and subsequent use of cached matrices and their inverses.

## makeCacheMatrix: takes a matrix and creates a special "matrix" object
## that caches both the matrix and its inverse for future use.
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

## cacheSolve: computes the inverse of the special "matrix" returned by
## makeCacheMatrix. If the inverse has already been calculated (and the matrix
## has not changed), cacheSolve retrieves the inverse from the cache.
cacheSolve <- function(x, ...) {
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    ## return a matrix that is the inverse of 'x'
    m
}
