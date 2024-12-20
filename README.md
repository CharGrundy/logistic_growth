1)
OVERVIEW:
  This repo contains the analysis fo logistic growth in a test tube of Escherichia Coli. 

DATA USED:
  Contained within the experiment.csv

VALUES OF INITIAL POPULATION, GROWTH RATE AND CARRYING CAPACITY:
  N0 = 879 
  
  r = 0.009902

  K = 60000000000

RESULTS:
INITIAL POPULATION-
  The initial population would be the population at t=0. This is easily extrapolated from going into the experiment.csv as the first data point is at t=0. Therefore, N0 must equal 879.

CARRYING CAPACITY (K)-
  The carrying capacity can be found after making the first geom_point scatterplot in plot_data. The data quite clearly shows a plateau at the 6e+10 mark. A plateau   would indicate the bacterial colony can no longer grow in the test tube and has met its largest possible population within the environment. Therefore, the carrying capacity of the colony can be estimated at 60000000000 (.

GROWTH RATE (r)-
  The growth rate is more complicated to find. Using a combination of data_subset1 and the linearisation of model1, we can find the growth rate. Data_subset1 is set at t=1800 within the range of time when the growth rate is at its maximum. Model 1 uses log_N as this produces a linear model where the slope represents r. Otherwise, the model would not be linear it would be exponential. Therefore, by finding the slope of model1 we can find that r=0.00902.

RESULT METHODOLOGY:
  This is all based on the logistic growth model:
  Early growth phase - between the range of t=0 to t=2000 the growth is exponential. This is only because the carrying capacity is greter than the population (N<K).
.  Stabilisation/plateau phase - after t=2500 the population no longer grows at all as the carrying capacity has been reached (N=K). N has converged on K.
  
CONCLUSION:
Logistic models are extremely important for modelling species that are finite on resources.

2)
0.009902×4980=
49.31196

N=879 x e(49.31196)
N=2.2903454685758348e+24

N equals approximately 2.29×10^24

K is approximately 6.00x10^10

The difference between the two values is pretty great. Under logistic growth the population is restricted to K which is the maximum population sustainable. N is the product of only exponential growth. In comparison N is 3.82×10^13 greater than K. Even given infinite time K woudl not change.

3)
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

  ![image](https://github.com/user-attachments/assets/06399a16-a032-484e-a3fc-dd52117f7eed)




