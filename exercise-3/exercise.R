# Exercise 3: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1


# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)

# Which Acura model has the best hwy MPG in 2015? (without method chaining)
best.hwy.2015 <- filter(vehicles, year == 2015)
acura.2015 <- filter(best.hwy.2015, make == 'Acura')
acura.2015.hwy.mpg <- acura.2015$model[acura.2015$hwy == max(acura.2015$hwy)]

# Which Accura model has the best hwy MPG in 2015? (nesting functions)
filter(filter(vehicles, year == 2015), make == 'Acura')$model[filter(filter(vehicles, year == 2015), make == 'Acura')$hwy == max(filter(filter(vehicles, year == 2015), make == 'Acura')$hwy)]

# Which Accura model has the best hwy MPG in 2015? (pipe operator)
acura.2015.hwy.mpg <- filter(vehicles, year == 2015, make == 'Acura') %>%
                      filter(hwy == max(hwy)) %>%
                      select(model)

### Bonus ###

# Write 3 functions, one for each approach.  Then, 
# Test how long it takes to perform each one 1000 times
