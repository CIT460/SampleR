x <- 10:1
y <- -4:5
q <- c("Hockey", "Football","Baseball", "Curling", "Rugby", "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")
df <- data.frame(x,y,q)
df
nrow(df)
ncol(df)
dim(df)

names(df)
colnames(df)
row.names(df)
names(df)[1] <- "count"
df



df <- data.frame(First = x, Second = y, Sport = q)
df

names(df)
rownames(df)
colnames(df) <- c("A", "B", "C")
rownames(df) <- c("One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine ","Ten")


df
head(df)
head(df, 3)
tail(df)
tail(df, 2)

class(df)
class(df[1])


#accessing elements
df[1]
df[2]
df[2, 3]
df[, 3]
class(df[1])
class(df[2, 3])


df$Sport
class(df$Sport)



# Lists
lst <- list(1, 2, 3, "A", c("Orange", "Banana"), list("i","j"))
lst
class(lst)

lst[[1]]
class(lst[[1]])

#Each list element may of different type
lst <- list(1, c(2, 5), list(5, 6, 7), df)
lst

names(lst[[1]]) <- NULL
names(lst[1]) <- "First"

lst
lst[["First"]]
lst
lst[[1]]

state.abb
state.x77
state.area
state.center

state.abb[38]


stateData <- data.frame(state.abb, state.center)
names(stateData)[1] <- "StateName"
names(stateData)[2] <- "Lat"
names(stateData)[3] <- "Long"

northeast <- subset(stateData, StateName == "PA")

