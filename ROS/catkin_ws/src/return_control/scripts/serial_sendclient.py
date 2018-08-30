#!/usr/bin/env python

import sys
import rospy
from std_msgs.msg import String
from return_control.srv import SerialSend

def serial_sendClient(command_to_do,values):
    rospy.wait_for_service('send_to_objectReturn')
    try:
        send_to_objectReturn = rospy.ServiceProxy('send_to_objectReturn', SerialSend)
        resp1 = send_to_objectReturn(command_to_do,values)
        return 1
    except rospy.ServiceException, e:
        print "Service call failed: %s"%e


def usage():
    return "%s [x y]"%sys.argv[0]

if __name__ == "__main__":
    rospy.sleep(2)
    serial_sendClient('LOAD',[])
    serial_sendClient('TIME',[200])
    serial_sendClient('PID',[0.5,0.05,0.05])   
    serial_sendClient('MODE',[2])
    serial_sendClient('ON',[])
