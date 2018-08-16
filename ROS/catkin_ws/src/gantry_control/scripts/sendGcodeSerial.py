#!/usr/bin/env python

import serial
import time
import rospy
import parseCommands

from gantry_control.msg import *

def begin(deviceLong):
	"""Start serial communication
	INPUTS:
		deviceLong - the long name of the device you want to use

	OUTPUTS:
		s - the serial object created
	"""	
	s = serial.Serial(deviceLong, 115200)
	return s


def end(s):
	"""Stop serial communcation
	INPUTS:
		s - serial object
	OUTPUTS:
		n/a
	"""
	s.close()


def initialize(s):
	"""Wake up the device and flush the input
	INPUTS:
		s - serial object

	OUTPUTS:
		n/a
	"""	
	s.write("\r\n\r\n")
	time.sleep(2)   # Wait for grbl to initialize
	s.flushInput()  # F300lush startup text in serial input


def fromFile(s,filename):
	"""Send lines from a file
	INPUTS:
		[serial]	s - a serial object
		[string]	filename - name of the file to use

	OUTPUTS:
		n/a
	"""
	f = open(filename,'r');

	# Stream g-code to grbl
	for line in f:
		l = line.strip()  # Strip all EOL characters for streaming
		
		publishSentData(l)
		print('Sending: ' + l)
		s.write(l + '\n')  # Send g-code block to grbl
		
		while True:
			ack=s.readline()
			publishRecievedData(ack.strip())
			# print(' : ' + ack.strip())
			if "ok" in ack:
				break

	# Close file and serial port
	f.close()
	
	
	
	
	
def publishSentData(out_msg): 
	pub = rospy.Publisher('to_gantry', to_gantry, queue_size=10)
	#rospy.init_node('talker',anonymous=True)
	if not rospy.is_shutdown():
		msg=to_gantry()
		msg.message = out_msg
		
		rospy.loginfo(msg)
		pub.publish(msg)
		
		
def publishRecievedData(in_msg): 
	pub = rospy.Publisher('from_gantry', from_gantry, queue_size=10)
	#rospy.init_node('talker',anonymous=True)
	if not rospy.is_shutdown():
		msg=from_gantry()
		if "X:" in in_msg:
			pos=in_msg.split(" ")
			pos_items=map(pos.__getitem__, {0,1,2})
						
			pos_act=[]
			for pos_item in pos_items:
				pos_split=pos_item.split(':')
				pos_act.append(float(pos_split[1]))
			
			print(pos_act)
			msg.position = pos_act
			
		msg.response = in_msg
		
		rospy.loginfo(msg)
		pub.publish(msg)
			
			
				
