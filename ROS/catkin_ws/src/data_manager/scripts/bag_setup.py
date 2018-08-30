#!/usr/bin/env python

import sys
import rospy
import os
import sys
from std_srvs.srv import Trigger, TriggerResponse
from data_manager.srv import bag_update, bag_updateResponse

SAVE_DATA=rospy.get_param('GLOBAL_SAVE_DATA')
DEBUG=False


def updateBagfile(**kwargs):
	if kwargs.get('folder'):
		rospy.set_param('/record/path_save',kwargs['folder'])
	if kwargs.get('file'):
		rospy.set_param('/record/file_name',kwargs['file'])
	if kwargs.get('topics'):
		rospy.set_param('/record/topic',kwargs['topics'])


def getTopicString(topics):
	outStr=""
	for topic in topics:
		subtopics=rospy.get_published_topics(namespace=str(topic))
		if DEBUG:
			print('Topic: %s'%(topic))
			print('Subtopic: %s'%(subtopics))
		for subtopic in subtopics:
			outStr+= str(subtopic[0])+' '
	if DEBUG:
		print('Topics: %s'%(outStr))
	return outStr


def runInit(req):
	fullpath = rospy.get_param('MAIN/output_fullpath')
	topics = rospy.get_param('MAIN/save_topics')
	updateBagfile(folder=fullpath,topics=getTopicString(topics))

	return TriggerResponse(True,'Nice, you set the new filename for your bag file!')



def runUpdate(req):
	fullpath = rospy.get_param('MAIN/output_fullpath')
	topics = rospy.get_param('MAIN/save_topics')
	updateBagfile(folder=fullpath,file=req.filename,topics=getTopicString(topics))

	return bag_updateResponse()



def server():
	runInit('Not Used')
	if DEBUG:
		print('rosbag settings initialized')
	rospy.init_node('update_bagfile_server')
	s = rospy.Service('update_bagfile', bag_update, runUpdate)
	s = rospy.Service('initialize_bagfile', Trigger, runInit)
	print('data save servers started')
	rospy.spin()



if __name__ == '__main__':
	if SAVE_DATA:
		server()