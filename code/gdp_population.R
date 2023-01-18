#Tidyverse library
library(tidyverse)

#Don't overwrite names
name <- "Ben"
name
age <- 26
age
name <- "Harry Potter"
name
Sys.Date()

#learning more about functions
round(3.1415)
round(3.1415,3)

round(x = 3.1415)
round(x = 3.1415, digits = 2)
round(digits = 2, x = 3.1415)
round(2, 3.1415)

#create our first plot
ggplot(data=gapminder_1997) #this gets us a gray rectangle
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap) #this adds vertical lines with numbers (x axis labels)
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap) +
  labs(x = "GDP Per Capita") #added label to x axis
#Add y axis labels and data points
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap) +
  labs(x = "GDP Per Capita (USD)") +
  aes(y = lifeExp) +
  labs(y = "Life Expectancy (Years)") +
  geom_point() +
  labs(title = "Do people in wealthy countries live longer?") +
  aes(color = continent) +
  scale_color_brewer(palette = "Set1") +
  aes(size = pop/1000000) +
  labs(size = "Population (in millions)") +
  aes(shape = continent)
#Hint! 
#You will get "invalid argument to unary operator" if your line starts with "+"
#Viridis is color blind friendly palette 
install.packages("viridis")
library("viridis")

#Short hand ggplot
ggplot(data = gapminder_1997, 
       aes(x = gdpPercap, y =lifeExp,
                                  shape = continent, size = pop)) +
  labs(x = "GDP Per Capita", y = "Life Expectancy",
       title = "Do people in wealthy countries live longer?",
       size = "Population (in millions)")+
  geom_point(aes(color = continent)) +
  scale_color_viridis(discrete=TRUE)

#Read in all of the data from gapminder (more years than 1997)
#dim is dimensions of our dataset
?dim
#head shows us just the top of out dataset
?head
#Predicting ggplot outputs
ggplot(data = gapminder_data) +
  aes(x=year, y=lifeExp, color=continent) +
  geom_point()
#Structure
str(gapminder_data)
#lineplot by continent
ggplot(data = gapminder_data) +
  aes(x = year, y = lifeExp, color = continent) +
  geom_line()
#Line for each country
ggplot(data = gapminder_data) +
  aes(x = year, y = lifeExp, group = country, color = continent) +
  geom_line()
#Lineplot of population and life expectancy
ggplot(data = gapminder_data) +
  aes(x = pop, y = lifeExp, group = country, color = continent) +
  geom_line()
#Discrete Plots
#Boxplot
ggplot(data = gapminder_data) +
  aes(x = continent, y = lifeExp) +
  geom_boxplot(aes(color = continent)) +
  scale_color_viridis(discrete=TRUE) + 
  labs(x = "Continent", y = "Life Expectancy",
       title = "Life Expectany by Continent",
       )
  
#Violin Plot
ggplot(data = gapminder_data) +
aes(x = continent, y = lifeExp) +
  geom_violin(aes(color = continent)) +
  scale_color_viridis(discrete=TRUE) + 
  labs(x = "Continent", y = "Life Expectancy",
       title = "Life Expectany by Continent",
  )
#Geom Jitter
ggplot(data = gapminder_data) +
  aes(x = continent, y = lifeExp) +
  geom_violin(aes(color = continent)) +
  scale_color_viridis(discrete=TRUE) + 
  labs(x = "Continent", y = "Life Expectancy",
       title = "Life Expectany by Continent",) +
  geom_jitter()
#Just using the 1997 dataset
ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin(aes(color = continent)) +
  scale_color_viridis(discrete=TRUE) + 
  labs(x = "Continent", y = "Life Expectancy",
       title = "Life Expectany by Continent",) +
  geom_jitter()
#Change jitter and violin order has violin on top of points
ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_jitter() +
  geom_violin(aes(color = continent)) +
  scale_color_viridis(discrete=TRUE) + 
  labs(x = "Continent", y = "Life Expectancy",
       title = "Life Expectany by Continent",)
#Change point size
ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin(aes(color = continent)) +
  scale_color_viridis(discrete=TRUE) + 
  labs(x = "Continent", y = "Life Expectancy",
       title = "Life Expectany by Continent",)+
  geom_jitter(aes(size = pop))

#Color versus fill pink!
ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin(color="pink")
#Fill pink!
ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin(fill="pink")
#Fill continent
ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin(aes(fill=continent))
#Random colors
sample(colors(), size = 10)
#Transparency
ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin(aes(fill= "darkblue", alpha = 0.5))
#Histogram
ggplot(gapminder_1997) +
  aes(x = lifeExp) +
  geom_histogram()
#better bin value
ggplot(gapminder_1997) +
  aes(x = lifeExp) +
  geom_histogram(bins=20)
#Plot themes
ggplot(gapminder_1997) +
  aes(x = lifeExp) +
  geom_histogram(bins = 20) +
  theme_classic()
#Facets
ggplot(gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) +
  geom_point()
#Seperate plot for each continent
ggplot(gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) +
  geom_point() +
  facet_wrap(vars(continent))
#Facet grid
ggplot(gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) +
  geom_point() +
  facet_grid(rows = vars(continent))
#Saving plots
#Name plot
violin_plot <- ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin(aes(fill=continent))
#Save plot
ggsave("awesome_violin_plot.jpg", plot = violin_plot, width=6, height=4)
#Animated plots
install.packages(c("gganimate", "gifski"))
library(gganimate)
library(gifski)
ggplot(data = gapminder_data)+
  aes(x = log(gdpPercap), y = lifeExp, size = pop, color = continent)+
  geom_point()
#pretty plot
staticHansPlot <- ggplot(data = gapminder_data)+
  aes(x = log(gdpPercap), y = lifeExp, size = pop/1000000, color = continent)+
  geom_point(alpha = 0.5) + # we made our points slightly transparent, because it makes it easier to see overlapping points
  scale_color_brewer(palette = "Set1") +
  labs(x = "GDP Per Capita", y = "Life Expectancy", color= "Continent", size="Population (in millions)")+
  theme_classic()

staticHansPlot
#Animate 
animatedHansPlot <- staticHansPlot +
  transition_states(year,  transition_length = 1, state_length = 1)+
  ggtitle("{closest_state}")

animatedHansPlot
#Save plot
anim_save("hansAnimatedPlot.gif", 
          plot = animatedHansPlot,
          renderer = gifski_renderer())
#Map plots
# make sure names of countries match between the map info and the data
# NOTE: we haven't learned how to modify the data in this way yet, but we'll learn about that in the next lesson. Just take for granted that it works for now :)
mapdata <- map_data("world") %>%
  mutate(region = recode(region,
                         USA="United States",
                         UK="United Kingdom"))

install.packages("mapproj")
install.packages("ggthemes")
library("mapproj")
library("ggthemes")
gapminder_1997 %>%
  ggplot() +
  geom_map(aes(map_id=country, fill=lifeExp), map=mapdata) +
  expand_limits(x = mapdata$long, y = mapdata$lat) +
  coord_map(projection = "mollweide", xlim = c(-180, 180)) +
  ggthemes::theme_map()