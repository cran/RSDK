#' runSudoku()
#'
#' @return Opens the sudoku shiny application
#' @export
runSudoku <- function() {
  appDir <- system.file("shiny", "RSDK", package = "RSDK")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `RSDK`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}
