# Load the required libraries and set options
library(tidyverse)
library(janitor)
library(readr)
library(tidyr)
library(chron)
library(dplyr)
library(readr)
library(lubridate)
library(ggridges)
library(directlabels)
options("scipen"=10)

# Import the dataset
climate_change_metrics <- read.csv("./Datasets/Original CSV/GlobalLandTemperaturesByCity.csv")

# Inspect the dataset
colnames(climate_change_metrics)
glimpse(climate_change_metrics)
nrow(climate_change_metrics)
dim(climate_change_metrics)
head(climate_change_metrics)
tail(climate_change_metrics)
summary(climate_change_metrics)
str(climate_change_metrics)
View(climate_change_metrics)

# Check for NA's
sapply(climate_change_metrics, function(x) sum(is.na(x))) # There are no N/A's within the data.

# Drop rows with NA's - In this case, the rows with NA's don't contain any other important metrics.
climate_change_metrics = na.omit(climate_change_metrics)

climate_change_metrics %>%
  summarize(min_avg_temp = min(AverageTemperature),
            max_avg_temp = max(AverageTemperature))
            
