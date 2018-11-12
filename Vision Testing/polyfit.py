#!/usr/bin/env python

import cv2
import numpy as np
import math
from termcolor import colored
import matplotlib.pyplot as plt

def curvatureCalculation(poly, x):

	k = (6 * poly[0]*x + 2 * poly[1])/pow(1 + pow(3*poly[0]*x*x + 2*poly[1]*x + poly[2], 2), 1.5)


	return k;
