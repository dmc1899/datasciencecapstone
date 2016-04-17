library("R.utils")
library("stringi")

source("utils/Constant.R")
source("utils/Init.R")

GetLastWordInPhrase  <- function(phrase){
    # Extracts the last word in a sequence of words, specified as a phrase.
    # Returns:
    #   A character vector of one word.
    stopifnot (is.character (phrase))
    stopifnot (length (phrase) == 1)
    
    words <- SplitPhraseIntoWords(phrase)
    return(words [length (words)])
}

SplitPhraseIntoWords  <- function(phrase){
    # Deconstructs a sequence of words into separate words.
    # Returns:
    #   A character vector of seperate words.
    stopifnot (is.character (phrase))
    
    words <- unlist (strsplit (phrase, split = "[ ]+"))
    return(words [nchar (words) > 0])
}

RemoveLastWord  <- function(phrase){
    # Removes the last word in a sequence of words.
    # Returns:
    #   A character vector of one phrase, excluding the last word.
    stopifnot (is.character (phrase))
    stopifnot (length (phrase) == 1)
    
    words <- SplitPhraseIntoWords (phrase)
    
    wordsWithoutLastWord <- words [1:length (words)-1]
    
    phraseWithoutLastWord  <- paste(wordsWithoutLastWord, collapse = " ")
    return(phraseWithoutLastWord)
}


CleanPhrase  <- function(inputPhrase){
    tolower(stri_replace_all_regex(inputPhrase, nonStandardCharacters, c("")))
}