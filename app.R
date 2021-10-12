library(shiny)
library(ggplot2)

wine <- read.csv("wine.csv")
ui <- fluidPage(
  fluidRow(
    column(12,
           DT::dataTableOutput("table")
           )
  )
)

server <- function(input, output, session) {
  output$table <- DT::renderDataTable(wine, 
                                      filter = "top",
                                      options = list(pageLength = 5))
}

shinyApp(ui, server)