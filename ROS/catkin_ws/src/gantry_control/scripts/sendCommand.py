#!/usr/bin/env python

import sys
import rospy
import os
import sys
from gantry_control.msg import *
from std_msgs.msg import Bool
import sendGcodeSerial
import getFiles as files



params=rospy.get_param('gantry')
baud=params['baudrate']
devname=params['devname']
common_funs=params['common_funs']

commonFunctionDir = files.getCommonDir(params)


# Append paths to the system path
sys.path.append(commonFunctionDir)

trueMsg=Bool()
trueMsg.data=True


s = sendGcodeSerial.obtain(devname,baud)

def send_common_fun(command):
	command_file=common_funs.get(command)
	if command_file:
		#sendGcodeSerial.initialize(s)
		
		if command == "-r":
			sendGcodeSerial.fromFile(s, os.path.join(commonFunctionDir, common_funs['stop_traj']))

		elif command == "-s":
			sendGcodeSerial.end(s)

		else:
			# do command
			sendGcodeSerial.fromFile(s,os.path.join(commonFunctionDir, command_file))
		
	else:
		print('Invalid Command')


def raw(command):
	sendGcodeSerial.fromLine(s,command)


def accel(newAccels):
	outStr='M201'
	for accel in newAccels:
		outStr+=(' '+str(accel))
	outStr=outStr.upper()+'\n'
	sendGcodeSerial.fromLine(s,outStr)





def talk(arg):
	homePub = rospy.Publisher('/gantry/homed', Bool, queue_size=10)
	rospy.init_node('commandSend_node', anonymous=True)

	send_common_fun(arg)
	if arg=='go_home':
		rospy.loginfo("HOME COMMAND SENT")
		homePub.publish(trueMsg)
		print("--- I'm going home, to the place where I belong")
		rospy.sleep(0.5)



if __name__ == '__main__':

	if len(sys.argv)==2:
		try:
			talk(str(sys.argv[1]))
		except rospy.ROSInterruptException:
			pass
	elif len(sys.argv)>2:
		if sys.argv[1]=='-g':
			try:
				raw(sys.argv[2])
			except rospy.ROSInterruptException:
				pass
		elif sys.argv[1]=='-a':
			try:
				accel(sys.argv[2:])
			except rospy.ROSInterruptException:
				pass

