#!/usr/bin/env python

import cv2
import numpy as np
from select_input import colorSampling, trackBars, getTrackValues
from termcolor import colored


cap = cv2.VideoCapture(0)

'''
choose filtering mode: 
1: average
2: Gaussian blur
3: median blur
'''
f = 3

'''
choose filtering mode: 
1: Input select from image (lagy)
2: Hardcoding
3: Trackbar HSV selection
'''
mode = 3

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

    print colored('Lower H bound: ', 'green')
    print lower_boundary
    print colored('Higher H bound: ', 'green')
    print upper_boundary

    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV) 
    mask = cv2.inRange(hsv, lower_boundary, upper_boundary)
    res = cv2.bitwise_and(frame,frame, mask= mask)

    cv2.imshow('frame',frame)
    cv2.imshow('hsv', hsv)
    #cv2.imshow('mask',mask)
    cv2.imshow('res',res)

    if f == 1:
        kernel = np.ones((15,15), np.float32)/225
        smoothed = cv2.filter2D(res, -1, kernel)
        cv2.imshow('smoothed',smoothed)

    elif f == 2:
        blur = cv2.GaussianBlur(res, (15,15),0)
        cv2.imshow('gaussian blur',blur)

    elif f == 3:
        median = cv2.medianBlur(res,15)
        cv2.imshow('median blur',median)

    else:
        pass

    edges = cv2.Canny(median, 100, 200)
    #shape = edges.shape

    cv2.imshow('edges', edges)
        
    k = cv2.waitKey(5) & 0xFF
    if k == 27:
        break

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



cv2.destroyAllWindows()
cap.release()