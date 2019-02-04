#Reading a CSV file from an external source

theUrl  <- "http://www.jaredlander.com/data/TomatoFirst.csv"
tomato <-read.table(file=theUrl, header=TRUE, sep=",")
tomato

?read.table
class(tomato)
tomato$Tomato




#StringsAsFactors
#When downloading data sets that contain strings, most of the time
#you need to disable stringsAsFactors.

#Here is an example of strings as factors


x <- 10:1
y <- -4:5
q <-c("Hockey", "Football", "Baseball", "Curling", "Rugby",
      "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")
# stringsAsFactors=TRUE   keeps the info on levels
theDF <-data.frame(First=x, Second=y, Sport=q, stringsAsFactors=TRUE)
theDF$Sport



# stringsAsFactors=FALSE   keeps the info as only collection of characters
theDF <-data.frame(First=x, Second=y, Sport=q, stringsAsFactors=FALSE)
theDF$Sport


#Another method to read CSV files

library(readr)
theUrl <- "http://www.jaredlander.com/data/TomatoFirst.csv"
tomato2 <-read_delim(file=theUrl, delim=',')
tomato2

class(tomato2)
tomato2$Tomato
class(tomato2$Tomato)

# read_delim is faster than read.table    No need to perform stringsAsFactor


#####################

#  fread    from the read.table package

?fread


install.packages("data.table")
library(data.table)
theUrl <- "http://www.jaredlander.com/data/TomatoFirst.csv"
tomato3 <-fread(input=theUrl, sep=',', header=TRUE)
tomato3


class(tomato3)


?read.delim
#read.delim and fread are both fast



##############################   Reading Databases
?download.file


#download a database file
#you need to create a subfolder called data for this to work

download.file("http://www.jaredlander.com/data/diamonds.db",
          destfile = "data/diamonds.db", mode='wb')

#if needed install RSQLite package
install.packages('RSQLite')
library(RSQLite)


#create the driver and connection

drv <- dbDriver('SQLite')
con <- dbConnect(drv, 'data/diamonds.db')

class(drv)
class(con)

#testing the connection and the database
dbListTables(con)


dbListFields(con, name = 'diamonds')


# simple SELECT * query from one table
diamondsTable <- dbGetQuery(con,
                               "SELECT * FROM diamonds",
                               stringsAsFactors=FALSE)
diamondsTable

# simple SELECT * query from one table
colorTable <- dbGetQuery(con,
                           "SELECT * FROM DiamondColors",
                           stringsAsFactors=FALSE)


colorTable


# do a join between the two tables
longQuery <- "SELECT * FROM diamonds, DiamondColors
                         WHERE
                         diamonds.color = DiamondColors.Color"

diamondsJoin <-dbGetQuery(con, longQuery,
                            stringsAsFactors=FALSE)


class(diamondsJoin)



#saving data for future use

save(diamondsJoin, file="data/diamonds.rdata")



rm(diamondsJoin)

#verify it is removed
diamondsJoin

#load the info from saved source
load("data/diamonds.rdata")

diamondsJoin


tomato

# save the tomato data.frame to disk
save(tomato, file="data/tomato.rdata")


# remove tomato from memory
rm(tomato)
# check if it still exists
head(tomato)

load("data/tomato.rdata")
head(tomato)

#############################################

library(XML)
theURL <- "https://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/"
bowlPool <- readHTMLTable(theURL, which=1, header=FALSE, stringsAsFactors=FALSE)
bowlPool


?readHTMLTable


#####################  Reading table from web page using htmltab
library(htmltab)

#the following webpage containes a table with the title "Ability"
#this table is identified through the html <th> tag

url <- "http://christianrubba.com/cran/htmltab/vignette/Demography%20of%20the%20United%20Kingdom%20-%20Wikipedia.html"
ukLang <- htmltab(doc = url, which = "//th[text() = 'Ability']/ancestor::table")
head(ukLang)

#####################  Another method to scrape table 

library(XML)
page <- "https://www.theacsi.org/index.php?option=com_content&view=article&id=147&catid=&Itemid=212&i=Airlines"

airline <- readHTMLTable(page, header=T, which=1,stringsAsFactors=F)

?readHTMLTable


##############   Reading tables using rvest and dplyr

library(rvest)
library(dplyr)

page <- "https://www.theacsi.org/index.php?option=com_content&view=article&id=147&catid=&Itemid=212&i=Airlines"


#  html(page) %>% html_table  returns the tables as a list
airline.table <- (html(page) %>% html_table)[[1]]

airline.table

#################   Reading Excel files

#Create an Excel book or download a sample book
#The following excel file was downloaded from:
#http://spreadsheetpage.com/downloads/xl/worksheet%20functions.xlsx

library("readxl")
# xls files
my_data <- read_excel("data/worksheet functions.xlsx", sheet = "Sheet1")
# xlsx files
my_data


#get more help
?read_excel

#######################


data(diamonds, package='ggplot2')
head(diamonds)

#####################   Reading Excel files

#assume there is an Excel file in the data subfolder

library(readxl)

df <- read_excel('data/ExcelDataFile.xlsx')
df
class(df)



#####################





