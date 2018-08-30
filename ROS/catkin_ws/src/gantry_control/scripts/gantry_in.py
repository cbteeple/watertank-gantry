#!/usr/bin/env python
import rospy
from gantry_control.msg import *
from std_msgs.msg import Bool

import sendGcodeSerial
import publishROSTopics as pubROS

#Get Parameters
DEBUG=rospy.get_param('GLOBAL_DEBUG') or rospy.get_param('/gantry/DEBUG')
params=rospy.get_param('gantry')
baud=params['baudrate']
devname=params['devname']

# Open the serial port
s = sendGcodeSerial.resume(devname,baud)
read_data=True

def readOn(data):
	global read_data
	read_data=data.data
	if DEBUG:
		if read_data:
			print('---gantry_in: RAMBO handling Started')
		else:
			print('---gantry_in: RAMBO handling is up to you now...')


#Open publisher
pub = rospy.Publisher('/gantry/ready', Bool, queue_size=10)
posPub = rospy.Publisher('/gantry/curr_position', currPos, queue_size=10)
homePub = rospy.Publisher('/gantry/homed', Bool, queue_size=10)
rospy.Subscriber('/gantry/handle_incomming',Bool,readOn)
trueMsg=Bool()
trueMsg.data=True
falseMsg=Bool()
falseMsg.data=False

def getNewData(s):
	if s.in_waiting:
		try:
			ack=s.readline()
		except serial.serialutil.SerialException:
			rospy.logerr('GANTRY CONTROL: Serial read error...ignoring it')
			return
		#pubROS.publishFromData(ack.strip())
		if DEBUG:
			print(' : ' + ack.strip())
		if len(ack)>0:
			if "ok" in ack:
				rospy.loginfo(trueMsg)
				pub.publish(trueMsg)
			elif ack.startswith("X:"):
				posMsg=currPos()
				pos=ack.split(" ")
				pos_items=map(pos.__getitem__, {0,1,2})
							
				pos_act=[]
				for pos_item in pos_items:
					pos_split=pos_item.split(':')
					pos_act.append(float(pos_split[1]))
				
				posMsg.position = pos_act
				rospy.loginfo(posMsg)
				posPub.publish(posMsg)
				#homePub.publish(trueMsg)
			elif "Home XYZ first" in ack:
				rospy.logfatal('PLEASE HOME STAGE - The Stage is NOT HOMED YET')
				homePub.publish(falseMsg)
			elif "start" in ack:
				rospy.logerr('PLEASE HOME STAGE - The Stage is NOT HOMED YET')
				homePub.publish(falseMsg)


def server():
	rospy.init_node('gantry_in_node', anonymous=True)
	FastRate=rospy.Rate(200)
	while not rospy.is_shutdown():
		if read_data:
			getNewData(s)
		FastRate.sleep()
	

if __name__ == '__main__':
    server()
