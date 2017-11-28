
library(shiny)
library(dplyr)
library(ggplot2)
int <- interviews
int$Date <- as.Date(int$Date, format = "%Y-%m-%d")         
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
                                      

   # dat <-int%>%
    #  select(Attendance, Date) %>%
     # filter(Date > "2015-01-04" & Date <"2015-09-18")%>%
      #group_by(Attendance) %>%
      #summarise(count = n())
    
    dat <- int%>%
      select(Attendance, Date) %>%
      filter(Date > input$daterange3[1] & Date <input$daterange3[2]) %>%
      group_by(Attendance) %>%
      summarise(count = n())
    
    plot<-ggplot(data=dat, aes(x=Attendance, y=count, fill = (Attendance)))+
      geom_bar(stat="identity") + ylim(0, 1000)

    plot
    # generate bins based on input$bins from ui.R
    #x    <- interviews[, 24] 
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    #hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  
  output$cityPlot <- renderPlot({
    
    
    
    
    
     dat <-int%>%
       select(Venue, Attendance) %>%
       filter(Venue == input$city)%>%
       group_by(Attendance) %>%
       summarise(count = n())
     
    
    plot<-ggplot(data=dat, aes(x=Attendance, y=count, fill = (Attendance)))+
      geom_bar(stat="identity") + ylim(0, 1000)
    
    plot
    # generate bins based on input$bins from ui.R
    #x    <- interviews[, 24] 
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    #hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
    
  
 # output$attendence <- renderDataTable(table(interviews$Attendance))

  output$attendence <- renderTable(  dat <- int%>%
                                       select(Attendance, Date) %>%
                                       filter(Date > input$daterange3[1] & Date <input$daterange3[2]) %>%
                                       group_by(Attendance) %>%
                                       summarise(count = n()))
})
