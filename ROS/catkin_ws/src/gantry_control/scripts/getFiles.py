#!/usr/bin/env python

import sys
import rospy
import os


parentDir = os.path.abspath(os.path.dirname(__file__) + '../../../../../..')


#HELPERS
def getParams(args):
	params=[]
	if len(args)==0:
		params=rospy.get_param('gantry')
	elif len(args)==1:
		params=args[0]
	else:
		print("You gave me too many arguments")
	#These are the params we deserve
	return params


def getFolderPath(*args):
	params = getParams(args)
	return params['folder_paths']


def getCommonDir(*args):
	params=getParams(args)
	folderpaths=getFolderPath(params)
	return os.path.join(parentDir, folderpaths['trajFolder'], folderpaths['commonFolder'])


def getTrajDir(*args):
	params=getParams(args)
	folderpaths=getFolderPath(params)
	return os.path.join(parentDir, folderpaths['trajFolder'], params['traj_folder'])


#MAIN STUFF
def getTrajFiles(*args):
	params=getParams(args)
	traj_dir=getTrajDir(params)
	sys.path.append(traj_dir)
	# Get all the perturbations in the folder
	allFiles = [os.path.join(traj_dir,f) for f in os.listdir(traj_dir)
	if os.path.isfile(os.path.join(traj_dir, f))
	and "Perturbation" in os.path.join(traj_dir, f) ]
	
	return allFiles