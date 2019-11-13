# Shiny App for CSML1000 Fall 2019 Group 8

# Tackling Obesity — Prioritizing the Risk Factors by Demographic

# deployed at https://ptgray.shinyapps.io/project/ Nov 13 2019

library(shiny)
library(shinyWidgets)
library(plotly)
library(rsconnect)

# Define UI ----

ui <- fluidPage(
  
  tags$head(tags$script(src = "message-handler.js")),
  
  setBackgroundColor(color = "#FFFFFF", gradient = c("linear"), direction = c("bottom"), shinydashboard = FALSE),
  
  # App title ----
  
  p("."), 
  # The layouts are so tight! And so hard to add blank space! These rogue periods may not be perfect, but they help it 'breathe'...
  
  titlePanel("Tackling Obesity — Prioritizing the Risk Factors by Demographic"),
  p("."),
  
  # Sidebar layout with input and output definitions ----
  
  sidebarLayout(
  
    # Sidebar panel for inputs ----
    
    sidebarPanel(
      
      tags$style(".well {background-color:#E8F3FF;}"),
      
      h4("Select demographic:"),
      
      # radio buttons for inputs, excellent visibility and usability given the inputs we're using.
      
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
      
      actionButton("dont", "Get Predictions"),

    ),
      
    # Main panel for displaying outputs ----
    
    mainPanel(
      
      p(". "),
      h4("Obesity Rates with Real and Improved Scores for Eating and Exercise"),
      p(". "),
      
      p <- plot_ly(
        
        # Labels for bars, formatted for clean look and easy reading
        y = c("<sup>5</sup> <b>Base Obesity Rate</b> <br><i>(actual eating and</i> <br><i>exercise scores)</i> ", 
              "<sup>4</sup> Improved <b>Exercise</b> <br><i>(Next decile up)</i> ", 
              "<sup>3</sup> Improved <b>Eating</b> <br><i>(Next decile up)</i> ",
              "<sup>2</sup> Improved <b>Eating and Exercise</b> <br><i>(Both next decile up)</i> ",
              "<sup>1</sup> Next Level <b>Education</b> <br><i>(base obesity of next</i> <br><i>most educated segment)</i> "),
        
        # Sample data gleaned for our Exploration of the Data
        x = c(34, 33, 29, 30, 27),
        
        # Extra information appears on bars when user hovers:
        text = c("Predicted with Exercise 4/10 Eating 3/10", 
                 "Predicted with Exercise increased to 5/10", 
                 "Predicted with Eating increased to 4/10", 
                 "Predicted with Eating increased to 4/10 and Exercise increased to 5/10",
                 "The obesity rate of the next most educated segment using actual Eating and Exercise values"),
        name = "Obesity",
        type = "bar",
        
        # horizontal bars. To accommodate larger labels, and because vertical bars seem to confuse obesity rate with height.
        orientation = "h",
        
        # colours of bars
        marker = list(color = c('rgba(50, 50, 50 ,1)', 'rgba(222,45,38,1)',
                                'rgba(24,24,222,1)', 'rgba(154,24,204,1)',
                                'rgba(234,204,74,1)'))
      ) %>%
      
        layout(xaxis = list(title = "<br><b>Obesity Rate ( % )<b><br>"))

    )
  ),
  
  p(". "),
  
  h4("CSML1000 York University Fall 2019 Final Project by Group 8"),
  
  h6("Haofeng Zhou, Peter Gray, Tamer Hanna, Xiaohai Lu"),
)

server <- function(input, output) {
  
  observeEvent(input$do, {
    session$sendCustomMessage(type = 'testmessage',
                              message = 'Thank you for clicking')
  })
    
  # Data Science is a Team Sport.
  
  # We hope you enjoy our thoughtful, interpretable, and aesthetically pleasing user interface.
  
  # To the best of our abilities, it reflects the Real-World Problem we are trying to Solve,
  # (as outlined in the markdown), it provides a simple enough experience that anyone could use and
  # interpret it, and that our sample output is reasonably reflective of what was discovered in our 
  # Exploration of the Data (in the markdown).
  
  # One subject for debate — does making the bars different colours influence people's interpretations?
  # In the name of Science, they should probably all be the same colour. Picking colours for the bars is
  # the moral and ethical equivalent of "card forcing" https://rebelmagic.com/card-tricks/forces/
  
  # The reason we chose to use colours was simply that "People Like Shiny Things". Pun thoroughly intended.

}

shinyApp(ui = ui, server = server)
