#!/usr/bin/env python

import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import colorsys as cs
import numpy as np
import cv2
from termcolor import colored
from polyfit_TESTING import curvatureCalculation
from operator import itemgetter


# input: cannyedge, Original Image, parameter: 1 for reduced size, zero full size, 
# increment between recorded points ((higher increment = fewer points)
# degree: degree of the polynomial fit
def pointExtractor(img, originalImg, parameter,increment, degree):
	
	sumK = 0
	pointList = [0]
	x = [0]
	y = [0]



	if parameter == 0:
		indices = np.where(img != [0])
		print colored('Indices', 'blue')
		print indices
		coordinates = zip(indices[0], indices[1])
		coordinates = sorted(coordinates,key=itemgetter(1))
		length = len(coordinates)
		print colored('Coordinates', 'green')
		print coordinates	

	for i in range(0,length - 1):	
		if coordinates[i + 1][1] == coordinates[i][1]:
			i = i + increment
		elif coordinates[i + 1][1] > coordinates[i][1]:
			pointList.append(coordinates[i])
			i = i + increment

	for i in range(1, len(pointList) -1):
		a = pointList[i][0]
		b = pointList[i][1]

		x.append(a)
		y.append(b)

		cv2.circle(originalImg,(b, a), 5, (0, 0, 255), +1) 

	'''
	poly = np.polyfit(x, y, degree, rcond=None, full=False, w=None, cov=False)
	p = np.poly1d(poly)

	for i in range(1, len(x)-1):
		sumK = sumK + curvatureCalculation(poly, x[i])


	k = sumK / len(x)
	'''
	k=0
	return originalImg, k;



li = [['John',2],['Jim',9],['Jason',1]]
li = sorted(li,key=itemgetter(1))
print li