#!/usr/bin/env python

import cv2
import numpy as np
import math
from termcolor import colored
import matplotlib.pyplot as plt

def curvatureCalculation(A, B, C, x):
	
	#k = (6 * poly[0]*x + 2 * poly[1])/pow(1 + pow(3*poly[0]*x*x + 2*poly[1]*x + poly[2], 2), 1.5)
	k = (6 * A*x + 2 * B)/pow(1 + pow(3*A*x*x + 2*B*x + C, 2), 1.5)
	return k;



'''
# Trying out the polyfit!!!
lines = 480
columns = 640

x = [68, 80, 105, 116, 147, 187, 209, 262, 273, 320, 342, 353, 364, 400, 425, 450, 475, 500, 525, 558, 572]
y = [90, 92, 126, 126, 132, 137, 137, 135, 135, 133, 132, 132, 132, 131, 130, 130, 130, 129, 129, 127, 122]
#x = [1,2,3,4,5,7]
#y = [1,2,4,5,6,8]

polynom = np.polyfit(x, y, 10)

#polynom = [2.75000755e-06, -2.88366925e-03, 9.21112090e-01, 4.62299301e+01]
print polynom
p = np.poly1d(polynom)

plt.plot(x, y, 'ro')
_ = plt.plot(x, y, '.', x, p(x), '-')
plt.ylim(0, lines)
plt.xlim(0, columns)
plt.show()
'''