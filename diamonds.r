library("ggplot2")
library("MASS")

###
#Function for creating diamonds
###
size = c(50,50)
makeDiamond <- function(center, d) {
  M <- matrix(0, size[1], size[2])
  for (i in 1:dim(M)[1]) {
    for (j in 1:dim(M)[2]) {
  norm = abs(i - center[1]) + abs(j - center[2])
  M[i,j] = exp( -.5*(norm - d)^2)
    }
  }
M
}

###
#Functions for moving to/from vectors/Matrices
###
toVector <- function(M) as.vector(M)
toMatrix <- function(v) matrix(v, nrow = size[1], ncol = size[2], byrow = TRUE)
image(toMatrix(toVector(M)))

###Generate diamonds
centerxs = 1:49
ds = 2:20
diamonds = ( matrix(nrow = length(centerxs)*length(ds), ncol = size[1]*size[2]) )
i=1
for (x in centerxs) {
  for (d in ds) {
  diamonds[i,] = toVector(makeDiamond(c(x,25), d))
  i = i+1
  print(i)
  }
}

###
#Look at one of the diamonds
###
image(toMatrix(diamonds[80,]))

###
#Make non-diamonds by permuting columns
###
makeFakeData <- function(df) {
  dfFake = df
  for (col in 1:ncol(dfFake)) {
    dfFake[,col] = sample(dfFake[,col])
  }
  dfFake
}
diamondsFake = makeFakeData(diamonds)

###
#combine diamonds and non-diamonds, create class labels
###
diamondsBoth = rbind(diamonds,diamondsFake)
diamondsClasses = c(  rep(1, nrow(diamonds)),   rep(0, nrow(diamondsFake)))

###
#random forest for distinguishing diamonds from non-diamonds
###
rfDiamonds = randomForest(diamondsBoth, factor(diamondsClasses), 
                          ntree=100, proximity = TRUE, do.trace = TRUE)

###Let's also see how well this works with noise added
diamondsBothNoise = diamondsBoth
diamondsBothNoise[,seq(from=1, by=50, length.out=50)] = runif(nrow(diamondsBoth)*50)
image(toMatrix(diamondsBothNoise[1,]))
rfDiamondsNoise = randomForest(diamondsBothNoise, factor(diamondsClasses), 
                          ntree=100, proximity = TRUE, do.trace = TRUE)


###
#this function creates an "annotation_raster" object for adding to a ggplot
###
makeARDiamond <- function(rowNum, size, posDF,  imageDF) {
  row = imageDF[rowNum,]
  two = as.numeric(row)
  t = two/max(two)
  twoRGB = rgb(t,t,t)
  twoM = matrix((twoRGB), 50, 50)
  pos = c(posDF[rowNum,] - size/2, posDF[rowNum,] + size/2)
  annotation_raster(t(twoM), pos[1], pos[3], pos[2], pos[4])
}


###
#Based on random forest with diamond images
###
prox = rfDiamonds$proximity[1:nrow(diamonds),1:nrow(diamonds)]
embeddingDiamonds = isoMDS(1.1 - prox, k = 2)
rows = sample(1:nrow(diamonds), 150)
rows
ARs = Map(function(n) makeARDiamond(n, .03, embeddingDiamonds$points, diamonds),  rows)
p = qplot(X1, X2, data = data.frame(embeddingDiamonds$points))
p
Reduce("+", ARs, init = p)

###
#Based on random forest with diamond images that have added noise
###
prox = rfDiamondsNoise$proximity[1:nrow(diamonds),1:nrow(diamonds)]
embeddingDiamonds = isoMDS(1.1 - prox, k = 2)
rows = sample(1:nrow(diamonds), 150)
rows
ARs = Map(function(n) makeARDiamond(n, .03, embeddingDiamonds$points, 
                                    diamondsBothNoise[1:nrow(diamonds),]),  rows)
p = qplot(X1, X2, data = data.frame(embeddingDiamonds$points))
p
Reduce("+", ARs, init = p)

#based on euclidean distance between images as vectors in R^2500
proxEuclid = as.matrix(dist(as.matrix(diamonds)))
embeddingEuclid = isoMDS(proxEuclid, k = 2)
p = qplot(X1, X2, data = data.frame(embeddingEuclid$points))
p
rows = sample(1:nrow(proxUniform), 100)
ARs = Map(function(n) makeARDiamond(n, .3, embeddingEuclid$points, diamonds),  rows)
print(Reduce("+", ARs, init = p))
