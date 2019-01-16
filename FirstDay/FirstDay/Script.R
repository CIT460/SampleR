hostName <- "Bailey Miller"

17 / 3
17 %% 3
2 ^ 4
? "+"

17 %% 3

x <- 4

5 -> y

assign(y, 7)
assign("z", 5)
? assign

a <- b <- x
rm(a)
a
rm(x, y)
ls()
rm(ls())
rm(list = ls())

class(x)
is.numeric(y)

y <- 5L
class(y)
is.numeric(y)

d <- "2019-01-16"
class(d)
date <- as.Date(d)

date
class(date)

new.date <- date + 20
new.date

as.numeric(date)
date - as.numeric(date)

TRUE
FALSE
T
F
TRUE * 10
2 < 4

2 == 5

V <- c(4, 2, 6, 1, 9)


t <- c(2, 4, "banana", 2 < 6)
t
class(t)
any(v > u)
any(v == u)
all(u > v)

t <- c(0, 0, 0, 0, 0)
all(v > t)

t <- c(4, 5, 6, 1, 2, 7, 90, 56)

t
t[1]
1[3]
t[c[1, 3]]
t[2:4]
t[c(1,3:5)]

# Use me to clear variables Globally
rm(list = ls())

# Fuck your R Drive
#Heard they finally slashed that one thing you liked using. Web FTP or something
# Yeah they got rid of it because the tech is old oh well I still just use FileZilla
# Filezilla until I fucking die

# It's funny to watch this inside of VS Code, VS Code has an R Extension
#Im not a huge fan of vs code only because its just a stripped down version of this. I guess theres a lot to love about that
# Oh yeah, for web dev its soooooooOOO much better than VS studio. Especially (fuck you'ure*, YES) when working with CSS (seeing colors help so much)
# I like it for web development because it's essentially just a file editor 

i <- c("a", "b", "c")
j <- c("r", "s", "t", "u")
i + j
c(i, j)

k <- 1:3
k
names(k) <- c("A", "B", "C")
k

k["A"]

# I wish that VS Studio had auto-save for files though

# FACTORS
p <- c(4, 5, 4, 5, 6, 7, 1, 2, 1, 6, 7, 4, 7, 9)
p
q <- as.factor(p)
q
# Levels of a factor show numbers within the "array" that aren't repeated 

# Wonder how you count number of times 4 appears?

class(q)
apropos("mea")
#NA and NULL
r <- c(2, 4, 3, NA, 8, NA)
#Yeah thats what its kind of for. Data science and statistics with big data like from a data warehouse
# Wonder if we could make this actually crunch some large numbers, like a huge vector and doing like a ! operation on them all?
# But like maybe it's my computer sometimes 1+1 takes a literal second to display?
# He needs to end soon I have to go to work :/
mean(r)
mode(r) #Mode will just tell us the data type?
range(r)
mean(r, na.rm = TRUE)


#Gonna add the rest of what we did today to the top of this and save a copy myself. 
# Keep the comments, they're important

#PIPES | PiPeS JK ITS NOT THAT ITS FUCKING %>%
s <- c(5, 7, 2, NA)

s %>% mean

install.packages("magrittr")
library(magrittr)

#Got stored in my Local\Temp\#########\downloaded_packages
# Same but that is actually kinda good, then some garbage collector will remove it eventually
#Just for reference I guess. Sometimes I download stuff through unity and it auto saves to my temp which is real annoying.
# Lots of things get saved to my local temp folder it urks me.... UWP apps only have direct access to a special local temp folder and that's it by default
#When you only got 128/256GB of SSD storage, you kinda gotta be picky about where shit goes.
# To access any other folder with UWP the user needs to give them permission.... Yah know how hard it is to steal files when they need to give permission?

s %>% is.na() %>% sum()

# This pipe shit is helpful might want to remember that
#Maybe its easier than you think? :D i dunno. I mess around with my default folders all the time in RegEdit
# Save fast I need to leave as fast as possible

#Saved, don't know where it stored it though'