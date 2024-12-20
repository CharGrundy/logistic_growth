#install.packages(ggplot2)
#install.packages(dplyr)

library(ggplot2)

library(dplyr)

growth_data <- read.csv("experiment.csv")

filtered_data <- growth_data %>%
  filter(t <= 1980)


N0 <- 879 

r <- 0.009902 

K <- 60000000000 


#functions to implement the logistic equations into this model

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}


exponential_fun <- function(t) {
  
  N <- (N0*exp(r*t))
  
  return(N)
  
}

#plot of the model

ggplot(aes(x=t,y=N), data = filtered_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  geom_function(fun=exponential_fun, colour="blue") +
  
  geom_point()