#'perm_mat()
#'
#'This function permutes the columns of a given matrix with a cyclic permutaion
#'
#' @param a A matrix
#' @param v The length of the cyclic permutation
#'
#' @return A matrix permuted cyclically by \code{v} columns
#'
#' @examples
#' perm_mat(a=diag(1,5),4)
#' @export
perm_mat <- function(a, v) {
  if (is.vector(a)) {
    return(perm_vec(a, v))
  }
  v <- c(v, rep(0, length(dim(a)) - length(v)))
  f <- function(i) {
    perm_vec(seq_len(dim(a)[i]), v[i])
  }
  do.call("[", c(list(a), sapply(seq_along(dim(
    a
  )), f, simplify = FALSE),
  drop = FALSE))
}
