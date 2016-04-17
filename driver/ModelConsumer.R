source("utils/Prediction.R")

myModelName  <- "ngramModelObject"
myModel  <- RetrieveModel(, "ngramModelObject")                           
mySentence  <- "this is the best christmas"
myWordLimit  <- 5

myNextWords  <- PredictNextWord(myModel, mySentence, myWordLimit)
myNextWords$word                      