#!/usr/bin/env python


from return_control.srv import *
from return_control.msg import *
from std_msgs.msg import String
import rospy

DEBUG = rospy.get_param('GLOBAL_DEBUG')

curr_setpos=0



def sendSetpoint(setting):
	rospy.wait_for_service('send_to_objectReturn')
	try:
		send_to_objectReturn = rospy.ServiceProxy('send_to_objectReturn', SerialSend)
		resp1 = send_to_objectReturn("SET",[setting])
		return 1
	except rospy.ServiceException, e:
		print "Service call failed: %s"%e





def getSetting(data):
	global curr_setpos
	
	curr_setpos = float(data.data[0])

	if DEBUG:
		print('---return_sendMoves: Update Position: '),
		print('%f\t%f\t%f'%(curr_setpos))



def updateSetpoint(req):
	global curr_setpos

	old_setpos = curr_setpos*1
	setPt=float(req.setpoint)
	totTime=float(req.time)

	N=20

	timestep=totTime/N
	rate=rospy.Rate(1/timestep)
	distStep=(setPt-old_setpos)/N

	for idx in range(N):
		print(old_setpos+idx*distStep)
		sendSetpoint(old_setpos+idx*distStep)
		rate.sleep()

	sendSetpoint(setPt)



def server():
	rospy.init_node('return_sepoint_server', anonymous=True)
	rospy.Subscriber("/object_return/set_setpoint", setpoint, updateSetpoint)
	rospy.Subscriber('/object_return/location', serial_data, getSetting)

	while not rospy.is_shutdown():
		rospy.spin()  #keep python from exiting until this node is stopped


if __name__ == '__main__':
	try:
		server()
	except rospy.ROSInterruptException:
		pass

