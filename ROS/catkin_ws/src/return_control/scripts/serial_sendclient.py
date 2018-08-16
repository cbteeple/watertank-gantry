#!/usr/bin/env python

import sys
import rospy
from std_msgs.msg import String
from serial_test.srv import SerialSend

def serial_sendClient(command):
    rospy.wait_for_service('send_to_objectReturn')
    try:
        send_to_objectReturn = rospy.ServiceProxy('send_to_objectReturn', SerialSend)
        resp1 = send_to_objectReturn(command)
        return 1
    except rospy.ServiceException, e:
        print "Service call failed: %s"%e

def usage():
    return "%s [x y]"%sys.argv[0]

if __name__ == "__main__":
    if len(sys.argv) == 2:
        time = int(sys.argv[1])
        
    elif rospy.has_param('object_return'):
		params=rospy.get_param('object_return')
		time= params['default_delay']
		print('Reading time setting from file')
		
    else:
        print usage()
        sys.exit(1)
        
    rospy.sleep(2)
    print "Setting time to %s ms"%(time)
    serial_sendClient(time)
