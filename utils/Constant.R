hashtag  <- "#\\w+"
emailAddress  <- "(\\b\\S+\\@\\S+\\..{1,3}(\\s)?\\b)"
mentions  <- "@\\w+"
urls  <- "http[^[:space:]]*"
slashes  <- "/|@|\\|"
nonStandardCharacters  <- "[^A-Za-z0-9 ]+" # This does not seem to pick up the "è" character in a corpus, but does in a simple character vector.
specialChars  <- "[^\\p{L}\\s[']]+"
wordDelimiter  = ' \r\n\t.,;:\\"()?!'
neutralEncoding  <- c("unknown")
refDataDir  <- "data"
downloadDir  <- "data"
utf8Encoding  <- "UTF-8"
readIndicator  <- "r"
writeIndicator  <- "w"
