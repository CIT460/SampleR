install.packages("ggplot2")
library(ggplot2)

movies <- read.csv("Movie-Ratings.csv");
movies

head(movies)
colnames(movies)

# Change the column names
head(movies)
tail(movies)
str(movies)

factor(movies$Year)
movies$Year <- factor(movies$Year)
summary(movies)

colnames(movies)[3] <- "CriticRatings"
colnames(movies)[4] <- "AudienceRating"
colnames(movies)[5] <- "BudgetMillions"

ggplot(data = movies, aes(x = CriticRatings, y = AudienceRating, colour = Genre, size = BudgetMillions))
# ^ No graph type

ggplot(data = movies, aes(x = CriticRatings, y = AudienceRating, colour = Genre, size = BudgetMillions)) +
    geom_point()
