#!/usr/bin/env python


from video_recorder.srv import *
from std_msgs.msg import String
import rospy

devname = '0'

#Get parameters
if rospy.has_param('camera1'):
	params=rospy.get_param('camera1')
	devname=params['devname']
	location=params['location']
	

def cam_do(req):
	com = serial.Serial(devname,baudrate=baud)
	command_toSend = 'TIME;' +str(req.command)+'\n'
	com.write(command_toSend)
	com.write('ON'+'\n')
	com.close()
	return SerialSendResponse(1)
	

def camera_server():
	rospy.init_node('camera_server_'+location,anonymous=True)
	s = rospy.Service('camera_control_'+location, cam_control, cam_do)
	print "Ready to send stuff to motor."
	rospy.spin()

if __name__ == "__main__":	
	camera_server()
