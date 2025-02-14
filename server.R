#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Server logic
server <- function(input, output) {
    
    dataInput <- reactive({
        getSymbols(input$symb, src = "yahoo",
                   from = input$dates[1],
                   to = input$dates[2],
                   auto.assign = FALSE)
    })
    
    finalInput <- reactive({
        if (!input$adjust) return (dataInput())
        adjust(dataInput())
    })
    
    output$plot <- renderPlot({
        
        chartSeries(finalInput(), theme = chartTheme("white"),
                    type = "line", log.scale = input$log, TA = NULL)
    })
    
}