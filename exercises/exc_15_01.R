mat.cr <- scale(res.decat$adjmean)

n <- nrow(mat.cr)
p <- ncol(mat.cr)

# Centers of gravity
matG <- matrix(colMeans(mat.cr), n, p , byrow=TRUE)

# Matrix of distances
distG <- apply((mat.cr - matG)^2, 1, sum)

sum(distG)/n

mat.var.cr <- var(mat.cr)
sum(diag(mat.var.cr))