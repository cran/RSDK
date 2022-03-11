#' nbrposs()
#'
#' This function returns the number of possibilities for a given empty cell
#'
#' @param x A sudoku grid
#' @param i The index of the row of the given cell
#' @param j The index of the column of the given cell
#'
#' @return Number of possibilities for the cell (i,j)
#'
#' @examples
#' nbrposs(x=grid_gen_cplt(),5,7)
#' nbrposs(x=grid_gen_cplt(),6,9)
#' @export
nbrposs <- function(x, i, j) {
  return(length(poss(x, i, j)))
}
