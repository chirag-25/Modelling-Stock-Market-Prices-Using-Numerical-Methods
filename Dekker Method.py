from math import sin
from math import cos
from math import e
def w(x):


y = (4*sin(100*x) + 3*cos(150*x) + 5*sin(170*x) + 8*cos(190*x) + 0.09)/50
return abs(y)
# function for which we have to find the root


def f(x):


    # y = 7*e**(-x)*sin(x)-1
y = e**(mu*x - (sigma*sigma*x/2) + sigma*w(x)) - k
return y
# dekker method
def dekker(a, b, fun_tol, maxit):


ak = a
bk = b
fak = f(ak)
fbk = f(bk)
iteration = 0
# checking whether the intial bounds are not the solution
if abs(fbk) <= fun_tol:
root = bk
return bk, iteration
elif abs(fak) <= fun_tol:
root = ak
return ak, iteration
# assumption
if abs(fak) < abs(fbk):
ak, bk = bk, ak
fak, fbk = fbk, fak
# function has no root in this interval
if fak*fbk > 0:
print("Stock Price Can't be doubled ")
# the existence of root in such an interval is not guaranteed
return 0, iteration
# multiple iteration
bk_1 = ak
while abs(bk - bk_1) > fun_tol and iteration < maxit:
fbk_1 = f(bk_1)
m = (ak + bk)/2
if fbk_1 != fbk:  # secant method
xr = bk - fbk*(bk - bk_1)/(fbk - fbk_1)
if bk < m:
if xr < m and xr > bk:
bk1 = xr
else:
bk1 = m
elif bk > m:
if xr > m and xr < bk:
bk1 = xr
else:
bk1 = m
else:  # bisection method
xr = (ak + bk)/2
bk1 = m
iteration = iteration + 1
fbk1 = f(bk1)
fxr = f(xr)
if abs(fxr) <= fun_tol:
return xr, iteration
if fak*fxr < 0:
ak1 = ak
else:
ak1 = bk
if abs(f(ak1)) < abs(f(bk1)):
ak, bk = bk, ak
fak, fbk = fbk, fak
bk_1 = bk
bk = bk1
ak = ak1
fak = f(ak)
fbk = f(bk1)
if iteration >= maxit:
return xr, iteration
# input ---------------------
mu = .006
sigma = 0.000012
k = 2
a = 1
b = 4000
fun_tol = 1e-12
maxit = 1000
# -----------------------------------
root, it_count = dekker(a, b, fun_tol, maxit)
print(root)
print(it_count)
