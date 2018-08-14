#!/usr/bin/env python


#Adapted from:
#https://answers.ros.org/question/159276/read-data-from-serial-port-and-publish-over-a-topic/


import roslib;  # roslib.load_manifest('numpy_tutorials') #not sure why I need this
import rosbag
import rospy
from serial_test.msg import serial_data
import serial

devname = '0'
baud = 0


def talker():
    ser = serial.Serial(devname,baudrate=baud)

    pub = rospy.Publisher('object_return', serial_data, queue_size=10)
    rospy.init_node('talker',anonymous=True)
    while not rospy.is_shutdown():
		data= ser.readline() # Read data from serial port
		if not data.startswith('_'):
		
			dataVec=data[0:-1].split("\t")
			msg=serial_data()
			msg.milliseconds=long(dataVec[0])
			msg.rate=long(dataVec[1])
			msg.data=map(int,dataVec[2:])
			
			rospy.loginfo(msg)
			pub.publish(msg)
		
		#rospy.sleep(1.0)


if __name__ == '__main__':
    try:
		if rospy.has_param('object_return'):
			params=rospy.get_param('object_return')
			baud=params['baudrate']
			devname=params['devname']
		
		talker()
    except rospy.ROSInterruptException:
        pass
