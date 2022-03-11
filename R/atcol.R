#' atcol()
#'
#' This function checks if a value already exists in a column from a sudoku grid
#'
#' @param x A sudoku grid
#' @param j An index of a column from the grid
#' @param n a value to check its existance in the column j
#'
#' @return TRUE if the checked value is on the column or FALSE if the checked value is not on the column
#' @examples
#' atcol(x=grid_gen(63),1,8)
#' atcol(x=grid_gen(49),7,6)
#' @export
atcol <- function(x, j, n) {
  n %in% x[, j]
}
