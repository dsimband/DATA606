#df <- read.table("https://s3.amazonaws.com/assets.datacamp.com/blog_assets/test.txt", header = FALSE)
#df






#install.packages("RMySQL")
library(RMySQL)

mydb = dbConnect(MySQL(), user='root', password='AllAcd1234', dbname='DATA606', host='localhost')


rs = dbSendQuery(mydb, "select * 
            from DATA606.movie_reviews
            Join DATA606.friends 
            	on friends.id = movie_reviews.friend_id
            Join DATA606.movies
            	on movies.id = movie_reviews.movie_id")
dbDisconnect(mydb)

data = fetch(rs, n=-1)
#data


clean_data <- subset(data, data$rating > 0 & data$rating < 6) 
#clean_data


avg <- aggregate(clean_data$rating, list(clean_data$movie_id), FUN=mean) 
avg


