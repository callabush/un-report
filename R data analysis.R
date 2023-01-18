#Data Analysis with Gus
library(tidyverse)
gapminder_data <- read_csv("data/gapminder_data.csv")
summarize(gapminder_data, averageLifeExp=mean(lifeExp))
gapminder_data %>% summarize(averageLifeExp=mean(lifeExp))
gapminder_data %>%
  summarize(averageLifeExp=mean(lifeExp))
gapminder_data_summarized <- gapminder_data %>%
  summarize(averageLifeExp=mean(lifeExp))
gapminder_data <- gapminder_data %>%
  summarize(averageLifeExp=mean(lifeExp)
#Narrow down rows with filter()
#2007 is the most recent year, calculate life expectancy for only that year with filter
gapminder_data %>%
  filter(year == 2007) %>%
  summarize(average=mean(lifeExp))
#Average GDP per capital in this dataset
#What is the earliest year?
gapminder_data %>%
  filter(year == min(year))%>%
  summarize(average=mean(lifeExp))
#Using group_by()
#group_by() takes the data and "groups" by the year
gapminder_data %>%
  group_by(year) %>%
  summarize(average=mean(lifeExp))
