
# source: https://towardsdatascience.com/data-science-101-is-python-better-than-r-b8f258f57b0f

# generate data and set boostrap size
set.seed(999)
x <- 0:100
y <- 2*x + rnorm(101, 0, 10)
n <- 100000

# model definition
fit.mod <- lm(y ~ x)
errors <- resid(fit.mod)
yhat <- fitted(fit.mod)

# bootstrap
boot <- function(n){
  b1 <- numeric(n)
  b1[1] <- coef(fit.mod)[2]
  for(i in 2:n){
    resid_boot <- sample(errors, replace=F)
    yboot <- yhat + resid_boot
    model_boot <- lm(yboot ~ x)
    b1[i] <- coef(model_boot)[2]
  }
  return(b1)
}
start_time <- Sys.time()
boot(n)
end_time <- Sys.time()

# output time
end_time - start_time
