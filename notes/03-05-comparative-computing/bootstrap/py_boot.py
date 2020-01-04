
import numpy as np
import statsmodels.api as sm
import time

# generate data and set bootstrap size
x = np.arange(0, 101)
y = 2*x + np.random.normal(0, 10, 101)
n = 100000
X = sm.add_constant(x, prepend=False)

# model definition
fitmod = sm.OLS(y, X)
results = fitmod.fit()
resid = results.resid
yhat = results.fittedvalues

# bootstrap
b1 = np.zeros((n))
b1[0] = results.params[0]
start = time.time()
for i in np.arange(1, 100000):
   resid_boot = np.random.permutation(resid)
   yboot = yhat + resid_boot
   model_boot = sm.OLS(yboot, X)
   resultsboot = model_boot.fit()
   b1[i] = resultsboot.params[0]
end = time.time()

# output time
print("Time difference of " + str(end - start) + " seconds")