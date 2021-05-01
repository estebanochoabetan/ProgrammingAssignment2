## To create a special matrix we have to use the fuction makeCacheMatrix:

makeCacheMatrix <- function(x = matrix()) {
  est <- NULL
  set <- function(y) {
    x <<- y
    est <<- NULL
  }
  get <- function() x
 ## To get the inverse of the matrix we use the next code:
  setinverse <- function(inverse) est <<- inverse
  getinverse <- function() est
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## To solve the inverse we use cacheSolve (the following code):

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x' 
  est <- x$getinverse()
  if(!is.null(est)) {
    message("getting cached data")
    return(est)
  }
  data <- x$get()
  est <- inverse(data, ...)
  x$setinverse(est)
  est
}

