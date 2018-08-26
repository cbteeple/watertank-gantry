#!/usr/bin/env python

import serial
import time
import parseCommand
import publishROSTopics as pubROS

from gantry_control.msg import *


def begin(devname,baud):
	"""Start serial communication
	INPUTS:
		devname - the short name of the device you want to use
		baud    - baud rate

	OUTPUTS:
		s - the serial object created
	"""	
	s = serial.Serial(devname, baud)
	if s.isOpen():
		s.close()
	s.open()
		
	return s

	
def resume(devname,baud):
	"""Start serial communication
	INPUTS:
		devname - the short name of the device you want to use
		baud    - baud rate

	OUTPUTS:
		s - the serial object created
	"""	
	s = serial.Serial(devname, baud)
	if not s.isOpen():
		s.open()
		
	return s


def obtain(devname,baud):
	"""Start serial communication
	INPUTS:
		devname - the short name of the device you want to use
		baud    - baud rate

	OUTPUTS:
		s - the serial object created
	"""	
	s = serial.Serial(devname, baud)
		
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
		if l.startswith(';'):
			extCommand=parseCommand.parse(l)
			parseCommand.execute(extCommand)
		else:
			print('Sending: ' + l)
			s.write(l + '\n')  # Send g-code block to grbl
			# Close file and serial port
	f.close()
	


def fromArray(s,in_array):
	"""Send lines from array
	INPUTS:
		[serial]		s - a serial object
		[string array]	in_array - the array to use

	OUTPUTS:
		n/a
	"""
	# Stream g-code to grbl
	for line in in_array:
		l = line.strip()  # Strip all EOL characters for streaming
		if l.startswith(';'):
			extCommand=parseCommand.parse(l)
			parseCommand.execute(extCommand)
		else:
			pubROS.publishToGantry(l)
			print('Sending: ' + l)
			s.write(l + '\n')  # Send g-code block to grbl
		
			while True:
				ack=s.readline()
				pubROS.publishFromData(ack.strip())
				# print(' : ' + ack.strip())
				if "ok" in ack:
					break

	

def fromLine(s,line):
	"""Send line
	INPUTS:
		[serial]	s - a serial object
		[string]	line - the line of gcode to send

	OUTPUTS:
		n/a
	"""
	l = line.strip()  # Strip all EOL characters for streaming
	if l.startswith(';'):
		return
	else:
		print('Sending: ' + l)
		s.write(l + '\n')  # Send g-code block to grbl


def waitForOK(s):	
	while True:
		ack=s.readline()
		if "ok" in ack:
			break			
			
				
