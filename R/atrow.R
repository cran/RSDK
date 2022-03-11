#'atrow()
#'
#'This function checks if a value already exists in a row from a sudoku grid
#' @param x A sudoku grid
#' @param i An index of a row from the grid
#' @param n a value to check its existance in the row i
#'
#' @return TRUE if the checked value is on the row or FALSE if the checked value is not on the row
#' @examples
#' atrow(x=grid_gen(63),1,8)
#' atrow(x=grid_gen(49),7,6)
#' @export
atrow <- function(x, i, n) {
  n %in% x[i, ]
}
