#!/usr/bin/env python

import matplotlib.pyplot as plt
import matplotlib.image as mpimg
from termcolor import colored
import colorsys as cs
import numpy as np
import cv2


def colorSampling(image):

#modify the input image
	#image = cv2.imread("finger.png")
	shape = image.shape
	cv2.imwrite('sample.png',image)
	hsv_image = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)

	img = mpimg.imread('sample.png')
	imgplot = plt.imshow(img)

	#get points of interest
	print colored("Please click", 'green')
	x = plt.ginput(4)
	print("clicked", x)
	plt.show()

	y_1 = x[0][0]
	x_1 = x[0][1]

	y_2 = x[1][0]
	x_2 = x[1][1]

	y_3 = x[2][0]
	x_3 = x[2][1]

	y_4 = x[3][0]
	x_4 = x[3][1]

	#BGR value of the points
	px_BGR_1 = image[x_1, y_1]
	print px_BGR_1
	px_BGR_2 = image[x_3 , y_3]
	print px_BGR_2

	px_hsv_1 = hsv_image[x_1, y_1]   #get the hsv value of the pixel or convert the rgb to hsv!!!
	px_hsv_2 = hsv_image[x_3, y_3]

	#converting to hsv



	if px_hsv_1[0] <= px_hsv_2[0]:
		low = px_hsv_1
		high = px_hsv_2
	else:
		high = px_hsv_1
		low = px_hsv_2

	print colored('Lower H bound: ', 'green')
	print low
	print colored('Higher H bound: ', 'green')
	print high

	return low, high;









