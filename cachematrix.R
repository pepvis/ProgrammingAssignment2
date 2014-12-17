
## 2 functions for caching and retrieving the inverse of a matrix
## to prevent unnecessary recalculation


# From a matrix, makeCacheMatrix creates a list object with 4 functions and
# 2 attributes; effectively storing the original matrix x and a placeholder m
# for its inverse. The functions enable manipulation of the two attributes.

makeCacheMatrix <- function(x = matrix()) {

    m <- NULL

    set <- function(y) {
        x <<- y
        m <<- NULL
    }

    get <- function() {x
    }

    setinvmatrix <- function(solve) {
        m <<- solve
    }

    getinvmatrix <- function() {m
    }

    list(set = set, get = get,
         setinvmatrix = setinvmatrix,
         getinvmatrix = getinvmatrix)
}



#retreives inverse of matrix stored in list object, or calculates the inverse if
#inverse matrix is not cached yet

cacheSolve <- function(x, ...) {
    m <- x$getinvmatrix()

    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }

    data <- x$get()
    m <- solve(data, ...)
    x$setinvmatrix(m)
    m
}


