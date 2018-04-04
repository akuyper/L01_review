### Review Lab (L01)
### Data Science III (STAT 301-3) - Spring 2018

# Load packages
library(tidyverse)
library(modelr)

# Read in data
wildfire_dat <- read_csv("data/wildfires.csv") %>%
  mutate(winddir = factor(winddir, levels = c("N", "NE", "E", "SE", "S", "SW", "W", "NW")),
         traffic = factor(traffic, levels = c("lo", "med", "hi")))

# Candidate models

# Model 1
mod01 <- function(df){
  lm(burned ~ . - wlf, data = df)
}

# Model 2
mod02 <- function(df){
  lm(burned ~ poly(windspd, 3) + poly(rain, 3) + poly(vulnerable, 3) + heli, data = df)
}

