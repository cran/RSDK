#' plt_grid_play()
#'
#' This function gives a reactive plot of the grid for the shiny application
#'
#' @param B Initial grid
#' @param x The grid that the user put the numbers on it
#'
#' @return a plot of the grid with the user input with a different color red if the input is on the wrong cell and green if the input is on the right cell
#' @importFrom grDevices rgb
#' @importFrom graphics lines par plot rect text
#' @export
plt_grid_play <- function(B, x) {
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
      if (!is.na(B[i, j])) {
        rect(j - .5, 9.5 - i, j + .5, 10.5 - i, col = "gray70")
        text(j, 10 - i, B[i, j], cex = 2, col = "darkblue")
      }
      else {
        if (!is.na(x[i, j])) {
          y <- x
          a <- x[i, j]
          y[i, j] <- NA
          if (ispossible(y, i, j, a)) {
            rect(j - .5, 9.5 - i, j + .5, 10.5 - i, col = rgb(0, 1, 0, .3))
            text(j, 10 - i, a, cex = 2, col = "darkblue")
          }
          else if (!ispossible(y, i, j, a)) {
            rect(j - .5, 9.5 - i, j + .5, 10.5 - i, col = rgb(1, 0, 0, .3))
            text(j, 10 - i, a, cex = 2, col = "darkblue")
          }
        }
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
