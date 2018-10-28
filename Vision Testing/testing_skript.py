#!/usr/bin/env python

import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import colorsys as cs
import numpy as np
import cv2
from select_input import colorSampling

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


image = cv2.imread("finger.png")

lower,upper = colorSampling(image)

print lower
print upper