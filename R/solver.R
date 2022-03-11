#' solver()
#'
#' This function is a recurcive function that solves a given sudoku grid for shiny application and it is more
#' optimized than the backtraking solver on the function \code{\link[RSDK]{bt_solver}}
#' @param x A sudoku grid
#'
#' @return The grid \code{x} solved
#'
#' @examples solver(x=grid_gen(46))
#' @export
solver <- function(x) {
  if (all(!is.na(x))) {
    return(x)
  }
  pos <- order_wposs(x)
  i <- pos$row[1]
  j <- pos$col[1]

  for (k in poss(x, i, j)) {
    if (ispossible(x, i, j, k)) {
      x[i, j] <- k
      S <- solver(x)
      if (!is.null(S)) {
        return(S)
      }
    }
  }
}


