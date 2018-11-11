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
		params=rospy.get_param('gantry')
		self.devname=params['devname']
		self.baud=params['baudrate']

		#Set up publishers and subscribers
		self.sub_set   = rospy.Subscriber("/gantry/set_actuation", actuation, self.callbackGo)

		#Send a "start" message
		rospy.loginfo("[%s] has started", self.node_name)


	def __del__(self):
		None


	def callbackGo(self, data):
		self.go(data.levels)


	def getArray(self, values):
		#Set up GCODE based on values
		gcode_array=[]
		for idx, value in enumerate(values):
			val_mapped=self.map28bit(value)
			if val_mapped==0:
				gcode_array.append('M107 P%d'%(idx))
			else:
				gcode_array.append('M106 P%d S%d'%(idx, val_mapped))
		return gcode_array



	def go(self, values):
		gcode_array = self.getArray(values)
		
		s = sendGcodeSerial.obtain(self.devname,self.baud)
		
		#Send the GCODE commands
		for entry in gcode_array:
			sendGcodeSerial.fromLine(s,entry)
			sendGcodeSerial.waitForOk(s);
	


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
