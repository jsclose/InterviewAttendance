
library(shiny)
library(dplyr)
library(ggplot2)
    
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  interviews <- read.csv("data.csv")
  
  int <- interviews
  int$Date <- as.Date(int$Date, format = "%Y-%m-%d")     
  
  output$distPlot <- renderPlot({

    dat <- int%>%
      select(Attendance, Date) %>%
      filter(Date > input$daterange3[1] & Date <input$daterange3[2]) %>%
      group_by(Attendance) %>%
      summarise(count = n())
    
    plot<-ggplot(data=dat, aes(x=Attendance, y=count, fill = (Attendance)))+
      geom_bar(stat="identity") + ylim(0, 1000)

    plot
    
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
    
  })
    
  output$featurePlot <- renderPlot({
    
    dat <- int
    for (word in input$var){
      dat <-int%>%
        filter(int[, as.numeric(word)] == "yes")
    }
     dat <- dat %>% group_by(Attendance) %>%
      summarise(count = n())
     
    percent <-dat$count[2]   / (dat$count[2]   + dat$count[1]  ) * 100 

    plot<-ggplot(data=dat, aes(x=Attendance[2], y=percent))+
      geom_bar(stat="identity", fill="#0072B2", colour="black") + ylim(0, 100)
    
    plot
    
  })
  
  output$attendence <- renderTable(  dat <- int%>%
                                       select(Attendance, Date) %>%
                                       filter(Date > input$daterange3[1] & Date <input$daterange3[2]) %>%
                                       group_by(Attendance) %>%
                                       summarise(count = n()))
})
