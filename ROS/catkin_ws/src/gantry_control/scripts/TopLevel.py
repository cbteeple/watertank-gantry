#!/usr/bin/env python

import sys
import rospy
import os
import sys
from gantry_control.msg import *
from return_control.srv import *
from std_msgs.msg import Bool
from std_srvs.srv import Empty, Trigger
from record_ros.srv import String_cmd
from data_manager.srv import *
import getFiles as files

trueMsg=Bool()
trueMsg.data=True
falseMsg=Bool()
falseMsg.data=False

camState=False
runComplete=False

SAVE_DATA=rospy.get_param('GLOBAL_SAVE_DATA')
CAMS_ON=rospy.get_param('GLOBAL_CAMS_ON')
DEBUG=False

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


#BAG FUNCTIONS (saving data)

def startBag():
	rospy.wait_for_service('record/cmd')
	bagstart=rospy.ServiceProxy('record/cmd', String_cmd)
	try:
		resp1 =	bagstart('record')
	except rospy.ServiceException as exc:
		if DEBUG:
			print("Service did not process request: " + str(exc))


def stopBag():
	rospy.wait_for_service('record/cmd')
	bagstop=rospy.ServiceProxy('record/cmd', String_cmd)
	try:
		resp1 = bagstop('stop')
	except rospy.ServiceException as exc:
		if DEBUG:
			print("Service did not process request: " + str(exc))


def updateBagParams(filename):
	rospy.wait_for_service('/update_bagfile')
	bagupdate=rospy.ServiceProxy('/update_bagfile', bag_update)
	try:
		resp1 = bagupdate(filename)
	except rospy.ServiceException as exc:
		if DEBUG:
			print("Service did not process request: " + str(exc))




#CAMERA FUNCTIONS (webcams)

def startCams():
	rospy.wait_for_service('/usb_cam0/start_capture')
	camstart=rospy.ServiceProxy('/usb_cam0/start_capture', Empty)
	try:
		resp1 = camstart()
	except rospy.ServiceException as exc:
		if DEBUG:
			print("Service did not process request: " + str(exc))


def stopCams():
	rospy.wait_for_service('/usb_cam0/stop_capture')
	camstop=rospy.ServiceProxy('/usb_cam0/stop_capture', Empty)
	try:
		resp1 = camstop()
	except rospy.ServiceException as exc:
		if DEBUG:
			print("Service did not process request: " + str(exc))


def startRecord():
	rospy.wait_for_service('/video_recorder/start_recording')
	recstart=rospy.ServiceProxy('/video_recorder/start_recording', Trigger)
	try:
		resp1 = recstart()
	except rospy.ServiceException as exc:
		if DEBUG:
			print("Service did not process request: " + str(exc))


def stopRecord():
	rospy.wait_for_service('/video_recorder/stop_recording')
	recstop=rospy.ServiceProxy('/video_recorder/stop_recording', Trigger)
	try:
		resp1 = recstop()
	except rospy.ServiceException as exc:
		if DEBUG:
			print("Service did not process request: " + str(exc))



#OBJECT RETURN FUNCTIONS

def startObjectReturn():
	rospy.wait_for_service('send_to_objectReturn')
	try:
		send_to_objectReturn = rospy.ServiceProxy('send_to_objectReturn', SerialSend)
		resp1 = send_to_objectReturn("MODE",[2])
		return 1
	except rospy.ServiceException, e:
		print "Service call failed: %s"%e



def stopObjectReturn():
	rospy.wait_for_service('send_to_objectReturn')
	try:
		send_to_objectReturn = rospy.ServiceProxy('send_to_objectReturn', SerialSend)
		resp1 = send_to_objectReturn("MODE",[0])
		return 1
	except rospy.ServiceException, e:
		print "Service call failed: %s"%e



#MAIN FUNCTIONS (send stuff)

def sendReps(filename,num_reps):
	global runComplete
	base=os.path.basename(filename)
	base=base.strip('.gcode')
	rate=rospy.Rate(5)

	for idx in range(num_reps):
		stopObjectReturn()
		out_file=base+'_rep'+str(idx)
		rospy.set_param('MAIN/curr_filename',out_file)
		#Update the bag file info
		if SAVE_DATA:
			updateBagParams(out_file)
			stopBag()
			startBag()

		runComplete=False
		camOnOff(True)
				
		fileName=str(filename)
		msg=runFile()
		msg.filename=fileName
		rospy.loginfo(msg)
		pub.publish(msg)
		while pub.get_num_connections()<1 and not rospy.is_shutdown():
			rate.sleep()

		while not runComplete and not rospy.is_shutdown():
			rate.sleep()

		startObjectReturn()
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
		startCams()
		startRecord()
		
		if DEBUG:
			rospy.loginfo("Starting Cameras")

		while not camState and not rospy.is_shutdown():
			rate.sleep()
	
		if DEBUG:
			print("The cameras are started!")
	
	else:
		stopRecord()
		stopCams()

		if DEBUG:
			rospy.loginfo("Stopping Cameras")

		while camState and not rospy.is_shutdown():
			rate.sleep()

		if DEBUG:
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
		try:
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
		except KeyboardInterrupt:
			pass
			