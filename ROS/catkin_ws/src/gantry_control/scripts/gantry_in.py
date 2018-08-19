#!/usr/bin/env python
import rospy
from gantry_control.msg import *
from std_msgs.msg import Bool

import sendGcodeSerial
import publishROSTopics as pubROS

#Get Parameters
params=rospy.get_param('gantry')
baud=params['baudrate']
devname=params['devname']

# Open the serial port
s = sendGcodeSerial.resume(devname,baud)

#Open publisher
pub = rospy.Publisher('/gantry/ready', Bool, queue_size=10)
trueMsg=Bool()
trueMsg.data=True

def getNewData(s):
	ack=s.readline()
	pubROS.publishFromData(ack.strip())
	# print(' : ' + ack.strip())
	if len(ack)>0:
		if "ok" in ack:
			rospy.loginfo(trueMsg)
			pub.publish(trueMsg)



def server():
	rospy.init_node('gantry_in_node', anonymous=True)
	while not rospy.is_shutdown():
		getNewData(s)
	

if __name__ == '__main__':
    server()
