library(shiny)

function(input, output) {
  output$myPlot <- renderPlot({
    plot(rnorm(input$val))
    })
  
  "You selected following value: "
  
  output$mySelection <- renderText({
    input$val
  })
  
  observe({
    cat(input$myButton)
  })
}