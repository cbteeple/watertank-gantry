#!/usr/bin/env python

import serial
import time


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
		s - a serial object
		filename - name of the file to use

	OUTPUTS:
		n/a
	"""
	f = open(filename,'r');

	# Stream g-code to grbl
	for line in f:
		l = line.strip()  # Strip all EOL characters for streaming
		print('Sending: ' + l)
		s.write(l + '\n')  # Send g-code block to grbl
		
		while True:
			ack=s.readline()
			print(' : ' + ack.strip())
			if "ok" in ack:
				break

	# Close file and serial port
	f.close()
