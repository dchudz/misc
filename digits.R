#############################
##Using RandomForest proximity to visualize digits data set
#############################

library(randomForest)

###
#Read data, etc
###
train <- read.csv("./data/train.csv", header=TRUE)
#test <- read.csv("./data/test.csv", header=TRUE)

smallTrain = train[sample(1:nrow(train), nrow(train)*.25),]
labels <- as.factor(smallTrain[,1])
smallTrain = smallTrain[,-1]

splitter = runif(nrow(smallTrain)) < .5
mytrain = smallTrain[splitter,]
mytest = smallTrain[!splitter,]
labelsMyTrain = labels[splitter]
labelsMyTest = labels[!splitter]

###
#Random forest (generates proximities)
###
rf <- randomForest(mytrain, labelsMyTrain, ntree=1000, xtest = mytest, proximity = TRUE, do.trace = TRUE)
predictions <- levels(labels)[rf$test$predicted]
correct = labelsMyTest == predictions
mean(correct)

#####
#Do MDS on subset (to save time) of proximities
#####
prox = rf$test$proximity[,1:nrow(mytest)]

n=1000
proxSmall = prox[1:n,1:n]
hist(proxSmall)

library("ggplot2")
library("MASS")
hist(1 - proxSmall)
embeddingSmall = isoMDS(1 - proxSmall, k = 2)

###
#Plot RF-based embedding
#Plots:
#1) Label based on random forest
#2) Label based on truth, highlighting errors
#3) Label based on truth
#4) Label based on truth, highlighting errors
###
qplot(X1, X2, data = data.frame(embeddingSmall$points), colour = predictions[1:n])
qplot(X1, X2, data = data.frame(embeddingSmall$points), colour = predictions[1:n], size = 1-correct[1:n])
qplot(X1, X2, data = data.frame(embeddingSmall$points), colour = labelsMyTest[1:n])
qplot(X1, X2, data = data.frame(embeddingSmall$points), colour = labelsMyTest[1:n], size = 1-correct[1:n])



###
#Try embedding with PCA instead
###
pc = princomp(mytest[1:n,])
qplot(Comp.1, Comp.2, data = data.frame(pc$scores), colour = predictions[1:n])

###
#Try embedding with isoMDS starting with Euclidean distances
###

embeddingSmallEuclidean = isoMDS(dist(mytest[1:n,]), k = 2)
qplot(X1, X2, data = data.frame(embeddingSmallEuclidean$points), colour = labelsMyTest[1:n])


###
# Typical point detection, outlier detection
###
plotRow <- function(row, plot=T) {
 two = as.numeric(row)
 class(two)
 twoM = matrix((two), 28, 28)
 twoM = apply(twoM, 1, rev)
 if (plot) image(t(twoM), axes = FALSE, col = grey(seq(0, 1, length = 256)))
 twoM
}



plotRow(mytestUniform[48,], plot=F)
plotRow(mytestUniform[33,])

plotPrototypeOfClass <- function(class, n=1) {
  proxUniform = prox[labelsMyTest == class, labelsMyTest == class]
  predictionsUniform = predictions[labelsMyTest == class]
  mytestUniform = mytest[labelsMyTest == class,]
  medians = apply(proxUniform, 1, median)
  which.min(medians)
  o = order(medians)
  plotRow(mytestUniform[rev(o)[n],])
}

plotRandomOfClass <- function(class) {
  proxUniform = prox[labelsMyTest == class, labelsMyTest == class]
  predictionsUniform = predictions[labelsMyTest == class]
  mytestUniform = mytest[labelsMyTest == class,]
  plotRow(mytestUniform[sample(nrow(mytestUniform),1),])
}

plotWorstOfClass <- function(class, n=1) {
  proxUniform = prox[labelsMyTest == class, labelsMyTest == class]
  predictionsUniform = predictions[labelsMyTest == class]
  mytestUniform = mytest[labelsMyTest == class,]
  
  medians = apply(proxUniform, 1, median)
  which.min(medians)
  o = order(medians)
  plotRow(mytestUniform[o[n],])
}

par(mfrow = c(5,10))
l_ply(as.list(as.character(0:9)),plotPrototypeOfClass)
l_ply(as.list(as.character(0:9)),function(c) plotPrototypeOfClass(c,2))
l_ply(as.list(as.character(0:9)),plotRandomOfClass)
l_ply(as.list(as.character(0:9)),plotWorstOfClass)
l_ply(as.list(as.character(0:9)),function(c) plotWorstOfClass(c,2))

#do same as above but with euclidean distance?


######
# Plot images of the numbers
#####


makeAR <- function(rowNum, size, posDF,  imageDF, correct) {
  row = imageDF[rowNum,]
  two = as.numeric(row)
  t = two/max(two)
  z = t*correct[rowNum]
  twoRGB = rgb(t,z,z)
  twoM = matrix((twoRGB), 28, 28)
  pos = c(posDF[rowNum,] - size/2, posDF[rowNum,] + size/2)
  annotation_raster(t(twoM), pos[1], pos[3], pos[2], pos[4])
}

rows = sample(1:n, 100)
rows
ARs = Map(function(n) makeAR(n, .04, embeddingSmall$points, mytest, (predictions == labelsMyTest)),  
          rows)

correct = labelsMyTest == predictions
p = qplot(X1, X2, data = data.frame(embeddingSmall$points), colour = labelsMyTest[1:n], size = 1-correct[1:n])
p
png(filename = paste("digitsRF.png",sep=""), width = 960, height = 960)
Reduce("+", ARs, init = p)
dev.off()

x`image(twoM)
dim(twoM)

##############
#plot the images in rf-space, but just one class at a time
######

makePlotForDigit <- function(class) {
prox = rf$test$proximity[,1:nrow(mytest)]
proxUniform = prox[labelsMyTest == class, labelsMyTest == class]
predictionsUniform = predictions[labelsMyTest == class]
mytestUniform = mytest[labelsMyTest == class,]
correct = (predictionsUniform == class)
embedding = isoMDS(1 - proxUniform, k = 2)
p = qplot(X1, X2, data = data.frame(embedding$points), colour = predictionsUniform, size = 1-correct)
p

rows = sample(1:nrow(proxUniform), 100)
ARs = Map(function(n) makeAR(n, .08, embedding$points, mytestUniform, correct),  
          rows)
png(filename = paste("digit",class,".png",sep=""), width = 960, height = 960)
print(Reduce("+", ARs, init = p))
dev.off()
}
for (digit in as.character(0:0)) makePlotForDigit(digit)


makeEuclideanPlotForDigit <- function(class) {
  predictionsUniform = predictions[labelsMyTest == class]
  mytestUniform = mytest[labelsMyTest == class,]
  proxUniform = as.matrix(dist(as.matrix(mytestUniform)))
  correct = (predictionsUniform == class)
  embedding = isoMDS(proxUniform, k = 2)
  p = qplot(X1, X2, data = data.frame(embedding$points), colour = predictionsUniform, size = 1-correct)
  p
  
  rows = sample(1:nrow(proxUniform), 100)
  ARs = Map(function(n) makeAR(n, 100, embedding$points, mytestUniform, correct),  
            rows)
  png(filename = paste("digitEucl",class,".png",sep=""), width = 960, height = 960)
  print(Reduce("+", ARs, init = p))
  dev.off()
}
for (digit in as.character(7)) makeEuclideanPlotForDigit(digit)



#try random forest to distinguish real from fake numbers
#--- does this cluster better than euclidean distance?
#--- more like manifold?


#final product
#typical numbers plots
#embedding of all numbers 
#embedding of one number type
#with clickable points, or something