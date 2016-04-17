source("utils/Model.R")

myModel  <- BuildModel(0.005, 1, 5, 6, "corpus", TRUE)
SaveModel(, myModel, "myNewmodel")

