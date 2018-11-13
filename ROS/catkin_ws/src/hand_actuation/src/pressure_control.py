#!/usr/bin/env python

import sys
import rospy
from gantry_control import sendGcodeSerial #THIS MAY NOT WORK
from gantry_control.msg import set_finger_pressure
from std_msgs.msg import Bool


class handPressureController(object):
	def __init__(self):
		self.node_name = 'hand_pressure_control_node'
		self.is_shutdown=False

		#Set up variables
		params=rospy.get_param('hand')
		self.devname=params['devname']
		self.baud=params['baudrate']
		self.num_fingers=params['num_fingers']

		#Set up publishers and subscribers
		self.sub_set_pressure = rospy.Subscriber("/hand/set_pressure", set_pressure, self.callbackGo)

		self.hand_serial_obj = sendGcodeSerial.obtain(self.devname,self.baud)

		#Send a "start" message
		rospy.loginfo("[%s] has started", self.node_name)


	def __del__(self):
		None #This syntax might not work


	def callbackGo(self, data):
		self.go(data.pressures)


	def setup(self):
		self.hand_serial_obj.write("CHANNELS;%d"%self.num_fingers)
		self.setPressures([0 for i in range(self.num_fingers)])


	def setPressures(self, values):
		#Send the desired pressures to the pressure controller
		out_msg="SET"
		for value in values:
			out_msg += ";%1.3f"%value
		out_msg+="\n"

		self.hand_serial_obj.write(out_msg)


	
	def onShutdown(self):
		rospy.loginfo("[%s] Shutting Down." %(self.node_name))
		sendGcodeSerial.end(self.hand_serial_obj) #Shut down the serial port to the hand
		self.is_shutdown=True  #Mark this object "shut down"
		rospy.loginfo("[%s] Shutdown Successful." %(self.node_name))


if __name__ == '__main__':
	try:
		rospy.init_node('valve_control', anonymous=True)
		valve_control_node = handPressureController()
		rospy.on_shutdown(valve_control_node.onShutdown)

		while not rospy.is_shutdown():
			rospy.spin()  #keep python from exiting until this node is stopped

	except rospy.ROSInterruptException:
		pass
