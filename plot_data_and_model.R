#Script to plot data and model

growth_data <- read.csv("experiment.csv")
#adds in the data from the file and creates a funciotn for reading this data

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 879 # is the initial population size, so I extrapolated this at t=0 of the experiment.csv
  
r <- 0.009902 # based on the plot data

K <- 60000000000 #based on the plots in plot_data and the platueo on them

ggplot(aes(x=t,y=N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

  #scale_y_continuous(trans='log10')


