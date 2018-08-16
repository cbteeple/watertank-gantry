#!/usr/bin/env python

import sys
import rospy
import sendGcodeSerial

def go(values):
	#Set up GCODE based on values
	gcode_array=[]
	for idx, value in enumerate(values):
		val_mapped=map28bit(value)
		if val_mapped==0:
			gcode_array.append('M107 P%d'%(idx))
		else:
			gcode_array.append('M106 P%d S%d'%(idx, val_mapped))
	
	#Set up the serial connection
	params=rospy.get_param('gantry')
	devname=params['devname']
	baud=params['baudrate']
	
	s = sendGcodeSerial.resume(devname,baud)
	
	#Send the GCODE commands
	sendGcodeSerial.fromArray(s,gcode_array)


def map28bit(val):
	return int(val*255)
