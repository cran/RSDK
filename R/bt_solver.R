#' bt_solver()
#'
#' This function is a recurcive function that solves a sudoku grid using the backtracking algorithme
#'
#' @param x A sudoku grid
#' @return A list of two elements in the first one there is the grid x solved as a matrix of 9 by 9, and the second one contains the number of backtracking does R do to solving it.
#' @examples bt_solver(x=grid_gen(49))
#' @export
bt_solver <- function(x) {
  bt.env <- new.env()
  bt.env$x <- x
  bt.env$n <- 0
  bt.env$p <- order_wposs(x)
  bt.env$I <- matrix(NA, 9, 9)
  bt.env$J <- matrix(NA, 9, 9)
  bt.env$B <- matrix(NA, 9, 9)

  for (i in 1:9)
    for (j in 1:9) {
      bt.env$I[i, j] <- atrow(x, i, j)
      bt.env$J[i, j] <- atcol(x, i, j)
      bt.env$B[i, j] <- atbox(x, i, ((3 * i - 1) %% 9), j)
    }


  isVal <- function(s) {
    if (nrow(s) == 0) {
      return(T)
    }
    bt.env$n <- bt.env$n + 1
    i <- s[1, 1] - 1
    j <- s[1, 2] - 1

    for (k in 1:9) {
      if (isFALSE(bt.env$I[i + 1, k]) &&
          isFALSE(bt.env$J[j + 1, k]) &&
          isFALSE(bt.env$B[(3 * (i %/% 3) + (j %/% 3) + 1), k])) {
        bt.env$I[i + 1, k] <<- T
        bt.env$J[j + 1, k] <<- T
        bt.env$B[(3 * (i %/% 3) + (j %/% 3) + 1), k] <<- T
        if (isVal(s[-1, ])) {
          bt.env$x[i + 1, j + 1] <<- k
          bt.env$n <- bt.env$n - 1
          return(T)
        }
        bt.env$I[i + 1, k] <<- F
        bt.env$J[j + 1, k] <<- F
        bt.env$B[(3 * (i %/% 3) + (j %/% 3) + 1), k] <<- F
      }
    }
    return(F)
  }
  isVal(bt.env$p)

  L <- list(Grid = bt.env$x , Backtracking = bt.env$n)
  return(L)

}
