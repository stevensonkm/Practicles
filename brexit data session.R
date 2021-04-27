# Read the dataset first

brexit_data <- read.csv("data_brexit_referendum.csv", na = "")
brexit_data

# Examine the structure of the dataset
str(brexit_data)
class(brexit_data)
head(brexit_data, 5)

# count the number of values with "-1" in the leave column

leave_issue <- brexit_data(brexit_data['Leave']) == "-1")


nrow(brexit_data[brexit_data$Leave == -1,])
sum(brexit_data$Leave == -1)

# Replace these with NA
brexit_data$Leave[brexit_data$Leave == -1] <- NA

# verify the -1 values have been replaced
sum(brexit_data$Leave[brexit_data$Leave == -1])

# View the number of records with NA
# could use the complete case command
na_records <- brexit_data[!complete.cases(brexit_data),]

# count the number of records with NA
nrow(na_records)

# visualise the patterns of NA data 
# using Mice and Vim
library(mice)
md.pattern(brexit_data)
# VIM
library(VIM)
missing_values <- aggr(brexit_data, prop = FALSE, numbers = TRUE )
summary(missing_values)

# looking at the proportion of voters
# are in favour of leaving the EU
# to rremain or leave the EU
# Examine the proportion of leave and votes
brexit_data$Proportion <- brexit_data$Leave / brexit_data$NVotes



# create a new variable and figure out
# wheather each ward decided to leave or remain
# if proportion is < 0.5 = remain
# if proportion is > 0.5 = leave
brexit_data$Vote[brexit_data$Proportion <= 0.5] <- "Remain"
brexit_data$Vote[brexit_data$Proportion > 0.5] <- "Leave"
str(brexit_data)
# var is a chr so need to convert 
attach(brexit_data)
brexit_data$RegionName[RegionName == "London"] <- "L"
brexit_data$RegionName[RegionName == "North West"] <- "NW"
brexit_data$RegionName[RegionName == "North East "] <- "NE"
brexit_data$RegionName[RegionName == "South West"] <- "SW"
brexit_data$RegionName[RegionName == "South East"] <- "SE"
brexit_data$RegionName[RegionName == "East Midlands"] <- "EM"
brexit_data$RegionName[RegionName == "West Midlands"] <- "WM"
brexit_data$RegionName[RegionName == "East of England "] <- "EE"
brexit_data$RegionName[RegionName == "Yorkshire and the Humber"] <- "Y"
summary(brexit_data)

is.numeric(Proportion)
is.numeric(RegionName)

#
#

numerical_variable_list <- sapply(brexit_data, is.numeric)
class(numerical_variable_list)
numerical_variable_list

# we can use this logic to create the subset of data
numerical_data <- brexit_data[numerical_variable_list]
head(numerical_data, 5)

# Remove the ID field as it is of no benefit
# Remove from the numerical_variable_list
# We can assign "FALSE" to it
numeric_variable_list["ID"] <- FALSE


# We can use this logic to create a subset of the data again
# now that the ID field is removed
numerical_data <- brexit_data[numerical_variable_list]
head(numerical_data, 5)

# We can use the apply() function to retuen a list
# where each list member has a corresponding name
lapply(numerical_data, summary)

names(brexit_data)


















