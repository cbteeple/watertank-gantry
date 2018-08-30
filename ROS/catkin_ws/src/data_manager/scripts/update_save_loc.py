#!/usr/bin/env python

import sys
import rospy
import os
import datetime

#SAVE_DATA=rospy.get_param('GLOBAL_SAVE_DATA')

def get_ws_dir():
	return os.path.abspath(os.path.dirname(__file__) + '../../../..')


def make_dir(dir_path):
	if not os.path.exists(dir_path):
		os.makedirs(dir_path)



def updateBagfile(**kwargs):
	if kwargs['folder']:
		rospy.set_param('/record/file_name',kwargs['folder'])
	if kwargs['file']:
		rospy.set_param('/record/path_save',kwargs['filename'])
	if kwargs['topics']:
		rospy.set_param('/record/topic',kwargs['topics'])




def main():
	rootDir=get_ws_dir()
	traj_dir = rospy.get_param('gantry/traj_folder','DATA')
	dataDir = rospy.get_param('MAIN/data_dir','data')
	testType=rospy.get_param('MAIN/testType','Test')
	outputDir = rospy.get_param('MAIN/output_dir_format','[timestamp] - [trajdir]')

	ts=datetime.datetime.now()
	timeStamp = ts.strftime("%Y_%m_%d---%H,%M,%S")
	outputDir = outputDir.replace('[timestamp]',timeStamp)
	outputDir = outputDir.replace('[testtype]',testType)
	outputDir = outputDir.replace('[trajdir]',traj_dir)

	fullpath=os.path.join(rootDir,dataDir,outputDir)
	print(fullpath)
	make_dir(fullpath)
	rospy.set_param('MAIN/output_fullpath',fullpath)




if __name__ == '__main__':
	main()