#!/usr/bin/env python

import cv2
import numpy as np
from select_input import colorSampling, trackBars, getTrackValues
from point_extractor import pointExtractor
from termcolor import colored
import matplotlib.pyplot as plt
#from polyfit import ###

cap = cv2.VideoCapture(1)

'''
choose filter: 
1: average
2: Gaussian blur
3: median blur
'''
f = 3

'''
choose Sampling mode: 
1: Input select from image (lagy)
2: Hardcoding
3: Trackbar HSV selection
'''
mode = 3

#degree of the polynomial fit. not interchangeable yet

degree = 3

trackBars()

while(1):    

    _, frame = cap.read()
    
    if mode == 0:
        low, high = colorSampling(frame)
        lower_boundary = np.array([low[0, 0, 0], low[0, 0, 1], low[0, 0, 2]])
        upper_boundary = np.array([high[0, 0, 0], high[0, 0, 1], high[0, 0, 2]])
        increment = 1
        pass;
    
    if mode == 2:
        lower_boundary = np.array([35,100,100])
        upper_boundary = np.array([60,255,255])

    if mode == 3:
        lower_boundary, upper_boundary = getTrackValues()

    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV) 
    mask = cv2.inRange(hsv, lower_boundary, upper_boundary)
    res = cv2.bitwise_and(frame,frame, mask= mask)

    if f == 1:
        kernel = np.ones((15,15), np.float32)/225
        filtered = cv2.filter2D(res, -1, kernel)        

    elif f == 2:
        filtered = cv2.GaussianBlur(res, (15,15),0)        

    elif f == 3:
        filtered = cv2.medianBlur(res,15)
        

    else:
        pass

    edges = cv2.Canny(filtered, 100, 200)
    
    #returns the original image and the list of points
    frame_with_points, curvature = pointExtractor(edges, frame, 0, 40, degree)
    
    print colored('Curvature K', 'green')
    print curvature
    edges_3_channel = cv2.cvtColor(edges, cv2.COLOR_GRAY2BGR)    
    
    #show images
    numpy_horizontal_1 = np.hstack((res, filtered))
    numpy_horizontal_2 = np.hstack((edges_3_channel, frame))
    numpy_vertical = np.vstack((numpy_horizontal_1, numpy_horizontal_2))
    cv2.imshow('Mask, Filter, Canny Edge, Detected points', numpy_vertical)
        
    k = cv2.waitKey(5) & 0xFF
    if k == 27:
        break

cv2.destroyAllWindows()
cap.release()

'''
    kernel1 = np.ones((15,15), np.float32)
    kernel2 = np.ones((5,5), np.float32)
    erosion = cv2.erode(mask, kernel1, iterations = 1)
    dilation = cv2.dilate(mask, kernel1, iterations = 1)
    opening = cv2.morphologyEx(mask, cv2.MORPH_OPEN, kernel2)
'''
   

'''
    cv2.imshow('erosion',erosion)
    cv2.imshow('dilation',dilation)
    cv2.imshow('opening',opening)
'''