## Here is a usage example:
##> m1 <- matrix(1:4,2,2) ##create a matrix with name
##> mat <- makeCacheMatrix(m1) ##apply the function makeCacheMatrix so that the functions inside can be set
##> cacheSolve(mat)##the 1st time to get inverse matrix of m1
##> cacheSolve(mat)##the 2nd time to get inverse matrix of m1,the output should print "getting cached data"

## makeCacheMatrix is the 1st function that should be executed

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}

## cacheSolve is the 2nd function that should be executed

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}
