#' order_wposs()
#'
#' This function returns an ordred data frame by number of the possibilities for all the empty cells in the grid with index of row for the first column and index of column for the second column and the number of possibilities in third column
#'
#' @param x A sudoku grid
#'
#' @return data frame
#'
#' @examples order_wposs(x=grid_gen_cplt())
#' @export
order_wposs <- function(x) {
  poss <- vector()
  row <- vector()
  col <- vector()
  for (i in 1:9) {
    for (j in 1:9) {
      if (is.na(x[i, j])) {
        poss <- append(poss, nbrposs(x, i, j))
        row <- append(row, i)
        col <- append(col, j)
      }
    }
  }
  D <- data.frame(row, col, poss)
  D <- D[order(D[, 3], decreasing = F), ]
  return(D)
}
