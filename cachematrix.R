# makeCacheMatrix
# Creates a special "matrix" object that can cache its inverse.
# Saves the matrix to variable x and its inverse to variable s in scope.
# Returned object (actually it's a list) contains:
# set: sets matrix and resets cached inverse
# get: returns matrix
# setSolve: saves solve value
# getSolve: returns cached inverse value

makeCacheMatrix <- function(x = matrix()) {
        s <- NULL
        set <- function(y) {
                x <<- y
                s <<- NULL
        }
        get <- function() {
                x
        }
        setSolve <- function(solve) {
                s <<- solve
        }
        getSolve <- function() {
                s
        }
        list(set = set, get = get, setSolve = setSolve, getSolve = getSolve)
}

# Takes the object of that type as an argument 'x', checks if the inverse value is already
# cached, and if it is returns the cached value; if not, this function calculates the
# inverse for the matrix saved in the 'x', saves it into 'x' cache using method 'setSolve'
# and returns the result.
cacheSolve <- function(x, ...) {
        s <- x$getSolve()
        if(!is.null(s)) {
                message("getting cached data")
                return(s)
        }
        data <- x$get()
        s <- solve(data, ...)
        x$setSolve(s)
        s
}
