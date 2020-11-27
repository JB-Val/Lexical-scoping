## Put comments here that give an overall description of what your
## functions do

## The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to

    set the value of the matrix
    get the value of the matrix
    set the value of the inversed matrix
    get the value of the inversed matrix 

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() {x}
  setmatrix <- function(solve) {m <<- solve}
  getmatrix <- function() {m}
  list(set = set, get = get,
       setmatrix = setmatrix,
       getmatrix = getmatrix)
}

 # This function creat the inverse of the matrix created by the precedent function, if a inverse is already present in the matrix ($getmatrix) it return the message 
 "getting cached matrix". Other wise it calculate the inverse by the "solve" function and replace it in "getmatrix" by the setmatrix function. 
 
cacheSolve <- function(x, ...) {
  m <- x$getmatrix()
  if(!is.null(m)) {
    message("getting cached matrix")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setmatrix(m)
  m
}

# For exemple 

> x<-makeCacheMatrix(matrix(c(1:4),ncol = 2,nrow = 2))
> 
> x$getmatrix()
NULL
> cacheSolve(x)
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> x$getmatrix()
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> cacheSolve(x)
getting cached matrix
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5



