#!/usr/bin/env python

import os.path
import shutil

backupDir='/run/user/1000/gvfs/smb-share:server=seasfs01.rc.fas.harvard.edu,share=rjwood/Clark/WaterTankData'
#backupDir='/home/woodlab/TEST/1'
sourceDir='/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/data'

if os.path.isdir(backupDir):
	print('Deleting Old Data')
	shutil.rmtree(backupDir)

print('Saving New Data')
try:
	shutil.copytree(sourceDir,backupDir,symlinks=False)
except shutil.Error:
	pass
