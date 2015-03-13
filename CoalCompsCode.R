#### CoalComps Code #### 
#Set working directory
setwd("~/Comps_Coalescent")
library(stringr)

wd<-getwd()
#read in data
a<-readLines(paste(wd,'/ms/msdir/Ne50000Sim.txt',sep=''))
head(a,n=40)
a<-a[grep('[0-1]{9}',a)] #pull out the results from each simulation
b<-lapply((1:length(a)),function(x) str_split(a[x],''))
b<-unlist(b)
c<-matrix(data=b,nrow=(40000*40),ncol=11,byrow=T)#throw them in a matrix
c<-c[,-1]#this gives us all of the results from all reps

SharSites<-vector()
for (i in 1:10000){#over all simulations
  a=0
  temp<-c[((i*40)-39):(i*40),]
  for (j in 1:10){#over number seg sites
if((sum(as.numeric(temp[(1:20),j]))>0) & (sum(as.numeric(temp[(21:40),j]))>0)){
  a<-a+1
} else {
  a<-a
}
}#over the loci
SharSites[i]<-a
}#over simulations

hist(SharSites)



