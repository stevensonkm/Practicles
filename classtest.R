# 1
# File downloaded from blackboard into data frame
# missing content replaced with na

 ufo_data <- read.csv("ufo.csv", na = "")
# 2
# View the structure of data frame 
# and show the first 15 rows of data  
 
str(ufo_data)

head(ufo_data, 15)
# 3
# Change the date variable from chr to date 
# convert the date time variable to date variable 

converted_date <- as.Date(ufo_data$datetime, "%m/%d/%Y")
converted_date                      
str(converted_date)
# 4
# Update the new data frame with new structure 
# display the new structure of UFO data frame

ufo_data$datetime <- converted_date
converted_date
str(ufo_data)

# 5
# Update the variable names 
# duration..seconds. to DurationSeconds
# duration..hours.min.to DurationHrsMins
# date.posted to DatePosted

names(ufo_data)
names(ufo_data)[6] <- "DurationSeconds"
names(ufo_data)[7] <- "DurationHrsMins"
names(ufo_data)[9] <- "DatePosted"
names(ufo_data)


# 6 
# Recode the latitude variable from chr to numercal
# and show the structure of the variable 
 
 ufo_data$latitude <- as.numeric(ufo_data$latitude)
 str(ufo_data)

# 7 
# Install and use the mice package to show 
# missing variables in ufo_data frame
 
 install.packages("mice")
library(mice)
md.pattern(ufo_data)



# 8
# sort the data frame by shape and city
# Extract the columns datetime, city, country and shape
# and store it in data frame called sorted_ufo_data
# display the first 15 rows

attach(ufo_data)
sorted_data <- ufo_data[order(shape, city),]
sorted_data
include_list <- names(sorted_data) %in% c("datetime", "city", "country", "shape")
include_list  
sorted_ufo_data <- sorted_data
sorted_ufo_data
head(sorted_ufo_data, 15)

# 9 
# Find all the entries in df using the subset function 
# where country = gb, shape = disk
# store the contents in data frame ufo_gb_disk
attach(sorted_ufo_data)
ufo_gb_disk <- subset(sorted_ufo_data, country == "gb" & shape == "disk")
ufo_gb_disk

#10
# save the newly modified data frame as modified_ufo.csv using command write.csv 
# save the data frame ufo_gb_disk as ufo_gb.csv
write.csv(ufo_data, file = "sorted_ufo_data.csv")
write.csv(sorted_ufo_data, file = "ufo_gb_disk.csv")
write.csv(ufo_gb_disk, file = "ufo_gb.csv")
