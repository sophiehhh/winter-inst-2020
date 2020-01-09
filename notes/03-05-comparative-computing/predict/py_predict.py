import pandas as pd
import os
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import confusion_matrix

# Set your working directory to the /data folder on your local machine
os.chdir("/Users/simonheuberger/Insync/Google Drive/data_science_center/winter_inst/winter-inst-2020/data")

# load data
traindf = pd.read_csv("train.csv")
testdf = pd.read_csv("test.csv")
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
