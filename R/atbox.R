#' atbox()
#'
#' This function checks if a value already exists in a 3 by 3 box from a sudoku grid
#'
#' @param x A sudoku grid
#' @param i An index of a line from the box
#' @param j An index of a column from the box
#' @param n a value to check its existance in the box that contains the cell of the index (i,j)
#'
#' @return TRUE if the checked value is on the box or FALSE if the checked value is not on the box
#' @examples
#' atbox(x=grid_gen(49),1,4,8)
#' @export
atbox <- function(x, i, j, n) {
  n %in% x[((i - 1) %/% 3) * 3 + (1:3), ((j - 1) %/% 3) * 3 + (1:3)]
}
