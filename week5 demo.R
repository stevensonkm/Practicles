# Import the diabetes data frame
diabetes_data <- read.csv("diabetes.csv", na ="")
str(diabetes_data)


# check for missing variables. delete if there are any
# Examine missing data 
incomplete_data <- diabetes_data[!complete.cases(diabetes_data),]
incomplete_data

# diabetes_data$Status[diabetes_data$Status == ""] <- NA
# Install the mice package 

install.packages("mice")
library(mice)
md.pattern(diabetes_data)

library(VIM)
missing_values <- aggr(diabetes_data, prop = FALSE, numbers = TRUE)

# show the content of missing values
summary(missing_values)

# create a new variable called the data that contains 
diabetes_data$Date <- paste(diabetes_data$Month, diabetes_data$Year, sep='/')
str(diabetes_data)
                            

# change the date variable to the Date
# date has a particular requirement as it should contain
# day, month and year

# here is an example of an error 
converted_date <- as.Date(diabetes_data$Date, "%m/%Y")
converted_date
class(converted_date)

#diabetes_data$Date <- paste(diabetes_data$Month, diabetes_data$Year, "01", sep='/')

#diabetes_data$Date <- as.Date(diabetes_data$Date, format ="%m/%Y/%d")
#str(diabetes_data)

# this is how it is fixed
# the date would contaim dd/mm/yyyy
converted_date <- paste(diabetes_data$Month, diabetes_data$Year, sep = "/")
converted_date

# Add the element into the variable 
converted_date <- paste("01", diabetes_data$Month, diabetes_data$Year, sep = "/")
converted_date

diabetes_data$Date <- as.Date(converted_date, format ="%d/%m/%Y")
str(diabetes_data)

# plot the status variable using the plot() function
# convert to a factor first
# you could plot the summary() of the staus variable data

plot(diabetes_data$Status)
diabetes_data$Status <- factor(diabetes_data$Status)
str(diabetes_data)
plot(diabetes_data$Status)
summary(diabetes_data$Status)

# Add titles to the chart that are relevant.
attach(diabetes_data)
display_settings <- par(no.readonly = TRUE)
plot(Status, main = "Number of patient recoveries", xlab = "Diabetes status", ylab = "No of patients")

# save the modified daibetes data frame
write.csv(diabetes_data, file = "diabetes-data-modified.csv")












