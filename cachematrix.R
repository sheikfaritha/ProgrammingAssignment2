## Two functions calculate the inverse of a matrix and cached it, so that the next call for inverse
## will take the result from cache instead of recalculating.

## This function creates a matrix by getting and setting objects to matrix and its inverse.

makeCacheMatrix <- function(x = matrix())
{
  outputcache<-NULL
  make <-function(a)
  {
    x<<-a
    outputcache <<-NULL
  }
  retrieve  <- function()
  {
    x
  }
  makeoutput <-function(output)
  {
    outputcache <<- output
  }
  retrieveoutput <- function()
    
  {
    outputcache
  }
  
  list(set=make,get=retrieve,setresult=makeoutput,getresult=retrieveoutput)
  
}

## This function calculates the inverse of the matrix along with the prior check whether the inverse 
## is already calculated or not.
cacheSolve <- function(x,...)
{
        ## Return a matrix that is the inverse of 'x'
  output <- x["retrieveoutput()"]
  inversematrix <- x$retrieveoutput()
  if(!is.null(output))
  {
    message("printing cached output")
    return(output) ## printing cched data
  }
   matrix <- x$retrieve()
  inversematrix <- solve(matrix, ...) ## general function for inverse
  x$makeoutput(inversematrix)
  inversematrix
} 
