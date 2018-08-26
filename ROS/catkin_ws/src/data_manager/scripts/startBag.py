#!/usr/bin/env python

import sys
import rospy
import rosbag
import os
import sys
from std_srvs.srv import Trigger, TriggerResponse
from data_manager.msg import metadata


def runService(req):
	#Get some parameters that are important
	SAVE_DATA=rospy.get_param('GLOBAL_SAVE_DATA')

	if not SAVE_DATA:
		return TriggerResponse(False,'No Data is being saved')

	traj_dir = rospy.get_param('gantry/traj_folder')
	test_type=rospy.get_param('MAIN/testType')
	curr_file = rospy.get_param('MAIN/curr_filename')
	fullpath = rospy.get_param('MAIN/output_fullpath')


	bagname=curr_file.strip('.gcode')+'_bag.bag'
	bagfull=os.path.join(fullpath,bagname)
	rospy.set_param('MAIN/output_bagpath',str(bagfull))
	#Start the new bag file, appending
	bag = rosbag.Bag(bagfull, 'w')
	bag.reindex()

	#Set some metadata
	print('Set the metadata')
	metadata_msg = metadata(traj_folder=traj_dir, test_type=test_type, curr_file=curr_file)
	bag.write('/metadata', metadata_msg)
	bag.close()

	return TriggerResponse(True,'Nice, you set the new filename for your bag file!')



def server():
	rospy.init_node('update_bagfile_server')
	s = rospy.Service('update_bagfile', Trigger, runService)
	rospy.spin()



if __name__ == '__main__':
	server()