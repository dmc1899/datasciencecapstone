library("shiny")
library("UsingR")

shinyUI(pageWithSidebar(

        headerPanel("Next Word Prediction"),
    
        sidebarPanel(
            helpText("1. Please enter your sentence below"),
            textInput("phrase", "Phrase:"),
            
            helpText("2. Limit the number of options returned. Please note that the number of returned words will be between 1 and the vaule you specifiy below."),
            numericInput('numWords', 'Limit to:', 4, min = 1, max = 4, step = 1),
            
            helpText("5. Press here to predict the next word in your sentence."),
            actionButton("goButton", "Predict Word")
        ),
        
        mainPanel(
            helpText("This data product allows you to predict the next word in the sentence you have entered.  Follow the steps on the left hand side to predict your next word."),
            h3('Predicted Word:'),
            verbatimTextOutput('prediction'),
            plotOutput("result")
        )
    )   
)