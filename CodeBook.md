---
title: "CodeBook"
author: "Julio Chong"
date: "October 21, 2015"
output: html_document
---

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r}
summary(cars)
```

You can also embed plots, for example:

```{r, echo=FALSE}
plot(cars)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.



<li>a tidy data set as described below, 
<li>a link to a Github repository with your script for performing the analysis, and 
<li>a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

<li>Merges the training and the test sets to create one data set.
<li>Extracts only the measurements on the mean and standard deviation for each measurement. 
<li>Uses descriptive activity names to name the activities in the data set
<li>Appropriately labels the data set with descriptive variable names. 
<li>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

