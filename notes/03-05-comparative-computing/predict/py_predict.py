import pandas as pd
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import confusion_matrix

# load data
traindf = pd.read_csv("../data/train.csv")
testdf = pd.read_csv("../data/test.csv")
x = traindf['Sepal.Length'].values.reshape(-1,1)
y = traindf['Species']
x_test = testdf['Sepal.Length'].values.reshape(-1,1)
y_test = testdf['Species']

# fit model
classifier = LogisticRegression(random_state=0, solver='lbfgs')
classifier.fit(x,y)

# prediction
y_pred = classifier.predict(x_test)

# confusion matrix
confusion_matrix = confusion_matrix(y_test, y_pred)

# accuracy
print(classifier.score(x_test, y_test))
