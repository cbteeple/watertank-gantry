#!/usr/bin/env python

import sys
import rospy
import os
import sys
from gantry_control.msg import *
import sendGcodeSerial



params=rospy.get_param('gantry')
baud=params['baudrate']
devname=params['devname']
folderpaths=params['folder_paths']
common_funs=params['common_funs']

parentDir = os.path.abspath(os.path.dirname(__file__) + '../../../../../..')
commonFunctionDir = os.path.join(parentDir, folderpaths['trajFolder'], folderpaths['commonFolder'])


# Append paths to the system path
sys.path.append(commonFunctionDir)


s = sendGcodeSerial.resume(devname,baud)

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






def get_traj_files(in_path):
	gcodeDir = os.path.join(parentDir, folderpaths['trajFolder'], in_path)
	sys.path.append(gcodeDir)
	# Get all the perturbations
	gcodeFiles = [os.path.join(gcodeDir,f) for f in os.listdir(gcodeDir)
	if os.path.isfile(os.path.join(gcodeDir, f))
	and "Perturbation" in os.path.join(gcodeDir, f) ]
	
	return gcodeFiles



def talk(arg):
	
	send_common_fun(arg)



if __name__ == '__main__':

	if len(sys.argv)==2:
		try:
		    talk(str(sys.argv[1]))
		except rospy.ROSInterruptException:
		    pass
