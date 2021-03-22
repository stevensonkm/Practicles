# ente datainto vectors before constructing the data frame
date_col <- c("10/15/18", "01/11/18", "10/21/18", "10/28/18", "05/01/18")
country_col <- c("US", "US", "IRL", "IRL", "IRL")
gender_col <- c("M", "F", "F", "M", "F")
age_col <- c(32, 45, 25, 39, 99)
q1_col <- c(5, 3, 3, 3, 2)
q2_col <- c(4, 5, 5, 3, 2)
q3_col <- c(5, 2, 5, 4, 1)
q4_col <- c(5, 5, 5, NA, 2)
q5_col <- c(5, 5, 2, NA, 1)

#construct a data frame using the data from all the vectors
managers_data <- data.frame(date_col, 
                            country_col,
                            gender_col,
                            age_col,
                            q1_col,
                            q2_col,
                            q3_col,
                            q4_col,
                            q5_col)
managers_data

column_names <- c("Date",
                  "Country",
                  "Gender",
                  "Age",
                  "Q1",
                  "Q2",
                  "Q3",
                  "Q4",
                  "Q5")
# Add column names to the managers_data data frame
colnames(managers_data) <- column_names

managers_data

# Recode the incorrect 'age' to NA
managers_data$Age[managers_data$Age == 99] <- NA
managers_data

# 2 options to create a new variable 
# 1 - create a new vector and store the logical check in it
# 2 - create a new variable when doing the logical check 


managers_data$AgeCat[managers_data$Age >= 45] <-"Elder"
managers_data$AgeCat[managers_data$Age >= 26 & managers_data$Age <= 44] <- "Middle Aged"
managers_data$AgeCat[managers_data$Age <= 25] <- "Young"
managers_data$AgeCat[is.na(managers_data$Age)] <- "Elder"
managers_data

# recode age_cat so that it is ordinal and factored
# with the order younf, middle aged, elder

age_cat <- factor(managers_data$AgeCat, order = TRUE, levels = c("Young", "Middle Aged", "Elder"))
age_cat

# replace manager_data age_cat variable with
# factored variable

managers_data$AgeCat <-age_cat
managers_data
 

# look at the structure of data frame
str(managers_data)
managers_data

# create a new col called summery_col that
# contains a summery of each row

summery_col <- managers_data$Q1 +
               managers_data$Q2 + 
               managers_data$Q3 + 
               managers_data$Q4 + 
               managers_data$Q5
summery_col

# Add summery_col to the end of the data frame
# Take content of the data frame,create a new data frame
# and add summery_col vector to the data frame

managers_data <- data.frame(managers_data, summery_col)
managers_data                        
# calculate mean value for each row
mean_value <- rowMeans(managers_data[5:9])
mean_value

# Add the mean value vector to the data frame

managers_data <- data.frame(managers_data, mean_value)
managers_data

# Change variable title to more readable
names(managers_data)[11] <- "Summary"
names(managers_data)[12] <- "Mean value"

# Show the structure of data frame
str(managers_data)
managers_data

# convert current date chr variable to a date type var
# Currently using dd/mm/yy
managers_data$Date
converted_date <- as.Date(managers_data$Date, "%m/%d/%y")
converted_date
str(converted_date)


# overwrite the current date variable with the new date var
# in the managers data farme
managers_data$Date <- converted_date
str(managers_data)
managers_data

# Dealing with the missing data

# Likewise deletion = remove any rows that contains NA
new_managers_data <- na.omit(managers_data)
new_managers_data

# Use complee.cases
complete_managers_data <- complete.cases(managers_data)
complete_managers_data
sum(complete_managers_data)

# List the rows that do not have missing values
complete_managers_data <- managers_data[complete.cases(managers_data),]
complete_managers_data

# List rows with missing values
managers_data[!complete.cases(managers_data),]

# Show the summary of missing values in a variable
sum(is.na(managers_data$Age))
sum(is.na(managers_data$`Mean value`))

# Install and use the mice package to show 
# missing var in the managers data frame
install.packages("mice")
library(mice)
md.pattern(managers_data)

# Vim package can also show missing values
install.packages("VIM")
library(VIM)
missing_values <- aggr(managers_data, prop = FALSE, number = TRUE)

# show the summery of the content of the missing_values
summary(missing_values)

