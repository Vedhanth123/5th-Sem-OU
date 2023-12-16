from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report
from sklearn.tree import DecisionTreeClassifier
from sklearn import datasets
from sklearn.neural_network import MLPClassifier
from sklearn.naive_bayes import GaussianNB
from sklearn.neighbours import KNeighboursClassifier
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.datasets import load_iris

# iris = load_iris()
# iris

# df = pd.DataFrame(data = iris.data)
# df['target'] = iris.target

# X,Y, x, y = train_test_split(df.drop(df.columns[[-1]]), df['target'])

# clf = DecisionTreeClassifier()
# clf.fit(X,Y)
# yhat = clf.predict(y)

# accuracy_score(y, yhat)

# tree.plot(clf)


## 
# x,y = datasets.make_classification(n_features = 5, n_classes = 2, n_samples=100)
# clf = MLPClassifier()
# X,Y,x,y = train_test_split(x,y)

# clf.fit(X,Y)
# y_pred = clf.predict(y)

# print(accuracy_score(y, y_pred))
# print(con)

x,y = datasets.make_classification(n_samples=100, n_classes = 2, n_features = 5)
X,Y, x, y = train_test_split(X,Y)
clf = GaussianNB()

clf.fit(X,Y)
y_pred = clf.predict(y)

accuracy_score(y, y_pred)
confusion_matrix(y, y_pred)