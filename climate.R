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
sapply(climate_change_metrics, function(x) sum(is.na(x)))

# Drop rows with NA's - In this case, the rows with NA's don't contain any other important metrics. 
climate_change_metrics <- na.omit(climate_change_metrics)

# Convert the date column from character to datetime values.
climate_change_metrics <- climate_change_metrics %>% 
  mutate(dt = ymd(dt))

# Rename some columns
names(climate_change_metrics) <- c("Date", "AverageTemperature", "AverageTemperatureUncertainty", "City", "Country", "Latitude", "Longitude")

test <- climate_change_metrics %>% 
    group_by(Country, year = lubridate::floor_date(Date, "year")) %>%
    summarize(AvgTemperature = mean(AverageTemperature), AvgTemperatureUncertainty = mean(AverageTemperatureUncertainty))

glimpse(test)
View(test)

# Calculate the difference between the max temperature recorded and the average temperature (by Country)
climate_change_metrics %>%
  group_by(Country) %>%
  summarize(max(AverageTemperature - mean(AverageTemperature)))

climate_change_metrics %>%
  group_by(Country) %>%
  summarize(max(AverageTemperatureUncertainty - mean(AverageTemperatureUncertainty)))

# Look at which Countries have seen the largest increases.
largest_increase <- climate_change_metrics %>%
  group_by(Country, Date) %>%
  summarize(max(Average Temperature - mean(Average Temperature)))

colnames(largest_increase)
glimpse(largest_increase)

ggplot(climate_change_metrics, aes(x = Date, y = AverageTemperature)) +
  geom_point() +
  geom_smooth(span = 0.3)

