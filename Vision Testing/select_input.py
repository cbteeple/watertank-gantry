#!/usr/bin/env python

import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import colorsys as cs
import numpy as np
import cv2


image = cv2.imread("finger.png")
hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
img = mpimg.imread('finger.png')
imgplot = plt.imshow(img)

x = 0

while x == 0:
	print("Please click")
	x = plt.ginput(2)
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

px_hsv_1 = hsv[x_1, y_1]
px_hsv_2 = hsv[x_2, y_2]
px_hsv_3 = hsv[x_3, y_3]
print 'HSV point 1: ', px_hsv_1
print 'HSV point 2: ', px_hsv_2



hsv_final = (px_hsv_1, px_hsv_2)





#px_bgr = image[x_1, y_1]
#print 'BGR: ', px_bgr






