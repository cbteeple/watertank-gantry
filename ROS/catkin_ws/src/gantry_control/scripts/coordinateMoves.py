#!/usr/bin/env python
import rospy
from gantry_control.msg import *
from std_msgs.msg import Bool
from std_srvs.srv import Trigger, TriggerResponse
import math

import valves_gcode_control

#Get Parameters
DEBUG=rospy.get_param('GLOBAL_DEBUG') or rospy.get_param('/gantry/DEBUG')
params=rospy.get_param('gantry')
SAVE_DATA=rospy.get_param('GLOBAL_SAVE_DATA')

ready = True
posReached = 0
homed = False
curr_pos=[]
fileNames=[]
factor=1.0


def callbackReady(data):
	global ready
	
	if DEBUG:
		print("---coordinateMoves: Update READY State from: %d"%(ready)),
	ready=data.data
	if DEBUG:
		print("\tto: %d"%(ready))
	
def callbackNewRun(data):
	if DEBUG:
		print(fileNames)
	fileNames.append(data.filename)
	if DEBUG:
		print(fileNames)
	
def updatePos(data):
	global posReached
	global curr_pos
	
	curr_pos = data.position
	posReached = 1

	if DEBUG:
		print('---coordinateMoves: Update Position: '),
		print('%f\t%f\t%f'%(curr_pos[0],curr_pos[1],curr_pos[2]))
		print('Position Reached? %d'%(posReached))

def callbackHomed(data):
	global homed
	homed=data.data
	if DEBUG:
		print('---coordinateMoves: Update Homing Status: %d'%(homed))



def queryPosition():
	rospy.wait_for_service('/gantry/get_pos')
	query=rospy.ServiceProxy('/gantry/get_pos', Trigger)
	try:
		resp1 = query()
	except rospy.ServiceException as exc:
		if DEBUG:
			print("Service did not process request: " + str(exc))



def server():
	global posReached
	global curr_pos
	global ready
	global fileNames

	pubPos = rospy.Publisher("/gantry/set_position", trajectory, queue_size=10)
	pubAct =rospy.Publisher("gantry/set_actuation", actuation, queue_size=10)
	pubRun =rospy.Publisher("gantry/runFile_ack", Bool, queue_size=10)
	pubComplete =rospy.Publisher("/gantry/run_complete", Bool, queue_size=10)
	 
	#also actuation will be a service
	rospy.Subscriber("/gantry/ready", Bool, callbackReady)
	rospy.Subscriber("/gantry/homed",Bool,callbackHomed)
	rospy.Subscriber("/gantry/runFile", runFile, callbackNewRun)
	rospy.Subscriber("/gantry/curr_position", currPos, updatePos)

	rospy.init_node('motion_server', anonymous=True)

	rate = rospy.Rate(100)
	outerRate=rospy.Rate(5)
	waitRate=rospy.Rate(5)
	while not rospy.is_shutdown():
		if homed and fileNames:
			#Read the next line in the file
			print('Starting...')
			print(fileNames[0])
			rospy.loginfo(True)
			pubRun.publish(True)
			f = open(fileNames[0],'r')

			# Interpret trajectory line by aine
			for line in f:
				if not homed:
					break

				l = line.strip()  # Strip all EOL characters for streaming
				
				#Get parts of trajectory
				new_pos = l.split('\t')
				if not len(new_pos)>1:
					break
				new_pos=map(float,new_pos) #Convert everything to a float
				curr_timestep=new_pos[0]
				
				#Get Commanded Positions
				position = new_pos[1:4]
				speed = new_pos[4]
				
				#Get the speed
				if speed==0.0:
					speed=math.sqrt(sum([(a-b)**2 for a,b in zip(curr_pos,position)]))/curr_timestep*60*factor

				if speed==0.0:
					speed=500

				#Send actuation if it's different than before
				#Wait for the ready signal after each send
				act=actuation()
				act.levels=new_pos[5:]
				rospy.loginfo(act)
				pubAct.publish(act)
				
				#Send position if it's different than before
				#Wait for the ready signal after each send
				pos=trajectory()
				pos.position=position
				pos.speed=speed
				
				posReached = False
				
				rospy.loginfo(pos)
				pubPos.publish(pos)
				#Sleep for the specified length
				#print('Sleep for %f sec'%(curr_timestep))
				
				
				if curr_timestep==0:
					curr_timestep=0.001
				
				
				rate=rospy.Rate(1/curr_timestep)
				rate.sleep()
				
				if not (ready and posReached):
					while (not rospy.is_shutdown()) and homed:
						if DEBUG:
							print("READY: %d\tPOS REACHED: %d"%(ready,posReached))
						if (ready and posReached):
							break
						queryPosition()
						waitRate.sleep()
				
			# Close file and serial port
			f.close()
			fileNames.pop(0) #Remove the first filename in the list
			rospy.loginfo('Finished the run!')
			pubComplete.publish(True)

		elif fileNames and not homed:
			fileNames=[]
			rospy.logerr('---coordinateMoves: PLEASE HOME STAGE')
			if DEBUG:
				print(fileNames)

		outerRate.sleep()	



if __name__ == '__main__':
	try:
		server()
	except rospy.ROSInterruptException:
		pass



