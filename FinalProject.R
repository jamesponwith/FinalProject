# Final Project
#
# Analyze Suicide Rates Overview from 1985 - 2016
#
# This model aims to estimate the # of suicides based on the 11 other 
# variables in the dataset. 
# 

# Importing the dataset
dataset = read.csv('master.csv')

# Splitting the dataset into the Training set and Test set
#
# TODO: 
#       Need to seperate X and Y variables 
#       Convert Categorical Data to Numerical Data (age ranges)
#       Deal with the country data (have to scale solution below)
#       

# Encoding categorical data
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

library(caTools)
set.seed(123)
split = sample.split(dataset$suicides_no, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)




# STUFF BELOW DOESNT WORK 


# Fitting Multiple Linear Regression to the Training Set
regressor = lm(formula = suicides_no ~ ., 
               data = training_set) # Express independent variable as a linear combination of all dependent variables
# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

#
#
#
#
# Building the optimal model using Backward Elimination
#regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, 
#               data = dataset)
#summary(regressor)