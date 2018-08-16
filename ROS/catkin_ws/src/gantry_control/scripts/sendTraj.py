#!/usr/bin/env python
"""\
Simple g-code streaming script
Clark Teeple (based on something from the hivemind that is the world wide web)
"""
import os
import sys

import sendGcodeSerial
import params

# _______________________________________________________________________________
# SETUP


parentDir = os.path.abspath(os.path.dirname(__file__) + '../..')
gcodeDir = os.path.join(parentDir, params.trajFolder, params.gcodeFolder)
commonFunctionDir = os.path.join(parentDir, params.trajFolder, params.commonFolder)

print(gcodeDir)
print(commonFunctionDir)

# Append paths to the system path
sys.path.append(gcodeDir)
sys.path.append(commonFunctionDir)

# Name of the gcode file to use (This will be a function input later)
onefile = False

if onefile:
	gcodeFiles = [params.gcodeFolder + '_Full.gcode']

else:
	# Get all the perturbations
	gcodeFiles = [f for f in os.listdir(gcodeDir)
	if os.path.isfile(os.path.join(gcodeDir, f))
	and "Perturbation" in os.path.join(gcodeDir, f) ]


numTrials = 1  # Number of times to repeat each trajectory


# _______________________________________________________________________________
# SERIAL COMMS

# Set up serial
s = sendSerial.begin(params.motorLong)
sendSerial.initialize(s)

# go home
sendSerial.fromFile(s,os.path.join(commonFunctionDir, params.go_home))


# Send the main gcode
for gcodeFile in gcodeFiles:
	for x in range(numTrials):
		sendSerial.fromFile(s, os.path.join(gcodeDir, gcodeFile))


# Stop motor controller
# sendSerial.fromFile(s, os.path.join(commonFunctionDir, params.stop_traj))
sendSerial.fromFile(s, os.path.join(commonFunctionDir, params.high_five))

# Close Serial
sendSerial.end(s)

