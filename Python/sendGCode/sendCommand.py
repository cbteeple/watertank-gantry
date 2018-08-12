#!/usr/bin/env python
"""\
Simple g-code streaming script
Clark Teeple (based on something from the hivemind that is the world wide web)
"""
import os
import sys

import sendSerial
import params

# _______________________________________________________________________________
# SETUP


parentDir = os.path.abspath(os.path.dirname(__file__) + '../..')
commonFunctionDir = os.path.join(parentDir, params.trajFolder, params.commonFolder)

print(commonFunctionDir)

# Append paths to the system path
sys.path.append(commonFunctionDir)


numTrials = 1  # Number of times to repeat each trajectory


# _______________________________________________________________________________
if __name__ == "__main__":
	s = sendSerial.begin(params.motorLong)
	if sys.argv[1] == "-r":
		sendSerial.fromFile(s, os.path.join(commonFunctionDir, params.stop_traj))

	elif sys.argv[1] == "-s":
		sendSerial.end(s)

	else:
		# do command
		sendSerial.fromFile(s,os.path.join(commonFunctionDir, sys.argv[1]+'.gcode'))


