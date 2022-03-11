#' plt_grid()
#'
#' This function plots a given sudoku grid
#'
#' @param X A sudoku grid
#'
#' @return a plot of the grid
#' @examples plt_grid(X=grid_gen_cplt())
#' @importFrom grDevices rgb
#' @importFrom graphics lines par plot rect text
#' @export
plt_grid <- function(X) {
  plot(
    1,
    type = "n",
    xlab = "",
    ylab = "",
    xlim = c(.5, 9.5),
    ylim = c(.5, 9.5),
    axes = F
  )
  for (i in 1:9) {
    text(.25, i, 10 - i, col = "white", cex = 1.5)
    text(i, 9.75, i, col = "white", cex = 1.5)
    for (j in 1:9) {
      if (!is.na(X[i, j])) {
        rect(j - .5, 9.5 - i, j + .5, 10.5 - i, col = "gray70")
        text(j, 10 - i, X[i, j], cex = 2, col = "darkblue")
      }
    }
  }
  for (i in seq(.5, 9.5, 3)) {
    lines(c(.5, 9.5), c(i, i), lwd = 3, col = "white")
    lines(c(i, i), c(.5, 9.5), lwd = 3, col = "white")
  }
  for (i in seq(.5, 9.5, 1)) {
    lines(c(.5, 9.5), c(i, i), lwd = 1, col = "white")
    lines(c(i, i), c(.5, 9.5), lwd = 1, col = "white")
  }

}
