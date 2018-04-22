library(shiny)
library(datasets)
# Use a fluid Bootstrap layout
fluidPage(Input() element(),
          Output() element(),
  
  # Give the page a title
  titlePanel("Lesson 1 - Homework"),
  

  sidebarLayout(
    # Sidebar with a slider input
    
    sidebarPanel( 
      sliderInput("obs","Number of observations:",
      min = 0,
      max = 1000,
      value = 500)

    ),
    
    
    mainPanel(
       plotOutput("distPlot")
       
    )
    
  )
)
