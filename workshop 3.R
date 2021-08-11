library(tidymodels)
library(skimr)
library(janitor)
library(tidyverse)

muffin_cupcake_data_original<-read.csv("https://raw.githubusercontent.com/adashofdata/muffin-cupcake/master/recipes_muffins_cupcakes.csv")

muffin_cupcake_data_original%>%skim()

#clean variables name 
muffin_cupcake_data<-muffin_cupcake_data_original%>%
  clean_names()

#splitting the data and splitting clean data set version training vs testing- internal structue
muffin_cupcake_data_split<-initial_split(muffin_cupcake_data)

#saving training and testing data sets
muffin_cupcake_data_training<-training(muffin_cupcake_data_split)

muffin_cupcake_data_testing<-testing(muffin_cupcake_data_split)


muffin_cupcake_data%>%count(type)

#create a recipe 

muffin_recipe<-recipe(type~flour+milk+sugar,  data = muffin_cupcake_data_training)

muffin_recipe_steps<-muffin_recipe%>%
  step_meanimpute(all_numeric())%>%
  step_center(all_numeric())%>%
  step_scale(all_numeric())

muffin_recipe_steps


#prep the recipe 

prepped_recipe<-prep(muffin_recipe_steps,training = muffin_cupcake_data_training)

#bake

muffin_train_preprocessed<-bake(prepped_recipe,muffin_cupcake_data_training)

muffin_testing_preprocessed<-bake(prepped_recipe,muffin_cupcake_data_testing)
