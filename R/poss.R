#' poss()
#'
#' This function returns a vector of possibilities for a given empty cell
#'
#' @param x A sudoku grid
#' @param i The index of the row of the given cell
#' @param j The index of the column of the given cell
#'
#' @return Vector of possibilities for the cell (i,j)
#'
#' @examples
#' poss(x=grid_gen(46),4,7)
#' poss(x=grid_gen(49),3,9)
#' @export
poss <- function(x, i, j) {
  k <- 1:9
  p <- vector()
  for (n in k) {
    if (isTRUE(ispossible(x, i, j, n)))
      p <- append(p, n)
  }
  return(p)
}
