#!/usr/bin/env python
from __future__ import print_function
import cv2
import numpy as np
import datetime
import time
import os

import rospy
import rosnode

from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError


from video_recorder.srv import cam_control
from std_msgs.msg import String, Bool
from std_srvs.srv import Trigger, TriggerResponse, Empty

devname = '0'
cams_on = False

#Get parameters
params=rospy.get_param('cameras')
#locations=params['locations']   #Eventually want to get these
DEBUG=rospy.get_param('GLOBAL_DEBUG') or rospy.get_param('/cameras/DEBUG')

#Set up callback functions
def callbackCamStart(req):  
    global cams_on
    cams_on=True
    print('---recorder_server: Update Camera Cammand: %d'%(cams_on))
    return TriggerResponse(True,'Successfully set!')

def callbackCamStop(req):  
    global cams_on
    cams_on=False
    print('---recorder_server: Update Camera Cammand: %d'%(cams_on))
    return TriggerResponse(True,'Successfully set!')





#Suscripbe and publish
pubState=rospy.Publisher("/cameras/state", Bool, queue_size=100)
#rospy.Subscriber("/cameras/on_cmd",Bool, callbackCam_Cmd)



def get_image_grid_dims(length):
    if length>4:
        Error('Oops, I havent implemented grids higher than 2x2')
    grid_divs= [[1,1],[2,2],[2,2],[2,2]]
    grid_shifts = [ [[0,0]], [[0,0],[0,0.5]],[[0,0],[0,0.5],[0.5,0]],[[0,0],[0,0.5],[0.5,0],[0.5,0.5]] ]
    return grid_divs[length-1], grid_shifts[length-1]




def opencv_version():
    v = cv2.__version__.split('.')[0]
    if v == '2':
        return 2
    elif v == '3':
        return 3
    raise Exception('opencv version can not be parsed. v={}'.format(v))


class VideoFrames:
    def __init__(self, image_topic, target_x, target_y, target_w, target_h):
        self.image_sub = rospy.Subscriber(image_topic, Image, self.callback_image, queue_size=1)
        self.bridge = CvBridge()
        self.frames = []
        self.target_x, self.target_y, self.target_w, self.target_h = target_x, target_y, target_w, target_h

    def callback_image(self, data):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            rospy.logerr('[ros-video-recorder][VideoFrames] Converting Image Error. ' + str(e))
            return

        self.frames.append((time.time(), cv_image))

    def get_latest(self, at_time, remove_older=True):
        fs = [x for x in self.frames if x[0] <= at_time]
        if len(fs) == 0:
            return None

        f = fs[-1]
        if remove_older:
            self.frames = self.frames[len(fs) - 1:]

        return f[1]

    def unsubscribe(self):
        self.image_sub.unregister()


class VideoRecorder:
    def __init__(self, output_width, output_height, output_fps, output_format, output_path):
        self.frame_wrappers = []
        self.start_time = -1
        self.end_time = -1
        self.pub_img = None
        self.bridge = CvBridge()

        self.fps = output_fps
        self.interval = 1.0 / self.fps
        self.output_width = output_width
        self.output_height = output_height

        if opencv_version() == 2:
            fourcc = cv2.cv.FOURCC(*output_format)
        elif opencv_version() == 3:
            fourcc = cv2.VideoWriter_fourcc(*output_format)
        else:
            raise

        self.output_path = output_path
        
        if self.output_path:
            self.video_writer = cv2.VideoWriter(output_path, fourcc, output_fps, (output_width, output_height))
        else:
            self.video_writer = None

    def add_subscription(self, subscription):
        self.frame_wrappers.append(subscription)

    def rm_subscriptions(self):
        for sub in self.frame_wrappers:
            sub.unsubscribe()

    def set_broadcast(self, publish_topic):
        if not publish_topic:
            self.pub_img = None
        else:
            self.pub_img = rospy.Publisher(publish_topic, Image, queue_size=1)

    def start_record(self):
        self.start_time = time.time()
        curr_time = self.start_time
        while self.end_time < 0 or curr_time <= self.end_time:
            #try:
            canvas = np.zeros((self.output_height, self.output_width, 3), np.uint8)

            for frame_w in self.frame_wrappers:
                f = frame_w.get_latest(at_time=curr_time)
                if f is None:
                    continue

                resized = cv2.resize(f, (frame_w.target_w, frame_w.target_h))
                canvas[frame_w.target_y:frame_w.target_y+frame_w.target_h, frame_w.target_x:frame_w.target_x+frame_w.target_w] = resized
                # rospy.sleep(0.01)

            if self.video_writer:
                self.video_writer.write(canvas)
            if self.pub_img:
                try:
                    self.pub_img.publish(self.bridge.cv2_to_imgmsg(canvas, 'bgr8'))
                except CvBridgeError as e:
                    rospy.logerr('cvbridgeerror, e={}'.format(str(e)))
                    pass
            rospy.sleep(0.01)

            if rospy.is_shutdown() and self.end_time < 0:
                self.terminate()

            while curr_time + self.interval > time.time():
                rospy.sleep(self.interval)

            curr_time += self.interval
            #except KeyboardInterrupt:
            if not cams_on:
            	print("---recorder_server: Done Recording!")
                self.terminate()
                break

        if self.video_writer:
            self.video_writer.release()

    def terminate(self):
        rospy.loginfo("[ros-video-recorder] Video Saved. path={}".format(self.output_path))
        self.end_time = time.time()
        self.rm_subscriptions()





