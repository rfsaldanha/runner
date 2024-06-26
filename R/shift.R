#' Shifts vector values to right or left
#'
#' @param x Vector for which to shift values
#' @param n Number of places to be shifted.
#'    Positive numbers will shift to the right by default.
#'    Negative numbers will shift to the left by default.
#'    The direction can be inverted by the invert parameter.
#' @param invert Whether or not the default shift directions should be inverted.
#' @param default The value that should be inserted by default.
#'
#' @returns a vector.
#'
#' @export
#'
#' @examples
#' # Lag
#' shift(c(2,3,5,6,7), n = 1, default = 0)
#' # Lead
#' shift(c(2,3,5,6,7), n = -1, default = 0)
#'
shift <- function(x, n, invert = FALSE, default = NA){
  checkmate::assert_numeric(x = x)

  stopifnot(length(x)>=n)

  if(n==0){
    return(x)
  }

  n <- ifelse(invert, n*(-1), n)

  if(n<0){
    n <- abs(n)
    forward=FALSE
  }else{
    forward=TRUE
  }
  if(forward){
    return(c(rep(default, n), x[seq_len(length(x)-n)]))
  }
  if(!forward){
    return(c(x[seq_len(length(x)-n)+n], rep(default, n)))
  }
}

# https://stackoverflow.com/questions/26997586/shifting-a-vector
