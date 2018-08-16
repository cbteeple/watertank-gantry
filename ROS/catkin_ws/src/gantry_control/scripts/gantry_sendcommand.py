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
commonFunctionDir = os.path.join(parentDir, folderpaths['trajFolder'], folderpaths['commonFolder'])

print(commonFunctionDir)

# Append paths to the system path
sys.path.append(commonFunctionDir)





def send_common_fun(command):
	command_file=common_funs.get(command)
	if command_file:
		s = sendGcodeSerial.begin(params['devname'])
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


def send_traj(gcodeFiles, numTrials):
	# Set up serial
	s = sendGcodeSerial.begin(params['devname'])
	sendGcodeSerial.initialize(s)

	# go home
	sendGcodeSerial.fromFile(s,os.path.join(commonFunctionDir, common_funs['go_home']))


	# Send the main gcode
	for gcodeFile in gcodeFiles:
		for x in range(numTrials):
			sendGcodeSerial.fromFile(s, gcodeFile)


	# Stop motor controller
	# sendGcodeSerial.fromFile(s, os.path.join(commonFunctionDir, params.stop_traj))
	sendGcodeSerial.fromFile(s, os.path.join(commonFunctionDir, common_funs['stop_traj']))

	# Close Serial
	sendGcodeSerial.end(s)





def send_stuff(req):
	command=req.command
	cmd_type=req.type

	if cmd_type == "common":
		send_common_fun(command)
		
	elif cmd_type == "traj":
		traj_path = req.path
		files_to_send = get_traj_files(traj_path)
		send_traj(files_to_send, params['num_reps'])
		
	return gantry_sendResponse(1)
	

def send_to_gantry_server():
	rospy.init_node('send_to_gantry_server')
	s = rospy.Service('send_to_gantry', gantry_send, send_stuff)
	print "Ready to send stuff to motor."
	rospy.spin()

if __name__ == "__main__":

	send_to_gantry_server()
	
	
	
	
	
