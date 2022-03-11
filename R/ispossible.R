#' ispossible()
#'
#'This function checks if it is possible to put a given number in a given empty cell
#'
#' @param x A sudoku grid
#' @param i The index of the row of the given cell
#' @param j The index of the column of the given cell
#' @param n The number that we want to check if is possible to put it in the cell of the index (i,j)
#'
#' @return True if it is possible to put \code{n} in the cell (i,j)
#'
#' @examples
#' ispossible(x=grid_gen_cplt(),4,5,6)
#' ispossible(x=grid_gen_cplt(),4,5,6)
#' @export
ispossible <- function(x, i, j, n) {
  if (!atrow(x, i, n) && !atcol(x, j, n) && !atbox(x, i, j, n)) {
    return(T)
  }
  return(F)
}
