library(shiny)

shinyServer(function(input, output) {
  A <- NULL
  B <- NULL
  k <- NULL


  Lv <- reactiveVal()
  observeEvent(input$Nglv, {
    Lv(paste("You are currently in the", input$Nglv , " level"))
  })
  observeEvent(input$strlv, {
    Lv(paste("You are currently in the", input$strlv , " level"))
  })
  output$Lv <- renderText(Lv())



  observeEvent(input$StartButton, {
    inputSweetAlert(
      inputId = "strlv",
      input = "select",
      inputOptions = c("Easy", "Difficult", "Hard", "Legend"),
      title = "Choose a level"
    )
  })

  observeEvent(input$strlv, {
      output$plot <- renderPlot({
        if(!is.null(input$strlv)){
        a <- grid_gen_lv(input$strlv)
        plt_grid(a)
        A <<- a
        B <<- a
        }
      }
    , bg = "transparent")
  })

  output$git <- renderText({
    paste(
      "Github:",
      a("Click here", href = "https://github.com/ELKHMISSI/RSDK", target = "_blank")
    )
  })

  output$cor <- renderText({
    c = input$plot_click
    if (!all(is.null(c))) {
      i <- 10 - floor(as.numeric(c$y) + 0.5)
      j <- floor(as.numeric(c$x) + 0.5)
      if (i %in% 1:9 && j %in% 1:9) {
        if (is.na(B[i, j])) {
          paste("You will edit the value of the case (", i, ",", j, ")")
        } else if (!is.na(B[i, j])) {
          paste("You can not edit the value of the case (", i, ",", j, ")")
        }
      }
    } else
      paste("You will edit the value of the case (", ",", ")")
  })

  observeEvent(input$keys, {
    observeEvent(input$plot_click, {
      c <- input$plot_click
      if (!all(is.null(c))) {
        if ((as.numeric(c$x) < 10) &&
            (as.numeric(c$x) > 0) &&
            (as.numeric(c$y) < 10) &&
            (as.numeric(c$y) > 0)) {
          i <- 10 - floor(as.numeric(c$y) + 0.5)
          j <- floor(as.numeric(c$x) + 0.5)
          k <<- as.numeric(input$keys)

          if (is.na(B[i, j])) {
            if (length(k) != 0) {
              A[i, j] <<- k
              k <<- NULL
            }
          }
        }
      }
    })

    output$plot <- renderPlot({
      plt_grid_play(B, A)
    }, bg = "transparent")

  })

  observeEvent(input$dbl, {
    c <- input$dbl
    i <- 10 - floor(as.numeric(c$y) + 0.5)
    j <- floor(as.numeric(c$x) + 0.5)
    if (!is.na(A[i, j])) {
      A[i, j] <<- NA
    }
    output$plot <- renderPlot({
      plt_grid_play(B, A)
    }, bg = "transparent")

  })


  observeEvent(input$Ngconf, {
    inputSweetAlert(
      inputId = "Nglv",
      input = "select",
      inputOptions = c("Easy", "Difficult", "Hard", "Legend"),
      title = "Choose a level"
    )
  })

  observeEvent(input$Ng, {
    ask_confirmation(
      inputId = "Ngconf",
      type = "warning",
      showCloseButton = T,
      title = "Want to start a new game ?"
    )
  })
  observeEvent(input$Nglv, {
    output$plot <- renderPlot({
      if (!is.null(input$Nglv)) {
        a <- grid_gen_lv(input$Nglv)
        plt_grid(a)
        A <<- a
        B <<- a
      }
    }, bg = "transparent")
  })

  observeEvent(input$Solution, {
    ask_confirmation(
      inputId = "solconf",
      type = "info",
      showCloseButton = T,
      title = "Want to quit the game and see the solution ?"
    )
  })
  observeEvent(input$solconf, {
    if (isTRUE(input$solconf)) {
      output$plot <- renderPlot({
        plt_grid(solver(B))
        B <<- solver(B)
        A <<- B
      }, bg = "transparent")
    }
  })


  observeEvent(input$Check, {
    if (check_grid(A)) {
      sendSweetAlert(title = "Good job !!",
                     text = "All in order",
                     type = "success")
    } else{
      sendSweetAlert(title = "Try again...",
                     text = "Oups !",
                     type = "error")
    }
  })
})
