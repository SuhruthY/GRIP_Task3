# Loading the necessary  libraries
library(dplyr) # data manupulation library
library(stringr) # string manupulation library
library(tidyverse) # collection of tidymodels packages
library(tidytext) # used for text mining
library(ggplot2) # used for data visualization

## LOADING AND SUBSETTING DATA
rawDf <- tibble(read.csv("../../data/sub_data/topics.csv")) # loading the topics modeling subset
rawDf$iyear <- as.integer(as.character(rawDf$iyear)) # converting year to integer
rawDf$iyear <- factor(rawDf$iyear) # changing year to factor
rawDf <- rawDf %>% mutate_if(is.character, list(~na_if(.,""))) # converting blanks to NULL
rawDf # printing 1st few rows

## TOPIC MODELLING ON SUMMARY
SumDf <- rawDf %>% select(iyear, summary) %>% drop_na() # creating a subset of raw data
# cleaning the string 
SumDf$summary %<>%  
  str_replace_all("[^A-z]", " ") %>% # excluding numericals
  str_replace_all("[\\s]+", " ") %>% # excluding whitespace
  tolower() # converting to lowercase
# tokenization
SumDf %<>% 
  mutate(line = row_number()) %>% # generating wor numbers
  unnest_tokens(word, summary) %>% # unnesting into words
  anti_join(stop_words) %>%  # removing stop words
  filter(word != "responsibility" & word!="claimed") # removing outliers
# calculating frequency
Sum_tfIdf <- SumDf %>% 
  count(iyear, word, sort = TRUE) %>% # count each word by year 
  bind_tf_idf(word, iyear, n) %>%  
  arrange(-tf_idf) %>% # arrange in the order of tf-idf
  group_by(iyear) %>% distinct(n, .keep_all = TRUE) %>% # extract distinct count
  top_n(10) %>% ungroup() # filter top 10
# plotting the tf-idf
g1 <- Sum_tfIdf %>%
  mutate(word=reorder_within(word, tf_idf, iyear))%>% # reorder words
  ggplot(aes(word, tf_idf, fill=iyear)) + # initializing the gggplot object
  geom_col(alpha=0.8, show.legend = F) + # creating a column/bar chart
  facet_wrap(~iyear, scales = "free", ncol = 5) + # wraping the year with free scaling 
  scale_x_reordered() + # reordering scales
  coord_flip() # flipping the coordinates
g1 
gd1 <- ggplot_build(g1)$data # getting the plot data
glimpse(gd1) # printing the plot data
write.csv(gd1, "../../data/sub_data/topic modellling/topic.csv") # saving the plot data
