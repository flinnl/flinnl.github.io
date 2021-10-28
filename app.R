library(shiny)
library(ggplot2)

wine <- read.csv("wine.csv", stringsAsFactors = FALSE)

ui = fluidPage(
  
  title = 'Select Table Rows',
  
  h1('A Client-side Table'),
  
  fluidRow(
    column(6, DT::dataTableOutput('x1')),
    column(6, plotOutput('x2', height = 500))
  ),
  
  hr(),
  
  h1('A Server-side Table'),
  
  fluidRow(
    column(9, DT::dataTableOutput('x3')),
    column(3, verbatimTextOutput('x4'))
  )
  
)

server = function(input, output, session){
  
}


shinyApp(ui, server)




# d1 <- wine
# ui <- fluidPage(
#   titlePanel("wine"),
#   
#   mainPanel(
#     tabsetPanel(
#       id = 'Apt',
#       tabPanel("Apt", 
#                
#                DT::dataTableOutput("table"), #banking.df_data
#                br(),
#                actionButton("saveBtn","Save"),
#                br(),
#                actionButton("viewBtn","View"),
#                br(),
#                DT::dataTableOutput("updated.df")
#       ))))
# 
# server <- function(input, output, session) {
#   output$table <- DT::renderDataTable(d1,
#                                       selection = 'none',
#                                       editable = TRUE,
#                                       #rownames = TRUE,
#                                       extensions = 'Buttons',
#                                       #filter = "top",
#                                       options = list(paging = TRUE,
#                                                      searching = TRUE,
#                                                      fixedColumns = TRUE,
#                                                      autoWidth = TRUE,
#                                                      ordering = TRUE,
#                                                      dom = 'Bfrtip',
#                                                      buttons = c('csv', 'excel')),
#                                       #rownames = FALSE ,
#                                       class = 'display')
# 
#   observeEvent(input$table_cell_edit, {
#     d1[input$table_cell_edit$row,input$table_cell_edit$col] <<- input$table_cell_edit$value
#   })
#   
#   view_fun<-eventReactive(input$viewBtn,{
#     if(is.null(input$saveBtn)||input$saveBtn==0)
#     {
#       returnValue()
#     }
#     else
#     {
#       DT::datatable(d1,selection = 'none')
#     }
#     
#   })
#   
#   
#   observeEvent(input$saveBtn,{
#     write.csv(d1,'wine.csv')
#   })
#   
#   output$updated.df<-renderDataTable({
#     view_fun()
#   }
#   ) 
#   
# }
# 
# shinyApp(ui, server)