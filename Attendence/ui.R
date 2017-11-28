
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Interview Attendence"),
  
  
  fluidRow(
    column(3,
           
           dateRangeInput("daterange3", "Date range:",
                          start  = "2015-03-01",
                          end    = "2016-12-05",
                          min    = "2015-01-01",
                          max    = "2016-12-31",
                          format = "mm/dd/yy",
                          separator = " - ")
    ),
    column(3, offset = 1,
           plotOutput("distPlot")
    ),
    column(3, offset = 2,
           tableOutput("attendence")
    )
  ),
  fluidRow(
    column(3,
           radioButtons("city", "Interview Location:",
                        c("Chennai" = "Chennai",
                          "Bangalore" = "Bangalore",
                          "Hyderabad" = "Hyderabad",
                          "Gurgaon" = "Gurgaon"))
    ),
    column(4, offset = 1,
           plotOutput("cityPlot")
    )
  )
 
  # Sidebar with a slider input for number of bins 
  
    
      
    
  
))
