#'perm_vec()
#'
#'This function permutes a given vector with a cyclic permutaion
#'
#' @param x A vector
#' @param i The length of the cyclic permutation
#'
#' @return A vector permuted cyclically by \code{x} values
#'
#' @examples
#' perm_vec(1:6,4)
#' perm_vec(27:50,15)
#' @export
perm_vec <- function(x, i){
  n <- length(x)
  if (n == 0) {
    return(x)
  }
  i <- i %% n
  if (i == 0) {
    return(x)
  }
  return(x[c((n - i + 1):n, 1:(n - i))])
}
