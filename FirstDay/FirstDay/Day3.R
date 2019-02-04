theUrl <- "http://www.jaredlander.com/data/TomatoFirst.csv"
tomato <- read.table(file = theUrl, header = TRUE, sep = ",", stringsAsFactors = FALSE);

tomato$Tomato

install.packages("readr");
library(readr)
tomato2 <- read_delim(file = theUrl, delim = ",")
tomato2

class(tomato2)
tomato2$Tomato
class(tomato$Tomato)

#Read delim is faster than read.table  How many fucking tomatos are we going to instansiate during this file?!
# Whats the BIG O notation of sucking my dick? 10/10 will drive back to Bloom maybe this weekend (Bathroom sex is overrated)
# Its how I lost my virginity tbh
# I want these comments in my code forever
install.packages("data.table")
library(data.table)

tomato3 <- fread(input = theUrl, sep=",", header= TRUE)
class(tomato3)

install.packages("readxl")
library(readxl)

df <- read_excel("data/fuckThisShit.xslx")
df

df <- read_excel('data/ExcelDataFile.xlsx')
df
class(df)
devtools::install_github("tidyverse/readxl")


#******************************************** DATABASES

download.file("HE WENT TO JARED?")
destfile = "data/diamonds.db", mov

install.packages('RSQLite')
library(RSQLite)


drv <- dbDriver('SQLite')
class(drv)
con <- dbConnect(drv, 'data/diamonds.db')
class(con)

dbListTables(con)
dbListFields(con, name = 'diamonds')
# simple select * query from one table

diamondsTable <- dbGetQuery(con,
                            "SELECT * FROM diamonds",
                            stringsAsFactors = FALSE)
diamondsTable

longQuery <- "SELECT * FROM DIAMONDS, Diamond" # where cost > 9000000000;