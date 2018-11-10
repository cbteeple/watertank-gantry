#!/usr/bin/env python

import sys
import rospy
import sendGcodeSerial
from gantry_control.msg import *
from std_msgs.msg import Bool


class valvesGcode(object):
    def __init__(self):
        self.node_name = 'valve_control_gcode_node'

        #Set up variables
        self.ready=False

        #Set up publishers and subscribers
        self.sub_ready = rospy.Subscriber("/gantry/ready", Bool, self.callbackReady)
		self.sub_set   = rospy.Subscriber("/gantry/set_actuation", actuation, self.callbackGo)


	def callbackReady(self, data):
		self.ready=data.data


	def callbackGo(self, data):
		go(data.levels)


	def getArray(self, values):
		#Set up GCODE based on values
		gcode_array=[]
		for idx, value in enumerate(values):
			val_mapped=map28bit(value)
			if val_mapped==0:
				gcode_array.append('M107 P%d'%(idx))
			else:
				gcode_array.append('M106 P%d S%d'%(idx, val_mapped))
		return gcode_array



	def go(self, values):
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
				if self.ready:
					break
	


	def map28bit(self, val):
		return int(val*255)
	


if __name__ == '__main__':
    try:
    	rospy.init_node('valve_control', anonymous=True)
    	valve_control_node = valvesGcode()
    	
        while not rospy.is_shutdown():
			rospy.spin()  #keep python from exiting until this node is stopped

    except rospy.ROSInterruptException:
        pass
