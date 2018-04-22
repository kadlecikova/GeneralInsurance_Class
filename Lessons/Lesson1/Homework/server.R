

# Define a server for the Shiny app
shinyServer(function(input, output, session) {
            output$uppercase <- renderText({
            toupper(input$message)
})
})
