library("R.utils")

source("utils/Constant.R")
source("utils/Init.R")
source("utils/Word.R")

GetFileSizeToNearestMB  <- function(fullFileName){
    round(file.info(fullFileName)$size/1024^2,0)
}

GetNumberOfLinesInFile  <- function(fullFileName){
    countLines(fullFileName, 1024^2)[1]
}

GetNumberOfCharsInLongestLine  <- function(fullFileName){
    longestLineLength  <- 0
    
    con = file(fullFileName, readIndicator)
    while ( TRUE ) {
        line = readLines(con, n=1, warn = FALSE, encoding=utf8Encoding)
        
        if (length(line) == 0) {
            break
        }
        
        currentLineLength  <- nchar(line[1])
        if (currentLineLength > longestLineLength){
            longestLineLength  <- currentLineLength
        }
    }
    close(con)
    
    return(longestLineLength)
}

GetNumberOfLinesInFileContainingToken  <- function(fullFileName, caseSensitiveToken){
    beginningOfToken  <- "\\<"
    endOfToken  <- "\\>"
    numberOfLinesContainingToken  <- 0
    
    fullTokenOnly  <- paste(beginningOfToken, caseSensitiveToken, endOfToken, sep = "")
    
    con = file(fullFileName, readIndicator)
    while ( TRUE ) {
        line = readLines(con, n=1, warn = FALSE, encoding=utf8Encoding)
        
        if (length(line) == 0) {
            break
        }
        
        if (regexpr(fullTokenOnly,line) > 0){
            numberOfLinesContainingToken = numberOfLinesContainingToken + 1
        }
    }
    close(con)
    
    return(numberOfLinesContainingToken)
}

GetLinesInFileContainingToken  <- function(fullFileName, caseSensitiveToken){
    
    linesContainingToken  <- vector(mode="character")
    fullTokenOnly  <- paste(beginningOfToken, caseSensitiveToken, endOfToken, sep = "")
    
    con = file(fullFileName, readIndicator)
    while ( TRUE ) {
        line = readLines(con, n=1, warn = FALSE, encoding=utf8Encoding)
        
        if (length(line) == 0) {
            break
        }
        
        if (regexpr(fullTokenOnly,line) > 0){
            linesContainingToken  <- append(linesContainingToken,line)
        }
    }
    close(con)
    
    return(linesContainingToken)
}

DownloadFile  <- function(sourceFileUri, destinationDir){
    destinationFile  <- file.path(destinationDir, basename(sourceFileUri))
    download.file(url <- sourceFileUri, destfile = destinationFile, method='curl')
    return(destinationFile)
}

CreateRandomSampleFromFiles <- function (fileNames, percentageSampleSize, destinationDir) {
    # Creates a random sample from each of the specified filenames in the specified destination directory.
    
    #   The full path of the created directory.
    fullCorpusDir <- CreateSubDirectory(destinationDir)
    
    linesInCorpus  <- sapply(fileNames, GetNumberOfLinesInFile)
    linesInCorpus  <- append(linesInCorpus, round(linesInCorpus * percentageSampleSize, 0))
    
    # For each of the source text documents, create a new file containing a random sample of each.
    for (i in 1:length(fileNames))
    {
        con  <- file(fileNames[i], readIndicator)
        corpus  <-  readLines(con, n=-1L, warn = FALSE, encoding=utf8Encoding)
        close(con)
        
        sampleFileName  <- paste(basename(fileNames[i]), "_", i, sep="")
        randomCorpusSample  <- corpus[sample(1:linesInCorpus[i], linesInCorpus[length(fileNames)+i], replace = FALSE)]
        
        con  <- file(file.path(fullCorpusDir, sampleFileName), writeIndicator, encoding=utf8Encoding)
        writeLines(randomCorpusSample,con)
        close(con)  
    }
}

GetProfanityWords  <- function(sourceProfanityUri) {
    fullRefDataDir <- CreateSubDirectory(refDataDir)     
    
    requestedProfanityFile  <- file.path(fullRefDataDir, basename(sourceProfanityUri))
    
    if (!file.exists(requestedProfanityFile)){
        requestedProfanityFile  <- DownloadFile(sourceProfanityUri, downloadDir)
    }
    
    profanityFile <- file(requestedProfanityFile, open = "rb")
    profanities <- readLines(profanityFile, encoding = utf8Encoding, warn=FALSE, skipNul=TRUE)
    close(profanityFile) 
    
    return(profanities)
}

UncompressFiles  <- function(fileNames, destDirectory){
    for (thisFile in fileNames){
        unzip(thisFile, exdir = destDirectory, overwrite = TRUE)
    }
}