# Exercise 1: Data Frame Practice

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the "fueleconomy" package
library(fueleconomy)

# You should now have access to the `vehicles` data.frame
View(vehicles)

# Select the different manufacturers (makes) of the cars in this data set.
makes <- vehicles$make

# Use the `unique()` function to determine how many different car manufacturers
# are represented by the data set.
length(unique(makes))

# Filter the data set for vehicles manufactured in 1997
vehicles.97 <- vehicles[vehicles$year == 1997, ]

# Arrange the 1997 cars by highway (`hwy`) gas milage
# Hint: use the `order()` function similar to how you would use the `max()` function.
# See also: https://www.r-bloggers.com/r-sorting-a-data-frame-by-the-contents-of-a-column/
vehicles.97 <- vehicles.97[order(vehicles.97$hwy), ]  # order the vehicles frame by hwy, get the frame, store it
vehicles.97

# Mutate the 1997 cars data frame to add a column `average` that has the average gas milage between
# city and highway for each car
vehicles.97$average <- (vehicles.97$hwy + vehicles.97$cty) / 2

# Filter the whole vehicles data set for 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
# Save this new data frame in a variable.
two.wheel <- vehicles[vehicles$drive == '2-Wheel Drive' & vehicles$cty > 20, ]
two.wheel

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
# Hint: filter for the worst vehicle, then select its ID.
worst.vehicle <- min(two.wheel$hwy)
worst.id <- two.wheel$id[two.wheel$hwy == worst.vehicle]

# Write a function that takes a `year` and a `make` as parameters,
# and returns the vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
# You'll need to filter more!
MostHwyMiles <- function(year, make) {
  vehicle.frame <- vehicles[vehicles$year == year & vehicles$make == make, ]
  most.hwy <- max(vehicle.frame$hwy)
  return(vehicle.frame[vehicle.frame$hwy == most.hwy, ])
}

# What was the most efficient honda model of 1995?
print(MostHwyMiles(1995, "Honda"))
