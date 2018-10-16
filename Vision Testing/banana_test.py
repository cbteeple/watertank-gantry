#!/usr/bin/env python
import cv2
import numpy as np
import math



def loadImage():
	img_original = cv2.imread('finger_test.jpg')
	inputImage = cv2.resize(img_original, (0,0), fx=0.5, fy=0.5) 

	#inputImage = cv2.imread("finger_test.jpg")
	inputImageGray = cv2.cvtColor(inputImage, cv2.COLOR_BGR2GRAY)

	kernel = np.ones((10,10),np.float32)/25

	dst = cv2.filter2D(inputImageGray,-1,kernel)

	#edges = cv2.Canny(inputImageGray,150,300,apertureSize = 3)
	
    
	edges = cv2.Canny(dst,150,300,apertureSize = 3)

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
	cv2.imshow("Lines", inputImage)
	cv2.imshow('edge', edges)
	cv2.imshow('dst', dst)
	cv2.waitKey(0)
		
	#TRY CATch

	#terminate the function !!!!
	cv2.destroyAllWindows()



	print "Hay"
	return;

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

#k = curvatureCalculation(poly,arg1, arg2)





# load and process the image
# calibrating...
# Filter detect the lines
# choose the right points
# implemenet curvature
