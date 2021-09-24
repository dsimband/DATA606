


if(!file.exists('11263-Smoking_tcm86-13253.xls')) {
    download.file('https://github.com/jbryer/DATA606Fall2019/blob/master/course_data/11263-Smoking_tcm86-13253.xls?raw=true', 
                  destfile = '11263-Smoking_tcm86-13253.xls')
}
smoking <- readxl::read_excel('11263-Smoking_tcm86-13253.xls')


smoking



ggplot(data = nycflights, aes(x = dep_delay)) +
    geom_histogram(binwidth = 1)


36.3 - 11
11 + 36.3
47.3-25.3




scores <- c(57, 66, 69, 71, 72, 73, 74, 77, 78, 78, 79, 79, 81, 81, 82, 83, 83, 88, 89, 94)




load( "aflsmall.Rdata" )
summary( afl.margins )



load( "/Users/dsimbandumwe/dev/cuny/data_606/lsr/rbook/bookdown/data/aflsmall.Rdata" ) 
summary( afl.margins )
boxplot( x = afl.margins, range = 100 )





