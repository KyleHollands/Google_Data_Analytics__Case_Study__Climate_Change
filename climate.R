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
climate_data <- read.csv("./Datasets/Original CSV/GlobalLandTemperaturesByCity.csv")

# Inspect the dataset
colnames(climate_data)
glimpse(climate_data)
nrow(climate_data)
dim(climate_data)
head(climate_data)
tail(climate_data)
summary(climate_data)
str(climate_data)
View(climate_data)

# Check for NA's
sapply(climate_data, function(x) sum(is.na(x)))

# Drop rows with NA's - In this case, the rows with NA's don't contain any other important metrics. 
climate_data <- na.omit(climate_data)
sapply(climate_data, function(x) sum(is.na(x)))

# Convert the date column from character to datetime values.
climate_data <- climate_data %>% 
  mutate(dt = ymd(dt))

# Rename some columns
names(climate_data) <- c("Date", "AvgTemperature", "AvgTemperatureUncertainty", "City", "Country", "Latitude", "Longitude")

# Condense the data to only years.
climate_data_condensed <- climate_data %>% 
    group_by(Country, Year = lubridate::floor_date(Date, "year")) %>%
    summarize(AvgTemperature = mean(AvgTemperature), AvgTemperatureUncertainty = mean(AvgTemperatureUncertainty))

glimpse(climate_data_condensed)

View(climate_data_condensed)
head(climate_data_condensed)
tail(climate_data_condensed)

# Acquire only the average temperature per year, for all Countries.
climate_data_condensed_two <- climate_data_condensed %>%
  group_by(Year) %>%
  summarize(AvgTemperature = mean(AvgTemperature), AvgTemperatureUncertainty = mean(AvgTemperatureUncertainty))

View(climate_data_condensed_two)

# Calculate the difference between the max AVG temperature recorded per year and the average temperature (by Country)
(climate_data_condensed %>%
  group_by(Country) %>%
  summarize(AvgTemperature = mean(AvgTemperature), AvgTemperatureUncertainty = mean(AvgTemperatureUncertainty)))

(climate_data_condensed_two %>%
  group_by(Year) %>%
  summarize(AvgTemperature = mean(AvgTemperature), AvgTemperatureUncertainty = mean(AvgTemperatureUncertainty)))

# Look at which Countries have seen the largest increases.
largest_increases <- climate_data_condensed %>%
  group_by(Country) %>%
  summarize(LargestIncreases = max(AvgTemperature - mean(AvgTemperature)), LargestUncertainties = max(AvgTemperatureUncertainty - mean(AvgTemperatureUncertainty))) %>%
  filter(LargestIncreases > 3)

colnames(largest_increases)
glimpse(largest_increases)
View(largest_increases)

ggplot(climate_data_condensed_two,
       aes(x = Year)) +
  geom_line(aes(y = AvgTemperature), color = "red") +
  geom_line(aes(y = AvgTemperatureUncertainty), color = "green", linetype = "twodash") +
  labs(
    x = "Year",
    y = "Average Temperature Over Year",
    title = "Amounts of Lending Club Loans"
  )
