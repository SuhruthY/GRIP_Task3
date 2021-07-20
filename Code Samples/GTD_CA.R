# Loading the necessary  libraries
library(dplyr) # data manupulation library
library(reshape2) # used to reshaping the data
library(ca) # to perform correspondance analysis 

##################--- UTILITY FUNCTION ---############################
names <- c("1-2", "3-9", "10-29" ,">=30") # creating a vector of fatality levels
# creating a fucntion to  perform CA
simple_ca <- function(df, formula) {
  
  regCT <- dcast(df, formula) # dcasting the data by provided formula
  
  regCT[is.na(regCT)] <- 0 # assigning null a zero value
  
  fit <- ca(regCT[, names]) # performing the CA
  
  tmp <- data.frame(name=regCT$txt,chsqdist=fit$rowdist, fit$rowcoord,
                    inertia=fit$rowinertia) # creating a dataframe of necessary  values
  
  tmp2 <- data.frame(name=c("Very High" ,"Very Low", "High", "Low"),
                     chsqdist=fit$coldist, fit$colcoord, inertia=fit$colinertia) # getting the CA values
  
  
  tmp3 <- rbind(tmp, tmp2) # row binding the dataframes
  
  plot(fit) # plotting the cA
  
  return(tmp3) # returning the required data
}
#########################################################################

## LOADING AND SUBSETTING DATA
regDf <- read.csv("../../data/sub_data/Fatality Freq by Region.csv") # loading the region data
names(regDf) <- c("txt", "Region", "FatalityLevel", "Count") # assigning custom colnames
 
head(regDf) # printing the 1st few rows

## Performing Correspondance Analysis
rfDf <- simple_ca(regDf, Region+txt~FatalityLevel) # performing CA
head(rfDf) # printing the 1st few rows
write.csv(rfDf, "../../data/sub_data/CA.xlsx") #saving it to a csv

# CA on  country data
cntryDf <- read.csv("../../data/sub_data/Fatality Freq by Country.csv") #loading the country data
names(cntryDf) <- c("txt", "Country", "FatalityLevel", "Count") # naming the columns
head(cntryDf) # prinitng the 1st few rows
cfDf <- simple_ca(cntryDf, Country+txt~FatalityLevel) # performing CA
head(cfDf) # printing the 1st few rows

