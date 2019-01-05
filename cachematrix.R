## these two fucntions are used to 1) create a list of functions which set and get 
## the value of a matrix and set and get its inverse; 2) cache the inverse matrix.

## the makeCacheMatrix function creates a list a functions which serve to do things
## described as above. invese matrix is stored in variable "i".

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y){
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) i <<- inverse
    getInverse <- function() i
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## this function will first check whether the inverse matrix has been cached. If
## not, then calculate the inverse of the given matrix and cache it via the solve
## and setInverse function.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    i <- x$getInverse()
    if (!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    i <- solve(x$get(),...)
    x$setInverse(i)
    return(i)
}
