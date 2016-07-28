## Setup

library("RPostgreSQL")
setwd("C:/Users/kmeierdiercks/Google Drive/Projects/Coastal_Wetlands_Hurricane/GIT/wetlands")

## Table Creation

drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv,
                 dbname="wetlands",
                 host="pgstudio.research.sesync.org",
                 user="student",
                 password="synthesis")

dbGetQuery(con, "BEGIN TRANSACTION")



raw_data <- read.csv("data/county_table.csv")
dbWriteTable(con, "county", raw_data, row.names=FALSE, append=TRUE)

dbCommit(con)
dbDisconnect(con)