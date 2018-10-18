#!/usr/bin/env python

import matplotlib.pyplot as plt
import numpy as np
import cv2


t = np.arange(10)
plt.plot(t, np.sin(t))

img = cv2.imread('finger.jpg')

shape = img.shape

print shape


print("Please click")
x = plt.ginput(3)
print("clicked", x)
plt.show()