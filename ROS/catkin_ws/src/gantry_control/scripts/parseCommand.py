#!/usr/bin/env python

import time
import rospy
import publishROSTopics as pubROS
import valves_gcode_control

from gantry_control.msg import *


def parse(commandStr):
	#Set default value of output command
	command ={
		'action': None ,
		'values': None,
	}
	
	#Make sure the command has a semicolon, otherwise it's not valid
	if commandStr.startswith(';'):	
		commandStr = commandStr.strip() #Strip of newlines
		commandStr = commandStr.strip(';') #Strip of comment semicolons
		commandVec= commandStr.split(', ') #Split by comma+space
		
		if len(commandVec)>0:
			command['action'] = commandVec[0]
			
			if len(commandVec)>1:
				values = commandVec[1:]
				valueNums=[]
				for value in values:
					valueNums.append(float(value))
				command['values'] = valueNums
	
	return command


def execute(command):
	#Create function list
	switcher = {
		'VALVES':valves,
		'CAMERA':camera,
	}
	
	#Find the correct function from the list
	func = switcher.get(command['action'], incorrect)
	
	#Execute function
	func(command['values'])




#ACTION FUNCTIONS_____________

#Valves
def valves(values):
	params=rospy.get_param('gantry')
	valve_type=params['hand_actuation']
	
	valve_funs={
		'gcode': valves_gcode,
		'standalone': valves_standalone,
	}
	
	func = valve_funs.get(valve_type, incorrect)
	func(values)

	pubROS.publishActuation(values)


def valves_gcode(values):
	valves_gcode_control.go(values)
	

def valves_standalone(values):
	print('Not Configured Yet :/')







#Cameras
def camera(value):
	if len(value)==1:
		value=int(value)
		if value==1: #Start Camera
			print('start camera')
		elif value==0: #Stop Camera
			print('stop camera')
	else:
		print('Incorrect Camera Value')


#Incorrect Commands
def incorrect():
	print('Incorrect Command')
	
	
	
