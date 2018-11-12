cmake_minimum_required(VERSION 2.8.3)
project(video_recorder)

find_package(catkin REQUIRED
  std_msgs
  cv_bridge
  rospy
  message_generation
)


## Generate messages in the 'msg' folder
# add_message_files(
#   FILES
#   from_gantry.msg
#   to_gantry.msg
#   actuation.msg
# )



# Generate services in the 'srv' folder
 add_service_files(
   FILES
   cam_control.srv
 )

## Generate actions in the 'action' folder
# add_action_files(
#   FILES
#   Action1.action
#   Action2.action
# )

# Generate added messages and services with any dependencies listed here
 generate_messages(
   DEPENDENCIES
   std_msgs
 )



catkin_package()
