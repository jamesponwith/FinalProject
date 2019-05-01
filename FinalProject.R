# Final Project
#
# Analyze Suicide Rates Overview from 1985 - 2016
#
# This model aims to estimate the # of suicides based on the 11 other 
# variables in the dataset. 
# 

# Importing the dataset
dataset = read.csv('master.csv')

# Create Dataframe to encode Country data
countries_col = dataset[1]
uni = unique(countries_col)
uni$ID <- seq.int(nrow(uni))

# Create Dataframe to encode Country data
age_col = dataset[4]
uni_age = unique(age_col)
uni_age$ID <- seq.int(nrow(uni_age))

# Create Dataframe to encode Sex data
sex_col = dataset[3]
uni_sex = unique(sex_col)
uni_sex$ID <- seq.int(nrow(uni_sex))

# Create Dataframe to encode Generation data
gen_col = dataset[12]
uni_gen = unique(gen_col)
uni_gen$ID <- seq.int(nrow(uni_gen))


# Splitting the dataset into the Training set and Test set
#
# TODO: 
#       Need to seperate X and Y variables 
#       Convert Categorical Data to Numerical Data (age ranges)
#       

# Encoding Categorical Data as Numerical Data

# Encode Country data (1-101)
dataset$country = factor(dataset$country,
                       levels = uni$country,
                       labels = uni$ID)

# Encode age ranges (1-6)
dataset$age = factor(dataset$age,
                         levels = uni_age$age,
                         labels = uni_age$ID)

dataset$sex = factor(dataset$sex,
                       levels = uni_sex$sex,
                       labels = uni_sex$ID)

dataset$generation = factor(dataset$generation,
                            levels = uni_gen$generation,
                            labels = uni_gen$ID)

dataset <- subset(dataset, select = -c(8, 9))

library(caTools)
set.seed(123)
split = sample.split(dataset$suicides_no, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)




# STUFF BELOW DOESNT WORK 

#####################################################################
#####################################################################
### DATA IS CLEAN BUT THE VARIABLES ARE WEIRD WHEN REGRESSOR IS BUILT
#####################################################################
#####################################################################

# Fitting Multiple Linear Regression to the Training Set
regressor = lm(formula = suicides_no ~.,
               data = training_set)
#regressor = lm(formula = suicides_no ~ country + year + sex + age + population + suicides.100k.pop + gdp_for_year.... + gdp_per_capita...., 
#               data = training_set) # Express independent variable as a linear combination of all dependent variables
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