#***********    Visualization in R
#
#Grammar of Graphics
#
# Elements of creating R charts with ggplot
#
#
#   Data
#   Aesthetics: color, scale, x axis, size
#   Geometry: line, points
#   Statistics
#   Facets:  additional layers, different catagories
#   Coordinates:   Zooming
#   theme:  Coloration and placement


setwd("C:\\R Courses\\R Programming\\sec06")
#read.csv(file.choose())
movies <- read.csv("Movie-Ratings.csv")
movies
head(movies)
colnames(movies)
#change the column names
head(movies)
tail(movies)
str(movies)
?str

summary(movies)
#note that $Year is regarded as numeric field.  It needs to be turned to factor
movies$Year
factor(movies$Year)
movies$Year <- factor(movies$Year)

summary(movies)
str(movies)
colnames(movies)[3] <- "CriticRating"
colnames(movies)[4] <- "AudienceRating"
colnames(movies)[5] <- "BudgetMillions"
colnames(movies)
colnames(movies)[6] <- "Year"
#******************** Aesthetics
library(ggplot2)
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating))
#above does not produce any output .  It needs the geometry
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating)) + 
  geom_point()



ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, colour = Genre, size = Genre)) +
  geom_point()


ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, colour = Genre, size = BudgetMillions)) +
  geom_point()

#********************  Layers

p <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, colour = Genre, size = BudgetMillions))

p + geom_point()

p + geom_line()

p + geom_line() + geom_point()

#order does matter

p + geom_point() + geom_line()


#**************   overriding the aesthetics

q <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating,
                               colour = Genre, size = BudgetMillions))

q + geom_point(aes(size = CriticRating))
#changing colour
q + geom_point(aes(colour = BudgetMillions))

q + geom_point(aes(x = BudgetMillions)) +
  xlab("Budget in million $")

q + geom_line(size= .5) + geom_point()



#**************   parameter mapping and setting


r <- ggplot(data = movies, 
            aes(x = CriticRating, y = AudienceRating))

#mapping parameters
r + geom_point(aes(colour = Genre))

#setting parameters
r + geom_point(colour = "DarkGreen")

# cann not combine setting and mapping
#incorrect chart
r + geom_point(aes(colour = "DarkGreen"))



#making points of size 10
#not good
r + geom_point(aes(size = "banana"))
#proper
r + geom_point(aes(size = Genre))

#proper
r + geom_point(size = 1)



#*************  other geomery layers

s <- ggplot(data = movies, aes(x = BudgetMillions))
s + geom_histogram(binwidth = 10)

# add color

s + geom_histogram(binwidth = 10, aes(fill = Genre))

s + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "Black")


s + geom_density()


s + geom_density(aes(fill = Genre))

s + geom_density(aes(fill = Genre), position = "stack")





#*******************   More on aesthetic
library(ggplot2)
t <- ggplot(data = movies, aes(x = AudienceRating))



t + geom_histogram(binwidth = 10, fill="White", colour = "Blue")



#can do this another way by adding layers

t <- ggplot(data = movies)
t + geom_histogram(binwidth = 10,
                   aes(x = AudienceRating),
                   fill = "White",
                   color = "Red")
#this is more flexible
#same stem, different chart

t + geom_histogram(binwidth = 10,
                   aes(x = CriticRating),
                   fill = "White",
                   color = "Blue")


#Skeleton plot

t <- ggplot()
t + geom_histogram(data = movies,
                   binwidth = 10,
                   aes(x = AudienceRating),
                   fill = "White",
                   color = "Brown")


#Seeing plots better
#geom_smooth


u <- ggplot(data = movies,aes(x = CriticRating,
                              y = AudienceRating,
                              colour = Genre)
)

u + geom_point()
#now make it smooth
u + geom_point() + geom_smooth()

u + geom_smooth() + geom_point()


u + geom_point() + geom_smooth(fill=NA)

u + geom_smooth(fill=NA)



#Boxplots


u <- ggplot(data = movies, aes(x = Genre,
                               y = AudienceRating,
                               colour = Genre))
u + geom_boxplot()

u + geom_boxplot(size = 2)
u + geom_boxplot(size = 1.1)


u + geom_boxplot(size = 1.2) + geom_point()


u + geom_boxplot(size = 1.2) + geom_jitter()


u + geom_jitter()+ geom_boxplot(size = 1.2, alpha=.5 )
#add jitter



#***********  Facets

v <- ggplot(data = movies, aes(x= BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill = Genre))

v + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "Black")

v + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "Black") +
  facet_grid(Genre~.)

v + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "Black") +
  facet_grid(Genre~., scales = "free")



#another example facets to scatter plots

w <- ggplot(data = movies, aes(x = CriticRating, 
                               y = AudienceRating, 
                               colour = Genre))

w + geom_point()

w + geom_point(size= 3)

w + geom_point(size= 3) + facet_grid(Genre~.)

w + geom_point(size=3) + facet_grid(.~Year)


w + geom_point(size=3) + facet_grid(Genre~Year)


w + geom_point(size=3) + 
  geom_smooth() +
  facet_grid(Genre~Year)


w + geom_point(aes(size = BudgetMillions)) + 
  geom_smooth() +
  facet_grid(Genre~Year)

###############  Redo with lines

w <- ggplot(data = movies, aes(x = CriticRating, 
                               y = AudienceRating, 
                               colour = Genre))

w + geom_line()

w + geom_line(size= 2)

w + geom_line(size= 1) + facet_grid(Genre~.)

w + geom_line(size=1) + facet_grid(.~Year)


w + geom_line(size=1) + facet_grid(Genre~Year)


w + geom_line(size=1) + 
  geom_smooth() +
  facet_grid(Genre~Year)


w + geom_line(aes(size = BudgetMillions)) + 
  geom_smooth() +
  facet_grid(Genre~Year,  scales = "free")



# End redo with lines




#******************   Coordinates


m <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating,
                               size = BudgetMillions,
                               colour = Genre))
m + geom_point()


m + geom_point()+
  xlim(50, 100)




m + geom_point()+
  xlim(50, 100) +
  ylim(50, 100)


w + geom_point(aes(size = BudgetMillions)) + 
  geom_smooth() +
  facet_grid(Genre~Year) + 
  coord_cartesian(ylim=c(0, 100))


#******************************* Themes
#label, title, legend

o <- ggplot(data = movies, aes(x = BudgetMillions))
h <- o + geom_histogram(binwidth = 10, 
                        aes(fill=Genre),
                        colour = "Black")
h

h +xlab("$ in  millions") +
  ylab("num movies")

#*****************  Themes
#themes are about labels, legends, titles and such
#for non-data ink

library(ggplot2)
o <- ggplot(data = movies, aes(x=BudgetMillions))
o +geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")

h <- o +geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")
h


#let's add a label
#axes labels
h + xlab("Money Axis")

h + xlab("Money Axis") +
  ylab("Number of Movies")

#change text size and color


h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour = "DarkGreen", size=20),
        axis.title.y = element_text(colour="Red", size=20))


#add or modify tick marks

h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour = "DarkGreen", size=20),
        axis.title.y = element_text(colour="Red", size=20),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20))

#what else?
?theme
#there are lots of options

#controling the legend

h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour = "DarkGreen", size=20),
        axis.title.y = element_text(colour="Red", size=20),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        
        legend.title = element_text(size=20),
        legend.text = element_text(size=20))

#controling the legend position

h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour = "DarkGreen", size=20),
        axis.title.y = element_text(colour="Red", size=20),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        
        legend.title = element_text(size=20),
        legend.text = element_text(size=20),
        legend.position = c(1,1))

#think of plot area as the unit square. c(1,1) is the top right
#above does not workgreat, need to anchor the top right corner of
#the legent there

h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour = "DarkGreen", size=20),
        axis.title.y = element_text(colour="Red", size=20),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        
        legend.title = element_text(size=20),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1))

#Title of the chart.  
#first add the title layer

h + 
  xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution")
theme(axis.title.x = element_text(colour = "DarkGreen", size=20),
      axis.title.y = element_text(colour="Red", size=20),
      axis.text.x = element_text(size = 20),
      axis.text.y = element_text(size = 20),
      
      legend.title = element_text(size=20),
      legend.text = element_text(size=20),
      legend.position = c(1,1),
      legend.justification = c(1,1))

#then in theme, control the properties

h + 
  xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution")
theme(axis.title.x = element_text(colour = "DarkGreen", size=20),
      axis.title.y = element_text(colour="Red", size=20),
      axis.text.x = element_text(size = 20),
      axis.text.y = element_text(size = 20),
      
      legend.title = element_text(size=20),
      legend.text = element_text(size=20),
      legend.position = c(1,1),
      legend.justification = c(1,1),
      plot.title = element_text(colour = "DarkBlue",
                                size=30,
                                family = "Courier"))


