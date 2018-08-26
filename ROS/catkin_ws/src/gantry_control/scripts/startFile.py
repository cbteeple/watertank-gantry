#!/usr/bin/env python

import sys
import rospy
import os
import sys
from gantry_control.msg import *
from std_msgs.msg import Bool
import getFiles as files


def talk(arg):

	files_to_send=files.getTrajFiles()
	pub = rospy.Publisher("/gantry/runFile", runFile, queue_size=100)

	rospy.init_node('startFile', anonymous=True)
	rate=rospy.Rate(5)
	
	fileName=str(files_to_send[int(arg)])
	msg=runFile()
	msg.filename=fileName
	rospy.loginfo(msg)
	pub.publish(msg)
	while pub.get_num_connections()<1:
		rate.sleep()





if __name__ == '__main__':
	if len(sys.argv)==1:
		print("We will eventually start multiple")
	elif len(sys.argv)==2:
		try:
			print("Starting File #%d"%(int(sys.argv[1])))
			talk(sys.argv[1])
		except rospy.ROSInterruptException:
			pass