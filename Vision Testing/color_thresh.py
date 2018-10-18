#!/usr/bin/env python
import cv2
import numpy as np


frame = cv2.imread('reddots.jpg')
hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    
lower_red = np.array([30,150,50])
upper_red = np.array([255,255,180])
   
mask = cv2.inRange(hsv, lower_red, upper_red)
res = cv2.bitwise_and(frame,frame, mask= mask)

cv2.imshow('frame',frame)
cv2.imshow('mask',mask)
cv2.imshow('res',res)
cv2.waitKey(0)   
cv2.destroyAll