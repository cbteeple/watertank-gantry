#!/usr/bin/env python

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from matplotlib import style
from mpl_toolkits.mplot3d import Axes3D


style.use ('fivethirtyeight')

fig = plt.figure()
ax1 = fig.add_subplot(1,1,1)

#def animate(i):





degree = 2
dcm = 2

x = np.array([0.0, 1.0, 2.0, 3.0,  4.0,  5.0])
y = np.array([0.0, 0.8, 0.9, 0.1, -0.8, -1.0])
poly = np.polyfit(x, y, degree)
poly_1 = np.polyfit(x, y, degree + 1)

'''
for i in range(0,degree + 1):
	z[i] = (round (z[i], dcm))
'''

p = np.poly1d(poly)
pdgr_1 = np.poly1d(poly_1)
xp = np.linspace(-2, 6, 100)
_ = plt.plot(x, y, '.', xp, p(xp), '-', xp, pdgr_1(xp), '--')
plt.ylim(-2,2)
plt.show()


plt.plot([0, 189, 190, 193, 194, 195, 197, 196, 197], [0, 347, 372, 397, 422, 447, 472, 497, 522], 'ro')
#plt.plot([0, 1, 2, 3, 4], [0, 2, 4, 6, 8], 'ro')
#plt.ylim(0,480)
#plt.xlim(0,640)
plt.show()



