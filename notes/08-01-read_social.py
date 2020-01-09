# -*- coding: utf-8 -*-

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

x = [5, 6]
y = [4, 1]

np.mean(x)

plt.scatter(x, y)

social = pd.read_csv('http://j.mp/2Et71U0')

social = pd.DataFrame(social)

social.shape

social.size

social.ndim

social.columns

social.describe

pd.DataFrame.describe(social)

social['age'] = 2006 - social['yearofbirth']

social['age'].max()

pd.DataFrame.describe(social)

from sklearn import linear_model

# Initialize linear regression object

lm_out = linear_model.LinearRegression()

lm_out.fit(social[['age', 'primary2004']], social[['primary2006']])

print('Coefficients: \n', lm_out.coef_)
