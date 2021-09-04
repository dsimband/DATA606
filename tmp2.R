


library(RMySQL)

usr <- keyring::key_list("Temp")[1,2]
pwd <-  keyring::key_get("Temp", usr)
con = dbConnect(MySQL(), user=usr, password=pwd, dbname='Temp', host='localhost')
dbGetQuery(con, "SHOW DATABASES")

#sqlCreateTable(con, "bob", fields=c(a = "integer", b = "text"))

query <- "DROP TABLE IF EXISTS friends CASCADE;"
results <- dbSendQuery(con, query)
dbClearResult(results)


query<-"CREATE TABLE friends (
  id INT,
  name TEXT,
  PRIMARY KEY (id)
 );"

#Send the query to MySQL for execution
results <- dbSendQuery(con, query)
dbClearResult(results)


# moview
query <- "DROP TABLE IF EXISTS movies CASCADE;"
results <- dbSendQuery(con, query)
dbClearResult(results)
query<- "CREATE TABLE movies (
    id INT,
    name TEXT,
    PRIMARY KEY (id)
);"
results <- dbSendQuery(con, query)
dbClearResult(results)


# moview reviews
query <- "DROP TABLE IF EXISTS movie_reviews CASCADE;"
results <- dbSendQuery(con, query)
dbClearResult(results)
query<- "CREATE TABLE movie_reviews (
    friend_id INT,
    movie_id INT,
    rating INT,
    PRIMARY KEY (friend_id,movie_id)
);"
results <- dbSendQuery(con, query)
dbClearResult(results)

dbListTables(con)



#insert movies
dbGetQuery(con, "insert into movies 
                    (id,name) 
                values 
                    (1,	'No Time to Die'),
                    (2,	'Free Guy'),
                    (3,	'Respect'),
                    (4,	'The Suicide Squad'),
                    (5,	'Jungle Cruise'),
                    (6,	'F9: The Fast Saga')
           ;")



#insert friends
dbGetQuery(con, "insert into friends 
                    (id,name) 
                values 
                    (1,'Bob'),
                    (2,'Sam'),
                    (3,'Frank'),
                    (4,'Ann'),
                    (5,'Sue'),
                    (6,'Candy'),
                    (7,'David'),
                    (8,'Jeff'),
                    (9,'Cliff'),
                    (10,'Preston'),
                    (11,'Coffy')
           ;")



#insert reviews
dbGetQuery(con, "insert into movie_reviews 
                    (friend_id,movie_id,rating) 
                values 
                    (1, 1, 5),
                    (1, 2, 3),
                    (1, 3, 7),
                    (1, 4, 999),
                    (1, 5, 2),
                    (1, 6, 4),
                    (2, 1, 5),
                    (2, 2, 4),
                    (2, 3, 2),
                    (2, 4, 5),
                    (2, 5, 2),
                    (2, 6, 4),
                    (3, 1, 4),
                    (3, 2, 1),
                    (3, 3, 2),
                    (3, 4, 1),
                    (3, 5, 2),
                    (3, 6, 2),
                    (4, 1, 4),
                    (4, 2, 6),
                    (4, 3, 2),
                    (4, 4, 1),
                    (4, 5, 4),
                    (4, 6, 1),
                    (5, 1, 5),
                    (5, 2, 5),
                    (5, 3, 2),
                    (5, 4, 3),
                    (5, 5, 1),
                    (5, 6, 1),
                    (6, 1, 5),
                    (6, 2, 5),
                    (6, 3, 2),
                    (6, 4, 3),
                    (6, 5, 1),
                    (6, 6, 1),
                    (7, 1, 5),
                    (8, 1, 2),
                    (9, 1, 0),
                    (10, 1, 0),
                    (11, 1, 0)
           ;")



dbDisconnect(con)


