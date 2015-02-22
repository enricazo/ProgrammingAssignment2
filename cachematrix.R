## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Function calculates the inverse of a matrix and caches it
## -Example:
## -source the cachematrix.R to have the functions available in the environment
## -Call the function to create an instance
## xx <- makeCacheMatrix()
## -Define a matrix
## c=rbind(c(1, -1/4), c(-1/4, 1)) 
## -Cache the matrix
## xx$set(c)
## -Calculate the inverse
## cacheSolve(xx)
## -Check that is cached by calling the function again
## cacheSolve(xx)
## -check that the inverse is correctly calculated
## -The answer should be:
## getting cached data
##      [,1] [,2]
## [1,]    1    0
## [2,]    0    1


makeCacheMatrix <- function(x = matrix()) {
        # This function creates a special "matrix" object that can cache its inverse.
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


## Write a short comment describing this function

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
