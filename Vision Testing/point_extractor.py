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
def pointExtractor(img, originalImg, parameter,increment, degree,counter):

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
 
	for i in range(0,length - 1, increment):	
		if coordinates[i + 1][1] > coordinates[i][1]:
			pointList.append(coordinates[i])			
	
	for i in range(1, len(pointList) -1):
		line = pointList[i][0]
		column = pointList[i][1]	
		y.append(-line)
		x.append(column)

		cv2.circle(originalImg,(column, line), 5, (0, 0, 255), +1) 

	poly = np.polyfit(x, y, degree)
	poly_1 = np.polyfit(x, y, degree + 1)
	
	p = np.poly1d(poly)
	pdgr_1 = np.poly1d(poly_1)




	print pointList
	print colored('X', 'blue')
	print x
	print colored('Y', 'red')
	print y


	if counter > 300:
		plt.plot(x, y, 'ro')
		plt.ylim(-lines,0)
		plt.xlim(0, columns)
		plt.show()
	'''

	#xp = np.linspace(0, columns, 200)
	_ = plt.plot(x, y, '.', x, p(x), '-', x, pdgr_1(x), '--')
	plt.ylim(0,lines)
	plt.show()

	
	
	#draw fitted function into original frame?
	for i in range(1, len(x)-1):
		sumK = sumK + curvatureCalculation(poly, y[i])
	'''	

	k = sumK / len(y)

	
	return originalImg, k;