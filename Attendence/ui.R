
library(shiny)


interviews <- read.csv("data.csv")

int <- interviews
int$Date <- as.Date(int$Date, format = "%Y-%m-%d")     

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Interview Attendence For Various Clients in India"),
  
  h3("
The data pertains to the recruitment industry in India for the years 2014-2016 and deals with candidate interview attendance for various clients. When candidates don't appear for interviews, valuable time and resources are lost. "),
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
  ),
  fluidRow(
    column(3,
           checkboxGroupInput("var", "Features to turn on",
                              c("Candidate Permission To Start Immediately" = 13,
                                "Hope There Are No Unscheduled Meetings" = 14,
                                "Candidate Supplied Alternative Number" = 16,
                                "Candidate Can be called 3 hours in advance" = 15,
                                "Candidate Recently Updated Resume" = 17,
                                "Candidate Confirmed Venue Location" = 18))
    ),
    column(4, offset = 1,
           plotOutput("featurePlot")
    )
  )
  
 
  # Sidebar with a slider input for number of bins 
  
    
      
    
  
))
