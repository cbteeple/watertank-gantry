#!/usr/bin/env python

import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import colorsys as cs
import numpy as np
import cv2

x = 0

image = cv2.imread("finger.png")
hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
img = mpimg.imread('finger.png')
imgplot = plt.imshow(img)

#get points of interest
while x == 0:
	print("Please click")
	x = plt.ginput(4)
	print("clicked", x)
	#plt.show()
	break;

shape = image.shape
print shape

y_1 = x[0][0]
x_1 = x[0][1]

y_2 = x[1][0]
x_2 = x[1][1]

y_3 = x[2][0]
x_3 = x[2][1]

y_4 = x[3][0]
x_4 = x[3][1]

#returning hsv values of points of interest
px_hsv_1 = hsv[0.5 * (x_1 + x_2), 0.5 * (y_1 + y_2)]
px_hsv_2 = hsv[0.5 * (x_3 + x_4), 0.5 * (y_3 + y_4)]

if px_hsv_1[0] <= px_hsv_2[0]:
	low = px_hsv_1
	high = px_hsv_2
else:
	high = px_hsv_1
	low = px_hsv_2

print 'Lower H bound: ', low
print 'Higher H bound: ', high









