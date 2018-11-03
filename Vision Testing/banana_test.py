#!/usr/bin/env python
import cv2
import numpy as np
import math



def loadImage():
	img_original = cv2.imread('finger.jpg')
	img_bckgrnd = cv2.imread('background.jpg')
	
	#img_original = img_original - img_bckgrnd
	'''
	inputImage = cv2.resize(img_original, (0,0), fx=0.5, fy=0.5) 
	inputImageGray = cv2.cvtColor(inputImage, cv2.COLOR_BGR2GRAY)


	# Set threshold and maxValue
	thresh = 200
	maxValue = 255
 
	# Basic threshold example
	th, dst_1 = cv2.threshold(inputImageGray, thresh, maxValue, cv2.THRESH_BINARY);

	kernel = np.ones((10,10),np.float32)/25

	dst = cv2.filter2D(inputImageGray,-1,kernel)

	#possibility to attach two blobs or more and do blob detection

	#edges = cv2.Canny(inputImageGray,150,300,apertureSize = 3)
	
    
	edges = cv2.Canny(dst,150,300,apertureSize = 3)

	median = cv2.medianBlur(edges,5)

	minLineLength = 30
	maxLineGap = 5
	lines = cv2.HoughLinesP(edges,cv2.HOUGH_PROBABILISTIC, np.pi/180, 30, minLineLength,maxLineGap)
	# arrange parameters!!!
	for x in range(0, len(lines)):
    		for x1,y1,x2,y2 in lines[x]:
        	#cv2.line(inputImage,(x1,y1),(x2,y2),(0,128,0),2, cv2.LINE_AA)
        		pts = np.array([[x1, y1 ], [x2 , y2]], np.int32)
        		cv2.polylines(inputImage, [pts], True, (0,255,0))

	font = cv2.FONT_HERSHEY_SIMPLEX
	cv2.putText(inputImage,"Tracks Detected", (500, 250), font, 0.5, 255)
	cv2.imshow('Threshold', dst_1)
	cv2.imshow("Lines", inputImage)
	cv2.imshow('edge', edges)
	cv2.imshow('dst', dst)
	cv2.waitKey(0)
	cv2.destroyAllWindows()
	'''
	return;

def pointExtractor(image):
	


	return POINTS OR POLYNOM; 


def curvatureCalculation(poly,arg1, arg2):
	# polynom is an array of coefficients.
	poly1 = derivativeFirstDegree(poly)
	poly2 = derivativeSecondDegree(poly)

	#get the points to have a curvature along the way
	k = (poly2[0]*x +poly2[1]*x*x)/pow(1 + pow(poly1[0]+poly1[1]*x+poly[2]+x*x,2),3/2)

	k = arg1 + arg2
	print "The curvature is:", k
	return k;

def derivativeFirstDegree(poly):
	poly[0] = poly[1]
	poly[1] = 2 * poly[2]
	poly[2] = 3 * poly[3]
	return poly;

def derivativeSecondDegree(poly):
	poly[0] = 2 * poly[2]
	poly[1] = 6 * poly[3]	
	return poly;
	

#debug
arg1 = 1
arg2 = 3

loadImage = loadImage()

