#!/usr/bin/env python

import rospy
from gantry_control.msg import *
from std_msgs.msg import Bool
import math
import sendGcodeSerial


#Get Parameters
DEBUG=rospy.get_param('GLOBAL_DEBUG') or rospy.get_param('/gantry/DEBUG')
params=rospy.get_param('gantry')
baud=params['baudrate']
devname=params['devname']


#Get the serial object
s = sendGcodeSerial.obtain(devname,baud)
posReached=False
curr_pos=[]
homed=False
new_home_state=False


def updateHome(data):
	global homed
	global new_home_state
	homed=data.data
	new_home_state=True

	if DEBUG:
		print('---testHome: Update Homing: %d'%(homed))


def updatePos(data):
	global posReached
	global curr_pos
	
	curr_pos = data.position
	posReached = True

	if DEBUG:
		print('---testHome: Update Position: '),
		print('%f\t%f\t%f'%(curr_pos[0],curr_pos[1],curr_pos[2]))
		print('Position Reached? %d'%(posReached))



def main():
	global curr_pos
	global posReached
	#Set up the node (It's a one-off thing)
	rospy.Subscriber("/gantry/curr_position", currPos, updatePos)
	rospy.Subscriber("/gantry/homed", Bool, updateHome)
	pubHome = rospy.Publisher('/gantry/homed', Bool, queue_size=10)
	pubIncomming = rospy.Publisher('/gantry/handle_incomming', Bool, queue_size=10)
	pubPos=rospy.Publisher('/gantry/set_position', trajectory, queue_size=10)

	rospy.init_node('testing_home', anonymous=True)
	#Get the current Position
	sendGcodeSerial.fromLine(s,'M114')

	while not posReached and not rospy.is_shutdown():
		pass

	posReached=False
	#pubIncomming.publish(False)
	msg=trajectory()
	msg.position=curr_pos
	msg.speed=100
	pubPos.publish(msg)

	while not (posReached or new_home_state) and not rospy.is_shutdown():
		pass

	print('Position Reached: %d\tNew HomeState: %d'%(posReached,new_home_state))
	if posReached:
		pubHome.publish(True)


if __name__ == '__main__':
	main()