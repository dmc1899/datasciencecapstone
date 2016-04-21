library("shiny")
library("UsingR")
library("data.table")

initialiseApp  <- function(){
    source("utils/Prediction.R")
}

loadModel  <- function(){
    modelObject  <- readRDS("model/ngramModelObject") 
    return(modelObject)
}

delayPeriod  <- function(period){
    Sys.sleep(period)
}

ngramObjectModel  <- list()

shinyServer(
    function(input, output) {
        
        if (length(ngramObjectModel)==0){
            withProgress(message = 'Initialising', value = 0.1, {
                incProgress(amount  <- 0.2, message  <- "Loading libraries")
                initialiseApp()

                incProgress(amount  <- 0.2, message  <- "Loading model")
                modelObject  <- loadModel()
                incProgress(amount  <- 0.5, message  <- "Completed.")
                })   
        }
        predictions  <- data.table()       
                # Return the word prediction and create the probabilty bar chart on button press only.
                output$prediction <- renderText({
                    if (input$goButton == 0) ""
                    else {
                        isolate({
                            predictions  <- PredictNextWord(modelObject, {input$phrase}, {input$numWords})
                            
                            output$result  <- renderPlot({
                                if (input$goButton == 0) ""
                                else {
                                    isolate({
                                        barplot(predictions$probability, width = 1,  ,predictions$word, , , , , ,col  <- c("red", "pink", "orange", "yellow"), , main  <- "Word probability")
                                    })
                                }
                            })
                            predictions$word
                            })
                    }
                })
    }
)