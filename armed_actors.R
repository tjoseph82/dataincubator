resources <- read.csv("C:/Users/TomJo/Desktop/R/resources.csv", header = TRUE)
library(countrycode) 
resources$sidea <- as.character(resources$sidea)
load(resources$sidea)
resources$continent <-countrycode(sourcevar = resources$sidea,
                            origin = "country.name",
                            destination = "continent")
table(resources$continent[resources$agriculture_extortion == 1])
extort <- as.data.frame(cbind(continent = resources$continent, sidea = resources$sidea,
               agriculture = resources$agriculture_extortion, animal = resources$animal_extortion,
                bauxtie = resources$bauxite_extortion, cannabis = resources$cannabis_extortion,
                cassiterite = resources$cassiterite_extortion, charcoal = resources$charcoal_extortion,
                coal = resources$coal_extortion, cobalt = resources$cobalt_extortion,
                coca = resources$coca_extortion, cocoa = resources$cocoa_extortion, 
                coffee = resources$coffee_extortion,  coltan = resources$coltan_extortion,
                copper = resources$copper_extortion))

extort[,3:15] <- sapply(extort[,3:15], as.integer)

table(extort[,3:15])
sapply(extort[,3:15], sum)

matrix <- as.data.frame(tapply(extort[,14], extort$continent, FUN = sum))


for (i in 3:15) {
    matrix<- as.data.frame(tapply(extort[,i], extort$continent, FUN = sum))
}

