

# Define a server for the Shiny app
function(input, output) {
output$chart<-renderPlot(hist(runif(100)))
}
