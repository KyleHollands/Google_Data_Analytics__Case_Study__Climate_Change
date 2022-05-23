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

# Calculate the difference between the max temperature recorded and the average temperature (by Country)
climate_change_metrics %>%
  group_by(Country) %>%
  summarize(max(AverageTemperature - mean(AverageTemperature)))

# Calculate the difference between the max temperature recorded and the average temperature (by City)
climate_change_metrics %>%
  group_by(City) %>%
  summarize(max(AverageTemperature - mean(AverageTemperature)))

# Look at which Countries have seen the largest increases.
top_increases <- climate_change_metrics %>%
  group_by(Country) %>%
  summarize(max(AverageTemperature - mean(AverageTemperature)))

# Rename the summarize columns for readability.
names(top_increases) <- c("Country", "Top Increases")

top_increases %>%
  filter(`Top Increases` > 10)

View(top_increases)


