#!/usr/bin/env python

import sys
import rospy
import sendGcodeSerial
from gantry_control.msg import *
from std_msgs.msg import Bool

ready=False

def callbackReady(data):
	global ready
	ready=data.data

def callbackGo(data):
	go(data.levels)


def getArray(values):
	#Set up GCODE based on values
	gcode_array=[]
	for idx, value in enumerate(values):
		val_mapped=map28bit(value)
		if val_mapped==0:
			gcode_array.append('M107 P%d'%(idx))
		else:
			gcode_array.append('M106 P%d S%d'%(idx, val_mapped))
	return gcode_array



def go(values):
	global ready
	gcode_array = getArray(values)
	
	#Set up the serial connection
	params=rospy.get_param('gantry')
	devname=params['devname']
	baud=params['baudrate']
	
	s = sendGcodeSerial.obtain(devname,baud)
	
	#Send the GCODE commands
	for entry in gcode_array:
		sendGcodeSerial.fromLine(s,entry)
		
		while True:
			if ready:
				break
	


def map28bit(val):
	return int(val*255)
	
	
	
def server():
	rospy.init_node('valve_control', anonymous=True)
	rospy.Subscriber("/gantry/ready", Bool, callbackReady)
	rospy.Subscriber("/gantry/set_actuation", actuation, callbackGo)
	while not rospy.is_shutdown():
		rospy.spin()  #keep python from exiting until this node is stopped



if __name__ == '__main__':
    try:
        server()
    except rospy.ROSInterruptException:
        pass
