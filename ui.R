
library(shiny)

fluidPage(
  
  titlePanel("Welcome to your first shiny app"),
  
  sidebarLayout(
    
    sidebarPanel(
      "You are in sidebar panel",
      sliderInput("val", "Choose a Value", min = 0, max = 200, value = 25),
      
      actionButton("myButton", "Click Here")
      
    ),
    mainPanel(
      "You are in Main panel",
      plotOutput("myPlot"),
      
      "You have selected the following value:",
      
      textOutput("mySelection")
      )
    
  )
  
  )