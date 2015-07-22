## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## creates a representation of a given matrix that cached its inverse when fist time the inverse is requested,
## and use this cached inverse for the subsequent calls to the inverse.
## the ruturn value is a list of four function objects: 
## list(set = set, get = get,setinverse = setinverse,getinverse = getinverser)
makeCacheMatrix <- function(x = matrix()) {
  
  inv <- NULL  # set initial value of inverse to NULL
  set <- function(y) {
    x <<- y        # reset the value of matrix x to new matrix y in the global scope
    inv <<- NULL   # rest the inverse of y to NULL
  }
  get <- function() x # retun the actual represeted matrix x
  
  setinverse <- function(new_inverse) inv <<- new_inverse
  getinverse <- function() inv
  list(set = set, get = get,setinverse = setinverse,getinverse = getinverse)

}


## Write a short comment describing this function
## this a client function that recieved a list that encapsulates a matrix along with function to store/retrive its inverse
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
    data <- x$get()
    m <- solve(data)
    x$setinverse(m)
    m
}
