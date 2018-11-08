#!/usr/bin/env python

import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import colorsys as cs
import numpy as np
import cv2
from termcolor import colored
from polyfit import curvatureCalculation
from operator import itemgetter

# input: cannyedge, Original Image, parameter: 1 for reduced size, zero full size, 
# increment between recorded points ((higher increment = fewer points)
# degree: degree of the polynomial fit
def pointExtractor(img, originalImg, parameter,increment, degree):
	
	sumK = 0
	pointList = [0]
	x = [0]
	y = [0]
	lines,columns = img.shape


	if parameter == 0:
		indices = np.where(img != [0])
		coordinates = zip(indices[0], indices[1])
		coordinates = sorted(coordinates,key=itemgetter(1))
		length = len(coordinates)

	if parameter == 1:
		img = cv2.resize(img,None,fx=0.5, fy=0.5, interpolation = cv2.INTER_CUBIC)
		originalImg = cv2.resize(originalImg ,None,fx=0.5, fy=0.5, interpolation = cv2.INTER_CUBIC)
		indices = np.where(img != [0])
		coordinates = zip(indices[0], indices[1])
		coordinates = sorted(coordinates,key=itemgetter(1))
		length = len(coordinates)
	
	#first item is the line, second item is the column. 
	for i in range(0,length - 1):	
		if coordinates[i + 1][1] == coordinates[i][1]:
			i = i + increment
		elif coordinates[i + 1][1] > coordinates[i][1]:
			pointList.append(coordinates[i])
			i = i + increment

	for i in range(1, len(pointList) -1):
		line = pointList[i][0] #line
		column = pointList[i][1]	#column
		x.append(column)
		y.append(lines - line)

		cv2.circle(originalImg,(column, line), 5, (0, 0, 255), +1) 

	poly = np.polyfit(x, y, degree, rcond=None, full=False, w=None, cov=False)
	p = np.poly1d(poly)
	
	#draw fitted function into original frame
	for i in range(1, len(x)-1):
		sumK = sumK + curvatureCalculation(poly, y[i])

	print poly	

	k = sumK / len(y)
	
	return originalImg, k;