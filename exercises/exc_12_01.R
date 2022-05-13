n <- nrow(mat)
p <- ncol(mat)

# Centers of gravity
matG <- matrix(colMeans(mat), n, p , byrow=TRUE)

# Matrix of distances
distG <- apply((mat - matG)^2, 1, sum)
