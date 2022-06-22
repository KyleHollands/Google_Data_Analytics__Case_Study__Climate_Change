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

# Condense the data to only years, averaging AvgTemperature and AvgTemperatureUncertainty.
climate_data_condensed <- climate_data %>% 
    group_by(Country, Year = lubridate::floor_date(Date, "year")) %>%
    summarize(AvgTemperature = mean(AvgTemperature), AvgTemperatureUncertainty = mean(AvgTemperatureUncertainty))

glimpse(climate_data_condensed)
glimpse(climate_data)

View(climate_data_condensed)
head(climate_data_condensed)
tail(climate_data_condensed)

# Acquire only the average temperature per year, for all Countries.
climate_data_condensed_year <- climate_data_condensed %>%
  group_by(Year) %>%
  summarize(AvgTemperature = mean(AvgTemperature), AvgTemperatureUncertainty = mean(AvgTemperatureUncertainty))

View(climate_data_condensed_year)

# Calculate the difference between the max AVG temperature recorded per year and the average temperature (by Country)
(climate_data_condensed %>%
  group_by(Country) %>%
  summarize(AvgTemperature = mean(AvgTemperature), AvgTemperatureUncertainty = mean(AvgTemperatureUncertainty)))

(climate_data_condensed_year %>%
  group_by(Year) %>%
  summarize(AvgTemperature = mean(AvgTemperature), AvgTemperatureUncertainty = mean(AvgTemperatureUncertainty)))

# Look at which Countries have seen the largest increases.
largest_increases <- climate_data_condensed %>%
  group_by(Country) %>%
  summarize(LargestIncreases = max(AvgTemperature - mean(AvgTemperature)), TemperatureUncertainty = max(AvgTemperatureUncertainty - mean(AvgTemperatureUncertainty))) %>%
  filter(LargestIncreases > 2.5)

colnames(largest_increases)
glimpse(largest_increases)
View(largest_increases)

# Plot the global average temperature increase against average temperature uncertainties for the same period.
ggplot(climate_data_condensed_year,
       aes(x = Year)) +
  geom_line(aes(y = AvgTemperature, color = "AvgTemperature")) +
  geom_line(aes(y = AvgTemperatureUncertainty, color = "AvgTemperatureUncertainty")) +
  geom_smooth(aes(y = AvgTemperature), span = 0.175) +
  geom_smooth(aes(y = AvgTemperatureUncertainty), span = 0.175) +
  scale_color_manual(values = c(
    "AvgTemperature" = "red",
    "AvgTemperatureUncertainty" = "green")) +
  theme(legend.position = "bottom") +
  labs(
    color = "Legend",
    x = "Year",
    y = "Average Temperature",
    title = "Average Annual Global Temperature Increase"
  )

# Plot the countries with the largest average temperature increases.
ggplot(largest_increases, aes(y = Country, x = LargestIncreases)) +
  geom_col(aes(fill = TemperatureUncertainty)) +
  labs(
    x = "Largest Temperature Increases",
    y = "Country",
    title = "Largest Temperature Increases and Uncertainty",
    caption = "Data collected since 1743"
    ) +
    guides(fill=guide_legend("Temp. Change Uncertainty")) +
    theme_minimal() +
    theme(legend.position = "bottom")
