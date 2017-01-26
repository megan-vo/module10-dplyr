#Use "dplyr" 
#Install.packages("dplyr")
install.packages("dplyr")
library("dplyr")


#Load in SwissData from data set from data folder and view it to understand what is in it. 
swiss.data <- read.csv('data/SwissData.csv', stringsAsFactors = F)
View(swiss.data)

#Add a column (using dpylr) that is the absolute difference between Education and Examination and call it 
# Educated.Score
swiss.data <- mutate(swiss.data, Educated.Score = abs(Education - Examination))

#Which area(s) had the largest difference 
filtered.diff <- filter(swiss.data, Educated.Score == max(Educated.Score))
area <- select(filtered.diff, Region)
area

#Find which region has the highest percent of men in agriculture and retunr only the 
#percent and region name.  Use pipe operators to accomplish this. 
filtered.men <- filter(swiss.data, Agriculture == max(Agriculture)) %>%
                select(Region, Agriculture)
filtered.men


#Find the average of all infant.mortality rates and create a column (Mortality.Difference)
# showing the difference between a regions mortality rate and the mean. Arrange the dataframe in 
# Descending order based on this new column. Use pipe operators.
swiss.data <- mutate(swiss.data, Mortality.Difference = mean(Infant.Mortality) - Infant.Mortality) %>% 
              arrange(-Mortality.Difference)  # no need to have swiss.data b/c piped in


# Create a new data frame that only is that of regions that have a Infant mortality rate less than the 
# mean.  Have this data frame only have the regions name, education and mortality rate. 
infant.frame <- filter(swiss.data, Mortality.Difference > 0) %>% 
                select(Region, Education, Infant.Mortality)
infant.frame


#Filter one of the columns based on a question that you may have (which regions have a higher
#education rate, etc.) and write that to a csv file
            filter(swiss.data, Educated.Score > 10) %>% 
              select(Region, Educated.Score, Infant.Mortality) %>% 
              write.csv("data/educated_score.csv")

# Create a function that can take in two different region names and compare them based on a statistic 
# Of your choice (education, Examination, ect.)  print out a statment describing which one is greater 
# and return a data frame that holds the selected region and the compared variable.  If your feeling adventurous
# also have your function write to a csv file.
FertilityCompare <- function(region1, region2) {
  
}






