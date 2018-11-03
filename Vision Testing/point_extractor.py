#!/usr/bin/env python

import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import colorsys as cs
import numpy as np
from termcolor import colored
import cv2

# computationally very expensive to go through each pixel...
# thus create a window and see if the sum inside of all pixels values exceeds a ceetain threshold
# then record the position of the centroid of this window. 
'''
get the size of incomming image. 

for x in range until end of image 
	for y in range until end of image
		if pixel is white
			get record the pixel position
		else
			just continue
'''

'''
img = cv2.imread('egdges_screenshot_25.10.2018.png', 0)
edges = cv2.Canny(img, 100, 255)

indices = np.where(edges != [0])
coordinates = zip(indices[0], indices[1])

shape = edges.shape
print shape

print indices
print coordinates
'''

edges = cv2.imread('edges_screenshot_02.11.2018_2.png', 0)
res = cv2.resize(edges,None,fx=0.5, fy=0.5, interpolation = cv2.INTER_CUBIC)
cv2.imshow('edges', edges)
cv2.imshow('res', res)
shape = edges.shape



indices = np.where(edges != [0])
coordinates = zip(indices[0], indices[1])

length = len(coordinates)

print colored('Indices ', 'green')
print indices
print colored('coordinates ', 'green')
print coordinates
print colored('length ', 'green')
print length# get the point of the lowest or highest y
print colored('shape ', 'green')
print shape

#for same column take the coordinates of the pixel on the last row.
# for that compare if the next coordinates column index is higher or not than
# the current one. If yes the current coordinates are the ones to store. If not, 
#go to next point. 



cv2.waitKey(0)
cv2.destroyAllWindows()
