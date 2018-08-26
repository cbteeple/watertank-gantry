#!/usr/bin/env python

import sys
import rospy
import rosbag
import os
import sys
from gantry_control.msg import *
from std_msgs.msg import Bool
from std_srvs.srv import Empty, Trigger
from record_ros.srv import String_cmd
import getFiles as files

trueMsg=Bool()
trueMsg.data=True
falseMsg=Bool()
falseMsg.data=False

camState=False
runComplete=False

SAVE_DATA=rospy.get_param('GLOBAL_SAVE_DATA')


def callbackCams(data):
	global camState
	camState=data.data
	

def callbackRunStatus(data):
	global runComplete
	runComplete = data.data

def find(lst, lookingFor):
	result = []
	for i, x in enumerate(lst):
		if x==lookingFor:
			result.append(i)
	return result


pub = rospy.Publisher("/gantry/runFile", runFile, queue_size=100)
rospy.Subscriber("/gantry/run_complete",Bool, callbackRunStatus)

pubCams = rospy.Publisher("/cameras/on_cmd", Bool, queue_size=100)
rospy.Subscriber("/cameras/state",Bool, callbackCams)


def startBag():
	rospy.wait_for_service('record/cmd')
	startBag=rospy.ServiceProxy('record/cmd', String_cmd)
	try:
		resp1 = startBag('record')
	except rospy.ServiceException as exc:
		print("Service did not process request: " + str(exc))


def stopBag():
	rospy.wait_for_service('record/cmd')
	startBag=rospy.ServiceProxy('record/cmd', String_cmd)
	try:
		resp1 = startBag('stop')
	except rospy.ServiceException as exc:
		print("Service did not process request: " + str(exc))



def sendReps(filename,num_reps):
	global runComplete
	base=os.path.basename(filename)
	rospy.set_param('MAIN/curr_filename',base)

	for idx in range(num_reps):
		if SAVE_DATA:
			startBag()

		runComplete=False
		camOnOff(True)
		rate=rospy.Rate(5)
		
		fileName=str(filename)
		msg=runFile()
		msg.filename=fileName
		rospy.loginfo(msg)
		pub.publish(msg)
		while pub.get_num_connections()<1 and not rospy.is_shutdown():
			rate.sleep()

		while not runComplete and not rospy.is_shutdown():
			rate.sleep()

		rospy.sleep(3)
		camOnOff(False)

		if SAVE_DATA:
			stopBag() #Stop the record node



def sendOne(fileIdx,num_reps):
	files_to_send=files.getTrajFiles()
	rospy.init_node('startFile_SingleFile', anonymous=True)

	sendReps(files_to_send[int(fileIdx)],num_reps)



def sendAll(num_reps):
	global runComplete
	files_to_send=files.getTrajFiles()
	rospy.init_node('startFile_All', anonymous=True)

	for filename in files_to_send:
		sendReps(filename,num_reps)





def camOnOff(camOn):
	rate=rospy.Rate(10)

	if camOn:
		print('waiting for cameras')
		rospy.wait_for_service('/usb_cam0/start_capture')

		startCap=rospy.ServiceProxy('/usb_cam0/start_capture', Empty)
		print('trying to start cameras')
		try:
			resp1 = startCap()
		except rospy.ServiceException as exc:
			print("Service did not process request: " + str(exc))

		print('waiting for recorder')
		rospy.wait_for_service('/video_recorder/start_recording')
		startRec=rospy.ServiceProxy('/video_recorder/start_recording', Trigger)
		print('trying to start recorder')
		try:
			resp1 = startRec()
		except rospy.ServiceException as exc:
			print("Service did not process request: " + str(exc))
		

		rospy.loginfo("Starting Cameras")
		pubCams.publish(trueMsg)


		while not camState and not rospy.is_shutdown():
			rate.sleep()
		print("The cameras are started!")
	
	else:
		print('waiting for recorder')
		rospy.wait_for_service('/video_recorder/stop_recording')
		stopRec=rospy.ServiceProxy('/video_recorder/stop_recording', Trigger)
		print('trying to stop recorder')
		try:
			resp1 = stopRec()
		except rospy.ServiceException as exc:
			print("Service did not process request: " + str(exc))


		print('waiting for cameras')
		rospy.wait_for_service('/usb_cam0/stop_capture')

		startCap=rospy.ServiceProxy('/usb_cam0/stop_capture', Empty)
		print('trying to stop cameras')
		try:
			resp1 = startCap()
		except rospy.ServiceException as exc:
			print("Service did not process request: " + str(exc))



		rospy.loginfo("Stopping Cameras")
		


		while camState and not rospy.is_shutdown():
			rate.sleep()
		print("The cameras are finished!")



def camTest():
	rate=rospy.Rate(10)

	rospy.loginfo("Starting Cameras")
	pubCams.publish(trueMsg)
	while not camState and not rospy.is_shutdown():
		rate.sleep()
	print("The cameras are started!")
	rospy.sleep(5)
	rospy.loginfo("Stopping Cameras")
	pubCams.publish(falseMsg)
	while camState and not rospy.is_shutdown():
		rate.sleep()
	print("Tha cameras are finished!")



if __name__ == '__main__':
	print(len(sys.argv))
	multiFile = True
	fileIdx = 0
	sendfile = True
	num_reps=rospy.get_param('MAIN/num_reps',1)

	if len(sys.argv)==2:
		if str(sys.argv[1]) == '-c':
			sendfile=False
			try:
				rospy.init_node('startFile', anonymous=True)
				camTest()
			except rospy.ROSInterruptException:
				pass

	elif len(sys.argv)>2:
		if str(sys.argv[1]) == '-c':
			sendfile=False
			try:
				rospy.init_node('startFile', anonymous=True)
				camOnOff(int(sys.argv[2]))
			except rospy.ROSInterruptException:
				pass

		else:
			repsArgIdx=find(sys.argv, '-reps')
			fileArgIdx=find(sys.argv, '-file')
			fileIdx=0
			num_reps=1

			if repsArgIdx:
				num_reps=int(sys.argv[repsArgIdx[0]+1])


			if fileArgIdx:
				multiFile=False
				fileIdx=int(sys.argv[fileArgIdx[0]+1])
	
	if sendfile:
		if multiFile:
			try:
				print("Starting all files in the folder")
				sendAll(num_reps)
			except rospy.ROSInterruptException:
				pass
		else:
			try:
				print("Starting File #%d"%(fileIdx))
				sendOne(fileIdx,num_reps)
			except rospy.ROSInterruptException:
				pass

			