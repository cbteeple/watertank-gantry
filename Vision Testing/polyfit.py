#!/usr/bin/env python

import cv2
import numpy as np
import math
from termcolor import colored
import matplotlib.pyplot as plt

def curvatureCalculation(A, B, C, x):
	
	#k = (6 * poly[0]*x + 2 * poly[1])/pow(1 + pow(3*poly[0]*x*x + 2*poly[1]*x + poly[2], 2), 1.5)
	k = (6 * A*x + 2 * B)/pow(1 + pow(3*A*x*x + 2*B*x + C, 2), 1.5)


	return k;
