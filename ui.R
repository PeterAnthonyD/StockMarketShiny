#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Load packages ----
library(shiny)
library(quantmod)

# Source helpers ----
setwd("~/Documents/Rshiny/StockMarket-app/stockmarket")
source("helpers-2.R")

# User interface ----
ui <- fluidPage(
    titlePanel("stockVis"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Select a stock to examine.

        Information will be collected from Yahoo finance."),
            textInput("symb", "Symbol", "SPY"),
            
            dateRangeInput("dates",
                           "Date range",
                           start = "2013-01-01",
                           end = as.character(Sys.Date())),
            
            br(),
            br(),
            
            checkboxInput("log", "Plot y axis on log scale",
                          value = FALSE),
            
            checkboxInput("adjust",
                          "Adjust prices for inflation", value = FALSE)
        ),
        
        mainPanel(plotOutput("plot"))
    )
)
