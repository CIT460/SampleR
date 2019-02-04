
17 /3
17 %/% 3
2^4
?"+"

17 %% 3

x <- 4
5 -> y
assign(y, 7)
assign("z", 5)
?assign

a <- b <- x
rm(a)
a
rm(x, y)
ls()
rm(ls())
rm(list = ls())

x <-4
class(x)
is.numeric(x)
y <- "Banana"
class(y)
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
TRUE *10

2 < 4
2 == 5


v <- c(4, 2, 6, 1, 9)
v
u <- c(5, 6, 7, 0, 8)

v + u

v < U

w <- 1:5
u ^ w
class(w)


t <- c(2, 4, "banana", 2 < 6)
t
class(t)
any(v > u)
any(v == u)
all(u > v)

t <- c(0, 0, 0, 0, 0)
all(v > t)





t <- c(4,5,6, 1,2, 7, 90, 56)
t
t[1]
t[3]
t[c(1, 3)]
t[2:4]
t[c(1, 3:5)]


i <- c("a", "b", "c")
j <- c("r", "s", "t", "u")

i + j
c(i, j)


k <- 1:3
k
names(k) <- c("A", "B", "C")

k


k["A"]
k[c("A", "C")]


#factors

p <- c(4, 5, 4, 5, 6, 7, 1, 2, 1, 6, 7, 4, 7, 9)
p
q <- as.factor(p)
q

class(q)
apropos("mea")

#NA and null

r <- c(2, 4, 3, NA, 8, NA)
mean(r)
r ^ 2

mean(r, na.rm = TRUE)

#pipes    %>%   pipe

s <- c(5, 7, 2, 1)

s %>% mean

library(magrittr)

r %>% is.na() %>% sum()


rm(list = ls())

detach(package:magrittr)

