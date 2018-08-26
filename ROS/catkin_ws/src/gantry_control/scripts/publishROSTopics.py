#!/usr/bin/env python

import time
import rospy
import parseCommand

from gantry_control.msg import *



def publishActuation(out_levels): 
	pub = rospy.Publisher('actuation', actuation, queue_size=10)
	#rospy.init_node('talker',anonymous=True)
	if not rospy.is_shutdown():
		msg=actuation()
		msg.levels = out_levels
		
		rospy.loginfo(msg)
		pub.publish(msg)



def publishToGantry(out_msg): 
	pub = rospy.Publisher('to_gantry', to_gantry, queue_size=10)
	#rospy.init_node('talker',anonymous=True)
	if not rospy.is_shutdown():
		msg=to_gantry()
		msg.message = out_msg
		
		rospy.loginfo(msg)
		pub.publish(msg)


def publishFromData(in_msg): 
	pub = rospy.Publisher('from_gantry', from_gantry, queue_size=10)
	#rospy.init_node('talker',anonymous=True)
	if not rospy.is_shutdown():
		msg=from_gantry()
		if in_msg.startswith("X:"):
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
