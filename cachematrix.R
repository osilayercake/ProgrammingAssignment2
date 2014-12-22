## This script contains a submission for Coursera R Programming Assignment 2
## It contains four functions two of which are assessable and the other two are 
## an example from the course notes. It also contains a short rant about 
## the way R defines classes because its so much freaking clearer in Python.

## The assessable functions are "makeCacheMatrix" and "cacheSolve"

makeCacheMatrix <- function(x = matrix()) {
    ## This function defines a matrix that caches its inverse
    ## it accepts only one arcument which must be a matrix type.
    m <- NULL # 'm' Is the variable that holds the stored value of the inverse.
    
    # The set function allows you to redefine the matrix to be cached without
    # having to create a whole new object. It clears the cache and assigns a new 
    # value for 'x'
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x # Defines a fucntion that returns the original Matrix 'x'
    set_inverse <- function(inv) m <<- inv # Stores the inverse in the cache variable 'm'
    get_inverse <- function() m # Defines a function that returns the cached value 
    list(set = set, get = get,
         set_inverse = set_inverse,
         get_inverse = get_inverse)
}

cacheSolve <- function(x, ...) {
    ## This function accepts the "cacheMatrix" type output from the above function.
    ## it first checks if the matrix has a previously calculated inverse and returns 
    ## that object if it is not NULL otherwise it calcualtes the inverse and returns
    ## it and also caches it in the object for future use.
    m <- x$get_inverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data)
    x$set_inverse(m)
    m
}

## Examples from the course notes
makeVector <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}

cachemean <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}