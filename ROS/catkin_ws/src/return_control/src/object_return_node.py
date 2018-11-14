#!/usr/bin/env python

#Adapted from:
#https://answers.ros.org/question/159276/read-data-from-serial-port-and-publish-over-a-topic/


import roslib
import rospy
from return_control.msg import serial_data, setpoint, send_command
from std_msgs.msg import String
import serial_coms
import thread
import numpy as np


class objectReturn(object):
	def __init__(self):
		self.node_name = rospy.get_name()
		rospy.loginfo("[%s] Initializing......" %(self.node_name))
		#Get params
		#params=rospy.get_param('object_return')
		self.baud=rospy.get_param('baudrate')
		self.devname=rospy.get_param('devname')

		#Set up serial communication
		self.serial_obj = serial_coms.resume(self.devname,self.baud)
		self.startSerial()

		#Set up ros publishers
		self.pub = rospy.Publisher('/object_return/location', serial_data, queue_size=10)
		self.pubRaw = rospy.Publisher('/object_return/raw', String, queue_size=10)

		#Like, comment and subscribe for more great content!
		self.sub_set_position = rospy.Subscriber("/object_return/send_command'", send_command, self.sendCommand, queue_size=10)
		self.sub_set_position = rospy.Subscriber("/object_return/set_setpoint'", setpoint, self.setSetpoint, queue_size=10)

		self.curr_pos = []
		self.curr_setpos = 0



	#Start the serial port
	def startSerial(self):
		serial_coms.initialize(self.serial_obj)


	#Search for new data continouously
	def spin(self):
		#This is sort of like a task manager for the object return.
		while not rospy.is_shutdown():
			#Check for new serial data
			self.getNewData()


	#Get new data from the serial port if it exists
	def getNewData(self):
		if self.serial_obj.in_waiting:
			try:
				data= self.serial_obj.readline() # Read data from serial port
				if data.startswith('_'):
					msg=String()
					msg.data=data
					rospy.loginfo(msg)
					self.pubRaw.publish(msg)

				else:
					try:	
						dataVec=data[0:-1].split("\t")
						msg=serial_data()
						msg.milliseconds=long(dataVec[0])
						msg.rate=long(dataVec[1])
						msg.data=map(float,dataVec[2:])

						self.curr_pos=map(float,dataVec[2:])
						
						rospy.loginfo(msg)
						self.pub.publish(msg)
					except ValueError:
						rospy.logerr('OBJECT RETURN: data was garbled...ignoring it')

			except serial.serialutil.SerialException:
				rospy.logerr('OBJECT RETURN: Serial read error...ignoring it')


	#Callback fucnction when a new command message is recieved
	def sendCommand(self,command_msg):
		valStr=''
		for val in command_msg.values:
			valStr+=';'+str(val)

		command_toSend = command_msg.command.upper() +valStr+'\n'
		self.serial_obj.write(command_toSend)


	#Callback fucnction when a new setpoint message is recieved
	def setSetpoint(self,setpoint_msg):
		if (setpoint_msg.time == 0.0) or (setpoint_msg.time is None):
			self.sendSetpoint(setpoint_msg.setpoint)
		else:
			self.calculateSetpointTraj(setpoint_msg.setpoint, setpoint_msg.time, setpoint_msg.num_segs)


	#Calculate a linear move from the current setpoint to the new one, then execute it
	def calculateSetpointTraj(self, new_setpoint, total_time, num_segs):
		old_setpos = self.curr_setpos

		dist_vec = np.linspace(old_setpos, new_setpoint, num_segs)
		timestep = total_time/num_segs

		self.sendSetpointTraj(self,setpoint_traj, timestep)


	#Send the setpoint to the motor controller
	def sendSetpoint(self,setpoint):
		self.serial_obj.write("SET;%1.3f\n"%(setpoint))


	#Execute a trajectory from an array
	def sendSetpointTraj(self,setpoint_traj, timestep):
	#Send a smooth trajectory
		rate=rospy.Rate(1/timestep)
		for setpoint_curr in setpoint_traj:
			sendSetpoint(setpoint_curr)
			rate.sleep()




if __name__ == '__main__':
	try:
		rospy.init_node('talker',anonymous=True)
		object_return = objectReturn()

		#You spin me right round baby right round
		#like a record player right round round round
		thread.start_new_thread(object_return.spin, ())

	except rospy.ROSInterruptException:
		pass
