
# source: https://towardsdatascience.com/data-science-101-is-python-better-than-r-b8f258f57b0f

library(magrittr)
library(datasets)

# look at data
head(iris, 4)

# split data - one to train the model, one to test our prediction
ir_data <- iris[1:100, ]
set.seed(122)
samp <- sample(1:100, 80)
train <- ir_data[samp, ]
test <- ir_data[-samp, ]

# save for use in Python
write.csv(train, file = "../../../data/train.csv")
write.csv(test, file = "../../../data/test.csv")

# fit model
y <-train$Species
x <- train$Sepal.Length
out <- glm(y ~ x, family = 'binomial')
newdata <- data.frame(x = test$Sepal.Length)

# prediction
predicted_val <- predict(out, newdata, type = "response")
prediction <- data.frame(test$Sepal.Length, test$Species, 
                         predicted_val, ifelse(predicted_val > 0.5, 
                         'versicolor', 'setosa'))

# accuracy
sum(prediction$test.Species %>% factor ==
    prediction$ifelse.predicted_val...0.5...versicolor....setosa.. %>%
    factor) /
  predicted_val %>% length
