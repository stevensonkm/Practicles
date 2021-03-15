# First step
# Assign number 2 to variable x
x <- 2
# same as x = 2
y <- 5
y
rm(y)
class(x)
# test to see if x is numeric
is.numeric(x)
a <- 4
class(a)
a <- 4L
class(a)
b <- 2.8
class(b)
c <- a * b
class(c)
x <- "data"
class(x)
y <- factor("data")
y
nchar(x)
date1 <- as.Date("2021-11-03")
date1
class(date1)
as.numeric(date1)
# vectors
p <- c(3, 5, 6, 8)
q <- c(3, 3, 3)
r <- p+q
r
# vector arithmitic
x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
y <- c(x, 0, x)
y
class(y)
z <- 2*x + y + 1
z
min(z)
max(z)
range(z)
mean(z)
sort(z)
seq3 <- seq(-100, 100, by=0.6)
seq3
sort(seq3, decreasing = TRUE)
