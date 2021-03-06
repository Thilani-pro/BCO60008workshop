#install.packages("MASS")
#install.packages("ISLR")

library(tidyverse)
library(tidymodels)
library(MASS)
library(ISLR)

set.seed(123)

#1-specify the model- have to put type, mode and engine.
lm.spec<-linear_reg()%>%
  set_mode("regression")%>%
  set_engine("lm")

data(Boston)

#2-Take model specification from step 1 and apply to your data; use "fit" and put formula y~x

lm_fit<-lm.spec%>%
  fit(data=Boston, medv~lstat)

lm_fit

lm_fit%>%pluck("fit")%>%
  summary()

tidy(lm_fit)

#3-when we use fitted model from step 2 to predict new "y" in new data
predict(lm_fit, new_data = Boston)

#examining new predicted values
final_model<-augment(lm_fit, new_data = Boston)

rm(list=ls())

data(Boston)

#1
model_spec<-linear_reg()%>%
  set_mode("regression")%>%
  set_engine("lm")

#2

model_fit<-model_spec%>%fit(data=Boston, medv~age+crim+rm)

#3

#model_predicted<-predict(model_fit, new_data=Boston)

model_predicted_augment<-augment(model_fit, new_data = Boston)




rm(list=ls())

data(Boston)

#1

model_lm_spec<-linear_reg()%>%
  set_mode("regression")%>%
  set_engine("lm")


model_rf_spec<-rand_forest()%>%
  set_mode("regression")%>%
  set_engine("ranger")

@install.packages("ranger")
library(ranger)

#2

model_lm_fit<-model_lm_spec%>%
  fit(data=Boston, medv~.)

#3
model_lm_augm<-augment(model_lm_fit, new_data=Boston)



#Iris dataset
data(iris)


