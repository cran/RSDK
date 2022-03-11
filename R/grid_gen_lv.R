#' grid_gen_lv()
#'
#'
#' This function generates a sudoku grid for four levels of playing "Easy", "Difficult","Hard" and "Legend" based
#'  on the number of backtraking does the finction \code{\link[RSDK]{bt_solver}} did to solve the grid.
#'
#' @param lv A string argument level for the grid and must be "Easy", "Difficult","Hard" or "Legend"
#'
#' @return A sudoku grid associate to the level in \code{lv}
#'
#' @examples
#' grid_gen_lv("Easy")
#' grid_gen_lv("Legend")
#'@export
grid_gen_lv <- function(lv) {
  if (lv == "Easy") {
    repeat {
      A <- grid_gen(45)
      K <- bt_solver(A)
      if (K$Backtracking < 75)
        return(A)
    }

  }
  else if (lv == "Difficult") {
    repeat {
      A <- grid_gen(48)
      K <- bt_solver(A)
      if (K$Backtracking %in% 260:76)
        return(A)
    }
  }
  else if (lv == "Hard") {
    repeat {
      A <- grid_gen(51)
      K <- bt_solver(A)
      if (K$Backtracking %in% 261:600)
        return(A)
    }
  }
  else if (lv == "Legend") {
    repeat {
      A <- grid_gen(54)
      K <- bt_solver(A)
      if (K$Backtracking > 600)
        return(A)
    }
  }
}
