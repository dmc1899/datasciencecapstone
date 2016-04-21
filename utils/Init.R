library("data.table")
source("utils/Constant.R")

setJavaHeapSizeGB  <- function(heapSize){
    # This must be called before the Java-dependent libraries are loaded, such as RWeka.
    # Out-of-memory errors can be hard to identify and are often reported as "envir" errors, which are misleading.
    # Use the traceback() function to trace back through the call stack and identify if the Java Heap size is too small"
    # A more effective solution to increasing the heap size to 10GB would be to split up the corpus sentence by sentence
    # allowing Weka to perform n-gram tokenisation without requiring significant RAM resources.
    
    requestedHeapSize  <- paste("-Xmx", heapSize, "g", sep="")
    options( java.parameters = requestedHeapSize ) 
    
}

# LoadRequisiteLibraries  <- function(){
#     # Load the necessary supporting libraries.
#     library("shiny")
#     library("UsingR")
#     library("R.utils")
#     library("tm")
#     library("RWeka")
#     library("openNLP")
#     library("SnowballC")
#     library("stringi")
#     library("Rgraphviz")
#     library("markovchain")
#     library("plyr")
#     library("dplyr")
#     library("tidyr")
#     library("data.table")
# }

CreateSubDirectory <- function (directoryName) {
    # Creates a directory of the specified name within the current working directory.
    # Returns:
    #   The full path of the created directory.
    targetDirectory  <- file.path(getwd(), directoryName)
    if(!file.exists(targetDirectory)) {
        dir.create(targetDirectory, showWarnings = FALSE)
    }
    return(targetDirectory)
}