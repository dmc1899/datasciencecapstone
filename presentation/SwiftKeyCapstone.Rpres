Word Prediction Data Product
========================================================
author: Darragh McConville
date: 23/04/2016
SwiftKey Data Science Capstone
Introduction
========================================================

###### This slide deck describes the Word Prediction data product built as part of the SwiftKey Data Science Capstone within the Johns Hopkins Data Science Specialisation.  

### Purpose
###### The purpose of the data product (app) is to take a sequence of words and predict the next word to expedite the process of completing a sentence for the end user.

###### This deck will explain the process of fitting the model, making predictions and using the app.

### Links
- Source available from [https://github.com/dmc1899/datasciencecapstone](https://github.com/dmc1899/datasciencecapstone)
- Data Product available from [https://darraghmcconville.shinyapps.io/SwiftKeyCapstone/] (https://darraghmcconville.shinyapps.io/SwiftKeyCapstone/)

Fitting the Model
========================================================
### Data Sources
###### The US English blogs, tweets and news articles formed the basis of the model. A randon sample of 0.5% was taken from each

### Data Preparation
###### Profanities, special characters, email addresses and hyperlinks were all removed.

### Data Modelling
###### An n-gram model was created for values of n from 1 to 5.

### Context Segmentation
###### The previous n-1 words were segmented as a "context" and the nth word as the target word for prediction.

Fitting the Model (2)
========================================================
### Probability Calculation
###### For each n-gram model, the count of each target word was calculated and divided by the count of each unique context, resulting in a probability value. This technique is also known as the [MLE](https://en.wikipedia.org/wiki/Maximum_likelihood) or [maximum likelihood estimate](https://en.wikipedia.org/wiki/Maximum_likelihood).  

### Ranking
###### For each value of n, the target words were ordered from highest to lowest for each probability.

### Novel Continuation
###### For the unigram model values the [novel continuation](https://lagunita.stanford.edu/c4x/Engineering/CS-224N/asset/slp4.pdf) technique was applied to account for those target words which appear more frequently but only with specific bigram values.


Making Predictions
========================================================

### Stupid Backoff Technique
###### The input phrase specified by the user is truncated to the last four words. Those four words are used to match against a "context" value in the model, which was created using 5-gram quantity.  If found, the word with the higest probability is returned.

###### If not found, the model reduces the number of words to three and attempts to match against a "context" value in the model created using 4-gram quantity.  This process is repeated until a match is found.  

### Unknown Context
###### If a match is not found, the unigram value with the highest probability (adjusted using the Novel Coninuation technique) is returned.

Using the App
========================================================

### Instructions
###### The self-explanatory instructions are included on the LHS of the app main screen as shown below.  Simply enter your phrase, select the maximum number of words you want returned, click the Predict button and you will be presented with word options and a plot of probabilities.
![UI](Screenshot.png)
