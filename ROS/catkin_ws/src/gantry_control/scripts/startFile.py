#!/usr/bin/env python

import sys
import rospy
import os
import sys
from gantry_control.msg import *


params=rospy.get_param('gantry')
baud=params['baudrate']
devname=params['devname']
folderpaths=params['folder_paths']
common_funs=params['common_funs']

parentDir = os.path.abspath(os.path.dirname(__file__) + '../../../../../..')
commonFunctionDir = os.path.join(parentDir, folderpaths['trajFolder'], folderpaths['commonFolder'])


# Append paths to the system path
sys.path.append(commonFunctionDir)


def get_traj_files(in_path):
	gcodeDir = os.path.join(parentDir, folderpaths['trajFolder'], in_path)
	sys.path.append(gcodeDir)
	# Get all the perturbations
	gcodeFiles = [os.path.join(gcodeDir,f) for f in os.listdir(gcodeDir)
	if os.path.isfile(os.path.join(gcodeDir, f))
	and "Perturbation" in os.path.join(gcodeDir, f) ]
	
	return gcodeFiles



def talk(arg):

	files=get_traj_files(params['traj_folder'])

	pub = rospy.Publisher("/gantry/runFile", runFile, queue_size=10)
	rospy.init_node('startFile', anonymous=True)
	
	print(files[int(arg)])
	msg=runFile()
	msg.filename=str(files[int(arg)])

	pub.publish(msg)



if __name__ == '__main__':

	if len(sys.argv)==2:
		try:
		    talk(sys.argv[1])
		except rospy.ROSInterruptException:
		    pass
