#!/usr/bin/env python


from return_control.srv import *
from std_msgs.msg import String
import rospy
import serial_coms

devname = '0'
baud = 0



def send_stuff(req):
	com = serial_coms.resume(devname,baud)


	print(req)
	valStr=''
	for val in req.values:
		valStr+=';'+str(val)

	command_toSend = req.command.upper() +valStr+'\n'
	print(command_toSend)
	com.write(command_toSend)	
	return SerialSendResponse(1)
	


def send_to_objectReturn_server():
	rospy.init_node('send_to_objectReturn_server')
	s = rospy.Service('send_to_objectReturn', SerialSend, send_stuff)
	print "Ready to send stuff to motor."
	rospy.spin()

if __name__ == "__main__":
	if rospy.has_param('object_return'):
		params=rospy.get_param('object_return')
		baud=params['baudrate']
		devname=params['devname']
		
	send_to_objectReturn_server()
