d.train<-read.csv("training.csv",header = TRUE,sep=",",stringsAsFactors=F)
d.test<-read.csv("test.csv",header = TRUE,sep=",",stringsAsFactors=F)
str(d.train)
im.train<- d.train$Image
d.train$Image <- NULL
head(d.train)
