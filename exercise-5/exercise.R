# Exercise 5: DPLYR Grouped Operations

# Install the nycflights13 package and read it in. Require the dplyr package.
# install.packages("nycflights13")
library(nycflights13)
library(dplyr)


# In which month was the average departure delay the greatest?
# Hint: you'll have to perform a grouping operation before summarizing your data
avg.dep.delay <- flights %>% 
  group_by(month) %>% 
  summarize(mean = mean(dep_delay, na.rm = T)) 
filter(avg.dep.delay, mean == max(mean))
View(avg.dep.delay)


# If you create a data.frame with the columns "month", and "delay" above, you should be able to create
# a scatterplot by passing it to the 'plot' function
plot(avg.dep.delay)



# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation before summarizing your data
destinations <- flights %>% 
  group_by(dest) %>% 
  summarize(mean = mean(arr_delay, na.rm = T)) %>% 
  filter(mean == max(mean))

View(destinations)

# You can look up these airports in the `airports` data frame!


### Bonus ###
# Which city was flown to with the highest average speed?