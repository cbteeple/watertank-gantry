#!/usr/bin/env python
import numpy as np
import cv2
import colorsys as cs
import matplotlib.pyplot as plt
import matplotlib.image as mpimg

from termcolor import colored
from polyfit import curvatureCalculation
from operator import itemgetter


# input: cannyedge, Original Image, parameter: 1 for reduced size, zero full size, 
# increment between recorded points ((higher increment = fewer points)
# degree: degree of the polynomial fit

def pointExtractor(img, originalImg, parameter,increment, degree,counter):

	V = 0
	pointList = []
	x = []
	y = []
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
 
	for i in range(0,length - 1, increment):	
		if coordinates[i + 1][1] > coordinates[i][1]:
			pointList.append(coordinates[i])			
	
	for i in range(1, len(pointList) -1):
		line = pointList[i][0]
		column = pointList[i][1]	
		y.append(-line + lines)
		x.append(column)

		cv2.circle(originalImg,(column, line), 5, (0, 0, 255), +1) 

	poly = np.polyfit(x, y, degree)
	poly_1 = np.polyfit(x, y, degree + 1)
	
	p = np.poly1d(poly)
	pdgr_1 = np.poly1d(poly_1)

	print poly

	poly_rounded = [ round(elem, 2) for elem in poly ]

	print poly_rounded

	print pointList
	print colored('X', 'blue')
	print x
	print colored('Y', 'red')
	print y


	if counter > 2000:
	
		plt.plot(x, y, 'ro')
		_ = plt.plot(x, y, '.', x, p(x), '-', x, pdgr_1(x), '--')
		plt.ylim(0, lines)
		plt.xlim(0, columns)
		plt.show()

	
	for i in range(0, len(x)):
		V = V + curvatureCalculation(poly[0], poly[1], poly[2], x[i])

	k = V / len(x)
	
	return originalImg, k;