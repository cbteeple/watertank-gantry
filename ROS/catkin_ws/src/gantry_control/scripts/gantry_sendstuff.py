#!/usr/bin/env python


from gantry_control.srv import *
from std_msgs.msg import String
import rospy
import os
import sys
import sendGcodeSerial

devname = '0'
baud = 0

#Get Settings
params=rospy.get_param('gantry')
baud=params['baudrate']
devname=params['devname']
folderpaths=params['folder_paths']
common_funs=params['common_funs']

parentDir = os.path.abspath(os.path.dirname(__file__) + '../../../../../..')
commonFunctionDir = os.path.join(parentDir, folderpaths['trajFolder', folderpaths['commonFolder'])

print(commonFunctionDir)

# Append paths to the system path
sys.path.append(commonFunctionDir)



def send_stuff(req):
	command=common_funs.get(req.command)
	if command:
		s = sendGcodeSerial.begin(params['devname'])
		if req.command == "-r":
			sendGcodeSerial.fromFile(s, os.path.join(commonFunctionDir, common_funs['stop_traj']))

		elif req.command == "-s":
			sendGcodeSerial.end(s)

		else:
			# do command
			sendGcodeSerial.fromFile(s,os.path.join(commonFunctionDir, command))
	else:
		print('Invalid Command')
	return gantry_sendResponse(1)
	

def send_to_gantry_server():
	rospy.init_node('send_to_gantry_server')
	s = rospy.Service('send_to_gantry', gantry_send, send_stuff)
	print "Ready to send stuff to motor."
	rospy.spin()

if __name__ == "__main__":

	send_to_gantry_server()
	
	
	
	
	
