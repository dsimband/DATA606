


if(!file.exists('11263-Smoking_tcm86-13253.xls')) {
    download.file('https://github.com/jbryer/DATA606Fall2019/blob/master/course_data/11263-Smoking_tcm86-13253.xls?raw=true', 
                  destfile = '11263-Smoking_tcm86-13253.xls')
}
smoking <- readxl::read_excel('11263-Smoking_tcm86-13253.xls')


smoking