def cam_do(fastRate):
    #Publish the Start State to the message board
    pubState.publish(True)
	# parameters
    output_width = int(rospy.get_param('cameras/picture_width', '640'))
    output_height = int(rospy.get_param('cameras/picture_height', '480'))
    output_fps = int(rospy.get_param('~framerate', '30'))
    output_format = rospy.get_param('~output_format', 'mp42')
    output_topic = rospy.get_param('~output_topic', '/video_recorder/image_raw')

    output_dir = rospy.get_param('MAIN/output_fullpath', 'data')
    curr_filename = rospy.get_param('MAIN/curr_filename', 'Perturbation000')
    curr_filename=curr_filename.strip('.gcode')
    output_path = os.path.join(output_dir,curr_filename+'_cam.avi')
    output_path = output_path.replace('[timestamp]', datetime.datetime.now().strftime("%Y_%m_%d_%H_%M_%S"))
    
    ft = VideoRecorder(output_width, output_height, output_fps, output_format, output_path)

    # get parameters for videos and initialize subscriptions
    curr_nodes = rosnode.get_node_names()
    curr_usb_nodes=  [node for node in curr_nodes if "usb_cam" in node]

    #Auto Calculate a grid to throw cameras into
    denoms, shifts = get_image_grid_dims(len(curr_usb_nodes))
    print(denoms)
    print(shifts)

    #Subscribe to all the channels
    for idx, usb_node in enumerate(curr_usb_nodes):
        vf = VideoFrames(str(usb_node)+'/image_raw', 0+output_width*shifts[idx][0], 0+output_height*shifts[idx][1], output_width/denoms[0], output_height/denoms[1])
        ft.add_subscription(vf)

    if output_topic:
        ft.set_broadcast(output_topic)

    # recording.
    #try:
    	ft.start_record()
    while cams_on and not rospy.is_shutdown():
        fastRate.sleep()
        if DEBUG:
            print("---recorder_server: Video Rolling!")

    ft.terminate()
    #Publish the Stop State to the message board
    pubState.publish(False)




def camera_server():
    rospy.init_node('video_recorder', anonymous=True)
    startRec = rospy.Service('/video_recorder/start_recording', Trigger, callbackCamStart)
    stopRec = rospy.Service('video_recorder/stop_recording', Trigger, callbackCamStop)
    rate=rospy.Rate(5)
    fastRate=rospy.Rate(120)
    while not rospy.is_shutdown():
        if cams_on:
            cam_do(fastRate)
        #s = rospy.Service('camera_control', cam_control, cam_do)
        if DEBUG:
            print ("Ready to save video.")
        rate.sleep()
		#rospy.spin()


if __name__ == '__main__':
    #Shut down the cameras
    #EVENTUALLY NEED TO EXPAND THIS TO ARBITRARY NUMBER OF USB CAMS	
    camera_server()

	
