library(shiny)
library(shinyWidgets)
library(plotly)
library(rsconnect)

# Define UI ----
ui <- fluidPage(
  
  setBackgroundColor(color = "#FFFFFF", gradient = c("linear"), direction = c("bottom"), shinydashboard = FALSE),
  
  # App title ----
  p("."),
  titlePanel("Tackling Obesity — Prioritizing the Risk Factors by Demographic"),
  p("."),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
  
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      tags$style(".well {background-color:#E8F3FF;}"),

      #titlePanel("Select:"),
      
      h4("Select demographic:"),
      
      radioButtons("radio-gender", "Gender", selected = "all", inline = FALSE,
                   choiceNames = list(
                     "Male",
                     "Female",
                     "All"
                   ),
                   choiceValues = list(
                     "male", "female", "all"
                   )),
      
      radioButtons("radio-age", "Age", selected = "18 - 24", inline = FALSE,
                   choiceNames = list(
                     "18 - 24",
                     "25 - 34",
                     "35 - 44",
                     "45 - 54",
                     "55 - 64",
                     "65 +"
                   ),
                   choiceValues = list(
                     "18 - 24",
                     "25 - 34",
                     "35 - 44",
                     "45 - 54",
                     "55 - 64",
                     "65 +"
                   )),
      
      radioButtons("radio-edu", "Education", selected = "1", inline = FALSE,
                   choiceNames = list(
                     "Less than High School",
                     "High School",
                     "Some College or Technical School",
                     "College"
                   ),
                   choiceValues = list(
                     "1","2","3","4"
                   )),
      
      
      #selectInput(inputId = "gender",
                  #label = "Choose gender:",
                  #choices = c("male", "female", "all")),
      
      #selectInput(inputId = "age",
                  #label = "Select HDI Range:",
                  #choices = c("0-3", "4-6", "7-10")),

    ),
      
    # Main panel for displaying outputs ----
    mainPanel(
      p(". "),
      h4("Obesity Rates with Real and Improved Scores for Eating and Exercise"),
      p(". "),
      p <- plot_ly(
        y = c("[5] <b>BASE OBESITY RATE</b> <br><i>(actual eating and</i> <br><i>exercise scores)</i> ", 
              "[4] Improved Exercise <br><i>(Next decile up)</i> ", 
              "[3] Improved Eating <br><i>(Next decile up)</i> ",
              "[2] Improved Eating and Exercise <br><i>(Both next decile up)</i> ",
              " Next Level Education <br><i>(base obesity of next</i> <br><i>most educated segment)</i> "),
        x = c(34, 33, 29, 30, 27),
        text = c("Predicted with Exercise 4/10 Eating 3/10", 
                 "Predicted with Exercise incrased to 5/10", 
                 "Predicted with Eating increased to 4/10", 
                 "Predicted with Eating increased to 4/10 and Exercise increased to 5/10",
                 "The obesity rate of the next most educated segment"),
        name = "Obesity",
        type = "bar",
        orientation = "h",
        marker = list(color = c('rgba(50, 50, 50 ,1)', 'rgba(222,45,38,1)',
                                'rgba(24,24,222,1)', 'rgba(154,24,204,1)',
                                'rgba(234,204,74,1)'))
      ) %>%
      
        layout(xaxis = list(title = "<br>Obesity Rate ( % )<br>"))
      # Output: Verbatim text for data summary ----
      #verbatimTextOutput("summary"),
      # Output: Histogram ----
      #plotOutput("hist"),
      #plotOutput("hist2")
    )
  ),
  p(". "),
  h4("CSML1000 York University Fall 2019 Final Project by Group 8"),
  h6("Haofeng Zhou, Peter Gray, Tamer Hanna, Xiaohai Lu"),
)

server <- function(input, output) {
    
    #output$hist <- renderPlot({
    #hist(rnorm(input$num))
      #hist(df$suicides.100k.pop)
    #})
    #output$hist2 <- renderPlot({
      #hist(-(df$HDI.for.year))
    #})
    
}

shinyApp(ui = ui, server = server)

