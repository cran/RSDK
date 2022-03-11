#' Check_grid()
#'
#' This function checks if a 9 by 9 grid is a complete sudoku grid (each number appear only once in its row,column and box )
#'
#' @param x A sudoku grid
#'
#' @return True if x is a cpmlete sudoku grid False if x is not
#'
#' @examples
#' check_grid(x=grid_gen_cplt())
#' check_grid(x=grid_gen(54))
#' @export
check_grid <- function(x) {
  K <- matrix(NA, 9, 9)
  for (i in 1:9)
    for (j in 1:9) {
      k <- as.numeric(x[i, j])
      x[i, j] <- NA
      K[i, j] <- ispossible(x, i, j, k)
    }
  if (all(K))
    return(T)
  else
    return(F)
}
