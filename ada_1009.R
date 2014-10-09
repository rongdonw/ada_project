#######Read, prepare data###################
d.train<-read.csv("training.csv",header = TRUE,sep=",",stringsAsFactors=F)
d.test<-read.csv("test.csv",header = TRUE,sep=",",stringsAsFactors=F)
str(d.train)
im.train<- d.train$Image
d.train$Image <- NULL
head(d.train)
#as.integer(unlist(strsplit(im.train[1], " ")))
#install.packages('doMC')
#library(doMC)
#registerDoMC()
im.train <- foreach(im = im.train, .combine=rbind) %dopar% {
  as.integer(unlist(strsplit(im, " ")))
}
str(im.train)
im.test <- foreach(im = d.test$Image, .combine=rbind) %dopar% {
  as.integer(unlist(strsplit(im, " ")))
}
d.test$Image <- NULL
save(d.train, im.train, d.test, im.test, file='data.Rd')
load('data.Rd')

#############
