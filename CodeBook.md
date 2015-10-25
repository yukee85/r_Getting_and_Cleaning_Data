---
title: "CodeBook"
author: "Julio Chong"
date: "October 21, 2015"
output: html_document
---

<h1> Getting and Cleaning Data Project </h1>
=========================================================
<h2>Source Data </h2>

Data from teh Human Activity Recognition Using Smartphones Data Set
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

The following is the description of the data set and data collection methodology
from the web page link above:
```
'The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.'
```
<h2> Variable Description </h2>

The variables collected are mostly 3-D measurements (thus including X, Y, and Z
axis measurements) for both a time and frequency variables and their descriptive
statistical description:

* Body Acceleration
* Gravity Acceleration
* Body Acceleration Jerk
* Body Gyro Direction
* Body Gyro Jerk
* Body Gyro Jerk Magnitude
* Angle of the above metrics

<h2> Variable Transformations </h2>

The following are the transformations done on the data:

1. Data is read from the test and training data sets.
2. There are three files that are loaded for each the training and test sets:
- X file containing the measurements.
- Y file containing the activity 
- Subject file containing the subject number 
3. For the test set, the tree files are then merged into a single file. Same for the training data set.
4. Variables for measurement's medians and standard deviations are extracted.
5. A new data set is created tidying the data by subject and activity.
6. The median by subject and activity is calculated for the different variables extracted.
7. New data set is saved. 



