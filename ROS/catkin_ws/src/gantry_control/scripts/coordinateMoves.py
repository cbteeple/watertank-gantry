#!/usr/bin/env python
import rospy
from gantry_control.msg import *
from std_msgs.msg import Bool

import sendGcodeSerial
import valves_gcode_control

#Get Parameters
params=rospy.get_param('gantry')
baud=params['baudrate']
devname=params['devname']

ready = True
fileNames=[]

# Open the serial port
s=sendGcodeSerial.resume(devname,baud)



def callbackReady(data):
	ready=data.data
	
def callbackNewRun(data):
	fileNames.append(data.filename)
	



def sendPos_Client(pos,speed):
    rospy.wait_for_service('sendPosition')
    try:
        add_two_ints = rospy.ServiceProxy('sendPosition', trajectory)
        resp1 = add_two_ints(pos,speed)
        return resp1.sum
    except rospy.ServiceException, e:
        print "Service call failed: %s"%e






def server():
	#This is now a service
	pubPos = rospy.Publisher("/gantry/set_position", trajectory, queue_size=10)
	#also actuation will be a service
	rospy.Subscriber("/gantry/ready", Bool, callbackReady)
	rospy.Subscriber("/gantry/runFile", runFile, callbackNewRun)

	rospy.init_node('motion_server', anonymous=True)
	rate = rospy.Rate(100)
	outerRate=rospy.Rate(5)
	while not rospy.is_shutdown():
		if fileNames:
			#Read the next line in the file
			print('Starting...')
			print(fileNames[0])
			f = open(fileNames[0],'r')
    		
    		# Interpret trajectory line by line
			for line in f:
				l = line.strip()  # Strip all EOL characters for streaming
				
				#Get parts of trajectory
				curr_pos = l.split('\t')
				if not len(curr_pos)>1:
					break
				curr_pos=map(float,curr_pos) #Convert everything to a float
				curr_timestep=curr_pos[0]
				
				#Get Commanded Positions
				position = curr_pos[1:4]
				speed = curr_pos[4]
				
				#Send actuation if it's different than before
				#Wait for the ready signal after each send
				valves_gcode_control.go(curr_pos[5:])
				
				#Send position if it's different than before
				#Wait for the ready signal after each send	
				pos=trajectory()
				pos.position=position
				pos.speed=speed
				rospy.loginfo(pos)
				pubPos.publish(pos)
				while not ready:
					pass
				
				#Sleep for the specified length
				rate=rospy.Rate(1/curr_timestep)
				rate.sleep()
			# Close file and serial port
			f.close()
			fileNames.pop(0) #Remove the first filename in the list
			
		outerRate.sleep()		



if __name__ == '__main__':
	try:
		server()
	except rospy.ROSInterruptException:
		pass



