## To create two functions to get inverse of matrix from cache
--------------------------------------------------------------

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
## set function - makeCacheMatrix$set
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
## get function - makeCacheMatrix$get
        get <- function() x
## setsolve function - makeCacheMatrix$setsolve
        setsolve <- function(solve) m <<- solve
## getsolve function - makeCacheMatrix$getsolve
        getsolve <- function() m
## Create list of 4 functions
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}

cacheSolve <- function(x, ...) {
        m <- x$getsolve()
## To check if inverse of matrix is already there in cache or not
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
## If cache is empty, calculate inverse again using solve function
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}
