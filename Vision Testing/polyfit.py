#!/usr/bin/env python

import cv2
import numpy as np
import math
from termcolor import colored

def loadImage():
	img_original = cv2.imread('finger.jpg')
	img_bckgrnd = cv2.imread('background.jpg')
	return;

def curvatureCalculation(poly, x):
	# polynom is an array of coefficients.
	poly1 = derivativeFirstDegree(poly)
	poly2 = derivativeSecondDegree(poly)

	#get the points to have a curvature along the way

	k = (poly2[0]*x +poly2[1]*x*x)/pow(1 + pow(poly1[0]+poly1[1]*x+poly[2]+x*x,2),3/2)
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
	

