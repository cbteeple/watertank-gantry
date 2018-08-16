#!/usr/bin/env python

import sys
import rospy
from std_msgs.msg import String
from gantry_control.srv import *

params=rospy.get_param('gantry');


def gantry_sendClient(data):
    rospy.wait_for_service('send_to_gantry')
    try:
        send_to_objectReturn = rospy.ServiceProxy('send_to_gantry', gantry_send)
        resp1 = send_to_objectReturn(data['command'], data['cmd_type'], data['path'])
        return 1
    except rospy.ServiceException, e:
        print "Service call failed: %s"%e

def usage():
    return "%s [x y]"%sys.argv[0]

if __name__ == "__main__":
    if len(sys.argv) == 2:
    	data = {
        	'command': str(sys.argv[1]),
        	'cmd_type': "common",
        	'path': " ",
        }
        
    elif len(sys.argv) ==1:
    	data={
        	'command': " ",
        	'cmd_type': "traj",
        	'path': params['traj_folder'],
        }
        		
    else:
        print usage()
        sys.exit(1)
        
    #rospy.sleep(2)
    print "Sending command sequence: %s"%(data['command'])
    gantry_sendClient(data)
