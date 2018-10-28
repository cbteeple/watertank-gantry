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
	x = plt.ginput(2)
	print("clicked", x)
	plt.show()

	y_1 = x[0][0]
	x_1 = x[0][1]

	y_2 = x[1][0]
	x_2 = x[1][1]

	#y_3 = x[2][0]
	#x_3 = x[2][1]

	#y_4 = x[3][0]
	#x_4 = x[3][1]

	#BGR value of the points
	px_BGR_1 = image[x_1, y_1]
	print colored('BGR 1: ', 'green')
	print px_BGR_1
	px_BGR_2 = image[x_2 , y_2]
	print colored('BGR 2: ', 'green')
	print px_BGR_2

	point_1 = np.uint8([[[ px_BGR_1[0],px_BGR_1[1],px_BGR_1[2] ]]])
	point_2 = np.uint8([[[ px_BGR_2[0],px_BGR_2[1],px_BGR_2[2] ]]])
	
	#converting to hsv
	hsv_1 = cv2.cvtColor(point_1, cv2.COLOR_BGR2HSV)
	hsv_2 = cv2.cvtColor(point_2, cv2.COLOR_BGR2HSV)	

	if hsv_1[0,0,0] <= hsv_2[0,0,0]:
		low = hsv_1
		high = hsv_2
	else:
		high = hsv_1
		low = hsv_2

	print colored('Lower H bound: ', 'green')
	print low
	print colored('Higher H bound: ', 'green')
	print high

	return low, high;









