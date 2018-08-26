#!/bin/bash

rsync -r /media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/data /run/user/1000/gvfs/smb-share:server=seasfs01.rc.fas.harvard.edu,share=rjwood/Clark/WaterTankData
