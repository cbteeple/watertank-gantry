#!/usr/bin/env python

import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import colorsys as cs
import numpy as np
from termcolor import colored
import cv2

# input: cannyedge, Original Image, parameter: 1 for reduced size, zero full size
def pointExtractor(img, originalImg, parameter):
	
	pointList = [0]

	if parameter == 0:
		indices = np.where(img != [0])
		coordinates = zip(indices[0], indices[1])
		length = len(coordinates)

	if parameter == 1:
		img = cv2.resize(img,None,fx=0.5, fy=0.5, interpolation = cv2.INTER_CUBIC)
		originalImg = cv2.resize(originalImg ,None,fx=0.5, fy=0.5, interpolation = cv2.INTER_CUBIC)
		indices = np.where(img != [0])
		coordinates = zip(indices[0], indices[1])
		length = len(coordinates)
	

	for i in range(0,length - 1):	
		if coordinates[i + 1][0] == coordinates[i][0]:
			i = i + 1
		elif coordinates[i + 1][0] > coordinates[i][0]:
			pointList.append(coordinates[i])
			i = i + 1

	for i in range(1, len(pointList) -1):
		a = pointList[i][0]
		b = pointList[i][1]	
		cv2.circle(originalImg,(a, b), 5, (0, 0, 255), +1)

	return originalImg;