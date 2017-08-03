

weight_kg <- 55
x <- 3

weight_lb <- 2.2 * weight_kg

# this is a comment

weight_g <- c(50,60,65,82)

"animals" -> x
x
length(weight_g)

class(weight_g)

num_logical = c(1,2,3,TRUE)
str(num_logical)
class(num_logical)

animals = c("mouse","dog", "cat")
animals %in% c("dog", "cat")

heights = c(2,4,4,NA,6)
is.na(heights)
!is.na(heights)
heights[!is.na(heights)]
complete.cases(heights)


download.file("https://ndownloader.figshare.com/files/2292169", "data/portal_data_joined.csv")
download.file("https://ndownloader.figshare.com/files/2292169", "data/portal_data_joined.csv")
surveys = read.csv("data/combined.csv")
View(surveys)

dim(surveys)
summary(surveys)
tail(surveys)
ncol(surveys)
nrow(surveys)

surveys[which(colnames(surveys)=="genus")]

head(surveys)

surveys[c(1:3,5)]
surveys[17,]
surveys[c(15:18,20),2:3]

surveys[which(colnames(surveys[17,])=="genus")]

species_id = surveys[,c("species_id", "genus")]
species_id = surveys[,c("species_id")]
species_id_and_genus = surveys[,c("species_id", "genus")]

length(species_id)
length(species_id_and_genus)

# create dataframe called surveys 200 containing only obs from row 200 of surveys data set
# pull out last row of in the dataframe using nrow
# create a new dataframe called surveys_last from the last row
# use nrow() to extract the row in the middle of the dataframe from surveys. Call that surveys_middle

surveys_200 = surveys[200,]
surveys[nrow(surveys),]
surveys_last = surveys[nrow(surveys),]
surveys_middle = surveys[(nrow(surveys)/2),]

sex = factor(c("male", "female", "female", "male"))
sex
nlevels(sex)
sex = factor(sex, levels = c("male", "female"))

sex_character = as.character(sex)
class(sex_character)
class(sex)

sex_character
levels(sex)
as.numeric(sex)

f = factor(c(1,10,100,6,60))
as.numeric(f)
levels(f)

plot(surveys$sex)
levels(surveys$sex)[1] = "unknown"

plot(surveys$sex)  # plot function guesses what kind of plot you could want depending on the structure of the data you give it
levels(surveys$sex)
plot(surveys$sex)

levels(surveys$sex)["M"] = "male"

levels(surveys$sex)
levels(surveys$sex)[3] = "male"

surveys[which(levels(surveys$sex)=="M")]

surveys$sex = factor(surveys$sex, levels = c('female', 'male', 'unknown'))
plot(surveys$sex)

surveys_characters = read.csv("data/combined.csv", stringsAsFactors = FALSE)
str(surveys_characters)

install.packages("tidyverse")
library(tidyverse)

select(surveys, plot_id, species_id, weight)  # this is a dplyr-specific function, takes as arguments the names of columns you want after the name of the dataframe

filter(surveys, year == 1995)

# shift command m
surveys %>% 
  filter(weight < 5) %>% 
  select(species_id, sex, weight)

surveys_sml = surveys %>% 
  filter(weight < 5) %>% 
  select(species_id, sex, weight)

View(surveys_sml)

surveys_early = surveys %>% 
  filter(as.numeric(year) < 1995) %>% 
  select(year, sex, weight)

View(surveys_early)

max(surveys_early$year)
min(surveys_early$year)
max(surveys_sml$year)
max(surveys)

str(surveys)

###

surveys_complete <- surveys %>%  
  filter(species_id != "",         # remove missing species_id
         !is.na(weight),           # remove missing weight
         !is.na(hindfoot_length),  # remove missing hindfoot_length
         sex != "")                # remove missing sex

# If you named your missing sex data "unknown" or "missing" use that string instead of "" above.


## Extract the most common species_id
species_counts <- surveys_complete %>%
  group_by(species_id) %>%
  tally %>%
  filter(n >= 50)

