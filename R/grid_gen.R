#' grid_gen()
#'
#'This function generates a sudoku grid with a given number for the emty cells
#'
#' @param t The number of the emty cells
#'
#' @return A sudoku grid with \code{t} empty cells
#'
#' @examples Grid_45 = grid_gen(45)
#' @export
grid_gen <- function(t) {
  A <- grid_gen_cplt()
  repeat {
    v <- sample(1:9)
    A[v[sample(1:9, 1)], v[sample(1:9, 1)]] <- NA
    if (sum(is.na(A)) == t) {
      break
    }
  }
  return(A)
}
