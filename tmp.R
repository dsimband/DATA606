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


data = fetch(rs, n=-1)
dbDisconnect(mydb)
#data


clean_data <- subset(data, data$rating > 0 & data$rating < 6) 
#clean_data


avg <- aggregate(clean_data$rating, list(clean_data$movie_id), FUN=mean) 
names(avg)[1] <- "movie_id"
names(avg)[2] <- "avg_rating"
avg


clean_data <- subset(clean_data, , select=c(movie_id, name.1))

clean_data <- unique(clean_data)
clean_data

avg <- merge(avg,clean_data,by="movie_id")
names(avg)[3] <- "movie_name"
avg


library(ggplot2)
ggplot(data=avg, aes(x=movie_name, y=avg_rating)) + geom_bar(stat="identity") + coord_flip()






