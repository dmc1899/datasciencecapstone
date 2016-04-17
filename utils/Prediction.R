source("utils/Constant.R")
source("utils/Word.R")

PredictNextWord <- function (nGramModelWrapper, inputText, numberOfWordsRequired) {
    termProbabilityTable  <- nGramModelWrapper$nGramModel
    largestValueOfN  <- nGramModelWrapper$maxN
    largestContextSize  <- largestValueOfN -1
    
    cleanedInputWords  <- SplitPhraseIntoWords(CleanPhrase(inputText))
    numberOfInputWords  <- length(cleanedInputWords)
    
    found  <- FALSE
    for (numWordsInModelContext in largestContextSize:1){
        if(numberOfInputWords >= numWordsInModelContext){
            inputWordsContext  <- paste(tail(cleanedInputWords, numWordsInModelContext), collapse = " ")
            foundWords  <- termProbabilityTable[ context == inputWordsContext ]
            if (nrow(foundWords) > 0){
                found  <- TRUE
                break
            }
        }
    }
    
    if (!found){
        foundWords  <- termProbabilityTable[ gram == 1 ]
    }
    return(foundWords[order(rank)][rank <= numberOfWordsRequired])
}