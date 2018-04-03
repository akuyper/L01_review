# Load packages
library(tidyverse)
library(modelr)

# Read in data
wildfire_dat <- read_csv("data/wildfires.csv")

# Models to examine
# Model 1
mod01 <- function(df){
  lm(burned ~ . - wlf, data = df)
}

# Model 2
mod02 <- function(df){
  lm(burned ~ poly(windspd, 3) + poly(rain, 3) + poly(vulnerable, 3) + heli, data = df)
}

