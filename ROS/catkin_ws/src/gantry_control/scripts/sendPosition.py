#!/usr/bin/env python
import rospy
from gantry_control.msg import *
from std_msgs.msg import Bool
from std_srvs.srv import Trigger, TriggerResponse

import sendGcodeSerial

#Get Parameters
params=rospy.get_param('gantry')
baud=params['baudrate']
devname=params['devname']

# Open the serial port
s = sendGcodeSerial.obtain(devname,baud)

#Publish to the "sent" channel
pubSent = rospy.Publisher('/gantry/sent', to_gantry, queue_size=10)
pubReady = rospy.Publisher('/gantry/ready', Bool, queue_size=10)

falseMsg=Bool()
falseMsg.data=False

def callback(req):
	#Unpack trajectory element
	position=req.position
	speed=req.speed
	
	out_msg="G1 X%1.2f Y%1.2f Z%1.2f F%1.2f\n"%(position[0],position[1],position[2],speed)
	
	#Set the "ready" flag false (we need to wait for acknowledement)
	pubReady.publish(falseMsg)
	
	#Send the message to the motor controller
	sendGcodeSerial.fromLine(s,out_msg)
	sendGcodeSerial.fromLine(s,"M114\n")
	
	#Send a message out to the "sent" channel
	msg=to_gantry()
	msg.message = out_msg
	rospy.loginfo(out_msg)
	pubSent.publish(msg)
	

def getPos(req):
	sendGcodeSerial.fromLine(s,"M114\n")
	return TriggerResponse(True,'We did it!')


def server():
	rospy.init_node('sendPosition_server', anonymous=True)
	rospy.Subscriber("/gantry/set_position", trajectory, callback)
	rospy.Service('/gantry/get_pos',Trigger,getPos)

	while not rospy.is_shutdown():
		rospy.spin()  #keep python from exiting until this node is stopped


if __name__ == '__main__':
	try:
		server()
	except rospy.ROSInterruptException:
		pass