## Only keep the most common species
surveys_complete <- surveys_complete %>%
  filter(species_id %in% species_counts$species_id)


# Tells ggplot what data you're going to be plotting with
ggplot(data = surveys_complete)
# But we haven't told it yet how to build the plot, so no plot is created

# Next we need to tell ggplot what variables we want to assign to each axis of our plot
ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length))
# But it still doesn't make a plot!!! (Technically it makes a plot but there's no data plotted)

# We need to tell ggplot what type of plot we want
ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) +  geom_point()
# the geom_point() function tells ggplot what type of plot (scatterplot), and the "geom" stands for geometric

The + symbol in ggplot can be used to add information on subsequent lines, similar to how we used %>% earlier


# Assign plot to a variable
surveys_plot <- ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length))
# Draw the plot
surveys_plot + geom_point()
surveys_plot + geom_hex()


# Challenge (optional)
# Scatter plots can be useful exploratory tools for small datasets. For data sets with large numbers of observations, such as the surveys_complete data set, overplotting of points can be a limitation of scatter plots. One strategy for handling such settings is to use hexagonal binning of observations. The plot space is tessellated into hexagons. Each hexagon is assigned a color based on the number of observations that fall within its boundaries. To use hexagonal binning with ggplot2, first install the R package hexbin from CRAN:
#   install.packages("hexbin")
# Then use the geom_hex() function:
#   surveys_plot + geom_hex()
# What are the relative strengths and weaknesses of a hexagonal bin plot compared to a scatter plot? Examine the above scatter plot and compare it with the hexagonal bin plot that you created.


ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) + geom_hex()


What are the relative strengths and weaknesses of a hexagonal bin plot compared to a scatter plot? Examine the above scatter plot and compare it with the hexagonal bin plot that you created.

ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) +    geom_point()

# Make points transparent by setting the alpha argument (measurement of transparency). 
# This is set within the geom_point function because it applies to the points you're drawing.
# Alpha can be a value from 0 to 1, we hoose 0.1 is a value that is pretty transparent (so closer to 0 than 1), color

ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) +    geom_point(alpha = 0.1)

Similarly if we want to change the colors of the points, we put that in the geom_point function.

ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) +    geom_point(alpha = 0.1, color = "blue")

But we can change the color of the dots for each species by doing: 
  
  ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1, aes(color=species_id))

# Here we have set an aesthetic within the geom_point call that applies a different color to each group.

How do you know what order to put the arguments in? 
If you explicitly specify the arguments (eg "alpha = 0.1"), then the arguments can be in any order. 
Functions often have default arguments that they are expecting in a certain order, as long as the inputs you provide in the positions are compatible formats (eg numerical if numerical is expected), then these arguments 

ggplot(data = surveys_complete, aes(x = species_id, y = weight)) +    geom_boxplot()

ggplot(data = surveys_complete, aes(x = species_id, y = weight)) +    geom_boxplot(alpha = 0) +    geom_jitter(alpha = 0.3, color = "tomato")

# Additional materials avalible online: https://kristinariemer.github.io/2017-08-01-berkeleylab/ (and more on the Data Carpentry web page)
# Can do SQL inside R, or as a standalone
# For more, see the related Software Carpentry in R
# Also DataCamp (some free lesson, beyond that requires $ subscription), eg has series of lessons on ggplot : https://www.datacamp.com/ 
#   You can also export the etherpad and save 


###
my_plot <- ggplot(data = yearly_sex_counts, aes(x = year, y = n, color = sex)) +
  geom_line() +
  facet_wrap(~ species_id) +
  labs(title = 'Observed species in time',
       x = 'Year of observation',
       y = 'Number of species') +
  theme_bw() +
  theme(axis.text.x = element_text(colour="grey20", size=12, angle=90, hjust=.5, vjust=.5),
        axis.text.y = element_text(colour="grey20", size=12),
        text=element_text(size=16))
ggsave("name_of_file.png", my_plot, width=15, height=10)


